import asyncio
import json
import os
import re
import time
from datetime import datetime, timedelta
from decimal import Decimal
from pathlib import Path
from textwrap import indent
from typing import Dict, List, Tuple, Optional

import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import streamlit as st
from dateutil import parser
from dotenv import load_dotenv
from streamlit import session_state
from text2sql_engine import text2sql_engine  # Import the bot call

load_dotenv()

# Configuration paths - Now dynamic based on selected database
DB_BASE_PATH = Path("db_files")
EXTRACTED_DATA_FOLDER = "extracted_data"
TABLE_INFOS_FOLDER = "table_infos"
EXTRACTED_BI_DATA_FOLDER = "extracted_bi_data"

# Database settings file path
DB_SETTINGS_PATH = "database_settings.json"

# Theme colors for consistency - Light Theme
THEME_COLORS = {
    'primary': '#1E3888',
    'primary_light': '#668cff',
    'primary_lighter': '#90b4ff',
    'background': '#ffffff',
    'background_secondary': '#f8f9fa',
    'background_card': '#ffffff',
    'border': '#dee2e6',
    'border_light': '#e9ecef',
    'text_primary': '#212529',
    'text_secondary': '#6c757d',
    'success': '#28a745',
    'warning': '#ffc107',
    'error': '#dc3545',
    'info': '#17a2b8',
}

# Set page config with a wider layout
st.set_page_config(
    page_title="SQL Query Assistant",
    page_icon="🤖",
    layout="wide",
    initial_sidebar_state="expanded",
)

# Supported SQL dialects
SQL_DIALECTS = ["MySQL", "PostgreSQL", "SQLite", "SQL Server", "Oracle"]


# ===== Database Management Functions =====
def load_database_settings():
    """Load database settings from JSON file"""
    try:
        if os.path.exists(DB_SETTINGS_PATH):
            with open(DB_SETTINGS_PATH, 'r') as f:
                return json.load(f)
    except Exception as e:
        st.error(f"Error loading database settings: {str(e)}")
    return {}


def save_database_settings(settings):
    """Save database settings to JSON file"""
    try:
        with open(DB_SETTINGS_PATH, 'w') as f:
            json.dump(settings, f, indent=2)
        return True
    except Exception as e:
        st.error(f"Error saving database settings: {str(e)}")
        return False


def get_current_database():
    """Get the currently selected database configuration"""
    if "current_db" not in st.session_state:
        st.session_state.current_db = None

    if st.session_state.current_db and st.session_state.current_db in st.session_state.db_settings:
        return st.session_state.db_settings[st.session_state.current_db]
    return None


def is_database_initialized(db_name: str) -> bool:
    """Check if database folder structure exists"""
    try:
        db_path = DB_BASE_PATH / db_name
        table_info_path = db_path / EXTRACTED_DATA_FOLDER / TABLE_INFOS_FOLDER
        bi_data_path = db_path / EXTRACTED_DATA_FOLDER / EXTRACTED_BI_DATA_FOLDER

        return db_path.exists() and table_info_path.exists() and bi_data_path.exists()
    except Exception as e:
        st.error(f"Error checking database initialization: {str(e)}")
        return False


def get_database_paths(db_name: str) -> Dict[str, Path]:
    """Get all paths for a specific database"""
    db_path = DB_BASE_PATH / db_name
    return {
        "base_path": db_path,
        "table_info_path": db_path / EXTRACTED_DATA_FOLDER / TABLE_INFOS_FOLDER,
        "bi_data_path": db_path / EXTRACTED_DATA_FOLDER / EXTRACTED_BI_DATA_FOLDER,
        "table_index_dir": db_path / EXTRACTED_DATA_FOLDER / "table_data_index",
        "ddl_path": db_path / "init" / f"Dump_{db_name}.sql",
        "saved_summary_path": db_path / "database_summary.txt"
    }


def initialize_database(db_name: str, db_config: dict):
    """
    Placeholder function to initialize database folder structure.
    This should be replaced with your actual initialization logic.
    """
    try:
        # # Create folder structure
        # paths = get_database_paths(db_name)
        #
        # # Create directories
        # paths["table_info_path"].mkdir(parents=True, exist_ok=True)
        # paths["bi_data_path"].mkdir(parents=True, exist_ok=True)
        # paths["table_index_dir"].mkdir(parents=True, exist_ok=True)
        # paths["base_path"].joinpath("init").mkdir(parents=True, exist_ok=True)
        #
        # # Create placeholder files (replace with your actual initialization logic)
        # # Example: Create a dummy DDL file
        # with open(paths["ddl_path"], 'w') as f:
        #     f.write(f"-- Placeholder DDL for {db_name}\n")
        #
        # # Create a dummy database summary
        # with open(paths["saved_summary_path"], 'w') as f:
        #     f.write(f"Database: {db_name}\nDialect: {db_config.get('dialect', 'MySQL')}\n")

        # Update database settings to mark as initialized
        st.session_state.db_settings[db_name]["initialized"] = True
        save_database_settings(st.session_state.db_settings)

        return True
    except Exception as e:
        st.error(f"Error initializing database: {str(e)}")
        return False


