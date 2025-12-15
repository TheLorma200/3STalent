import re
from typing import List

from dateutil import parser
from llama_index.core.llms import ChatResponse
from llama_index.core.objects import SQLTableSchema

from text2sql_workflow.WorkflowClasses import *


def parse_response_to_sql(chat_response: ChatResponse) -> str:
    """Parse response to SQL, cutting at the first complete statement."""
    response = chat_response.message.content

    # Find SQL query section
    sql_query_start = response.find("SQLQuery:")
    if sql_query_start != -1:
        response = response[sql_query_start:]
        if response.startswith("SQLQuery:"):
            response = response[len("SQLQuery:") :]

    # Remove any SQLResult section
    sql_result_start = response.find("SQLResult:")
    if sql_result_start != -1:
        response = response[:sql_result_start]

    # Clean the response
    response = response.strip().strip("```").strip()

    # Remove "sql" at the beginning of the query (case-insensitive)
    response = re.sub(r"^sql\s+", "", response, flags=re.IGNORECASE)

    # Find the first complete SQL statement
    # Look for semicolon that's not inside quotes or parentheses
    in_quotes = False
    in_parentheses = 0
    for i, char in enumerate(response):
        if char == '"' or char == "'":
            in_quotes = not in_quotes
        elif char == "(" and not in_quotes:
            in_parentheses += 1
        elif char == ")" and not in_quotes:
            in_parentheses -= 1
        elif char == ";" and not in_quotes and in_parentheses == 0:
            return response[: i + 1].strip()

    return response.strip()



def parse_response_to_sql(chat_response: ChatResponse) -> str:
    """Parse response to SQL, cutting at the first complete statement."""
    response = chat_response.message.content

    # Find SQL query section
    sql_query_start = response.find("SQLQuery:")
    if sql_query_start != -1:
        response = response[sql_query_start:]
        if response.startswith("SQLQuery:"):
            response = response[len("SQLQuery:") :]

    # Remove any SQLResult section
    sql_result_start = response.find("SQLResult:")
    if sql_result_start != -1:
        response = response[:sql_result_start]

    # Clean the response
    response = response.strip().strip("```").strip()

    # Remove "sql" at the beginning of the query (case-insensitive)
    response = re.sub(r"^sql\s+", "", response, flags=re.IGNORECASE)

    # Find the first complete SQL statement
    # Look for semicolon that's not inside quotes or parentheses
    in_quotes = False
    in_parentheses = 0
    for i, char in enumerate(response):
        if char == '"' or char == "'":
            in_quotes = not in_quotes
        elif char == "(" and not in_quotes:
            in_parentheses += 1
        elif char == ")" and not in_quotes:
            in_parentheses -= 1
        elif char == ";" and not in_quotes and in_parentheses == 0:
            return response[: i + 1].strip()

    return response.strip()

def parse_response_for_pgVector(sql_query,query_embedding):
    """Parse response to SQL with pgvector, adding the embeddings"""


    query_embedding_str = str(query_embedding)
    sql_query_with_pgvector = sql_query.replace("[query_vector]", query_embedding_str)
    return sql_query_with_pgvector


def get_context_str(
    sql_database,
    vector_index_dict,
    query_str: str,
    table_schema_objs: List[SQLTableSchema],
    retrieved_scenarios,  # Add retrieved scenarios as parameter
    relevant_rows_top_k,
    verbose: bool = False,
) -> str:
    """Get complete context string including scenarios, tables, and rows."""
    context_parts = []

    # First, add scenarios context if any were retrieved
    if retrieved_scenarios:
        scenarios_context = f"Relevant Scenarios and their Joins:  \n\n  {retrieved_scenarios}"
        context_parts.append(scenarios_context)
        if verbose:
            print(f"> Scenarios Context: {scenarios_context}")

    # Then add table information and rows
    table_contexts = []
    for table_schema_obj in table_schema_objs:
        # Get table info + additional context
        table_info = sql_database.get_single_table_info(table_schema_obj.table_name)
        if table_schema_obj.context_str:
            table_opt_context = " The table description is: "
            table_opt_context += table_schema_obj.context_str
            table_info += table_opt_context

        # Lookup vector index to return relevant table rows
        vector_retriever = vector_index_dict[table_schema_obj.table_name].as_retriever(
            similarity_top_k=relevant_rows_top_k
        )

        # Include scenarios in the row retrieval query to get more relevant examples
        enhanced_query = f"{query_str} \n\n {retrieved_scenarios}"
        relevant_nodes = vector_retriever.retrieve(enhanced_query)

        if len(relevant_nodes) > 0:
            table_row_context = "\nHere are some relevant example rows (values in the same order as columns above)\n"
            for node in relevant_nodes:
                table_row_context += str(node.get_content()) + "\n"
            table_info += table_row_context

        if verbose:
            print(f"> Table Info: {table_info}")
        table_contexts.append(table_info)

    if table_contexts:
        tables_context = "Relevant Tables and their Content:\n" + "\n\n".join(table_contexts)
        context_parts.append(tables_context)

    # Join all context parts with clear separation
    return "\n\n".join(context_parts)


