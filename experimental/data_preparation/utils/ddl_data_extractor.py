import json
import os
import re

from dotenv import load_dotenv
from llama_index.core.bridge.pydantic import Field
from llama_index.llms.openai import OpenAI


class TableInfo:
    """Information regarding a structured table."""

    table_name: str = Field(..., description="table name (must be underscores and NO spaces)")
    table_summary: str = Field(..., description="short, concise summary/caption of the table")


class DDLDataExtractor:
    def __init__(
        self,
        ddl_data_paths: str,
        out_table_info_path: str,
        dialect,
        llm,
        max_example_row_for_enhancement,
    ):
        self.ddl_data_paths = ddl_data_paths
        self.out_table_info_path = out_table_info_path
        self.llm = llm
        self.dialect = dialect
        self.max_example_row_for_enhancement = max_example_row_for_enhancement

    def get_saved_table_infos(self):
        table_infos = []
        if os.path.exists(self.out_table_info_path) and os.listdir(
            self.out_table_info_path
        ):  # Check if directory exists and is not empty
            print(f"\nLoading existing table information from {self.out_table_info_path}")
            # Load all existing json files
            for file_name in sorted(os.listdir(self.out_table_info_path)):
                if file_name.endswith(".json"):
                    file_path = os.path.join(self.out_table_info_path, file_name)
                    with open(file_path, "r") as f:
                        info = json.load(f)

                    table_info = TableInfo()
                    table_info.table_name = info["table_name"]
                    table_info.table_summary = info["table_summary"]
                    table_infos.append(table_info)
                    print(f"Loaded table: {table_info.table_name}")

        return table_infos

    def process_and_save_table_info(self) -> list:
        table_infos = []
        print(f"File paths list: {self.ddl_data_paths}")
        for ddl_file in self.ddl_data_paths:
            print(f"\nExtracting new table information and creating {self.out_table_info_path}")
            print(f"ddl file path: {ddl_file}")

            try:
                with open(ddl_file, "r", encoding="utf-8") as f:
                    content = f.read()
                print(f"\n[DEBUG] Contenuto del file DDL ({ddl_file}):\n{content}\n")
            except Exception as e:
                print(f"[ERRORE] Impossibile leggere il file DDL {ddl_file}: {e}")
            # Create directory
            os.makedirs(self.out_table_info_path, exist_ok=True)

            # with open(self.ddl_data_path, 'r', encoding='utf-8') as f:
            #     ddl_content = f.read()

            # Extract table information
            # cleaned_ddl= self._remove_insert_from_ddl(ddl_file_path=self.ddl_data_path)
            # table_extracted_info = self._extract_table_info_from_cleaned_ddl(ddl_content=cleaned_ddl,dialect=self.dialect)
            try:
                table_extracted_info = self._extract_all_table_info_from_ddl(
                    ddl_file,
                    dialect=self.dialect,
                    max_inserts=self.max_example_row_for_enhancement,
                )
            except Exception as e:
                print(f" Errore in _extract_all_table_info_from_ddl: {e}")
                continue
            print(f"Numero di tabelle estratte: {len(table_extracted_info)}")
            print(f"table_extracted_info: {table_extracted_info}")


            # Process and save each table
            for idx, info in enumerate(table_extracted_info):
                print(f"\nProcessing table: {info['table_name']}")

                table_info = TableInfo()
                table_info.table_name = info["table_name"]
                table_info.table_summary = info["table_summary"]

                if table_info.table_summary is None:
                    # If no description exists, query LlamaIndex
                    try:
                        generated_description = self._get_table_description(
                            info["table_name"], info["complete_ddl"], self.llm
                        )
                        print(f"Generated description: {generated_description}")
                    except Exception as e:
                        print(f" Errore durante la generazione della descrizione per {info['table_name']}: {e}")
                        generated_description = "Descrizione non disponibile"
                    table_info.table_summary = generated_description
                    info["table_summary"] = generated_description
                else:
                    print(f"Generazione non riuscita {info['table_name']}")
                # Save to file
                file_name = f"{table_info.table_name}.json"
                if os.path.exists(os.path.join(self.out_table_info_path, file_name)):
                    file_name = f"{idx}_{table_info.table_name}.json"

                print(f"Percorso di output: {self.out_table_info_path} - Esiste: {os.path.exists(self.out_table_info_path)} - Scrivibile: {os.access(self.out_table_info_path, os.W_OK)}")

                out_file = os.path.join(self.out_table_info_path, file_name)

                #out_file = f"{self.out_table_info_path}/{idx}_{table_info.table_name}.json"
                with open(out_file, "w") as f:
                    json.dump(info, f)
                print(f"Wrote {out_file}")

                table_infos.append(table_info)

        return table_infos

    def _remove_insert_from_ddl(self, ddl_file_path: str) -> str:
        """Extract only CREATE TABLE and COMMENT statements from SQL dump file.

        Args:
            ddl_file_path: Path to the SQL dump file
        Returns:
            str: Cleaned DDL content containing only CREATE TABLE and COMMENT statements
        """
        cleaned_lines = []
        current_create_statement = []
        capturing_create = False

        with open(ddl_file_path, "r", encoding="utf-8") as file:
            for line in file:
                # Skip INSERT statements
                if line.strip().startswith("INSERT"):
                    continue

                # Start capturing CREATE TABLE statement
                if "CREATE TABLE" in line:
                    capturing_create = True
                    current_create_statement = [line]
                    continue

                # If we're capturing a CREATE TABLE statement
                if capturing_create:
                    current_create_statement.append(line)
                    if line.strip().endswith(";"):
                        capturing_create = False
                        cleaned_lines.extend(current_create_statement)
                        continue

                # Capture COMMENT statements
                if line.strip().startswith("COMMENT ON TABLE"):
                    cleaned_lines.append(line)

        return "".join(cleaned_lines)

    def _extract_table_info_from_cleaned_ddl(self, ddl_content: str, dialect: str = "postgresql") -> list[dict]:
        """Extract table information from cleaned DDL content.

        Args:
            ddl_content: Cleaned DDL content containing only CREATE TABLE and COMMENT statements
            dialect: Database dialect ('mysql', 'postgresql', etc.)
        Returns:
            list[dict]: List of dictionaries containing table information
        """
        # Normalize dialect name
        dialect = dialect.lower()

        # Define dialect-specific patterns
        patterns = {
            "mysql": {
                "create_table": r"CREATE TABLE `?(\w+)`?\s*\(",
                "table_format": lambda name: f"`{name}`",
                "comment_in_create": r"COMMENT=['\"](.*?)['\"]",
            },
            "postgresql": {
                "create_table": r"CREATE TABLE public\.(\w+)\s*\(",
                "table_format": lambda name: f"public.{name}",
                "comment_pattern": r"COMMENT ON TABLE public\.(\w+)\s+IS\s+'([^']+)';",
            },
            "mssql": {
                "create_table": r"CREATE TABLE \[?(\w+)\]?\s*\(",
                "table_format": lambda name: f"[{name}]",
                "comment_pattern": r"EXEC\s+sp_addextendedproperty\s+@name\s*=\s*N?'MS_Description'\s*,\s*@value\s*=\s*N?'([^']+)'\s*,\s*@level0type\s*=\s*N?'SCHEMA'\s*,\s*@level0name\s*=\s*N?'dbo'\s*,\s*@level1type\s*=\s*N?'TABLE'\s*,\s*@level1name\s*=\s*N?'(\w+)'",
            },
        }

        if dialect not in patterns:
            raise ValueError(f"Unsupported dialect: {dialect}. Supported dialects are: {', '.join(patterns.keys())}")

        dialect_patterns = patterns[dialect]
        table_dict = {}

        # Process CREATE TABLE statements
        create_matches = re.finditer(f"{dialect_patterns['create_table']}.*?;", ddl_content, re.DOTALL)
        for match in create_matches:
            create_stmt = match.group(0)
            table_name = re.search(dialect_patterns["create_table"], create_stmt).group(1)

            table_dict[table_name] = {
                "table_name": table_name,
                "table_summary": None,
                "complete_ddl": create_stmt,
            }

            # Handle comments within CREATE TABLE (MySQL style)
            if "comment_in_create" in dialect_patterns:
                comment_match = re.search(dialect_patterns["comment_in_create"], create_stmt)
                if comment_match:
                    table_dict[table_name]["table_summary"] = comment_match.group(1)

        # Process separate comment statements (PostgreSQL style)
        if "comment_pattern" in dialect_patterns:
            comment_matches = re.finditer(dialect_patterns["comment_pattern"], ddl_content)
            for match in comment_matches:
                table_name = match.group(1)
                if table_name in table_dict:
                    table_dict[table_name]["table_summary"] = match.group(2)
                    table_dict[table_name]["complete_ddl"] += f"\n{match.group(0)}"

        return list(table_dict.values())

    def _get_table_description(self, table_name: str, table_structure: str, llm) -> str:
        # Create prompt
        prompt = f"""Analizza la seguente struttura di tabella SQL e genera una descrizione tecnica ma comprensibile:
        Table Name: {table_name}
        SQL Structure:
        {table_structure}

        Requisiti per la descrizione:
        1. Descrivi lo scopo principale della tabella
        2. Evidenzia i campi più importanti e il loro utilizzo
        3. Menzioni eventuali relazioni con altre tabelle
        4. La descrizione deve essere in italiano
        5. Sia concisa (massimo 3 frasi)

        Esempio di formato desiderato:
        "Tabella con la lista delle attività che vengono svolte dagli operatori all'interno di ogni commessa.
        La struttura della tabella è ad albero gerarchico tramite parent_id.
        Il campo nome indica la mansione svolta o il nome dell'utente per il quale si eroga il servizio."

        Genera solo la descrizione, senza prefissi o formattazione aggiuntiva."""

        # Get response directly from LLM
        response = llm.complete(prompt)

        return str(response)

    def _extract_all_table_info_from_ddl(
        self, ddl_file_path: str, dialect: str = "postgresql", max_inserts: int = 5
    ) -> list[dict]:
        """Extract table information from a DDL file, including optional INSERT values."""

        dialect = dialect.lower()
        patterns = {
            "mysql": {
                "create_table": r"CREATE TABLE `?(\w+)`?\s*\(",
                "insert_pattern": r"INSERT INTO `?(\w+)`? VALUES\s*(.+?);", #INSERT INTO `?(\w+)`?\s+VALUES\s*(.+?);
                "comment_in_create": r"COMMENT=['\"](.*?)['\"]",
            },
            "postgresql": {
                "create_table": r'CREATE TABLE "?(\w+)"?\s*\(', #CREATE TABLE public\.(\w+)\s*\(
                "insert_pattern": r'INSERT INTO "?(\w+)"?\s+VALUES\s*(.+?);', #INSERT INTO public\.(\w+) VALUES\s*(.+?);
                "comment_pattern": r"COMMENT ON TABLE public\.\"?(\w+)\"?\s+IS\s+'([^']+)';",
            },
            "mssql": {
                # Updated to handle both square brackets AND backticks (for mixed syntax files)
                "create_table": r"CREATE TABLE [\[\`]?(\w+)[\]\`]?\s*\(",
                "insert_pattern": r"INSERT INTO [\[\`]?(\w+)[\]\`]?\s+VALUES\s*(.+?);",
                "comment_pattern": r"EXEC\s+sp_addextendedproperty\s+@name\s*=\s*N?'MS_Description'\s*,\s*@value\s*=\s*N?'([^']+)'\s*,\s*@level0type\s*=\s*N?'SCHEMA'\s*,\s*@level0name\s*=\s*N?'dbo'\s*,\s*@level1type\s*=\s*N?'TABLE'\s*,\s*@level1name\s*=\s*N?'(\w+)'",
            },
        }

        if dialect not in patterns:
            raise ValueError(f"Unsupported dialect: {dialect}. Supported dialects: {', '.join(patterns.keys())}")

        dialect_patterns = patterns[dialect]
        table_dict = {}
        value_counts = {}

        def process_values_str(values_str: str) -> list:
            """Extract individual value sets from a VALUES string."""
            return re.findall(r"\([^)]+\)", values_str)

        with open(ddl_file_path, "r", encoding="utf-8") as file:
            content = file.read()
            # Process CREATE TABLE statements \)
            create_matches = re.finditer(r"CREATE TABLE.*?;", content, re.DOTALL | re.IGNORECASE)
            for create_match in create_matches:
                create_stmt = create_match.group(0)
                match = re.search(dialect_patterns["create_table"], create_stmt, re.IGNORECASE)
                if match:
                    table_name = match.group(1)
                    print(f"✅  Estratta tabella: {table_name}")
                    table_dict[table_name] = {
                        "table_name": table_name,
                        "table_summary": None,
                        "complete_ddl": create_stmt,
                        "pending_values": [],
                    }
                    value_counts[table_name] = 0

                    if "comment_in_create" in dialect_patterns:
                        comment_match = re.search(dialect_patterns["comment_in_create"], create_stmt)
                        if comment_match:
                            table_dict[table_name]["table_summary"] = comment_match.group(1)

            # Process INSERT INTO statements
            insert_matches = re.finditer(dialect_patterns["insert_pattern"], content, re.DOTALL| re.IGNORECASE)
            for insert_match in insert_matches:
                table_name = insert_match.group(1)
                if table_name in table_dict and value_counts[table_name] < max_inserts:
                    values_str = insert_match.group(2)
                    values = process_values_str(values_str)

                    remaining_slots = max_inserts - value_counts[table_name]
                    values_to_add = values[:remaining_slots]

                    if values_to_add:
                        table_dict[table_name]["pending_values"].extend(values_to_add)
                        value_counts[table_name] += len(values_to_add)

            # Process PostgreSQL COMMENT ON TABLE statements
            if dialect == "postgresql":
                comment_matches = re.finditer(dialect_patterns["comment_pattern"], content)
                for match in comment_matches:
                    table_name = match.group(1)
                    if table_name in table_dict:
                        table_dict[table_name]["table_summary"] = match.group(2)
                        table_dict[table_name]["complete_ddl"] += f"\n{match.group(0)}"

            # Process MSSQL extended property comments
            elif dialect == "mssql":
                comment_matches = re.finditer(dialect_patterns["comment_pattern"], content, re.IGNORECASE)
                for match in comment_matches:
                    table_name = match.group(2)  # Note: group(2) for MSSQL pattern
                    if table_name in table_dict:
                        table_dict[table_name]["table_summary"] = match.group(1)
                        table_dict[table_name]["complete_ddl"] += f"\n{match.group(0)}"

            # Add INSERT statements to the complete DDL
            for table_name, info in table_dict.items():
                if info["pending_values"]:
                    if dialect == "mysql":
                        insert_stmt = f"\nINSERT INTO `{table_name}` VALUES {','.join(info['pending_values'])};"
                    elif dialect == "mssql":
                        # Use square brackets for proper MSSQL syntax
                        insert_stmt = f"\nINSERT INTO [{table_name}] VALUES {','.join(info['pending_values'])};"
                    else:  # postgresql
                        insert_stmt = f"\nINSERT INTO public.{table_name} VALUES {','.join(info['pending_values'])};"
                    info["complete_ddl"] += insert_stmt
                del info["pending_values"]

        return list(table_dict.values())

    # Unused
    def _old_extract_all_table_info_from_ddl(self, ddl_content: str) -> list[dict]:
        """Extract all table information from DDL file, including tables without comments."""

        # Dictionary to store table info
        table_dict = {}

        # Pattern to find complete CREATE TABLE statements including WITH clause
        create_pattern = r"CREATE TABLE public\.(\w+)\s*\((.*?)\)(\s*WITH\s*\([^)]+\))?\s*;"
        create_matches = re.finditer(create_pattern, ddl_content, re.DOTALL)

        # First pass: Get all table names and definitions
        for match in create_matches:
            table_name = match.group(1)
            table_content = match.group(2)
            with_clause = match.group(3) if match.group(3) else ""

            # Store complete DDLb
            complete_ddl = f"CREATE TABLE public.{table_name} (\n{table_content}\n){with_clause};"

            # Initialize table info
            table_dict[table_name] = {
                "table_name": table_name,
                "table_summary": None,
                "complete_ddl": complete_ddl,
            }

        # Pattern to find COMMENT ON TABLE statements
        comment_pattern = r"COMMENT ON TABLE public\.(\w+)\s+IS\s+'([^']+)';"
        comment_matches = re.finditer(comment_pattern, ddl_content)

        # Add comments to respective tables
        for match in comment_matches:
            table_name = match.group(1)
            if table_name in table_dict:
                table_dict[table_name]["table_summary"] = match.group(2).strip()
                table_dict[table_name]["complete_ddl"] += (
                    f"\n\nCOMMENT ON TABLE public.{table_name} IS '{match.group(2)}';"
                )

        return list(table_dict.values())

    def print_table_info(self, table_info: dict, detailed: bool = False):
        """Print table information in a formatted way."""

        print("\n" + "=" * 80)
        print(f"TABLE: {table_info['table_name']}")
        print("=" * 80)

        print("\nSUMMARY:")
        if table_info["table_summary"]:
            print(f"  {table_info['table_summary']}")
        else:
            print("  No summary available")

        if detailed:
            print("\n COMPLETE DDL:")
            print("-" * 80)
            print(table_info["complete_ddl"])
            print("-" * 80)

        print("\n")

    # Test function
    def test_ddl_table_extraction_info(self):
        """Print table info extraction from ddl"""

        # table_extractor.test_table_extraction()
        # Read your SQL file
        with open("../db_files/aeris_test_ai_fixed.sql", "r", encoding="utf-8") as f:
            ddl_content = f.read()

        # Extract table information
        tables_info = self._extract_all_table_info_from_ddl(ddl_content)
        # Print summary statistics
        print("\n📊 EXTRACTION SUMMARY")
        print("=" * 80)
        print(f"Total tables found: {len(tables_info)}")
        print(f"Tables with comments: {sum(1 for t in tables_info if t['table_summary'] is not None)}")
        print(f"Tables without comments: {sum(1 for t in tables_info if t['table_summary'] is None)}")
        print("=" * 80)

        # Ask user if they want to see detailed information
        response = input("\nDo you want to see detailed information for each table? (y/n): ")
        detailed = response.lower() == "y"

        # Print information for each table
        for table_info in tables_info:
            self.print_table_info(table_info, detailed)

            if detailed:
                # If in detailed mode, ask if user wants to continue after each table
                if input("\nContinue to next table? (y/n): ").lower() != "y":
                    break


if __name__ == "__main__":
    # Select db dialact
    dialect = "postgresql"
    # Load api key from .env
    load_dotenv()
    api_key = os.getenv("OPENAI_API_KEY")
    # Instantiate LLM
    llm = OpenAI(model="gpt-4o", api_key=api_key)
    # Extract data from DDL
    ddl_extractor = DDLDataExtractor(
        "../db_files/aeris_test_db/init/01-aeris_test_ai_fixed.sql",
        "../db_files/hiring_db/table_infos",
        dialect,
        llm,
    )
    ddl_extractor.process_and_save_table_info()
