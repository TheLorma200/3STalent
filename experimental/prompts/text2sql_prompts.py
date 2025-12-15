text_to_sql_prompt = ("""\
    Given an input question, first create a syntactically correct {dialect}
    query to run, then look at the results of the query and return the answer.
    You can order the results by a relevant column to return the most
    interesting examples in the database.\n\n
    Never query for all the columns from a specific table, only ask for a
    few relevant columns given the question.\n\n
    Pay attention to use only the column names that you can see in the schema
    description.\n\n
    Be careful to not query for columns that do not exist.\n\n
    Pay attention to which column is in which table. \n\n
    Also, qualify column names with the table name when needed.\n\n
    IMPORTANT NOTE: you can use specialized pgvector syntax (`<->`) to do nearest \
    neighbors/semantic search to a given vector from an embeddings column in the table. \
    The embeddings value for a given row typically represents the semantic meaning of that row. \
    The vector represents an embedding representation \
    of the question, given below. Do NOT fill in the vector values directly, but rather specify a \
    `[query_vector]` placeholder. For instance, some select statement examples below \
    (the name of the embeddings column is `embedding`):
    SELECT * FROM items ORDER BY embedding <-> '[query_vector]' LIMIT 5;
    SELECT * FROM items WHERE id != 1 ORDER BY embedding <-> (SELECT embedding FROM items WHERE id = 1) LIMIT 5;
    SELECT * FROM items WHERE embedding <-> '[query_vector]' < 5;

    You are required to use the following format, each taking one line:\n\n
    SQLQuery: SQL Query to run\n\n
    Only use tables listed below.\n
    Produce only a single final query without examples\n\n
    {schema}\n\n
    Question: {query_str}\n\n
    SQLQuery:
    """
)

text_to_sql_prompt_magic_hire_01 = ("""\
    You are an agent tasked with creating SQL queries in the context of a software for the 
    selection in an hiring process.
    Given an input question, first create a syntactically correct {dialect}
    query to run, then look at the results of the query and return the answer.
    You can order the results by a relevant column to return the most
    interesting examples in the database.
    Never query for all the columns from a specific table, only ask for a
    few relevant columns given the question.
    Pay attention to use only the column names that you can see in the schema
    description.
    Be careful to not query for columns that do not exist.
    Pay attention to which column is in which table. 
    Also, qualify column names with the table name when needed.
    IMPORTANT NOTE: you can use specialized pgvector syntax (`<->`) to do nearest \
    neighbors/semantic search to a given vector from an embeddings column in the table. \
    The embeddings value for a given row typically represents the semantic meaning of that row. \
    The vector represents an embedding representation \
    of the question, given below. Do NOT fill in the vector values directly, but rather specify a \
    `[query_vector]` placeholder. For instance, some select statement examples below \
    (the name of the embeddings column is `embedding`):
    SELECT * FROM items ORDER BY embedding <-> '[query_vector]' LIMIT 5;
    SELECT * FROM items WHERE id != 1 ORDER BY embedding <-> (SELECT embedding FROM items WHERE id = 1) LIMIT 5;
    SELECT * FROM items WHERE embedding <-> '[query_vector]' < 5;
    ALWAYS use this feature for the ordering of relevant search whenever it may be useful. Unless the clearly question does \
    not benefit of this kind of search, assume we are looking for a way to search in the text fields of the database
    using this feature to order the results, while keeping less filtering parameters in the query itself. \
    
    VERY IMPORTANT:
    -Do not use direct text search in the query, use the pgvector syntax instead.
    -When searching for candidates return their most important personal information, like name, contact information and\
    their description. \
   - Since most of the search function will be executed on the basis of the query vector, DO NOT add unnecessary filters or "where" clauses  
    on the query unless clearly specifically requested in the question, or they may filter out good results.\n

    You are required to use the following format, each taking one line:
    Only use tables listed below.
    Produce only a single final query without examples
    {schema}
    Question: {query_str}
    SQLQuery:
    """
)

response_synthesis_prompt_str = (
    "Given an input question, synthesize a response from the query results that directly addresses the user's question.\n"
    "Important:\n"
    "- The response must be written in the following language: {language}\n"
    "- The number of displayed results is limited to the first {n_result}. Please make sure to clearly state this in the response.\n\n"
    "Query: {query_str}\n"
    "SQL: {sql_query}\n"
    "SQL Response: {context_str}\n"
    "Response: "
)

error_explanation_prompt_str = (
    "Sei un assistente che deve spiegare in modo chiaro e conciso perché non è stato possibile "
    "soddisfare la richiesta dell'utente dopo diversi tentativi.\n\n"
    "Inizia direttamente con la risposta senza mettere cose come 'Assistente:'"
    "Domanda Originale: {original_query}\n"
    "Tentativi effettuati: {error_history}\n\n"
    "Tabelle considerate nel contesto: {table_context}\n\n"
    "Scenari considerati nel contest (gli scenari sono pattern frequenti di insieme di joins"
    "usate su questo DB nel contesto di business intelligence {scenarios_context}\n\n"
    "Mi dispiace, ma dopo diversi tentativi non sono riuscito a generare una query SQL valida. "
    "Analizza il problema riscontrato e fornisci:\n"
    "- Una spiegazione concisa del problema principale\n"
    "- Se ci sono più possibili cause, elencale brevemente\n"
    "- Un suggerimento concreto su come ottenere l'informazione desiderata\n\n"
    "Mantieni la risposta breve e diretta, concentrandoti sul problema fondamentale. "
    "Usa elenchi puntati solo se ci sono effettivamente più cause o soluzioni da considerare."
)

error_correction_prompt_str = (
    "You are an SQL expert. Your task is to fix SQL queries that have resulted in errors. "
    "Analyze the error message, the original query and the context, then provide a corrected version of the query."
    "Original Query: {original_sql}\n"
    "Error Message: {error_message}\n"
    "User Question: {query}\n"
    "Tables in context: {table}\n"
    "You can order the results by a relevant column to return the most "
    "interesting examples in the database.\n\n"
    "Never query for all the columns from a specific table, only ask for a "
    "few relevant columns given the question.\n\n"
    "Pay attention to use only the column names that you can see in the schema "
    "description. "
    "Be careful to not query for columns that do not exist. "
    "Pay attention to which column is in which table. "
    "Also, qualify column names with the table name when needed.\n\n"
    "Below you'll find common business scenarios with their associated joins. "
    "These scenarios represent frequently used query patterns in the BI system. "
    "Use them as reference when building your query, especially when the question "
    "aligns with one of these scenarios.\n\n"
    "Available Scenarios and their Joins, each joins also contains its details:\n"
    "{scenarios_context}\n\n"
    "(not that the table in this section starts with T_<table_name>, but the T_ prefix is not actually part"
    "of the table name, so it must be omitted in the final query"
    "Please provide a corrected SQL query that addresses the error."
    "You are required to use the following format, each taking one line:\n\n"
    "Relevant Scenario: Name of the relevant scenario (if any) and why it's relevant\n"
    "SQLQuery: SQL Query to run (incorporating relevant scenario joins if applicable)\n"
    "Only use tables listed.\n"
    "Produce only a single final query without examples"
    "SQLQuery: "
)
