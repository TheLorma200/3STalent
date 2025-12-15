"""
Helper script to generate embeddings for candidates after CV upload.
This can be run manually or integrated into the upload flow.
"""

import sys
from pathlib import Path

# Add parent directory to path to import modules
sys.path.append(str(Path(__file__).parent))

from CVDatabaseConnectionManager import database_manager
from llama_index.core import SQLDatabase
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()

# Import the DBEmbeddingsExtractor from your existing file
# Adjust the import path based on your project structure
try:
    from data_preparation.utils.db_embeddings_extractor import DBEmbeddingsExtractor
except ImportError:
    print("⚠️  Could not import DBEmbeddingsExtractor")
    print("Make sure the embeddings extractor file is in the Python path")
    sys.exit(1)


def generate_embeddings_for_candidate(candidate_id: int) -> bool:
    """
    Generate embeddings for a specific candidate

    Args:
        candidate_id: ID of the candidate

    Returns:
        bool: Success status
    """
    try:
        # Create database connection
        db_url = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOSTNAME')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
        engine = create_engine(db_url)
        sql_database = SQLDatabase(engine)

        # Initialize embeddings extractor
        extractor = DBEmbeddingsExtractor(
            sql_database=sql_database,
            embeddings_model_type='openai',
            batch_size=10
        )

        # Generate embeddings
        print(f"🔮 Generazione embeddings per candidato ID: {candidate_id}...")
        success, message = database_manager.generate_embeddings_for_candidate(
            candidate_id,
            extractor
        )

        if success:
            print(f"✅ {message}")
            return True
        else:
            print(f"❌ {message}")
            return False

    except Exception as e:
        print(f"❌ Errore: {str(e)}")
        return False


def generate_embeddings_for_all_candidates():
    """Generate embeddings for all candidates without embeddings"""
    try:
        conn = database_manager.get_connection()
        cursor = conn.cursor()

        # Find candidates without embeddings
        cursor.execute("""
                       SELECT id_candidato, nome, cognome
                       FROM candidati
                       WHERE embedding IS NULL
                       """)

        candidates = cursor.fetchall()
        cursor.close()
        conn.close()

        if not candidates:
            print("✅ Tutti i candidati hanno già gli embeddings")
            return

        print(f"📋 Trovati {len(candidates)} candidati senza embeddings")

        for candidate_id, nome, cognome in candidates:
            print(f"\n🔄 Processando: {nome} {cognome} (ID: {candidate_id})")
            generate_embeddings_for_candidate(candidate_id)

        print("\n✅ Processo completato!")

    except Exception as e:
        print(f"❌ Errore: {str(e)}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Generate embeddings for candidates')
    parser.add_argument('--candidate-id', type=int, help='ID of specific candidate')
    parser.add_argument('--all', action='store_true', help='Process all candidates without embeddings')

    args = parser.parse_args()

    if args.candidate_id:
        generate_embeddings_for_candidate(args.candidate_id)
    elif args.all:
        generate_embeddings_for_all_candidates()
    else:
        print("Usage:")
        print("  python generate_candidate_embeddings.py --candidate-id 123")
        print("  python generate_candidate_embeddings.py --all")