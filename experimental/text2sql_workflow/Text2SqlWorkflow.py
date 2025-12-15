import time

from llama_index.core.workflow import (
    Context,
    Event,
    StartEvent,
    StopEvent,
    Workflow,
    step,
)
from openai import embeddings

from text2sql_workflow.WorkflowUtils import *
from text2sql_workflow.WorkflowClasses import *



class Text2SqlWorkflow(Workflow):
    """Text-to-SQL Workflow that does query-time table retrieval."""

    def __init__(
        self,
        text2sql_prompt,
        table_info_retriever,
        table_content_vector_index_dict,
        sql_retriever,
        response_synthesis_prompt,
        error_correction_prompt,  # New prompt for error correction
        error_explanation_prompt,
        llm,
        embed_model,
        sql_database,
        sql_dialect,
        max_retries=3,
        *args,
        **kwargs,
    ) -> None:
        """Init params."""
        super().__init__(*args, **kwargs)
        self.text2sql_prompt = text2sql_prompt  # tutor_search_text_to_sql_prompt_01
        self.table_info_retriever = table_info_retriever
        self.table_content_vector_index_dict = table_content_vector_index_dict
        self.sql_retriever = sql_retriever
        self.response_synthesis_prompt = response_synthesis_prompt
        self.error_correction_prompt = error_correction_prompt  # better_error_correction_prompt_str
        self.error_explanation_prompt = error_explanation_prompt
        self.llm = llm
        self.embed_model = embed_model
        self.max_retries = max_retries
        self.retry_count = 0
        self.error_history = []
        self.sql_database = sql_database
        self.sql_dialect = sql_dialect
        self.current_datetime = None
        self.language = "Italian"
        self.x_output_result = 5

    @step
    def retrieve_tables(self, ctx: Context, ev: StartEvent) -> TableRetrieveEvent:
        """Retrieve scenarios, tables, and relevant rows."""
        self.error_history = []
        self.retry_count = 0
        self.language = ev.language
        self.current_datetime = ev.current_datetime
        self.x_output_result = ev.x_output_result

        enhanced_query = ev.query

        # Retrieve relevant table info with enhanced query
        table_schema_objs = self.table_info_retriever.retrieve(enhanced_query)
        print(f"Retrieved table schema objs{table_schema_objs}")

        # Construct complete context string
        tables_context_str = get_table_context_str(
            self.sql_database,
            self.table_content_vector_index_dict,
            ev.query,
            table_schema_objs,
            relevant_rows_top_k=3,
            verbose=self._verbose,
        )

        print(tables_context_str)

        return TableRetrieveEvent(
            table_context=tables_context_str,
            query=ev.query
        )

    @step
    def generate_sql(self, ctx: Context, ev: TableRetrieveEvent) -> TextToSQLEvent:
        """Generate SQL statement."""
        print(f"Context string: {ev.table_context}")
        fmt_messages = self.text2sql_prompt.format_messages(
            query_str=ev.query,
            schema=ev.table_context,
            dialect=self.sql_dialect.name,
        )
        print(f"fmt_messages: {fmt_messages[0].content}")

        chat_response = self.llm.chat(fmt_messages)
        print(f"chat_response: {chat_response}")
        # Parse SQL
        sql = parse_response_to_sql(chat_response)
        # Parse for PgVector
        query_embeddings = self.embed_model.get_text_embedding(ev.query)
        sql = parse_response_for_pgVector(sql, query_embeddings)

        print(f"sql query:{sql}")
        time.sleep(0.1)
        return TextToSQLEvent(
            sql=sql,
            query=ev.query,
            table_context=ev.table_context
        )

    @step
    def execute_sql(self, ctx: Context, ev: TextToSQLEvent) -> SQLExecutionErrorEvent | SQLExecutionResultEvent:
        """Execute SQL with error handling."""
        try:
            retrieved_rows = self.sql_retriever.retrieve(ev.sql)
            return SQLExecutionResultEvent(
                result=retrieved_rows,
                sql=ev.sql,
                query=ev.query,
                table_context=ev.table_context
            )
        except Exception as e:
            print(f"sql execution failed: {e}")
            # Update error history
            self.error_history.append({"attempt": self.retry_count + 1, "sql": ev.sql, "error": str(e)})
            return SQLExecutionErrorEvent(
                error_message=str(e),
                original_sql=ev.sql,
                query=ev.query,  # The user's question
                table_context=ev.table_context
            )

    @step
    def handle_sql_error(self, ctx: Context, ev: SQLExecutionErrorEvent) -> SQLErrorExplanationEvent | TextToSQLEvent:
        """Handle SQL execution error and generate corrected query."""

        if self.retry_count >= self.max_retries:
            return SQLErrorExplanationEvent(
                error_message=str(ev.error_message),
                original_sql=ev.original_sql,
                query=ev.query,  # The user's question
                table_context=ev.table_context

            )

        print(f"Error {ev.error_message}")
        # Generate corrected SQL
        fmt_messages = self.error_correction_prompt.format_messages(
            original_sql=ev.original_sql,
            error_message=ev.error_message,
            query=ev.query,
            schema=ev.table_context,
        )

        chat_response = self.llm.chat(fmt_messages)
        print(f"Error correction chat response: {chat_response}")

        new_sql = parse_response_to_sql(chat_response)

        print(f"Sql: {new_sql}")

        # Increment retry count
        # retry_count =  ctx.get("retry_count")
        # retry_count[0] = retry_count[0] + 1attivita_giornaliero
        # ctx.set("retry_count", retry_count)
        self.retry_count += 1
        return TextToSQLEvent(
            sql=new_sql,
            query=ev.query,
            table_context=ev.table_context
        )

    @step
    def generate_error_explanation(self, ctx: Context, ev: SQLErrorExplanationEvent) -> StopEvent:
        """Generate a detailed explanation of why the query failed."""
        fmt_messages = self.error_explanation_prompt.format_messages(
            original_query=ev.query,
            error_history=self.error_history,
            last_sql=ev.original_sql,
            last_error=ev.error_message,
            table_context=ev.table_context,
            language=self.language,
        )

        explanation_response = self.llm.chat(fmt_messages)
        return StopEvent(result=explanation_response)

    @step
    def generate_response(self, ctx: Context, ev: SQLExecutionResultEvent) -> StopEvent:
        """Generate final response from successful SQL execution."""
        x_result_response = ev.result[0].metadata["result"][
            : self.x_output_result
        ]  # filtra i risultati della query ai primi x result

        fmt_messages = self.response_synthesis_prompt.format_messages(
            n_result=self.x_output_result,
            sql_query=ev.sql,
            context_str=x_result_response,
            query_str=ev.query,
            language=self.language,
        )
        chat_response = self.llm.chat(fmt_messages)

        # Create a combined response with both the answer and the SQL query
        final_response = f"{chat_response.message.content}\n\n" f"SQL query:\n```sql\n{ev.sql}\n```\n\n"

        result_column_table = ev.result[0].metadata["col_keys"]
        result_data_table = ev.result[0].metadata["result"]

        return StopEvent(
            result=(
                final_response,
                result_column_table,
                result_data_table,
            )
        )

    def get_edges(self):
        """Define text2sql_workflow edges with error handling."""
        return [
            (StartEvent, self.generate_sql),
            (TextToSQLEvent, self.execute_sql),
            (SQLExecutionErrorEvent, self.handle_sql_error),
            (SQLErrorExplanationEvent, self.generate_error_explanation),
            (SQLExecutionResultEvent, self.generate_response),
            # The corrected query from error handling goes back to execution
            (TextToSQLEvent, self.execute_sql),
        ]