# ===== CSS Styling =====
def apply_custom_css():
    """Apply all custom CSS styles"""
    st.markdown(
        f"""
        <style>
        /* Main container styling - Light Theme */
        .main {{
            padding: 2rem;
            background-color: {THEME_COLORS['background_secondary']};
        }}

        /* Hide default streamlit header */
        header {{
            visibility: hidden;
        }}

        /* Custom header bar */
        .app-header {{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 70px;
            background: linear-gradient(135deg, {THEME_COLORS['primary']}, {THEME_COLORS['primary_light']});
            z-index: 999;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 0 2rem;
        }}

        .app-header h1 {{
            color: white;
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }}

        /* Adjust main content to account for fixed header */
        .main .block-container {{
            padding-top: 90px !important;
        }}

        /* Chat message styling */
        .stChatMessage {{
            background-color: {THEME_COLORS['background_card']} !important;
            border-radius: 15px;
            padding: 1rem;
            margin: 0.5rem 0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            border: 1px solid {THEME_COLORS['border_light']};
        }}

        [data-testid="stChatMessage"] {{
            background-color: {THEME_COLORS['background_card']} !important;
            border: 1px solid {THEME_COLORS['border_light']} !important;
        }}

        [data-testid="stChatMessageContent"] {{
            background-color: {THEME_COLORS['background_card']};
            color: {THEME_COLORS['text_primary']};
            border-radius: 8px;
            padding: 1rem;
        }}

        .user [data-testid="stChatMessageContent"] {{
            background-color: #e3f2fd;
            border-left: 4px solid {THEME_COLORS['primary']};
        }}

        .assistant [data-testid="stChatMessageContent"] {{
            background-color: {THEME_COLORS['background_card']};
            border-left: 4px solid {THEME_COLORS['primary_light']};
        }}

        /* Input styling */
        .stTextInput > div > div > input {{
            border-radius: 10px !important;
            border: 2px solid {THEME_COLORS['border']} !important;
            background-color: white !important;
            color: {THEME_COLORS['text_primary']} !important;
        }}

        .stTextInput > div > div > input:focus {{
            border-color: {THEME_COLORS['primary']} !important;
            box-shadow: 0 0 0 0.2rem rgba(30, 56, 136, 0.15) !important;
        }}

        .stTextArea > div > div > textarea {{
            background-color: white !important;
            color: {THEME_COLORS['text_primary']} !important;
            border: 2px solid {THEME_COLORS['border']} !important;
            border-radius: 8px !important;
        }}

        .stTextArea > div > div > textarea:focus {{
            border-color: {THEME_COLORS['primary']} !important;
            box-shadow: 0 0 0 0.2rem rgba(30, 56, 136, 0.15) !important;
        }}

        /* Button styling */
        .stButton>button {{
            background-color: {THEME_COLORS['primary']};
            color: white;
            border-radius: 8px;
            padding: 0.5rem 1.5rem;
            border: none;
            transition: all 0.3s ease;
            font-weight: 500;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}

        .stButton>button:hover {{
            background-color: {THEME_COLORS['primary_light']};
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(30, 56, 136, 0.2);
        }}

        /* Form submit button override */
        .stFormSubmitButton>button {{
            background-color: {THEME_COLORS['primary']};
            color: white;
        }}

        .stFormSubmitButton>button:hover {{
            background-color: {THEME_COLORS['primary_light']};
        }}

        /* Spinner styling */
        .stSpinner {{
            text-align: center;
            color: {THEME_COLORS['primary']};
        }}

        .stSpinner > div {{
            border-top-color: {THEME_COLORS['primary']} !important;
        }}

        /* Card styling */
        .custom-card {{
            background-color: {THEME_COLORS['background_card']};
            color: {THEME_COLORS['text_primary']};
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid {THEME_COLORS['border_light']};
            margin: 1rem 0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }}

        .stat-card {{
            background: linear-gradient(135deg, {THEME_COLORS['primary']}, {THEME_COLORS['primary_light']});
            color: white;
            padding: 1rem;
            border-radius: 12px;
            text-align: center;
            margin: 0.5rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }}

        /* Database settings specific styles */
        .db-card {{
            background-color: {THEME_COLORS['background_card']};
            color: {THEME_COLORS['text_primary']};
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid {THEME_COLORS['border_light']};
            margin: 1rem 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }}

        .db-card.active {{
            border-color: {THEME_COLORS['primary']};
            box-shadow: 0 0 0 3px rgba(30, 56, 136, 0.1);
        }}

        .db-card.uninitialized {{
            border-color: {THEME_COLORS['error']};
            background-color: #fff5f5;
        }}

        /* Sidebar styling */
        [data-testid="stSidebar"] {{
            background-color: {THEME_COLORS['background_card']} !important;
            border-right: 1px solid {THEME_COLORS['border_light']} !important;
        }}

        [data-testid="stSidebar"] .stMarkdown {{
            color: {THEME_COLORS['text_primary']} !important;
        }}

        [data-testid="stSidebar"] h1,
        [data-testid="stSidebar"] h2,
        [data-testid="stSidebar"] h3,
        [data-testid="stSidebar"] h4 {{
            color: {THEME_COLORS['text_primary']} !important;
        }}

        /* Sidebar selectbox styling */
        [data-testid="stSidebar"] .stSelectbox label {{
            color: {THEME_COLORS['text_primary']} !important;
            font-weight: 600 !important;
        }}

        [data-testid="stSidebar"] .stSelectbox > div > div {{
            background-color: white !important;
            color: {THEME_COLORS['text_primary']} !important;
            border: 2px solid {THEME_COLORS['border']} !important;
        }}

        /* Sidebar radio buttons */
        [data-testid="stSidebar"] .stRadio label {{
            color: {THEME_COLORS['text_primary']} !important;
            font-weight: 500 !important;
        }}

        [data-testid="stSidebar"] .stRadio > div {{
            background-color: transparent !important;
        }}

        /* Sidebar text */
        [data-testid="stSidebar"] p,
        [data-testid="stSidebar"] span,
        [data-testid="stSidebar"] div {{
            color: {THEME_COLORS['text_primary']} !important;
        }}

        /* Sidebar buttons */
        [data-testid="stSidebar"] .stButton>button {{
            background-color: {THEME_COLORS['primary']};
            color: white;
            border: none;
        }}

        [data-testid="stSidebar"] .stButton>button:hover {{
            background-color: {THEME_COLORS['primary_light']};
        }}

        /* Sidebar success/warning/info messages */
        [data-testid="stSidebar"] .stAlert {{
            border-radius: 8px !important;
        }}

        /* Main content selectbox and radio */
        .main .stSelectbox > div > div {{
            background-color: white !important;
            color: {THEME_COLORS['text_primary']} !important;
            border: 2px solid {THEME_COLORS['border']} !important;
        }}

        .main .stRadio > div {{
            background-color: transparent !important;
        }}

        .main .stRadio label {{
            color: {THEME_COLORS['text_primary']} !important;
        }}

        /* Expander styling */
        .streamlit-expanderHeader {{
            background-color: {THEME_COLORS['background_secondary']} !important;
            color: {THEME_COLORS['text_primary']} !important;
            border: 1px solid {THEME_COLORS['border']} !important;
            border-radius: 8px !important;
        }}

        .streamlit-expanderContent {{
            background-color: white !important;
            border: 1px solid {THEME_COLORS['border']} !important;
        }}

        /* Progress bar styling */
        .stProgress > div > div > div > div {{
            background-color: {THEME_COLORS['primary']} !important;
        }}

        /* Number input styling */
        .stNumberInput > div > div > input {{
            background-color: white !important;
            color: {THEME_COLORS['text_primary']} !important;
            border: 2px solid {THEME_COLORS['border']} !important;
        }}

        /* Alert styling - clear and visible */
        .stAlert {{
            border-radius: 8px !important;
            border-left: 4px solid !important;
        }}

        .element-container .stAlert {{
            background-color: #fff3cd !important;
            color: #856404 !important;
            border-left-color: {THEME_COLORS['warning']} !important;
        }}

        .element-container .stSuccess {{
            background-color: #d4edda !important;
            color: #155724 !important;
            border-left-color: {THEME_COLORS['success']} !important;
        }}

        .element-container .stError {{
            background-color: #f8d7da !important;
            color: #721c24 !important;
            border-left-color: {THEME_COLORS['error']} !important;
        }}

        .element-container .stInfo {{
            background-color: #d1ecf1 !important;
            color: #0c5460 !important;
            border-left-color: {THEME_COLORS['info']} !important;
        }}

        /* Dataframe styling */
        .stDataFrame {{
            background-color: white !important;
            border: 1px solid {THEME_COLORS['border_light']} !important;
            border-radius: 8px !important;
        }}

        /* Scrollbar styling */
        ::-webkit-scrollbar {{
            width: 10px;
            height: 10px;
        }}

        ::-webkit-scrollbar-track {{
            background: {THEME_COLORS['background_secondary']};
        }}

        ::-webkit-scrollbar-thumb {{
            background: {THEME_COLORS['border']};
            border-radius: 5px;
        }}

        ::-webkit-scrollbar-thumb:hover {{
            background: {THEME_COLORS['primary_light']};
        }}

        /* Chat input styling */
        .stChatInputContainer {{
            border-top: 1px solid {THEME_COLORS['border_light']} !important;
            background-color: white !important;
        }}

        /* Code block styling */
        code {{
            background-color: {THEME_COLORS['background_secondary']} !important;
            color: {THEME_COLORS['text_primary']} !important;
            padding: 2px 6px !important;
            border-radius: 4px !important;
        }}

        /* Links */
        a {{
            color: {THEME_COLORS['primary']} !important;
        }}

        a:hover {{
            color: {THEME_COLORS['primary_light']} !important;
        }}
        </style>
        """,
        unsafe_allow_html=True,
    )


# ===== Authentication =====
def check_password():
    """Returns `True` if the user had the correct password."""

    def password_entered():
        """Checks whether a password entered by the user is correct."""
        if st.session_state["password"] == os.getenv("PASSWORD"):
            st.session_state["password_correct"] = True
            del st.session_state["password"]
        else:
            st.session_state["password_correct"] = False

    if "password_correct" not in st.session_state:
        st.title("🔒 Password Protected")
        st.text_input(
            "Inserisci la password per accedere all'applicazione",
            type="password",
            key="password",
            on_change=password_entered,
        )
        return False

    elif not st.session_state["password_correct"]:
        st.title("🔒 Password Protected")
        st.text_input(
            "Please enter the password to access the application",
            type="password",
            key="password",
            on_change=password_entered,
        )
        st.error("😕 Password incorrect")
        return False
    else:
        return True


# ===== Initialization Functions =====
@st.cache_resource
def initialize_text2sql_engine(db_name: str):
    """Initialize the text2sql engine for a specific database"""
    try:
        if not is_database_initialized(db_name):
            return None

        paths = get_database_paths(db_name)

        memory_dir = "magic_bi/text2sql/data/chat_histories"
        response_language = "italian"
        limits_result_printed_output = 5

        engine = text2sql_engine(
            #str(paths["saved_summary_path"]),
            str(paths["ddl_path"]),
            str(paths["table_info_path"]),
            str(paths["table_index_dir"])
            # response_language,
            # limits_result_printed_output,
            # memory_dir,
        )

        if engine is None:
            print("Could not initialize text2sql engine")
        return engine
    except Exception as e:
        st.error(f"Error initializing text2sql engine: {str(e)}")
        return None


