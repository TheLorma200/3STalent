import asyncio
import json
import os
import re
import sys
from datetime import datetime

from dateutil import parser
from dotenv import load_dotenv
from llama_index.core import (
    PromptTemplate,
    Settings,
    SQLDatabase,
    VectorStoreIndex,
    load_index_from_storage,
)
from llama_index.core.objects import (
    ObjectIndex,
    SQLTableNodeMapping,
    SQLTableSchema,
)
from llama_index.core.retrievers import SQLRetriever

# Added to use openAI as embedding model
from llama_index.embeddings.openai import OpenAIEmbedding
from llama_index.llms.openai import OpenAI

# put data into sqlite db
from sqlalchemy import (
Column,
Integer,
MetaData,
String,
Table,
create_engine,
)

from data_preparation.utils.ddl_data_extractor import DDLDataExtractor

from data_preparation.utils.table_info_vectorizer import TableInfoVectorizer
from prompts.text2sql_prompts import (text_to_sql_prompt_magic_hire_01,response_synthesis_prompt_str,
                                      error_explanation_prompt_str,
                                      error_correction_prompt_str)
from text2sql_workflow.Text2SqlWorkflow import Text2SqlWorkflow

from llama_index.core.query_engine import PGVectorSQLQueryEngine



class text2sql_engine:
    def __init__(
        self,
        ddl_path,
        table_info_path,
        table_index_dir
    ):
        load_dotenv()
        api_key = os.getenv("OPENAI_API_KEY")
        self.llm = OpenAI(model="gpt-4o", api_key=api_key)
        self.embed_model = OpenAIEmbedding(api_key=api_key,model_name="text-embedding-3-small")
        Settings.embed_model = self.embed_model



        # Path to ddl sql data
        self.ddl_path = ddl_path
        # Path to the saved data
        self.table_info_path = table_info_path
        # Path to saved table index dir
        self.table_index_dir = table_index_dir

        # Connect to db
        DB_HOSTNAME = os.getenv("DB_HOSTNAME")
        DB_USER = os.getenv("DB_USER")
        DB_PASSWORD = os.getenv("DB_PASSWORD")
        DB_NAME = os.getenv("DB_NAME")
        DB_PORT = os.getenv("DB_PORT")



        connection_string = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOSTNAME}:{DB_PORT}/{DB_NAME}"
        self.db_engine = create_engine(connection_string)
        self.sql_database = SQLDatabase(self.db_engine)
        self.table_info_vectorizer = TableInfoVectorizer(
            sql_database=self.sql_database, table_index_dir=self.table_index_dir
        )

        self.ddl_data_extractor = DDLDataExtractor(
            self.ddl_path,
            self.table_info_path,
            dialect=self.db_engine.dialect.name,
            llm=self.llm,
            max_example_row_for_enhancement=5,
        )

        # Set up the text2sql_workflow
        self.workflow = self._init_workflow()

    def _init_workflow(self):
        table_node_mapping = SQLTableNodeMapping(self.sql_database)
        table_infos = self.ddl_data_extractor.get_saved_table_infos()
        table_schema_objs = [
            SQLTableSchema(table_name=t.table_name, context_str=t.table_summary) for t in table_infos
        ]  # add a SQLTableSchema for each table
        table_info_index = ObjectIndex.from_objects(
            table_schema_objs,
            table_node_mapping,
            VectorStoreIndex,
        )
        # Create the obj retrievers
        # SQL tables data
        table_info_retriever = table_info_index.as_retriever(similarity_top_k=12)
        sql_retriever = SQLRetriever(self.sql_database)
        # Table content
        table_content_vector_index_dict = self.table_info_vectorizer.get_saved_index_dict()

        # Create the prompts template
        text2sql_prompt = PromptTemplate(text_to_sql_prompt_magic_hire_01)
        response_synthesis_prompt = PromptTemplate(response_synthesis_prompt_str)
        error_correction_prompt = PromptTemplate(error_correction_prompt_str)
        error_explanation_prompt = PromptTemplate(error_explanation_prompt_str)


        # Define the text2sql_workflow
        workflow = Text2SqlWorkflow(
            text2sql_prompt=text2sql_prompt,
            table_info_retriever=table_info_retriever,
            table_content_vector_index_dict=table_content_vector_index_dict,
            sql_retriever=sql_retriever,
            response_synthesis_prompt=response_synthesis_prompt,
            error_correction_prompt=error_correction_prompt,
            error_explanation_prompt=error_explanation_prompt,
            llm=self.llm,
            embed_model = self.embed_model,
            sql_database=self.sql_database,
            sql_dialect=self.db_engine.dialect,
            verbose=True,
            max_retries=3,
            timeout=300,  # seconds
        )
        print("Workflow setup complete")
        return workflow


async def main():
    # Path to ddl sql data
    ddl_path = "db_files/hiring_db/Dump_dw_aeris_b.sql"
    # Path to the saved data
    table_info_path = "db_files/hiring_db/extracted_data/table_infos"
    # Path to saved table index dir
    table_index_dir = "db_files/hiring_db/extracted_data/table_data_index"

    engine = text2sql_engine(
        ddl_path,
        table_info_path,
        table_index_dir,

    )
    current_datetime = datetime.now()
    # current_datetime = datetime(2024, 10, 15, 14, 30, 0)  # Year, Month, Day, Hour, Minute, Second

    response_language = "italian"
    # response_language = "English"

    show_x_result = 5

    (
        response,
        result_column_table,
        result_data_table,
    ) = await engine.workflow.run(
        # query="Quali sono gli operatori che hanno rendicontato più assenze nell ultimo mese? calcolale in ore",
        query="Mostrami i migliori candidati per un assunzione in un centro di riabilitazione per tossicodipendenti ",
        language=response_language,
        current_datetime=current_datetime,
        x_output_result=show_x_result,
    )


    print(f"\033[94m {str(response)} \033[0m")


if __name__ == "__main__":
    asyncio.run(main())
