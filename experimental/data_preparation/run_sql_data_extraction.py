import os

from dotenv import load_dotenv
from llama_index.core import SQLDatabase
from llama_index.llms.openai import OpenAI
from sqlalchemy import create_engine
from utils.table_info_vectorizer import TableInfoVectorizer
from utils.ddl_data_extractor import DDLDataExtractor
from utils.db_embeddings_extractor import DBEmbeddingsExtractor


def main():
    load_dotenv()
    api_key = os.getenv("OPENAI_API_KEY")

    llm = OpenAI(model="gpt-4o", api_key=api_key)

    # Connect to db
    DB_HOSTNAME = os.getenv("DB_HOSTNAME")
    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_NAME = os.getenv("DB_NAME")
    DB_PORT = os.getenv("DB_PORT")

    connection_string = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOSTNAME}:{DB_PORT}/{DB_NAME}"

    # Connect to db
    engine = create_engine(connection_string)
    sql_database = SQLDatabase(engine)
    dialect = engine.dialect.name

    # Define source and out paths
    ddl_data_path = "../database/init/01_hiring_db_schema_definition.sql"
    out_table_info_path = "../db_files/hiring_db/extracted_data/table_infos"
    out_table_data_index_path = "../db_files/hiring_db/extracted_data/table_data_index"

    # Extract table name and schema from the DDL, enhance with AI comments and save them
    max_example_row_for_enhancement = 5
    ddl_extractor = DDLDataExtractor(
        [ddl_data_path],
        out_table_info_path,
        dialect,
        llm,
        max_example_row_for_enhancement,
    )
    ddl_extractor.process_and_save_table_info()

    # Extract relevant row, index them and save in vect db
    table_info_vectorizer = TableInfoVectorizer(sql_database=sql_database, table_index_dir=out_table_data_index_path)
    table_info_vectorizer.index_all_tables(max_limit_sql_rows=3)

    # Create embeddings for tables
    db_embeddings_extractor = DBEmbeddingsExtractor(sql_database,embeddings_model_type='openai',batch_size=32)
    db_embeddings_extractor.create_db_embeddings()

if __name__ == "__main__":
    main()