def initialize_session_state():
    """Initialize all session state variables"""
    if "initialized" not in st.session_state:
        st.session_state.initialized = True
        st.session_state.selected_dimensions = []
        st.session_state.selected_measures = []
        st.session_state.selected_formulas = []
        st.session_state.date_range = (datetime.now() - timedelta(days=30), datetime.now() + timedelta(days=30))

    if "chat_text_history" not in st.session_state:
        st.session_state.chat_text_history = []
    if "checkbox_chat_history" not in st.session_state:
        st.session_state.checkbox_chat_history = []
    if "pending_response" not in st.session_state:
        st.session_state.pending_response = False
    if "current_question" not in st.session_state:
        st.session_state.current_question = None
    if "query_count" not in st.session_state:
        st.session_state.query_count = 0
    if "start_time" not in st.session_state:
        st.session_state.start_time = time.time()
    if "response_language" not in st.session_state:
        st.session_state.response_language = "italian"
    if "show_x_result" not in st.session_state:
        st.session_state.show_x_result = 5
    if "current_datetime" not in st.session_state:
        st.session_state.current_datetime = datetime.now()
    if "graph_type" not in st.session_state:
        st.session_state.graph_type = "Bar"
    if "expanded_dimensions" not in st.session_state:
        st.session_state.expanded_dimensions = set()
    if "expanded_facts" not in st.session_state:
        st.session_state.expanded_facts = set()
    if "db_settings" not in st.session_state:
        st.session_state.db_settings = load_database_settings()
    if "current_db" not in st.session_state:
        st.session_state.current_db = None
    if "text2sql_engine" not in st.session_state:
        st.session_state.text2sql_engine = None
    if "interface_mode" not in st.session_state:
        st.session_state.interface_mode = "Chat"
    if "show_delete_confirm" not in st.session_state:
        st.session_state.show_delete_confirm = {}
    if "cv_extracted_data" not in st.session_state:
        st.session_state.cv_extracted_data = None
    if "cv_file_uploaded" not in st.session_state:
        st.session_state.cv_file_uploaded = None
    if "cv_extracted_data" not in st.session_state:
        st.session_state.cv_extracted_data = None
    if "cv_file_uploaded" not in st.session_state:
        st.session_state.cv_file_uploaded = None
    if "preserve_interface_mode" not in st.session_state:
        st.session_state.preserve_interface_mode = True
    if "cv_extracted_data" not in st.session_state:
        st.session_state.cv_extracted_data = None
    if "cv_file_uploaded" not in st.session_state:
        st.session_state.cv_file_uploaded = None
    if "preserve_interface_mode" not in st.session_state:
        st.session_state.preserve_interface_mode = True


# ===== Graph Creation Functions =====
def get_theme_colors_for_plotly():
    """Get color sequence for plotly charts matching our theme"""
    return [
        THEME_COLORS['primary'],
        THEME_COLORS['primary_light'],
        THEME_COLORS['success'],
        THEME_COLORS['info'],
        THEME_COLORS['warning'],
        '#6f42c1',  # purple
        '#e83e8c',  # pink
        '#20c997',  # teal
    ]


def apply_theme_to_figure(fig):
    """Apply consistent theming to plotly figures"""
    fig.update_layout(
        plot_bgcolor='white',
        paper_bgcolor='white',
        font=dict(color=THEME_COLORS['text_primary'], size=12),
        title_font=dict(color=THEME_COLORS['primary'], size=16, family='Arial, sans-serif'),
        legend=dict(
            bgcolor='white',
            bordercolor=THEME_COLORS['border'],
            borderwidth=1
        ),
        xaxis=dict(
            gridcolor=THEME_COLORS['border_light'],
            zerolinecolor=THEME_COLORS['border'],
            linecolor=THEME_COLORS['border'],
        ),
        yaxis=dict(
            gridcolor=THEME_COLORS['border_light'],
            zerolinecolor=THEME_COLORS['border'],
            linecolor=THEME_COLORS['border'],
        ),
        hoverlabel=dict(
            bgcolor="white",
            font_size=12,
            font_family="Arial, sans-serif"
        )
    )
    return fig


def draw_bar(df):
    fig = px.bar(
        df,
        x=df.columns[0],
        y=df.columns[1],
        text_auto=".2s",
        color_discrete_sequence=get_theme_colors_for_plotly()
    )
    return apply_theme_to_figure(fig)


def draw_bubble(df):
    fig = px.scatter(
        df,
        x=df.columns[0],
        y=df.columns[1],
        size=df.columns[2],
        color_discrete_sequence=get_theme_colors_for_plotly()
    )
    return apply_theme_to_figure(fig)


def draw_line(df):
    fig = px.line(
        df,
        x=df.columns[0],
        y=df.columns[1],
        color_discrete_sequence=get_theme_colors_for_plotly()
    )
    return apply_theme_to_figure(fig)


def draw_pie(df):
    values = df.columns[1]
    names = df.columns[0]
    hover_col = "lifeExp" if "lifeExp" in df.columns else None
    fig = px.pie(
        df,
        values=values,
        names=names,
        hover_data=[hover_col] if hover_col else None,
        color_discrete_sequence=get_theme_colors_for_plotly()
    )
    return apply_theme_to_figure(fig)


def create_graph(df, type):
    try:
        if type == "Bar":
            fig = draw_bar(df)
        elif type == "Bubble":
            fig = draw_bubble(df)
        elif type == "Line":
            fig = draw_line(df)
        elif type == "Pie":
            fig = draw_pie(df)
        else:
            fig = None
        return fig
    except Exception as e:
        st.warning(f"Impossibile creare il grafico: {str(e)}")
        return None


def create_table(df):
    """Create a themed table matching the light theme"""
    table = go.Figure(
        data=[
            go.Table(
                header=dict(
                    values=df.columns,
                    fill_color=THEME_COLORS['primary'],
                    font=dict(color="white", size=14, family='Arial, sans-serif'),
                    height=35,
                    align='left',
                    line=dict(color=THEME_COLORS['border'], width=1)
                ),
                cells=dict(
                    values=[df[col] for col in df.columns],
                    fill_color='white',
                    font=dict(color=THEME_COLORS['text_primary'], size=12, family='Arial, sans-serif'),
                    height=30,
                    align='left',
                    line=dict(color=THEME_COLORS['border_light'], width=1)
                ),
            )
        ]
    )
    table.update_layout(
        margin=dict(l=0, r=0, b=0, t=0),
        paper_bgcolor='white',
    )
    return table


