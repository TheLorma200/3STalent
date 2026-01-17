"""
Database Manager Module
Handles database operations for candidate data insertion
"""

import os
import json
from typing import Dict, List, Optional, Tuple, Any
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime
from llama_index.core import SQLDatabase
from sqlalchemy import create_engine, text
import os
from dotenv import load_dotenv
from data_preparation.utils.db_embeddings_extractor import DBEmbeddingsExtractor


load_dotenv()


class DatabaseManager:
    """Manages database operations for candidate data"""

    def __init__(self):
        """Initialize database connection parameters"""
        self.db_config = {
            'host': os.getenv('DB_HOSTNAME', 'localhost'),
            'port': os.getenv('DB_PORT', '5432'),
            'database': os.getenv('DB_NAME', 'db'),
            'user': os.getenv('DB_USER', 'postgres'),
            'password': os.getenv('DB_PASSWORD', 'postgres')
        }

        # Initialize SQLAlchemy engine for embeddings
        connection_string = f"postgresql://{self.db_config['user']}:{self.db_config['password']}@{self.db_config['host']}:{self.db_config['port']}/{self.db_config['database']}"
        self.engine = create_engine(connection_string)
        self.sql_database = SQLDatabase(self.engine)



    @staticmethod
    def _clean_value(value):
        """
        Convert empty strings and 'null' strings to None for database insertion.
        PostgreSQL requires None (NULL) instead of empty strings for typed fields like DATE, INTEGER, etc.

        Args:
            value: Any value from the form or extraction

        Returns:
            None if value is empty/null, otherwise the original value
        """
        if value == '' or value == 'null' or value == 'NULL':
            return None
        return value

    def get_connection(self):
        """Create and return a database connection"""
        try:
            conn = psycopg2.connect(**self.db_config)
            return conn
        except Exception as e:
            raise Exception(f"Errore di connessione al database: {str(e)}")

    def check_duplicate_email(self, email: str) -> Tuple[bool, Optional[Dict]]:
        """
        Check if a candidate with this email already exists

        Args:
            email: Email address to check

        Returns:
            Tuple of (exists: bool, candidate_data: dict or None)
        """
        if not email:
            return False, None

        try:
            conn = self.get_connection()
            cursor = conn.cursor(cursor_factory=RealDictCursor)

            cursor.execute("""
                SELECT id_candidato, nome, cognome, email, telefono, data_inserimento
                FROM candidati
                WHERE LOWER(email) = LOWER(%s)
            """, (email,))

            result = cursor.fetchone()

            cursor.close()
            conn.close()

            if result:
                return True, dict(result)
            return False, None

        except Exception as e:
            print(f"Errore nel controllo email duplicata: {str(e)}")
            return False, None

    def insert_candidate_complete(self, candidate_data: Dict) -> Tuple[bool, Optional[int], str]:
        """
        Insert complete candidate data including all related tables and generate embedding

        Args:
            candidate_data: Dictionary containing all candidate information

        Returns:
            Tuple of (success: bool, candidate_id: int or None, message: str)
        """
        conn = None
        try:
            conn = self.get_connection()
            cursor = conn.cursor()

            # Check for duplicate email
            if candidate_data["candidato"].get("email"):
                exists, existing = self.check_duplicate_email(candidate_data["candidato"]["email"])
                if exists:
                    return False, None, f"Email già presente nel database (Candidato: {existing['nome']} {existing['cognome']})"

            # 1. Insert candidato
            candidato_id = self._insert_candidato(cursor, candidate_data["candidato"])

            if not candidato_id:
                raise Exception("Errore nell'inserimento del candidato")

            # 2. Insert esperienze lavorative
            if candidate_data.get("esperienze_lavorative"):
                self._insert_esperienze(cursor, candidato_id, candidate_data["esperienze_lavorative"])

            # 3. Insert formazione
            if candidate_data.get("formazione"):
                self._insert_formazione(cursor, candidato_id, candidate_data["formazione"])

            # 4. Insert competenze
            if candidate_data.get("competenze"):
                self._insert_competenze(cursor, candidato_id, candidate_data["competenze"])

            # Commit all changes
            conn.commit()
            cursor.close()
            conn.close()

            # 5. Generate embeddings for the new candidate (after commit)
            try:
                embeddings_extractor = DBEmbeddingsExtractor(
                    sql_database=self.sql_database,
                    embeddings_model_type='openai',
                    batch_size=10
                )
                embeddings_extractor.generate_embeddings_for_candidate(candidato_id)
            except Exception as e:
                print(f"Warning: Failed to generate embeddings: {str(e)}")
                # Don't fail the insertion if embeddings fail
                return True, candidato_id, f"Candidato inserito con successo (embedding generation failed: {str(e)})"

            return True, candidato_id, "Candidato inserito con successo"

        except Exception as e:
            if conn:
                conn.rollback()
                conn.close()
            return False, None, f"Errore durante l'inserimento: {str(e)}"

    def _insert_candidato(self, cursor, candidato: Dict) -> Optional[int]:
        """Insert candidate into candidati table"""

        query = """
            INSERT INTO candidati (
                nome, cognome, email, telefono, codice_fiscale,
                data_nascita, luogo_nascita, genere,
                indirizzo, citta, provincia, cap,
                linkedin, portfolio,
                disponibilita_trasferte, disponibilita_remoto,
                lettera_presentazione, profilo_sintetico,
                stato_candidato, data_inserimento, data_ultimo_aggiornamento
            ) VALUES (
                %s, %s, %s, %s, %s,
                %s, %s, %s,
                %s, %s, %s, %s,
                %s, %s,
                %s, %s,
                %s, %s,
                %s, %s, %s
            ) RETURNING id_candidato
        """

        values = (
            self._clean_value(candidato.get("nome")),
            self._clean_value(candidato.get("cognome")),
            self._clean_value(candidato.get("email")),
            self._clean_value(candidato.get("telefono")),
            self._clean_value(candidato.get("codice_fiscale")),
            self._clean_value(candidato.get("data_nascita")),
            self._clean_value(candidato.get("luogo_nascita")),
            self._clean_value(candidato.get("genere")),
            self._clean_value(candidato.get("indirizzo")),
            self._clean_value(candidato.get("citta")),
            self._clean_value(candidato.get("provincia")),
            self._clean_value(candidato.get("cap")),
            self._clean_value(candidato.get("linkedin")),
            self._clean_value(candidato.get("portfolio")),
            candidato.get("disponibilita_trasferte"),  # Already boolean
            candidato.get("disponibilita_remoto"),      # Already boolean
            self._clean_value(candidato.get("lettera_presentazione")),
            self._clean_value(candidato.get("profilo_sintetico")),
            'nuovo',  # stato_candidato default
            datetime.now(),
            datetime.now()
        )

        cursor.execute(query, values)
        result = cursor.fetchone()
        return result[0] if result else None

    def _insert_esperienze(self, cursor, candidato_id: int, esperienze: List[Dict]):
        """Insert work experiences"""

        query = """
            INSERT INTO esperienze_lavorative (
                id_candidato, azienda, settore, posizione, descrizione,
                citta, provincia, data_inizio, data_fine, attuale, progetti_rilevanti
            ) VALUES (
                %s, %s, %s, %s, %s,
                %s, %s, %s, %s, %s, %s
            )
        """

        for esp in esperienze:
            values = (
                candidato_id,
                self._clean_value(esp.get("azienda")),
                self._clean_value(esp.get("settore")),
                self._clean_value(esp.get("posizione")),
                self._clean_value(esp.get("descrizione")),
                self._clean_value(esp.get("citta")),
                self._clean_value(esp.get("provincia")),
                self._clean_value(esp.get("data_inizio")),
                self._clean_value(esp.get("data_fine")),
                esp.get("attuale", False),  # Already boolean
                self._clean_value(esp.get("progetti_rilevanti"))
            )
            cursor.execute(query, values)

    def _insert_formazione(self, cursor, candidato_id: int, formazione: List[Dict]):
        """Insert education records"""

        query = """
            INSERT INTO formazione (
                id_candidato, tipo, istituto, titolo, campo_studio,
                voto, citta, provincia, data_inizio, data_fine, descrizione
            ) VALUES (
                %s, %s, %s, %s, %s,
                %s, %s, %s, %s, %s, %s
            )
        """

        for edu in formazione:
            values = (
                candidato_id,
                self._clean_value(edu.get("tipo")),
                self._clean_value(edu.get("istituto")),
                self._clean_value(edu.get("titolo")),
                self._clean_value(edu.get("campo_studio")),
                self._clean_value(edu.get("voto")),
                self._clean_value(edu.get("citta")),
                self._clean_value(edu.get("provincia")),
                self._clean_value(edu.get("data_inizio")),
                self._clean_value(edu.get("data_fine")),
                self._clean_value(edu.get("descrizione"))
            )
            cursor.execute(query, values)

    def _insert_competenze(self, cursor, candidato_id: int, competenze: List[Dict]):
        """
        Insert skills as JSON in competenze_candidati table.
        Structure: saves all competenze as JSON in the descrizione field.
        """
        if not competenze:
            return

        # Calculate average level and total years of experience
        livello_medio = sum(comp.get("livello", 3) for comp in competenze) / len(competenze)
        anni_esperienza_totali = max((comp.get("anni_esperienza") or 0 for comp in competenze), default=0)

        # Create JSON structure for competenze
        competenze_json = {
            "competenze": competenze,
            "summary": {
                "total_skills": len(competenze),
                "avg_level": round(livello_medio, 2),
                "max_experience_years": anni_esperienza_totali
            }
        }

        query = """
            INSERT INTO competenze_candidati (
                id_candidato, livello, anni_esperienza, descrizione
            ) VALUES (%s, %s, %s, %s)
            ON CONFLICT (id_candidato) DO UPDATE 
            SET livello = EXCLUDED.livello,
                anni_esperienza = EXCLUDED.anni_esperienza,
                descrizione = EXCLUDED.descrizione
        """

        values = (
            candidato_id,
            int(round(livello_medio)),
            anni_esperienza_totali,
            json.dumps(competenze_json, ensure_ascii=False)
        )

        cursor.execute(query, values)

    def test_connection(self) -> Tuple[bool, str]:
        """Test database connection"""
        try:
            conn = self.get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT version();")
            version = cursor.fetchone()
            cursor.close()
            conn.close()
            return True, f"Connessione riuscita: {version[0]}"
        except Exception as e:
            return False, f"Errore di connessione: {str(e)}"


# Singleton instance
database_manager = DatabaseManager()