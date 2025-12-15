import json
import os
from typing import Dict

from llama_index.core import (
    SQLDatabase,
    StorageContext,
    VectorStoreIndex,
    load_index_from_storage,
)
from llama_index.core.bridge.pydantic import Field
from llama_index.core.schema import TextNode
from sqlalchemy import text


class TableInfoVectorizer:
    def __init__(self, sql_database, table_index_dir):
        self.sql_database = sql_database
        self.table_index_dir = table_index_dir

    def get_saved_index_dict(self):
        vector_index_dict = {}

        # Check if directory exists and contains indices
        if os.path.exists(self.table_index_dir) and os.listdir(self.table_index_dir):
            print(f"\nLoading existing indices from {self.table_index_dir}")

            # Load existing indices for all tables
            for table_name in self.sql_database.get_usable_table_names():
                table_dir = f"{self.table_index_dir}/{table_name}"
                if os.path.exists(table_dir):
                    print(f"Loading index for table: {table_name}")
                    # Rebuild storage context and load index
                    storage_context = StorageContext.from_defaults(persist_dir=table_dir)
                    index = load_index_from_storage(storage_context, index_id="vector_index")
                    vector_index_dict[table_name] = index
        return vector_index_dict

    def index_all_tables(self, max_limit_sql_rows: int = 3) -> Dict[str, VectorStoreIndex]:
        """Index all tables or load existing indices."""

        vector_index_dict = self.get_saved_index_dict()

        if len(vector_index_dict) == 0:
            print(f"\nCreating new indices in {self.table_index_dir}")
            # Create directory
            os.makedirs(self.table_index_dir, exist_ok=True)

            # Create indices for all tables
            engine = self.sql_database.engine
            for table_name in self.sql_database.get_usable_table_names():
                print(f"Indexing rows in table: {table_name}")

                # Check the database dialect
                dialect = engine.dialect

                # Adjust quote character based on dialect
                if dialect == "mysql":
                    quote_char = "`"
                elif dialect == "postgresql":
                    quote_char = '"'
                else:
                    quote_char = '"'  # default

                # get all rows from table
                with engine.connect() as conn:
                    query = f"SELECT * FROM {quote_char}{table_name}{quote_char} LIMIT {max_limit_sql_rows}"
                    cursor = conn.execute(text(query))
                    result = cursor.fetchall()
                    row_tups = []
                    for row in result:
                        row_tups.append(tuple(row))

                # index each row
                nodes = [TextNode(text=str(t)[:1500]) for t in row_tups] #limit the maximum lenght of the string to 1500 characters

                # create vector store index
                index = VectorStoreIndex(nodes)

                # save index
                index.set_index_id("vector_index")
                index.storage_context.persist(f"{self.table_index_dir}/{table_name}")

                vector_index_dict[table_name] = index

        return vector_index_dict
