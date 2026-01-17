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

# Load environment variables
load_dotenv()

# Embedding configuration
OPENAI_API_KEY = os.getenv('OPENAI_API_KEY', '')


# Text formatters for each table
def format_candidati_text(row: Dict[str, Any]) -> str:
    return f"""
    Nome: {row['nome']} {row['cognome']}
    Email: {row['email']}
    Codice Fiscale: {row.get('codice_fiscale', '')}
    Data Nascita: {row.get('data_nascita', '')}
    Luogo Nascita: {row.get('luogo_nascita', '')}
    Indirizzo: {row.get('indirizzo', '')}, {row.get('citta', '')}, {row.get('provincia', '')}, {row.get('cap', '')}
    Contatti: {row.get('telefono', '')}, {row.get('email', '')}
    Profili: LinkedIn: {row.get('linkedin', '')}, Portfolio: {row.get('portfolio', '')}
    Stato: {row.get('stato_candidato', 'nuovo')}
    Disponibilità: Trasferte: {"Sì" if row.get('disponibilita_trasferte') else "No"}, 
                   Remoto: {"Sì" if row.get('disponibilita_remoto') else "No"}
    Note Personali: {row.get('note_personali', '')}
    Lettera Presentazione: {row.get('lettera_presentazione', '')}
    """


def format_esperienze_lavorative_text(row: Dict[str, Any]) -> str:
    data_fine = row.get('data_fine', 'Attuale' if row.get('attuale') else '')
    return f"""
    Azienda: {row['azienda']}
    Settore: {row.get('settore', '')}
    Posizione: {row['posizione']}
    Periodo: {row.get('data_inizio', '')} - {data_fine}
    Luogo: {row.get('citta', '')}, {row.get('provincia', '')}
    Descrizione: {row.get('descrizione', '')}
    Referenze: {row.get('referenze', '')}
    Progetti Rilevanti: {row.get('progetti_rilevanti', '')}
    """


def format_formazione_text(row: Dict[str, Any]) -> str:
    return f"""
    Tipo: {row['tipo']}
    Istituto: {row['istituto']}
    Titolo: {row['titolo']}
    Campo Studio: {row.get('campo_studio', '')}
    Voto: {row.get('voto', '')}
    Luogo: {row.get('citta', '')}, {row.get('provincia', '')}
    Periodo: {row.get('data_inizio', '')} - {row.get('data_fine', '')}
    Descrizione: {row.get('descrizione', '')}
    """


def format_competenze_candidati_text(row: Dict[str, Any]) -> str:
    return f"""
    Livello: {row.get('livello', '')} su 5
    Anni Esperienza: {row.get('anni_esperienza', '')}
    Descrizione: {row.get('descrizione', '')}
    """


def format_offerte_lavoro_text(row: Dict[str, Any]) -> str:
    return f"""
    Titolo: {row['titolo']}
    Descrizione: {row['descrizione']}
    Requisiti: {row['requisiti']}
    Responsabilità: {row.get('responsabilita', '')}
    Contratto: {row.get('tipo_contratto', '')}, Durata: {row.get('durata_contratto', '')}
    Stipendio: {row.get('stipendio_min', '')} - {row.get('stipendio_max', '')}
    Benefit: {row.get('benefit', '')}
    Pubblicazione: {row.get('data_pubblicazione', '')}, Scadenza: {row.get('data_scadenza', '')}
    Stato: {row.get('stato', 'aperta')}
    Modalità: {"Remoto" if row.get('lavoro_remoto') else "In sede"}, 
              {"Full-time" if row.get('full_time') else "Part-time"}
    Disponibilità: {"Immediata" if row.get('disponibilita_immediata') else "Da concordare"}
    Tipo: {row.get('interno_esterno', 'esterno')}
    Priorità: {row.get('priorita', '3')}
    Note Interne: {row.get('note_interne', '')}
    """


def format_candidature_text(row: Dict[str, Any]) -> str:
    return f"""
    ID Offerta: {row['id_offerta']}
    ID Candidato: {row['id_candidato']}
    Data Candidatura: {row.get('data_candidatura', '')}
    Stato: {row.get('stato', 'ricevuta')}
    Note: {row.get('note', '')}
    Lettera Motivazionale: {row.get('lettera_motivazionale', '')}
    Disponibilità Colloquio: {row.get('disponibilita_colloquio', '')}
    Ultimo Aggiornamento: {row.get('data_ultimo_aggiornamento', '')}
    """