# ===== Page Rendering Functions =====
def render_chat_interface():
    """Render the chat interface"""

    # Check if database is selected and initialized
    if not st.session_state.current_db:
        st.warning("⚠️ Please select a database from the sidebar first.")
        return

    if not is_database_initialized(st.session_state.current_db):
        st.error("❌ The selected database is not initialized. Please go to Database Settings to initialize it.")
        if st.button("Go to Database Settings"):
            st.session_state.interface_mode = "Database Settings"
            st.rerun()
        return

    # Check if engine is loaded
    if not st.session_state.text2sql_engine:
        st.error("❌ Failed to load the database engine. Please check your database configuration.")
        return

    async def get_bot_response(user_input):
        try:

            response_language = "italian"
            # response_language = "English"

            show_x_result = 5

            run_handler = st.session_state.text2sql_engine.workflow.run(
                query=user_input,
                language=response_language,
                current_datetime=st.session_state.current_datetime,
                x_output_result=show_x_result,

            )

            progress_placeholder = st.empty()
            message_placeholder = st.empty()
            progress_bar = progress_placeholder.progress(0)

            total_steps = 4
            step_messages = {
                1: "Analyzing your question...",
                2: "Searching for relevant data...",
                3: "Building SQL query...",
                4: "Generating response...",
            }

            current_step = 0

            async for event in run_handler.stream_events():
                if hasattr(event, "step_number") and hasattr(event, "msg"):
                    current_step = event.step_number
                    step_message = event.msg

                    progress_value = min(current_step / total_steps, 0.80)
                    progress_bar.progress(progress_value)
                    message_placeholder.info(f"Step {current_step}/{total_steps}: {step_message}")
                    await asyncio.sleep(0.5)

            (
                response,
                result_column_table,
                result_data_table,
            ) = await run_handler

            progress_bar.progress(1.0)
            message_placeholder.success("Processing complete!")

            await asyncio.sleep(1)
            progress_placeholder.empty()
            message_placeholder.empty()

            return (
                str(response),
                result_column_table,
                result_data_table
            )
        except Exception as e:
            if "progress_placeholder" in locals():
                progress_placeholder.empty()
            if "message_placeholder" in locals():
                message_placeholder.error(f"Error: {str(e)}")
            return f"Error: {str(e)}", "", "", {}, []

    def get_bot_response_sync(user_input):
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
        try:
            (
                response,
                result_column_table,
                result_data_table,
            ) = loop.run_until_complete(get_bot_response(user_input))

            return (
                str(f"{response}\n\n\n "),
                result_column_table,
                result_data_table,
            )
        except Exception as e:
            print("\033[91m [WARNING] Errore lato Text2SQL sync.\033[0m")
            print(f"\033[91m {str(e)}\033[0m")
            st.error(f"Si è verificato un errore durante l'elaborazione: {str(e)}")
            return "Si è verificato un errore. Riprova.", "", {}, []
        finally:
            loop.close()

    st.markdown(
        f"""
        <div class="custom-card">
            <strong>Connected to:</strong> {st.session_state.current_db}<br>
            <strong>Dialect:</strong> {st.session_state.db_settings[st.session_state.current_db].get('dialect', 'N/A')}<br><br>
            Benvenuti nell' bot di assistenza per le interrogazioni al database.
            Chiedi informazioni in linguaggio naturale senza dover usare SQL<br><br>

        </div>
        """,
        unsafe_allow_html=True,
    )

    # Chat interface
    chat_container = st.container()
    with chat_container:
        for idx, message in enumerate(st.session_state.chat_text_history):
            with st.chat_message(message["role"]):
                if "analysis" in message:
                    chat_output = f"{message['content']} + \n\n Analisi della risposta: \n\n {message['analysis']}"
                else:
                    chat_output = f"{message['content']}"

                st.write(chat_output)

                if "columns" in message and "data" in message:
                    df = pd.DataFrame(message["data"], columns=message["columns"])
                    table = create_table(df)
                    st.plotly_chart(table, use_container_width=True, key=f"table_chat_{idx}")

                    fig = create_graph(df, st.session_state.graph_type)
                    if fig is None:
                        st.warning(f"Il grafico non supporta la visualizzazione di questi dati")
                        fig = go.Figure()
                        fig.update_layout(
                            title="Grafico non disponibile",
                            plot_bgcolor='white',
                            paper_bgcolor='white',
                            font=dict(color=THEME_COLORS['text_primary'])
                        )

                    st.plotly_chart(fig, use_container_width=True, key=f"chart_chat_{idx}")

                if message["role"] == "assistant" and "expander_content" in message:
                    expander = st.expander("Relevant Scenarios Used")
                    expander.write(message["expander_content"])

    if st.session_state.pending_response:
        with st.chat_message("user"):
            st.write(st.session_state.current_question)

        with st.chat_message("assistant"):
            with st.spinner("Processing your question..."):
                response,  result_column_table, result_data_table = (
                    get_bot_response_sync(st.session_state.current_question)
                )
        if result_column_table is not None and result_data_table is not None:
            col_key = list(result_column_table)
            data = [tuple(row) for row in result_data_table]
        else:
            col_key = []
            data = []

        st.session_state.chat_text_history.append({"role": "user", "content": st.session_state.current_question})
        st.session_state.chat_text_history.append(
            {
                "role": "assistant",
                "content": response,
                "columns": col_key,
                "data": data,
            }
        )

        st.session_state.pending_response = False
        st.session_state.current_question = None
        st.rerun()

    if prompt := st.chat_input("💭 Ask your question here..."):
        if not st.session_state.pending_response:
            st.session_state.current_question = prompt
            st.session_state.pending_response = True
            st.rerun()


def load_table_view_and_description(db_name: str):
    """Load table information from JSON files for a specific database"""
    try:
        paths = get_database_paths(db_name)
        tables_path = paths["table_info_path"]

        if not tables_path.exists():
            return []

        tables_info = []

        for filename in os.listdir(tables_path):
            if filename.endswith(".json"):
                filepath = os.path.join(tables_path, filename)
                try:
                    with open(filepath, "r", encoding="utf-8") as f:
                        data = json.load(f)

                    table_name = data.get("table_name", "")
                    table_summary = data.get("table_summary", "")
                    complete_ddl = data.get("complete_ddl", "")

                    create_match = re.search(r"CREATE TABLE.*?\((.*?)\)\s+ENGINE=", complete_ddl, re.DOTALL)
                    columns = []
                    if create_match:
                        column_defs = create_match.group(1)
                        for line in column_defs.splitlines():
                            line = line.strip().strip(",")
                            if line and not line.upper().startswith(
                                    ("PRIMARY KEY", "KEY", "CONSTRAINT", "FOREIGN KEY")):
                                col_name = re.match(r"`([^`]+)`", line)
                                if col_name:
                                    columns.append(col_name.group(1))

                    sample_data = []
                    insert_match = re.search(r"INSERT INTO .*? VALUES\s*(.+);", complete_ddl, re.DOTALL)
                    if insert_match:
                        raw_values = insert_match.group(1)
                        tuples = re.findall(r"\((.*?)\)", raw_values)
                        for tup in tuples:
                            values = [val.strip(" '") if val.strip().upper() != "NULL" else None for val in
                                      tup.split(",")]
                            if len(values) == len(columns):
                                row = dict(zip(columns, values))
                                sample_data.append(row)

                    tables_info.append(
                        {
                            "table_name": table_name,
                            "table_summary": table_summary,
                            "columns": columns,
                            "sample_data": sample_data,
                            "filename": filename,
                            "complete_ddl": complete_ddl,
                        }
                    )
                except Exception as e:
                    st.warning(f"Could not load table info from {filename}: {str(e)}")
                    continue

        return tables_info
    except Exception as e:
        st.error(f"Error loading table information: {str(e)}")
        return []


def render_table_description():
    """Render the table description interface"""

    # Check if database is selected and initialized
    if not st.session_state.current_db:
        st.warning("⚠️ Please select a database from the sidebar first.")
        return

    if not is_database_initialized(st.session_state.current_db):
        st.error("❌ The selected database is not initialized. Please go to Database Settings to initialize it.")
        if st.button("Go to Database Settings"):
            st.session_state.interface_mode = "Database Settings"
            st.rerun()
        return

    st.markdown(
        f"""
        <div class="custom-card">
            <strong>Database:</strong> {st.session_state.current_db}<br>
            Description of the tables
        </div>
        """,
        unsafe_allow_html=True,
    )

    with st.spinner("Loading table information..."):
        tables = load_table_view_and_description(st.session_state.current_db)

    if not tables:
        st.info("No tables found for this database.")
        return

    col1_table, col2_dim_facts = st.columns([1, 1])

    with col1_table:
        table_names = sorted([table["table_name"] for table in tables])
        st.markdown(f"#### 📋 Elenco Tabelle")
        selected_table_name = st.radio("", table_names)

    with col2_dim_facts:
        table_info = next((t for t in tables if t["table_name"] == selected_table_name), None)
        if table_info:
            st.markdown(f"#### 📝 {table_info['table_name']}")
            st.markdown("<br>", unsafe_allow_html=True)

            description = st.text_area(
                "Descrizione della tabella:",
                table_info["table_summary"],
                height=300,
            )

            if st.button("💾 Save Description"):
                try:
                    if table_info:
                        table_info["table_summary"] = description
                        paths = get_database_paths(st.session_state.current_db)
                        table_file_path = os.path.join(paths["table_info_path"], table_info["filename"])

                        update_data = {
                            "table_name": table_info["table_name"],
                            "table_summary": table_info["table_summary"],
                            "complete_ddl": table_info["complete_ddl"],
                        }

                        with open(table_file_path, "w", encoding="utf-8") as f:
                            json.dump(update_data, f, ensure_ascii=True, indent=2)

                        success_placeholder = st.empty()
                        success_placeholder.success("✅ Descrizione salvata con successo!")
                        time.sleep(3)
                        success_placeholder.empty()
                except Exception as e:
                    st.error(f"❌ Errore nel salvataggio: {str(e)}")

            if "columns" in table_info and "sample_data" in table_info:
                df = pd.DataFrame(table_info["sample_data"], columns=table_info["columns"])
                st.markdown("#### 📊 Esempio dati tabella")
                st.dataframe(df, use_container_width=True)