def get_table_context_str(
    sql_database,
    vector_index_dict,
    query_str: str,
    table_schema_objs: List[SQLTableSchema],
    relevant_rows_top_k,
    verbose: bool = False,
) -> str:
    """Get complete context string including scenarios, tables, and rows."""
    context_parts = []

    # Then add table information and rows
    table_contexts = []
    for table_schema_obj in table_schema_objs:
        # Get table info + additional context
        table_info = sql_database.get_single_table_info(table_schema_obj.table_name)
        if table_schema_obj.context_str:
            table_opt_context = " The table description is: "
            table_opt_context += table_schema_obj.context_str
            table_info += table_opt_context

        # Lookup vector index to return relevant table rows
        vector_retriever = vector_index_dict[table_schema_obj.table_name].as_retriever(
            similarity_top_k=relevant_rows_top_k
        )

        relevant_nodes = vector_retriever.retrieve(query_str)

        if len(relevant_nodes) > 0:
            table_row_context = "\nHere are some relevant example rows (values in the same order as columns above)\n"
            for node in relevant_nodes:
                table_row_context += str(node.get_content()) + "\n"
            table_info += table_row_context

        if verbose:
            print(f"> Table Info: {table_info}")
        table_contexts.append(table_info)

    if table_contexts:
        tables_context = "Relevant Tables and their Content:\n" + "\n\n".join(table_contexts)
        context_parts.append(tables_context)

    # Join all context parts with clear separation
    return "\n\n".join(context_parts)


def get_table_context_and_rows_str(
    sql_database,
    vector_index_dict,
    query_str: str,
    table_schema_objs: List[SQLTableSchema],
    verbose: bool = False,
):
    """Get table context string."""
    context_strs = []
    for table_schema_obj in table_schema_objs:
        # first append table info + additional context
        table_info = sql_database.get_single_table_info(table_schema_obj.table_name)
        if table_schema_obj.context_str:
            table_opt_context = " The table description is: "
            table_opt_context += table_schema_obj.context_str
            table_info += table_opt_context

        # also lookup vector index to return relevant table rows
        vector_retriever = vector_index_dict[table_schema_obj.table_name].as_retriever(similarity_top_k=3)
        relevant_nodes = vector_retriever.retrieve(query_str)
        if len(relevant_nodes) > 0:
            table_row_context = "\nHere are some relevant example rows (values in the same order as columns above)\n"
            for node in relevant_nodes:
                table_row_context += str(node.get_content()) + "\n"
            table_info += table_row_context

        if verbose:
            print(f"> Table Info: {table_info}")

        context_strs.append(table_info)
    return "\n\n".join(context_strs)


def format_scenarios_markdown(scenarios_text: str) -> str:
    """
    Format scenarios text into readable markdown format.
    """
    # Skip if empty or None
    if not scenarios_text or not scenarios_text.strip():
        return ""

    # Initialize output
    # formatted_scenarios = "### Relevant Scenarios used\n\n"
    formatted_scenarios = ""

    # Split into individual scenarios
    scenarios = scenarios_text.split("Scenario ")

    # Process each scenario (skip first empty split)
    for scenario in scenarios[1:]:
        # Get scenario name and joins
        scenario_parts = scenario.split(":", 1)
        if len(scenario_parts) != 2:
            continue

        scenario_name, joins = scenario_parts

        # Add scenario name
        formatted_scenarios += f"#### {scenario_name.strip()}\n\n"
        formatted_scenarios += "Join structure:\n"

        # Process joins
        joins_list = joins.strip().split("Join ")
        for join in joins_list[1:]:  # Skip first empty split
            join = join.strip()
            # Extract and format join details
            join_parts = join.split(":")
            if len(join_parts) != 2:
                continue

            join_name, join_details = join_parts
            # Clean up the join details and format
            join_details = join_details.strip().replace("T_", "")
            formatted_scenarios += f"- **{join_name}**\n  ```sql\n  {join_details}\n  ```\n"

        formatted_scenarios += "\n"

    return formatted_scenarios

