"""
Helper script to generate embeddings for candidates after CV upload.
Now uses CONSOLIDATED embedding approach.
"""
import sys
from pathlib import Path
sys.path.append(str(Path(__file__).parent))

from CVDatabaseConnectionManager import database_manager
from llama_index.core import SQLDatabase
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

load_dotenv()

try:
    from data_preparation.utils.db_embeddings_extractor import DBEmbeddingsExtractor
except ImportError:
    logger.error("⚠️  Could not import DBEmbeddingsExtractor")
    logger.error("Make sure the embeddings extractor file is in the Python path")
    sys.exit(1)


def generate_embeddings_for_candidate(candidate_id: int) -> bool:
    """
    Generate CONSOLIDATED embedding for a specific candidate

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

        # Generate consolidated embedding
        logger.info(f"🔮 Generating CONSOLIDATED embedding for candidate ID: {candidate_id}...")
        result = extractor.generate_embedding_for_candidate_comprehensive(candidate_id)

        if result['success']:
            logger.info(f"✅ {result['message']}")
            logger.info(f"   Text length: {result['text_length']} characters")
            return True
        else:
            logger.error(f"❌ {result['message']}")
            return False

    except Exception as e:
        logger.error(f"❌ Error: {str(e)}", exc_info=True)
        return False


def generate_embeddings_for_all_candidates():
    """Generate consolidated embeddings for all candidates without embeddings"""
    try:
        conn = database_manager.get_connection()
        cursor = conn.cursor()

        # Find candidates without embeddings or those marked for refresh
        cursor.execute("""
            SELECT id_candidato, nome, cognome
            FROM candidati
            WHERE embedding IS NULL 
               OR embedding_needs_refresh = TRUE
            ORDER BY id_candidato
        """)
        candidates = cursor.fetchall()

        cursor.close()
        conn.close()

        if not candidates:
            logger.info("✅ All candidates have up-to-date consolidated embeddings")
            return

        logger.info(f"📋 Found {len(candidates)} candidates needing embeddings")

        success_count = 0
        for candidate_id, nome, cognome in candidates:
            logger.info(f"\n🔄 Processing: {nome} {cognome} (ID: {candidate_id})")
            if generate_embeddings_for_candidate(candidate_id):
                success_count += 1

        logger.info(f"\n✅ Process completed! {success_count}/{len(candidates)} successful")

    except Exception as e:
        logger.error(f"❌ Error: {str(e)}", exc_info=True)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description='Generate CONSOLIDATED embeddings for candidates'
    )
    parser.add_argument(
        '--candidate-id',
        type=int,
        help='ID of specific candidate'
    )
    parser.add_argument(
        '--all',
        action='store_true',
        help='Process all candidates without embeddings'
    )

    args = parser.parse_args()

    if args.candidate_id:
        generate_embeddings_for_candidate(args.candidate_id)
    elif args.all:
        generate_embeddings_for_all_candidates()
    else:
        print("Usage:")
        print("  python generate_candidate_embeddings.py --candidate-id 123")
        print("  python generate_candidate_embeddings.py --all")