def render_cv_upload():
    """Render the CV upload and processing interface"""
    from CVprocessing.CVProcessor import cv_processor
    from CVprocessing.CVDataExtractor import cv_data_extractor
    from CVprocessing.CVDatabaseConnectionManager import database_manager

    st.markdown(
        """
        <div class="custom-card">
            <h3>📄 Carica CV Candidato</h3>
            Carica un CV in formato PDF per estrarre automaticamente i dati del candidato
        </div>
        """,
        unsafe_allow_html=True,
    )

    # Step 1: File Upload
    uploaded_file = st.file_uploader(
        "Trascina qui il CV o clicca per selezionare",
        type=['pdf'],
        help="Supportati solo file PDF"
    )

    if uploaded_file is not None:
        st.success(f"✅ File caricato: {uploaded_file.name}")

        # Show file details
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Dimensione", f"{uploaded_file.size / 1024:.1f} KB")
        with col2:
            st.metric("Tipo", uploaded_file.type)

        # Process button
        if st.button("🔍 Analizza CV", type="primary"):
            with st.spinner("📖 Estrazione testo dal PDF..."):
                # Extract text from PDF
                success, text, error = cv_processor.extract_text_from_pdf(uploaded_file)

                if not success:
                    st.error(f"❌ {error}")
                    return

                # Validate CV content
                is_valid, message = cv_processor.validate_cv_content(text)
                if not is_valid:
                    st.error(f"❌ {message}")
                    return

                st.success("✅ Testo estratto correttamente")

            with st.spinner("🤖 Estrazione dati con AI... Questo potrebbe richiedere alcuni secondi"):
                try:
                    # Extract structured data using GPT
                    extracted_data = cv_data_extractor.extract_candidate_data(text)

                    # Store in session state
                    st.session_state.cv_extracted_data = extracted_data
                    st.session_state.cv_file_uploaded = uploaded_file

                    st.success("✅ Dati estratti con successo!")
                    # Don't call st.rerun() here - let the UI naturally update

                except Exception as e:
                    st.error(f"❌ Errore nell'estrazione dei dati: {str(e)}")
                    return

    # Step 2: Show extracted data for review
    if st.session_state.cv_extracted_data is not None:
        st.markdown("---")
        st.markdown("### 📋 Dati Estratti - Verifica e Modifica")

        data = st.session_state.cv_extracted_data
        candidato = data["candidato"]

        # Helper function to check if field is empty
        def is_empty(value):
            return value is None or value == "" or value == "null"

        # Personal Information
        with st.expander("👤 Informazioni Personali", expanded=True):
            col1, col2 = st.columns(2)

            with col1:
                nome_empty = is_empty(candidato.get("nome"))
                candidato["nome"] = st.text_input(
                    "Nome *" + (" ⚠️" if nome_empty else ""),
                    value=candidato.get("nome") or "",
                    help="Campo vuoto - compilare manualmente" if nome_empty else None
                )

                email_empty = is_empty(candidato.get("email"))
                candidato["email"] = st.text_input(
                    "Email *" + (" ⚠️" if email_empty else ""),
                    value=candidato.get("email") or "",
                    help="Campo vuoto - compilare manualmente" if email_empty else None
                )

                codice_fiscale_empty = is_empty(candidato.get("codice_fiscale"))
                candidato["codice_fiscale"] = st.text_input(
                    "Codice Fiscale" + (" ⚠️" if codice_fiscale_empty else ""),
                    value=candidato.get("codice_fiscale") or "",
                    help="Campo vuoto - compilare manualmente" if codice_fiscale_empty else None
                )

                luogo_nascita_empty = is_empty(candidato.get("luogo_nascita"))
                candidato["luogo_nascita"] = st.text_input(
                    "Luogo di Nascita" + (" ⚠️" if luogo_nascita_empty else ""),
                    value=candidato.get("luogo_nascita") or "",
                    help="Campo vuoto - compilare manualmente" if luogo_nascita_empty else None
                )

            with col2:
                cognome_empty = is_empty(candidato.get("cognome"))
                candidato["cognome"] = st.text_input(
                    "Cognome *" + (" ⚠️" if cognome_empty else ""),
                    value=candidato.get("cognome") or "",
                    help="Campo vuoto - compilare manualmente" if cognome_empty else None
                )

                telefono_empty = is_empty(candidato.get("telefono"))
                candidato["telefono"] = st.text_input(
                    "Telefono" + (" ⚠️" if telefono_empty else ""),
                    value=candidato.get("telefono") or "",
                    help="Campo vuoto - compilare manualmente" if telefono_empty else None
                )

                data_nascita_empty = is_empty(candidato.get("data_nascita"))
                candidato["data_nascita"] = st.text_input(
                    "Data di Nascita (YYYY-MM-DD)" + (" ⚠️" if data_nascita_empty else ""),
                    value=candidato.get("data_nascita") or "",
                    help="Campo vuoto - compilare manualmente" if data_nascita_empty else None
                )

                candidato["genere"] = st.selectbox(
                    "Genere",
                    options=["", "M", "F", "A"],
                    index=["", "M", "F", "A"].index(candidato.get("genere") or "")
                )

        # Address
        with st.expander("📍 Residenza", expanded=False):
            col1, col2, col3, col4 = st.columns([2, 1, 1, 1])

            with col1:
                candidato["indirizzo"] = st.text_input(
                    "Indirizzo",
                    value=candidato.get("indirizzo") or ""
                )
            with col2:
                candidato["citta"] = st.text_input(
                    "Città",
                    value=candidato.get("citta") or ""
                )
            with col3:
                candidato["provincia"] = st.text_input(
                    "Provincia",
                    value=candidato.get("provincia") or "",
                    max_chars=2
                )
            with col4:
                candidato["cap"] = st.text_input(
                    "CAP",
                    value=candidato.get("cap") or "",
                    max_chars=5
                )

        # Contacts and Links
        with st.expander("🔗 Contatti e Link", expanded=False):
            col1, col2 = st.columns(2)

            with col1:
                candidato["linkedin"] = st.text_input(
                    "LinkedIn",
                    value=candidato.get("linkedin") or ""
                )
            with col2:
                candidato["portfolio"] = st.text_input(
                    "Portfolio",
                    value=candidato.get("portfolio") or ""
                )

        # Availability
        with st.expander("✈️ Disponibilità", expanded=False):
            col1, col2 = st.columns(2)

            with col1:
                candidato["disponibilita_trasferte"] = st.checkbox(
                    "Disponibile per trasferte",
                    value=candidato.get("disponibilita_trasferte") or False
                )
            with col2:
                candidato["disponibilita_remoto"] = st.checkbox(
                    "Disponibile per lavoro remoto",
                    value=candidato.get("disponibilita_remoto") or False
                )

        # Profile Summary
        with st.expander("📝 Profilo Sintetico", expanded=True):
            candidato["profilo_sintetico"] = st.text_area(
                "Riassunto Professionale",
                value=candidato.get("profilo_sintetico") or "",
                height=150,
                help="Breve riassunto delle competenze e dell'esperienza del candidato"
            )

        # Work Experience
        with st.expander(f"💼 Esperienze Lavorative ({len(data['esperienze_lavorative'])})", expanded=False):
            if data["esperienze_lavorative"]:
                for i, exp in enumerate(data["esperienze_lavorative"]):
                    st.markdown(f"**Esperienza {i + 1}**")
                    col1, col2 = st.columns(2)
                    with col1:
                        st.text(f"Azienda: {exp.get('azienda', 'N/A')}")
                        st.text(f"Posizione: {exp.get('posizione', 'N/A')}")
                        st.text(f"Dal: {exp.get('data_inizio', 'N/A')}")
                    with col2:
                        st.text(f"Settore: {exp.get('settore', 'N/A')}")
                        st.text(f"Città: {exp.get('citta', 'N/A')}")
                        st.text(f"Al: {exp.get('data_fine', 'Presente') if not exp.get('attuale') else 'Presente'}")
                    if exp.get('descrizione'):
                        st.caption(exp['descrizione'])
                    st.markdown("---")
            else:
                st.info("Nessuna esperienza lavorativa trovata")

        # Education
        with st.expander(f"🎓 Formazione ({len(data['formazione'])})", expanded=False):
            if data["formazione"]:
                for i, edu in enumerate(data["formazione"]):
                    st.markdown(f"**Formazione {i + 1}**")
                    col1, col2 = st.columns(2)
                    with col1:
                        st.text(f"Titolo: {edu.get('titolo', 'N/A')}")
                        st.text(f"Istituto: {edu.get('istituto', 'N/A')}")
                    with col2:
                        st.text(f"Tipo: {edu.get('tipo', 'N/A')}")
                        st.text(f"Voto: {edu.get('voto', 'N/A')}")
                    st.markdown("---")
            else:
                st.info("Nessuna formazione trovata")

        # Skills
        with st.expander(f"🛠️ Competenze ({len(data['competenze'])})", expanded=False):
            if data["competenze"]:
                for comp in data["competenze"]:
                    col1, col2, col3 = st.columns([2, 1, 1])
                    with col1:
                        st.text(comp.get('nome', 'N/A'))
                    with col2:
                        st.text(f"Livello: {comp.get('livello', 'N/A')}/5")
                    with col3:
                        st.text(f"Tipo: {comp.get('tipo', 'N/A')}")
            else:
                st.info("Nessuna competenza trovata")

        # Languages
        with st.expander(f"🌐 Lingue ({len(data['lingue'])})", expanded=False):
            if data["lingue"]:
                for lang in data["lingue"]:
                    col1, col2, col3 = st.columns(3)
                    with col1:
                        st.text(lang.get('lingua', 'N/A'))
                    with col2:
                        st.text(f"Scritto: {lang.get('livello_scritto', 'N/A')}")
                    with col3:
                        st.text(f"Parlato: {lang.get('livello_parlato', 'N/A')}")
            else:
                st.info("Nessuna lingua trovata")

        # Cover Letter
        if candidato.get("lettera_presentazione"):
            with st.expander("✉️ Lettera di Presentazione", expanded=False):
                st.text_area(
                    "Contenuto",
                    value=candidato["lettera_presentazione"],
                    height=200,
                    disabled=True
                )

        # Action buttons
        st.markdown("---")
        col1, col2, col3 = st.columns([1, 1, 2])

        with col1:
            if st.button("💾 Salva nel Database", type="primary"):
                # Validate required fields
                if not candidato.get("nome") or not candidato.get("cognome"):
                    st.error("❌ Nome e Cognome sono obbligatori")
                elif not candidato.get("email"):
                    st.error("❌ Email è obbligatoria")
                else:
                    with st.spinner("Salvataggio in corso..."):
                        # Insert into database
                        success, candidate_id, message = database_manager.insert_candidate_complete(data)

                        if success:
                            # Save CV file
                            cv_file = st.session_state.cv_file_uploaded
                            if cv_file:
                                cv_file.seek(0)  # Reset file pointer
                                save_success, file_path, save_error = cv_processor.save_cv_file(
                                    cv_file,
                                    candidate_id,
                                    candidato["nome"],
                                    candidato["cognome"]
                                )

                                if save_success:
                                    # Register document in database
                                    if save_success:
                                        st.info(f"📄 CV salvato in: {file_path}")  # ✅ Solo info, no DB
                                    else:
                                        st.warning(f"⚠️ Errore nel salvataggio del CV: {save_error}")

                            st.success(f"✅ {message}")
                            st.success(f"🆔 ID Candidato: {candidate_id}")

                            # Clear session state but stay on CV Upload page
                            time.sleep(2)
                            st.session_state.cv_extracted_data = None
                            st.session_state.cv_file_uploaded = None
                            # interface_mode will be preserved automatically
                            st.rerun()
                        else:
                            st.error(f"❌ {message}")

        with col2:
            if st.button("🔄 Ricomincia"):
                st.session_state.cv_extracted_data = None
                st.session_state.cv_file_uploaded = None
                # interface_mode will be preserved automatically
                st.rerun()

        with col3:
            st.info("💡 I campi con ⚠️ sono vuoti e richiedono compilazione manuale")


