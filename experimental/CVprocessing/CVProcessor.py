"""
CV Processor Module
Handles PDF parsing and text extraction from CV files
"""

import io
from pathlib import Path
from typing import Optional, Tuple
import PyPDF2
import pdfplumber


class CVProcessor:
    """Processes CV files and extracts text content"""

    def __init__(self):
        """Initialize CV processor"""
        pass

    def extract_text_from_pdf(self, pdf_file) -> Tuple[bool, str, str]:
        """
        Extract text from PDF file using multiple methods for best results

        Args:
            pdf_file: File object from Streamlit file_uploader or file path

        Returns:
            Tuple of (success: bool, text: str, error_message: str)
        """
        try:
            # Try with pdfplumber first (better for complex layouts)
            text = self._extract_with_pdfplumber(pdf_file)

            if text and len(text.strip()) > 100:
                return True, text, ""

            # Fallback to PyPDF2
            text = self._extract_with_pypdf2(pdf_file)

            if text and len(text.strip()) > 100:
                return True, text, ""

            return False, "", "Il PDF sembra vuoto o non leggibile"

        except Exception as e:
            return False, "", f"Errore durante l'estrazione del testo: {str(e)}"

    def _extract_with_pdfplumber(self, pdf_file) -> str:
        """Extract text using pdfplumber (best for tables and complex layouts)"""
        try:
            # Reset file pointer if it's a file object
            if hasattr(pdf_file, 'seek'):
                pdf_file.seek(0)

            text_parts = []
            with pdfplumber.open(pdf_file) as pdf:
                for page in pdf.pages:
                    page_text = page.extract_text()
                    if page_text:
                        text_parts.append(page_text)

            return "\n\n".join(text_parts)
        except Exception as e:
            print(f"Pdfplumber extraction failed: {str(e)}")
            return ""

    def _extract_with_pypdf2(self, pdf_file) -> str:
        """Extract text using PyPDF2 (fallback method)"""
        try:
            # Reset file pointer if it's a file object
            if hasattr(pdf_file, 'seek'):
                pdf_file.seek(0)

            text_parts = []
            pdf_reader = PyPDF2.PdfReader(pdf_file)

            for page in pdf_reader.pages:
                page_text = page.extract_text()
                if page_text:
                    text_parts.append(page_text)

            return "\n\n".join(text_parts)
        except Exception as e:
            print(f"PyPDF2 extraction failed: {str(e)}")
            return ""

    def validate_cv_content(self, text: str) -> Tuple[bool, str]:
        """
        Validate that extracted text looks like a CV

        Args:
            text: Extracted text from PDF

        Returns:
            Tuple of (is_valid: bool, message: str)
        """
        if not text or len(text.strip()) < 100:
            return False, "Il contenuto del CV sembra troppo breve"

        # Check for common CV keywords in Italian
        cv_keywords = [
            'esperienza', 'formazione', 'istruzione', 'competenze',
            'lavoro', 'curriculum', 'email', 'telefono', 'skills',
            'education', 'experience', 'contatti', 'nato', 'data di nascita'
        ]

        text_lower = text.lower()
        keywords_found = sum(1 for keyword in cv_keywords if keyword in text_lower)

        if keywords_found < 2:
            return False, "Il documento non sembra essere un CV valido"

        return True, "CV valido"

    def save_cv_file(self, pdf_file, candidate_id: int, nome: str, cognome: str,
                     base_path: str = "./uploaded_cvs") -> Tuple[bool, str, str]:
        """
        Save CV file to disk with standardized naming

        Args:
            pdf_file: File object from Streamlit
            candidate_id: Database ID of the candidate
            nome: First name
            cognome: Last name
            base_path: Base directory for CV storage

        Returns:
            Tuple of (success: bool, file_path: str, error_message: str)
        """
        try:
            # Create directory if it doesn't exist
            cv_dir = Path(base_path)
            cv_dir.mkdir(parents=True, exist_ok=True)

            # Sanitize filename
            safe_nome = self._sanitize_filename(nome)
            safe_cognome = self._sanitize_filename(cognome)

            # Create filename
            filename = f"{candidate_id}_{safe_nome}_{safe_cognome}.pdf"
            file_path = cv_dir / filename

            # Reset file pointer and save
            if hasattr(pdf_file, 'seek'):
                pdf_file.seek(0)

            with open(file_path, 'wb') as f:
                f.write(pdf_file.read())

            return True, str(file_path), ""

        except Exception as e:
            return False, "", f"Errore nel salvataggio del file: {str(e)}"

    def _sanitize_filename(self, text: str) -> str:
        """Remove special characters from filename"""
        import re
        # Remove special characters, keep only alphanumeric and underscores
        safe_text = re.sub(r'[^\w\s-]', '', text)
        safe_text = re.sub(r'[-\s]+', '_', safe_text)
        return safe_text.strip('_')


# Singleton instance
cv_processor = CVProcessor()