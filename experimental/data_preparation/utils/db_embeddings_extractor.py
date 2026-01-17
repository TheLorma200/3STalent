import os
import psycopg2
from psycopg2.extras import execute_batch
import pandas as pd
from typing import List, Dict, Any, Tuple
from tqdm import tqdm
import numpy as np
from dotenv import load_dotenv
import argparse

# LlamaIndex imports
from llama_index.embeddings.openai import OpenAIEmbedding
from sqlalchemy import text
import json
import logging
from datetime import datetime


# Load environment variables
load_dotenv()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Embedding configuration
OPENAI_API_KEY = os.getenv('OPENAI_API_KEY', '')


def format_candidati_comprehensive_text(candidato_id: int, conn) -> str:
    """
    Generate comprehensive text for candidate including all available data.
    Handles missing data gracefully - uses what's available.

    Args:
        candidato_id: ID of the candidate
        conn: Database connection (SQLAlchemy connection object)

    Returns:
        Formatted text string for embedding generation
    """

    try:
        # Get base candidate info
        candidato_query = "SELECT * FROM candidati WHERE id_candidato = :candidato_id"
        result = conn.execute(text(candidato_query), {"candidato_id": candidato_id})
        row = result.fetchone()

        if not row:
            logger.warning(f"No candidate found with ID {candidato_id}")
            return ""

        candidato = dict(row._mapping)

        text_parts = []

        # === BASIC INFO ===
        nome_completo = f"{candidato.get('nome', '')} {candidato.get('cognome', '')}".strip()
        if nome_completo:
            text_parts.append(f"Candidato: {nome_completo}")

        if candidato.get('email'):
            text_parts.append(f"Email: {candidato['email']}")

        # Contact/Location info
        contact_parts = []
        if candidato.get('telefono'):
            contact_parts.append(f"Tel: {candidato['telefono']}")
        if candidato.get('citta'):
            location = f"{candidato['citta']}"
            if candidato.get('provincia'):
                location += f", {candidato['provincia']}"
            contact_parts.append(f"Località: {location}")

        if contact_parts:
            text_parts.append(" | ".join(contact_parts))

        # Professional links
        if candidato.get('linkedin'):
            text_parts.append(f"LinkedIn: {candidato['linkedin']}")
        if candidato.get('portfolio'):
            text_parts.append(f"Portfolio: {candidato['portfolio']}")

        # === SELF-DESCRIPTION (very valuable when present) ===
        if candidato.get('note_personali') and str(candidato['note_personali']).strip():
            text_parts.append(f"\n=== PROFILO PROFESSIONALE ===\n{candidato['note_personali']}")

        if candidato.get('lettera_presentazione') and str(candidato['lettera_presentazione']).strip():
            text_parts.append(f"\n=== LETTERA DI PRESENTAZIONE ===\n{candidato['lettera_presentazione']}")

        # If there's a synthetic profile, include it
        if candidato.get('profilo_sintetico') and str(candidato.get('profilo_sintetico', '')).strip():
            text_parts.append(f"\n=== RIEPILOGO ===\n{candidato['profilo_sintetico']}")

        # === WORK EXPERIENCE ===
        exp_query = """
                    SELECT * \
                    FROM esperienze_lavorative
                    WHERE id_candidato = :candidato_id
                    ORDER BY CASE WHEN attuale = TRUE THEN 0 ELSE 1 END, \
                             COALESCE(data_inizio, '1900-01-01'::date) DESC \
                    """
        exp_result = conn.execute(text(exp_query), {"candidato_id": candidato_id})
        esperienze = [dict(row._mapping) for row in exp_result]

        if esperienze:
            text_parts.append("\n=== ESPERIENZE LAVORATIVE ===")
            for idx, exp in enumerate(esperienze, 1):
                exp_text = []

                # Position and company (most important)
                if exp.get('posizione'):
                    exp_text.append(f"Ruolo: {exp['posizione']}")
                if exp.get('azienda'):
                    exp_text.append(f"Azienda: {exp['azienda']}")
                if exp.get('settore'):
                    exp_text.append(f"Settore: {exp['settore']}")

                # Dates
                date_parts = []
                if exp.get('data_inizio'):
                    date_parts.append(f"dal {exp['data_inizio']}")
                if exp.get('data_fine'):
                    date_parts.append(f"al {exp['data_fine']}")
                elif exp.get('attuale'):
                    date_parts.append("ad oggi")
                if date_parts:
                    exp_text.append(f"Periodo: {' '.join(date_parts)}")

                # Location
                if exp.get('citta'):
                    location = exp['citta']
                    if exp.get('provincia'):
                        location += f", {exp['provincia']}"
                    exp_text.append(f"Sede: {location}")

                # Description (very valuable)
                if exp.get('descrizione') and str(exp['descrizione']).strip():
                    exp_text.append(f"Descrizione: {exp['descrizione']}")

                # Relevant projects
                if exp.get('progetti_rilevanti') and str(exp['progetti_rilevanti']).strip():
                    exp_text.append(f"Progetti rilevanti: {exp['progetti_rilevanti']}")

                # References
                if exp.get('referenze') and str(exp['referenze']).strip():
                    exp_text.append(f"Referenze: {exp['referenze']}")

                if exp_text:
                    text_parts.append(f"\n[Esperienza {idx}]\n" + "\n".join(exp_text))

        # === EDUCATION ===
        form_query = """
                     SELECT * \
                     FROM formazione
                     WHERE id_candidato = :candidato_id
                     ORDER BY COALESCE(data_fine, '9999-12-31'::date) DESC \
                     """
        form_result = conn.execute(text(form_query), {"candidato_id": candidato_id})
        formazione = [dict(row._mapping) for row in form_result]

        if formazione:
            text_parts.append("\n=== FORMAZIONE ===")
            for idx, form in enumerate(formazione, 1):
                form_text = []

                if form.get('tipo'):
                    form_text.append(f"Tipo: {form['tipo']}")
                if form.get('titolo'):
                    form_text.append(f"Titolo: {form['titolo']}")
                if form.get('campo_studio'):
                    form_text.append(f"Campo di studio: {form['campo_studio']}")
                if form.get('istituto'):
                    form_text.append(f"Istituto: {form['istituto']}")
                if form.get('voto'):
                    form_text.append(f"Voto: {form['voto']}")

                # Dates
                date_parts = []
                if form.get('data_inizio'):
                    date_parts.append(f"dal {form['data_inizio']}")
                if form.get('data_fine'):
                    date_parts.append(f"al {form['data_fine']}")
                if date_parts:
                    form_text.append(f"Periodo: {' '.join(date_parts)}")

                # Location
                if form.get('citta'):
                    location = form['citta']
                    if form.get('provincia'):
                        location += f", {form['provincia']}"
                    form_text.append(f"Sede: {location}")

                if form.get('descrizione') and str(form['descrizione']).strip():
                    form_text.append(f"Descrizione: {form['descrizione']}")

                if form_text:
                    text_parts.append(f"\n[Formazione {idx}]\n" + "\n".join(form_text))

        # === COMPETENCIES ===
        comp_query = """
                     SELECT *
                     FROM competenze_candidati
                     WHERE id_candidato = :candidato_id \
                     """
        comp_result = conn.execute(text(comp_query), {"candidato_id": candidato_id})
        competenze_row = comp_result.fetchone()

        if competenze_row:
            comp = dict(competenze_row._mapping)
            text_parts.append("\n=== COMPETENZE ===")

            # Parse JSON from descrizione field
            if comp.get('descrizione'):
                try:
                    comp_data = json.loads(comp['descrizione']) if isinstance(comp['descrizione'], str) else comp[
                        'descrizione']

                    if 'competenze' in comp_data:
                        # List all skills with details
                        for skill in comp_data['competenze']:
                            skill_parts = []
                            if skill.get('nome'):
                                skill_parts.append(skill['nome'])
                            if skill.get('livello'):
                                skill_parts.append(f"Livello: {skill['livello']}/5")
                            if skill.get('anni_esperienza'):
                                skill_parts.append(f"{skill['anni_esperienza']} anni")
                            if skill.get('categoria'):
                                skill_parts.append(f"Categoria: {skill['categoria']}")

                            if skill_parts:
                                text_parts.append(f"  • {' | '.join(skill_parts)}")

                    # Add summary if available
                    if 'summary' in comp_data:
                        summary = comp_data['summary']
                        text_parts.append(
                            f"\nRiepilogo competenze: {summary.get('total_skills', 0)} competenze totali, "
                            f"livello medio {summary.get('avg_level', 0)}/5")

                except (json.JSONDecodeError, TypeError) as e:
                    logger.warning(f"Could not parse competenze JSON for candidate {candidato_id}: {e}")
                    # Fallback to raw text
                    if comp.get('descrizione'):
                        text_parts.append(f"Competenze: {comp['descrizione']}")

            # Add basic stats if available
            if comp.get('livello'):
                text_parts.append(f"Livello complessivo: {comp['livello']}/5")
            if comp.get('anni_esperienza'):
                text_parts.append(f"Anni di esperienza: {comp['anni_esperienza']}")

        # === AVAILABILITY & PREFERENCES ===
        preferences = []
        if candidato.get('disponibilita_trasferte'):
            preferences.append("Disponibile per trasferte")
        if candidato.get('disponibilita_remoto'):
            preferences.append("Disponibile per lavoro remoto")

        if preferences:
            text_parts.append(f"\n=== DISPONIBILITÀ ===\n{', '.join(preferences)}")

        # === METADATA (can help with matching) ===
        if candidato.get('stato_candidato'):
            text_parts.append(f"\nStato candidatura: {candidato['stato_candidato']}")

        result_text = "\n".join(text_parts)

        # Log the length for monitoring
        logger.info(f"Generated text for candidate {candidato_id}: {len(result_text)} characters")

        return result_text

    except Exception as e:
        logger.error(f"Error formatting candidate {candidato_id}: {str(e)}", exc_info=True)
        return ""