def render_cv_upload():
    """Render the CV upload and processing interface"""
    from CVprocessing.CVProcessor import cv_processor
    from CVprocessing.CVDataExtractor import cv_data_extractor
    from CVprocessing.CVDatabaseConnectionManager import database_manager

    st.markdown(
        """
        <div class="custom-card">
            <h3>📄 Carica CV Candidato</h3>
            Carica un CV in formato PDF per estrarre automaticamente i dati del candidato
        </div>
        """,
        unsafe_allow_html=True,
    )

    # Step 1: File Upload
    uploaded_file = st.file_uploader(
        "Trascina qui il CV o clicca per selezionare",
        type=['pdf'],
        help="Supportati solo file PDF"
    )

    if uploaded_file is not None:
        st.success(f"✅ File caricato: {uploaded_file.name}")

        # Show file details
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Dimensione", f"{uploaded_file.size / 1024:.1f} KB")
        with col2:
            st.metric("Tipo", uploaded_file.type)

        # Process button
        if st.button("🔍 Analizza CV", type="primary"):
            with st.spinner("📖 Estrazione testo dal PDF..."):
                # Extract text from PDF
                success, text, error = cv_processor.extract_text_from_pdf(uploaded_file)

                if not success:
                    st.error(f"❌ {error}")
                    return

                # Validate CV content
                is_valid, message = cv_processor.validate_cv_content(text)
                if not is_valid:
                    st.error(f"❌ {message}")
                    return

                st.success("✅ Testo estratto correttamente")

            with st.spinner("🤖 Estrazione dati con AI... Questo potrebbe richiedere alcuni secondi"):
                try:
                    # Extract structured data using GPT
                    extracted_data = cv_data_extractor.extract_candidate_data(text)

                    # Store in session state
                    st.session_state.cv_extracted_data = extracted_data
                    st.session_state.cv_file_uploaded = uploaded_file

                    st.success("✅ Dati estratti con successo!")
                    # Don't call st.rerun() - let UI naturally update

                except Exception as e:
                    st.error(f"❌ Errore nell'estrazione dei dati: {str(e)}")
                    return

    # Step 2: Show extracted data for review
    if st.session_state.cv_extracted_data is not None:
        st.markdown("---")
        st.markdown("### 📋 Dati Estratti - Verifica e Modifica")

        data = st.session_state.cv_extracted_data
        candidato = data["candidato"]

        # Helper function to check if field is empty
        def is_empty(value):
            return value is None or value == "" or value == "null"

        # Personal Information
        with st.expander("👤 Informazioni Personali", expanded=True):
            col1, col2 = st.columns(2)

            with col1:
                nome_empty = is_empty(candidato.get("nome"))
                candidato["nome"] = st.text_input(
                    "Nome *" + (" ⚠️" if nome_empty else ""),
                    value=candidato.get("nome") or "",
                    help="Campo vuoto - compilare manualmente" if nome_empty else None
                )

                email_empty = is_empty(candidato.get("email"))
                candidato["email"] = st.text_input(
                    "Email *" + (" ⚠️" if email_empty else ""),
                    value=candidato.get("email") or "",
                    help="Campo vuoto - compilare manualmente" if email_empty else None
                )

                codice_fiscale_empty = is_empty(candidato.get("codice_fiscale"))
                candidato["codice_fiscale"] = st.text_input(
                    "Codice Fiscale" + (" ⚠️" if codice_fiscale_empty else ""),
                    value=candidato.get("codice_fiscale") or "",
                    help="Campo vuoto - compilare manualmente" if codice_fiscale_empty else None
                )

                luogo_nascita_empty = is_empty(candidato.get("luogo_nascita"))
                candidato["luogo_nascita"] = st.text_input(
                    "Luogo di Nascita" + (" ⚠️" if luogo_nascita_empty else ""),
                    value=candidato.get("luogo_nascita") or "",
                    help="Campo vuoto - compilare manualmente" if luogo_nascita_empty else None
                )

            with col2:
                cognome_empty = is_empty(candidato.get("cognome"))
                candidato["cognome"] = st.text_input(
                    "Cognome *" + (" ⚠️" if cognome_empty else ""),
                    value=candidato.get("cognome") or "",
                    help="Campo vuoto - compilare manualmente" if cognome_empty else None
                )

                telefono_empty = is_empty(candidato.get("telefono"))
                candidato["telefono"] = st.text_input(
                    "Telefono" + (" ⚠️" if telefono_empty else ""),
                    value=candidato.get("telefono") or "",
                    help="Campo vuoto - compilare manualmente" if telefono_empty else None
                )

                data_nascita_empty = is_empty(candidato.get("data_nascita"))
                candidato["data_nascita"] = st.text_input(
                    "Data di Nascita (YYYY-MM-DD)" + (" ⚠️" if data_nascita_empty else ""),
                    value=candidato.get("data_nascita") or "",
                    help="Campo vuoto - compilare manualmente" if data_nascita_empty else None
                )

                candidato["genere"] = st.selectbox(
                    "Genere",
                    options=["", "M", "F", "A"],
                    index=["", "M", "F", "A"].index(candidato.get("genere") or "")
                )

        # Address
        with st.expander("📍 Residenza", expanded=False):
            col1, col2, col3, col4 = st.columns([2, 1, 1, 1])

            with col1:
                candidato["indirizzo"] = st.text_input(
                    "Indirizzo",
                    value=candidato.get("indirizzo") or ""
                )
            with col2:
                candidato["citta"] = st.text_input(
                    "Città",
                    value=candidato.get("citta") or ""
                )
            with col3:
                candidato["provincia"] = st.text_input(
                    "Provincia",
                    value=candidato.get("provincia") or "",
                    max_chars=2
                )
            with col4:
                candidato["cap"] = st.text_input(
                    "CAP",
                    value=candidato.get("cap") or "",
                    max_chars=5
                )

        # Contacts and Links
        with st.expander("🔗 Contatti e Link", expanded=False):
            col1, col2 = st.columns(2)

            with col1:
                candidato["linkedin"] = st.text_input(
                    "LinkedIn",
                    value=candidato.get("linkedin") or ""
                )
            with col2:
                candidato["portfolio"] = st.text_input(
                    "Portfolio",
                    value=candidato.get("portfolio") or ""
                )

        # Availability
        with st.expander("✈️ Disponibilità", expanded=False):
            col1, col2 = st.columns(2)

            with col1:
                candidato["disponibilita_trasferte"] = st.checkbox(
                    "Disponibile per trasferte",
                    value=candidato.get("disponibilita_trasferte") or False
                )
            with col2:
                candidato["disponibilita_remoto"] = st.checkbox(
                    "Disponibile per lavoro remoto",
                    value=candidato.get("disponibilita_remoto") or False
                )

        # Profile Summary
        with st.expander("📝 Profilo Sintetico", expanded=True):
            candidato["profilo_sintetico"] = st.text_area(
                "Riassunto Professionale",
                value=candidato.get("profilo_sintetico") or "",
                height=150,
                help="Breve riassunto delle competenze e dell'esperienza del candidato"
            )

        # Work Experience
        with st.expander(f"💼 Esperienze Lavorative ({len(data['esperienze_lavorative'])})", expanded=False):
            if data["esperienze_lavorative"]:
                for i, exp in enumerate(data["esperienze_lavorative"]):
                    st.markdown(f"**Esperienza {i + 1}**")
                    col1, col2 = st.columns(2)
                    with col1:
                        st.text(f"Azienda: {exp.get('azienda', 'N/A')}")
                        st.text(f"Posizione: {exp.get('posizione', 'N/A')}")
                        st.text(f"Dal: {exp.get('data_inizio', 'N/A')}")
                    with col2:
                        st.text(f"Settore: {exp.get('settore', 'N/A')}")
                        st.text(f"Città: {exp.get('citta', 'N/A')}")
                        st.text(f"Al: {exp.get('data_fine', 'Presente') if not exp.get('attuale') else 'Presente'}")
                    if exp.get('descrizione'):
                        st.caption(exp['descrizione'])
                    st.markdown("---")
            else:
                st.info("Nessuna esperienza lavorativa trovata")

        # Education
        with st.expander(f"🎓 Formazione ({len(data['formazione'])})", expanded=False):
            if data["formazione"]:
                for i, edu in enumerate(data["formazione"]):
                    st.markdown(f"**Formazione {i + 1}**")
                    col1, col2 = st.columns(2)
                    with col1:
                        st.text(f"Titolo: {edu.get('titolo', 'N/A')}")
                        st.text(f"Istituto: {edu.get('istituto', 'N/A')}")
                    with col2:
                        st.text(f"Tipo: {edu.get('tipo', 'N/A')}")
                        st.text(f"Voto: {edu.get('voto', 'N/A')}")
                    st.markdown("---")
            else:
                st.info("Nessuna formazione trovata")

        # Skills
        with st.expander(f"🛠️ Competenze ({len(data['competenze'])})", expanded=False):
            if data["competenze"]:
                for comp in data["competenze"]:
                    col1, col2, col3 = st.columns([2, 1, 1])
                    with col1:
                        st.text(comp.get('nome', 'N/A'))
                    with col2:
                        st.text(f"Livello: {comp.get('livello', 'N/A')}/5")
                    with col3:
                        st.text(f"Tipo: {comp.get('tipo', 'N/A')}")
            else:
                st.info("Nessuna competenza trovata")

        # Languages
        with st.expander(f"🌐 Lingue ({len(data['lingue'])})", expanded=False):
            if data["lingue"]:
                for lang in data["lingue"]:
                    col1, col2, col3 = st.columns(3)
                    with col1:
                        st.text(lang.get('lingua', 'N/A'))
                    with col2:
                        st.text(f"Scritto: {lang.get('livello_scritto', 'N/A')}")
                    with col3:
                        st.text(f"Parlato: {lang.get('livello_parlato', 'N/A')}")
            else:
                st.info("Nessuna lingua trovata")

        # Cover Letter
        if candidato.get("lettera_presentazione"):
            with st.expander("✉️ Lettera di Presentazione", expanded=False):
                st.text_area(
                    "Contenuto",
                    value=candidato["lettera_presentazione"],
                    height=200,
                    disabled=True
                )

        # Action buttons
        st.markdown("---")
        col1, col2, col3 = st.columns([1, 1, 2])

        with col1:
            if st.button("💾 Salva nel Database", type="primary"):
                # Validate required fields
                if not candidato.get("nome") or not candidato.get("cognome"):
                    st.error("❌ Nome e Cognome sono obbligatori")
                elif not candidato.get("email"):
                    st.error("❌ Email è obbligatoria")
                else:
                    with st.spinner("Salvataggio in corso..."):
                        # Insert into database
                        success, candidate_id, message = database_manager.insert_candidate_complete(data)

                        if success:
                            # Save CV file
                            cv_file = st.session_state.cv_file_uploaded
                            if cv_file:
                                cv_file.seek(0)  # Reset file pointer
                                save_success, file_path, save_error = cv_processor.save_cv_file(
                                    cv_file,
                                    candidate_id,
                                    candidato["nome"],
                                    candidato["cognome"]
                                )

                                if save_success:
                                    st.info(f"📄 CV salvato in: {file_path}")  # ✅ Solo info, no DB
                                else:
                                    st.warning(f"⚠️ Errore nel salvataggio del CV: {save_error}")

                            st.success(f"✅ {message}")
                            st.success(f"🆔 ID Candidato: {candidate_id}")

                            # Clear session state but stay on CV Upload page
                            time.sleep(2)
                            st.session_state.cv_extracted_data = None
                            st.session_state.cv_file_uploaded = None
                            st.rerun()
                        else:
                            st.error(f"❌ {message}")

        with col2:
            if st.button("🔄 Ricomincia"):
                st.session_state.cv_extracted_data = None
                st.session_state.cv_file_uploaded = None
                st.rerun()

        with col3:
            st.info("💡 I campi con ⚠️ sono vuoti e richiedono compilazione manuale")