def format_colloqui_text(row: Dict[str, Any]) -> str:
    return f"""
    ID Candidatura: {row['id_candidatura']}
    Data e Ora: {row['data_ora']}
    Tipo: {row['tipo']}
    Luogo: {row.get('luogo', '')}
    Stato: {row.get('stato', 'programmato')}
    Valutazione: {row.get('valutazione', '')}
    Note Intervistatore: {row.get('note_intervistatore', '')}
    Feedback Candidato: {row.get('feedback_candidato', '')}
    Decisione: {row.get('decisione', '')}, Data Decisione: {row.get('data_decisione', '')}
    """


# Table configurations
TABLE_CONFIGS = [
    {
        'name': 'candidati',
        'id_column': 'id_candidato',
        'formatter': format_candidati_text,
        'query': 'SELECT * FROM candidati'
    },
    {
        'name': 'esperienze_lavorative',
        'id_column': 'id_esperienza',
        'formatter': format_esperienze_lavorative_text,
        'query': 'SELECT * FROM esperienze_lavorative'
    },
    {
        'name': 'formazione',
        'id_column': 'id_formazione',
        'formatter': format_formazione_text,
        'query': 'SELECT * FROM formazione'
    },
    {
        'name': 'competenze_candidati',
        'id_column': 'id_candidato',
        'formatter': format_competenze_candidati_text,
        'query': 'SELECT * FROM competenze_candidati'
    },
    {
        'name': 'offerte_lavoro',
        'id_column': 'id_offerta',
        'formatter': format_offerte_lavoro_text,
        'query': 'SELECT * FROM offerte_lavoro'
    },
    {
        'name': 'candidature',
        'id_column': 'id_candidatura',
        'formatter': format_candidature_text,
        'query': 'SELECT * FROM candidature'
    },
    {
        'name': 'colloqui',
        'id_column': 'id_colloquio',
        'formatter': format_colloqui_text,
        'query': 'SELECT * FROM colloqui'
    }
]