def get_text_length(text: str) -> int:
    """Helper to get text length for tracking"""
    return len(text) if text else 0

class DBEmbeddingsExtractor:

    def get_embedding_model(self, embeddings_model_type='openai'):
        """Configure embedding model"""
        if embeddings_model_type.lower() == 'openai':
            if not OPENAI_API_KEY:
                raise ValueError("OpenAI API key is required when using OpenAI embeddings")
            return OpenAIEmbedding(model_name="text-embedding-3-small", api_key=OPENAI_API_KEY)
        else:
            raise ValueError("Unsupported embeddings_model_type")

    def generate_embeddings(self, texts: List[str], embedding_model):
        """Generate embeddings in batches"""
        embeddings = []
        for i in tqdm(range(0, len(texts), self.batch_size), desc="Generating embeddings"):
            batch_texts = texts[i:i + self.batch_size]
            batch_embeddings = embedding_model.get_text_embedding_batch(batch_texts)
            embeddings.extend(batch_embeddings)
        return embeddings

    def update_candidati_embeddings(self, conn, records_with_embeddings: List[Tuple[int, List[float], int]]):
        """
        Update candidati table with generated embeddings and metadata

        Args:
            conn: Database connection
            records_with_embeddings: List of tuples (candidato_id, embedding, text_length)
        """
        update_query = """
                       UPDATE candidati
                       SET embedding               = CAST(:embedding_json AS vector),
                           embedding_generated_at  = :timestamp,
                           embedding_version       = 'v1_consolidated',
                           embedding_text_length   = :text_length,
                           embedding_needs_refresh = FALSE
                       WHERE id_candidato = :id \
                       """

        timestamp = datetime.now()

        for candidato_id, embedding, text_length in tqdm(records_with_embeddings, desc="Updating database"):
            embedding_json = json.dumps(embedding)
            params = {
                "embedding_json": embedding_json,
                "id": candidato_id,
                "timestamp": timestamp,
                "text_length": text_length
            }
            conn.execute(text(update_query), params)

        conn.commit()
        logger.info(f"Updated {len(records_with_embeddings)} candidate records with consolidated embeddings.")

    def process_candidati_comprehensive(self, conn, embedding_model):
        """
        Process candidates table with comprehensive embeddings including all related data
        Process candidates table with comprehensive embeddings including all related data
        """
        logger.info("\n" + "=" * 80)
        logger.info("Processing candidates with CONSOLIDATED comprehensive embeddings")
        logger.info("=" * 80)

        # Get all candidate IDs
        result = conn.execute(text("SELECT id_candidato, nome, cognome FROM candidati ORDER BY id_candidato"))
        candidates = [(row[0], row[1], row[2]) for row in result]

        if not candidates:
            logger.warning("No candidates found.")
            return

        logger.info(f"Found {len(candidates)} candidates to process.")

        # Generate comprehensive texts
        texts = []
        valid_records = []  # (id, text, text_length)

        for candidato_id, nome, cognome in tqdm(candidates, desc="Formatting candidate data"):
            try:
                candidate_text = format_candidati_comprehensive_text(candidato_id, conn)
                if candidate_text and candidate_text.strip():
                    text_length = len(candidate_text)
                    texts.append(candidate_text)
                    valid_records.append((candidato_id, candidate_text, text_length))
                    logger.debug(f"✓ {nome} {cognome} (ID: {candidato_id}): {text_length} chars")
                else:
                    logger.warning(f"✗ {nome} {cognome} (ID: {candidato_id}): No data available")
            except Exception as e:
                logger.error(f"✗ Error formatting {nome} {cognome} (ID: {candidato_id}): {e}")
                continue

        if not texts:
            logger.error("No valid candidate data to process.")
            return

        logger.info(f"\nSuccessfully formatted {len(texts)}/{len(candidates)} candidates.")
        logger.info(f"Average text length: {sum(r[2] for r in valid_records) / len(valid_records):.0f} chars")
        logger.info(f"Min: {min(r[2] for r in valid_records)} | Max: {max(r[2] for r in valid_records)}")

        # Generate embeddings
        logger.info("\nGenerating embeddings...")
        embeddings = self.generate_embeddings([r[1] for r in valid_records], embedding_model)

        # Prepare data for update: (id, embedding, text_length)
        records_with_embeddings = [
            (record[0], embedding, record[2])
            for record, embedding in zip(valid_records, embeddings)
        ]

        # Update database
        logger.info("\nUpdating database...")
        self.update_candidati_embeddings(conn, records_with_embeddings)

        logger.info("\n" + "=" * 80)
        logger.info("✅ CONSOLIDATED EMBEDDINGS COMPLETED SUCCESSFULLY!")
        logger.info("=" * 80)

    def generate_embedding_for_candidate_comprehensive(self, candidato_id: int, embedding_model=None):
        """
        Generate and update CONSOLIDATED embedding for a single candidate

        Args:
            candidato_id: ID of the candidate
            embedding_model: Optional pre-initialized embedding model

        Returns:
            dict: Status information
        """
        # Initialize embedding model if not provided
        if embedding_model is None:
            embedding_model = self.get_embedding_model(self.embeddings_model_type)

        with self.sql_database.engine.connect() as conn:
            # Generate comprehensive text
            candidate_text = format_candidati_comprehensive_text(candidato_id, conn)

            if not candidate_text or not candidate_text.strip():
                logger.warning(f"No data available for candidate {candidato_id}")
                return {
                    'success': False,
                    'message': f'No data available for candidate {candidato_id}',
                    'text_length': 0
                }

            text_length = len(candidate_text)
            logger.info(f"Generated text for candidate {candidato_id}: {text_length} characters")

            # Generate embedding
            embedding = embedding_model.get_text_embedding(candidate_text)

            # Update database
            self.update_candidati_embeddings(conn, [(candidato_id, embedding, text_length)])

            logger.info(f"✅ Generated consolidated embedding for candidate {candidato_id}")

            return {
                'success': True,
                'message': f'Successfully generated embedding for candidate {candidato_id}',
                'text_length': text_length
            }

    def create_db_embeddings_consolidated(self):
        """Main method to create consolidated embeddings for all candidates"""
        logger.info(f"Using {self.embeddings_model_type} embedding model with batch size {self.batch_size}")
        logger.info("Mode: CONSOLIDATED EMBEDDINGS (single embedding per candidate)")

        # Initialize embedding model
        embedding_model = self.get_embedding_model(self.embeddings_model_type)

        with self.sql_database.engine.connect() as conn:
            # Process candidates with comprehensive embeddings
            self.process_candidati_comprehensive(conn, embedding_model)

            logger.info("\n✅ All candidates processed successfully!")

    def __init__(self, sql_database, embeddings_model_type, batch_size):
        self.batch_size = batch_size
        self.embeddings_model_type = embeddings_model_type
        self.sql_database = sql_database


if __name__ == "__main__":
    pass