def render_database_settings():
    """Render the database settings interface"""
    st.markdown(
        """
        <div class="custom-card">
            <h3>🗄️ Database Settings</h3>
            Configure your database connections here
        </div>
        """,
        unsafe_allow_html=True,
    )

    # Add new database form
    if "show_add_db_form" not in st.session_state:
        st.session_state.show_add_db_form = False

    if st.button("➕ Add New Database"):
        st.session_state.show_add_db_form = True

    # Display current databases
    if st.session_state.db_settings:
        st.markdown("### 📊 Configured Databases")

        for db_name, db_config in st.session_state.db_settings.items():
            is_active = db_name == st.session_state.current_db
            is_initialized = is_database_initialized(db_name)

            status_emoji = "🟢" if is_active else "⚪"
            init_status = "✅ Initialized" if is_initialized else "❌ Not Initialized"

            with st.expander(f"{status_emoji} {db_name} - {init_status}", expanded=is_active):
                col1, col2, col3 = st.columns([2, 2, 1])

                with col1:
                    st.text(f"Host: {db_config.get('hostname', 'N/A')}")
                    st.text(f"Port: {db_config.get('port', 'N/A')}")
                    st.text(f"Database: {db_config.get('database', 'N/A')}")
                    st.text(f"Dialect: {db_config.get('dialect', 'N/A')}")

                with col2:
                    st.text(f"User: {db_config.get('user', 'N/A')}")
                    st.text("Password: ********")
                    st.text(f"Status: {init_status}")

                with col3:
                    if not is_initialized:
                        if st.button("🔧 Initialize", key=f"init_{db_name}"):
                            with st.spinner(f"Initializing {db_name}..."):
                                success = initialize_database(db_name, db_config)
                                if success:
                                    st.success(f"✅ {db_name} initialized successfully!")
                                    time.sleep(2)
                                    st.rerun()
                                else:
                                    st.error(f"❌ Failed to initialize {db_name}")

                    # Delete with confirmation
                    delete_key = f"delete_{db_name}"
                    if delete_key not in st.session_state.show_delete_confirm:
                        st.session_state.show_delete_confirm[delete_key] = False

                    if not st.session_state.show_delete_confirm[delete_key]:
                        if st.button("🗑️ Delete", key=f"btn_delete_{db_name}"):
                            st.session_state.show_delete_confirm[delete_key] = True
                            st.rerun()
                    else:
                        st.warning("⚠️ Are you sure?")
                        col_yes, col_no = st.columns(2)
                        with col_yes:
                            if st.button("✅ Yes", key=f"confirm_delete_{db_name}"):
                                try:
                                    if st.session_state.current_db == db_name:
                                        st.session_state.current_db = None
                                        st.session_state.text2sql_engine = None
                                    del st.session_state.db_settings[db_name]
                                    save_database_settings(st.session_state.db_settings)
                                    st.session_state.show_delete_confirm[delete_key] = False
                                    st.success(f"✅ {db_name} deleted successfully!")
                                    time.sleep(1)
                                    st.rerun()
                                except Exception as e:
                                    st.error(f"❌ Error deleting database: {str(e)}")
                        with col_no:
                            if st.button("❌ No", key=f"cancel_delete_{db_name}"):
                                st.session_state.show_delete_confirm[delete_key] = False
                                st.rerun()

    # Add new database form
    if st.session_state.show_add_db_form:
        st.markdown("### ➕ Add New Database")

        with st.form("add_database_form"):
            col1, col2 = st.columns(2)

            with col1:
                db_name = st.text_input("Database Name*", placeholder="e.g., Production DB")
                hostname = st.text_input("Hostname*", placeholder="e.g., localhost or 192.168.1.1")
                port = st.number_input("Port*", min_value=1, max_value=65535, value=3306)
                dialect = st.selectbox("SQL Dialect*", SQL_DIALECTS, index=0)

            with col2:
                database = st.text_input("Database Name*", placeholder="e.g., my_database")
                user = st.text_input("Username*", placeholder="e.g., admin")
                password = st.text_input("Password*", type="password")

            col1, col2, col3 = st.columns([1, 1, 3])

            with col1:
                if st.form_submit_button("💾 Save Database"):
                    if all([db_name, hostname, port, database, user, password, dialect]):
                        # Clean the database name (remove spaces and special characters)
                        clean_db_name = re.sub(r'[^\w\s-]', '', db_name).strip()
                        clean_db_name = re.sub(r'[-\s]+', '_', clean_db_name)

                        # Check if database already exists
                        if clean_db_name in st.session_state.db_settings:
                            st.error(f"❌ Database '{clean_db_name}' already exists!")
                        else:
                            try:
                                st.session_state.db_settings[clean_db_name] = {
                                    "hostname": hostname,
                                    "port": port,
                                    "database": database,
                                    "user": user,
                                    "password": password,
                                    "dialect": dialect,
                                    "initialized": False
                                }
                                if save_database_settings(st.session_state.db_settings):
                                    st.session_state.show_add_db_form = False
                                    st.success(f"✅ Database '{clean_db_name}' added successfully!")
                                    time.sleep(2)
                                    st.rerun()
                            except Exception as e:
                                st.error(f"❌ Error saving database: {str(e)}")
                    else:
                        st.error("❌ Please fill in all required fields")

            with col2:
                if st.form_submit_button("❌ Cancel"):
                    st.session_state.show_add_db_form = False
                    st.rerun()