class DBEmbeddingsExtractor:

    # Configure embedding model
    def get_embedding_model(self,embeddings_model_type='openai'):
        if embeddings_model_type.lower() == 'openai':
            if not OPENAI_API_KEY:
                raise ValueError("OpenAI API key is required when using OpenAI embeddings")
            return OpenAIEmbedding(model_name="text-embedding-3-small", api_key=OPENAI_API_KEY)
        else:
            raise ValueError("Unsupported embeddings_model_type")

    def fetch_records(self,conn, query):
        """Fetch records from database"""

        # Convert the query to SQLAlchemy's text format with the option to return dictionaries
        result = conn.execute(text(query))

        # Convert results to dictionaries
        return [dict(row._mapping) for row in result]


    def generate_embeddings(self,texts: List[str], embedding_model):
        """Generate embeddings in batches"""
        embeddings = []
        for i in tqdm(range(0, len(texts), self.batch_size), desc="Generating embeddings"):
            batch_texts = texts[i:i + self.batch_size]
            batch_embeddings = embedding_model.get_text_embedding_batch(batch_texts)
            embeddings.extend(batch_embeddings)
        return embeddings

    def update_embeddings(self,conn, table_name: str, id_column: str,
                          records_with_embeddings: List[Tuple[Any, List[float]]]):
        """Update database with generated embeddings"""
        # Use text SQL with parameter binding that avoids conflicts with PostgreSQL syntax
        update_query = f"UPDATE {table_name} SET embedding = CAST(:embedding_json AS vector) WHERE {id_column} = :id"

        # Execute updates one by one
        for record_id, embedding in records_with_embeddings:
            # Convert embedding to a JSON string
            embedding_json = json.dumps(embedding)

            # Use named parameters
            params = {"embedding_json": embedding_json, "id": record_id}
            conn.execute(text(update_query), params)

        conn.commit()
        print(f"Updated {len(records_with_embeddings)} records in {table_name} table.")

    def process_table(self,conn, table_config, embedding_model):
        """Process a single table: fetch records, generate embeddings, and update the database"""
        print(f"\nProcessing {table_config['name']} table...")

        records = self.fetch_records(conn, table_config['query'])
        if not records:
            print(f"No records found in {table_config['name']} table.")
            return

        print(f"Found {len(records)} records.")

        # Format texts for embedding
        texts = [table_config['formatter'](record) for record in records]
        record_ids = [record[table_config['id_column']] for record in records]

        # Generate embeddings
        embeddings = self.generate_embeddings(texts, embedding_model)

        # Prepare data for update
        records_with_embeddings = list(zip(record_ids, embeddings))

        # Update database
        self. update_embeddings(conn, table_config['name'], table_config['id_column'], records_with_embeddings)


    def create_db_embeddings(self):
        # parser = argparse.ArgumentParser(description='Generate embeddings for candidate database')
        # parser.add_argument('--tables', nargs='+', help='Specific tables to process (default: all tables)')
        # parser.add_argument('--model', choices=['openai', 'huggingface'], default=EMBEDDING_MODEL_TYPE,
        #                     help=f'Embedding model to use (default: {EMBEDDING_MODEL_TYPE})')
        # parser.add_argument('--batch-size', type=int, default=BATCH_SIZE,
        #                     help=f'Batch size for embedding generation (default: {BATCH_SIZE})')
        # args = parser.parse_args()


        print(f"Using {self.embeddings_model_type} embedding model with batch size {self.batch_size}")

        # Initialize embedding model
        embedding_model = self.get_embedding_model(self.embeddings_model_type)

        # Get tables to process
        tables_to_process = TABLE_CONFIGS

        with self.sql_database.engine.connect() as conn:

            # Process each table
            for table_config in tables_to_process:
                self.process_table(conn, table_config, embedding_model)

            print("\nAll tables processed successfully!")

    def generate_embedding_for_record(self, table_name: str, record_id: int, embedding_model=None):
        """
        Generate and update embedding for a single record in a specific table

        Args:
            table_name: Name of the table
            record_id: ID of the record to process
            embedding_model: Optional pre-initialized embedding model (to avoid reinitializing)

        Returns:
            bool: Success status
        """
        # Find the table config
        table_config = next((t for t in TABLE_CONFIGS if t['name'] == table_name), None)
        if not table_config:
            print(f"Table {table_name} not found in TABLE_CONFIGS")
            return False

        # Initialize embedding model if not provided
        if embedding_model is None:
            embedding_model = self.get_embedding_model(self.embeddings_model_type)

        with self.sql_database.engine.connect() as conn:
            # Fetch the specific record
            query = f"{table_config['query']} WHERE {table_config['id_column']} = :record_id"
            result = conn.execute(text(query), {"record_id": record_id})
            record = dict(result.fetchone()._mapping) if result.rowcount > 0 else None

            if not record:
                print(f"Record with ID {record_id} not found in {table_name}")
                return False

            # Format text and generate embedding
            formatted_text = table_config['formatter'](record)
            embedding = embedding_model.get_text_embedding(formatted_text)

            # Update database
            self.update_embeddings(conn, table_name, table_config['id_column'], [(record_id, embedding)])

            print(f"Generated embedding for {table_name} record ID {record_id}")
            return True

    def generate_embeddings_for_candidate(self, candidato_id: int):
        """
        Generate embeddings for a newly inserted candidate and all related records

        Args:
            candidato_id: ID of the candidate

        Returns:
            dict: Status of embedding generation for each table
        """
        print(f"\nGenerating embeddings for candidate ID {candidato_id}...")

        # Initialize embedding model once for all operations
        embedding_model = self.get_embedding_model(self.embeddings_model_type)

        results = {}

        # 1. Generate embedding for candidato
        results['candidati'] = self.generate_embedding_for_record(
            'candidati', candidato_id, embedding_model
        )

        with self.sql_database.engine.connect() as conn:
            # 2. Generate embeddings for esperienze_lavorative
            exp_query = "SELECT id_esperienza FROM esperienze_lavorative WHERE id_candidato = :candidato_id"
            exp_result = conn.execute(text(exp_query), {"candidato_id": candidato_id})
            exp_ids = [row[0] for row in exp_result]

            results['esperienze_lavorative'] = []
            for exp_id in exp_ids:
                success = self.generate_embedding_for_record(
                    'esperienze_lavorative', exp_id, embedding_model
                )
                results['esperienze_lavorative'].append({'id': exp_id, 'success': success})

            # 3. Generate embeddings for formazione
            form_query = "SELECT id_formazione FROM formazione WHERE id_candidato = :candidato_id"
            form_result = conn.execute(text(form_query), {"candidato_id": candidato_id})
            form_ids = [row[0] for row in form_result]

            results['formazione'] = []
            for form_id in form_ids:
                success = self.generate_embedding_for_record(
                    'formazione', form_id, embedding_model
                )
                results['formazione'].append({'id': form_id, 'success': success})

            # 4. Generate embedding for competenze_candidati
            comp_query = "SELECT COUNT(*) FROM competenze_candidati WHERE id_candidato = :candidato_id"
            comp_result = conn.execute(text(comp_query), {"candidato_id": candidato_id})
            has_competenze = comp_result.scalar() > 0

            if has_competenze:
                results['competenze_candidati'] = self.generate_embedding_for_record(
                    'competenze_candidati', candidato_id, embedding_model
                )
            else:
                results['competenze_candidati'] = None

        print(f"Embedding generation complete for candidate {candidato_id}")
        return results

    def __init__(self,sql_database,embeddings_model_type,batch_size):

        self.batch_size = batch_size
        self.embeddings_model_type = embeddings_model_type
        self.sql_database = sql_database


if __name__ == "__main__":
    #create_db_embeddings()
    pass