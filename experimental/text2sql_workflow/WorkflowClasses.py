from typing import List

from llama_index.core.workflow import Event


class TableRetrieveEvent(Event):
    """Result of running table retrieval."""

    table_context: str
    query: str

class TextToSQLEvent(Event):
    """Text-to-SQL event."""

    sql: str
    query: str
    table_context: str


# Add new event types
class SQLExecutionErrorEvent(Event):
    """SQL execution error event."""

    error_message: str
    original_sql: str
    query: str
    table_context: str


class SQLErrorExplanationEvent(Event):
    """SQL generate error explanation event."""

    error_message: str
    original_sql: str
    query: str
    table_context: str

class SQLExecutionResultEvent(Event):
    """Successful SQL execution result event."""

    result: List
    sql: str
    query: str
    table_context: str