# ===== Main Application =====
def main():
    """Main application entry point"""

    # Apply custom CSS
    apply_custom_css()

    # Password protection
    if not check_password():
        st.stop()

    # Initialize session state
    initialize_session_state()

    # Custom header
    st.markdown(
        """
        <div class="app-header">
            <h1>🤖 SQLartisan</h1>
        </div>
        """,
        unsafe_allow_html=True,
    )

    # Render appropriate page based on selection
    if st.session_state.interface_mode == "Chat":
        render_chat_interface()
    elif st.session_state.interface_mode == "Tables Settings":
        render_table_description()
    elif st.session_state.interface_mode == "Database Settings":
        render_database_settings()
    elif st.session_state.interface_mode == "CV Upload":
        render_cv_upload()
    elif st.session_state.interface_mode == "CV Upload":
        render_cv_upload()


# ===== Sidebar =====
def render_sidebar():
    """Render the sidebar"""
    with st.sidebar:
        st.image("graphics_resources/magic_hire_no_bg.png", width=200)
        st.title("Settings & Info")
        st.markdown("<br>", unsafe_allow_html=True)

        # Database selector in sidebar
        st.markdown("### 🗄️ Select Database")
        db_names = list(st.session_state.db_settings.keys())

        if db_names:
            # Add initialization status to the display names
            display_names = []
            for db in db_names:
                if is_database_initialized(db):
                    display_names.append(f"{db} ✅")
                else:
                    display_names.append(f"{db} ❌")

            current_index = 0
            if st.session_state.current_db and st.session_state.current_db in db_names:
                current_index = db_names.index(st.session_state.current_db) + 1

            selected_display = st.selectbox(
                "Active Database:",
                options=["None"] + display_names,
                index=current_index
            )

            if selected_display != "None":
                # Extract the actual database name (remove the status emoji)
                selected_db = selected_display.rsplit(' ', 1)[0]

                if selected_db != st.session_state.current_db:
                    with st.spinner(f"Loading {selected_db}..."):
                        st.session_state.current_db = selected_db

                        # Clear chat history when switching databases
                        st.session_state.chat_text_history = []
                        st.session_state.checkbox_chat_history = []
                        st.session_state.query_count = 0

                        # Load new engine if database is initialized
                        if is_database_initialized(selected_db):
                            st.session_state.text2sql_engine = initialize_text2sql_engine(selected_db)
                            if st.session_state.text2sql_engine:
                                st.success(f"✅ Switched to {selected_db}")
                            else:
                                st.error(f"❌ Failed to load {selected_db}")
                        else:
                            st.session_state.text2sql_engine = None
                            st.warning(f"⚠️ {selected_db} needs to be initialized")

                    st.rerun()
            elif st.session_state.current_db:
                st.session_state.current_db = None
                st.session_state.text2sql_engine = None
                st.rerun()
        else:
            st.info("No databases configured yet")

        st.markdown("<hr>", unsafe_allow_html=True)

        # Add interface selection
        page_options = ["Chat", "Tables Settings", "Database Settings", "CV Upload"]
        current_index = page_options.index(
            st.session_state.interface_mode) if st.session_state.interface_mode in page_options else 0

        interface_selection = st.radio(
            "🔄 Choose page:",
            page_options,
            index=current_index,
            key="interface_mode",
        )
        st.markdown("<hr>", unsafe_allow_html=True)

        # Show current database info
        if st.session_state.current_db:
            db_config = st.session_state.db_settings.get(st.session_state.current_db, {})
            is_initialized = is_database_initialized(st.session_state.current_db)

            st.markdown("### 📊 Current Database")
            st.success(f"**{st.session_state.current_db}**")
            st.text(f"Dialect: {db_config.get('dialect', 'N/A')}")
            st.text(f"Host: {db_config.get('hostname', 'N/A')}")
            st.text(f"Status: {'✅ Initialized' if is_initialized else '❌ Not Initialized'}")
        else:
            st.warning("⚠️ No database selected")

        st.markdown("<hr>", unsafe_allow_html=True)

        # Page-specific options
        if interface_selection == "Chat" and st.session_state.current_db and is_database_initialized(
                st.session_state.current_db):
            # Clear chat button
            if st.button("🗑️ Clear Chat"):
                st.session_state.chat_text_history = []
                st.session_state.checkbox_chat_history = []
                st.session_state.query_count = 0
                st.success("✅ Chat cleared!")
                time.sleep(1)
                st.rerun()

            st.markdown("<br>", unsafe_allow_html=True)

            # Graph type selector
            st.session_state.graph_type = st.selectbox(
                "📊 Seleziona il tipo di grafico",
                ["Bar", "Bubble", "Line", "Pie"],
                key="graph_type_selector"
            )


# Run the application
if __name__ == "__main__":
    main()
    render_sidebar()