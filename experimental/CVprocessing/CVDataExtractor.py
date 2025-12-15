"""
CV Data Extractor Module
Extracts structured data from CV text using OpenAI GPT
"""

import json
import os
from datetime import datetime
from typing import Dict, List, Optional, Any
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()


class CVDataExtractor:
    """Extracts structured data from CV text using LLM"""

    def __init__(self):
        """Initialize OpenAI client"""
        api_key = os.getenv("OPENAI_API_KEY")
        if not api_key:
            raise ValueError("OPENAI_API_KEY not found in environment variables")

        self.client = OpenAI(api_key=api_key)
        self.model = "gpt-4o"  # Using GPT-4o for better accuracy

    def extract_candidate_data(self, cv_text: str) -> Dict[str, Any]:
        """
        Extract structured candidate data from CV text

        Args:
            cv_text: Raw text extracted from CV PDF

        Returns:
            Dictionary containing all extracted candidate data
        """

        # Define the JSON schema for extraction
        extraction_schema = {
            "candidato": {
                "nome": "string or null",
                "cognome": "string or null",
                "email": "string or null",
                "telefono": "string or null",
                "codice_fiscale": "string or null",
                "data_nascita": "YYYY-MM-DD or null",
                "luogo_nascita": "string or null",
                "genere": "M/F/A or null",
                "indirizzo": "string or null",
                "citta": "string or null",
                "provincia": "string (2 char) or null",
                "cap": "string or null",
                "linkedin": "string or null",
                "portfolio": "string or null",
                "disponibilita_trasferte": "boolean or null",
                "disponibilita_remoto": "boolean or null",
                "lettera_presentazione": "string or null",
                "profilo_sintetico": "string (max 300 parole)"
            },
            "esperienze_lavorative": [
                {
                    "azienda": "string",
                    "settore": "string or null",
                    "posizione": "string",
                    "descrizione": "string or null",
                    "citta": "string or null",
                    "provincia": "string (2 char) or null",
                    "data_inizio": "YYYY-MM-DD",
                    "data_fine": "YYYY-MM-DD or null",
                    "attuale": "boolean",
                    "progetti_rilevanti": "string or null"
                }
            ],
            "formazione": [
                {
                    "tipo": "università/master/corso_professionale/certificazione",
                    "istituto": "string",
                    "titolo": "string",
                    "campo_studio": "string or null",
                    "voto": "string or null",
                    "citta": "string or null",
                    "provincia": "string (2 char) or null",
                    "data_inizio": "YYYY-MM-DD or null",
                    "data_fine": "YYYY-MM-DD or null",
                    "descrizione": "string or null"
                }
            ],
            "competenze": [
                {
                    "nome": "string",
                    "tipo": "soft_skill/hard_skill/linguistica/tecnica",
                    "livello": "1-5",
                    "anni_esperienza": "integer or null",
                    "descrizione": "string or null"
                }
            ],
            "lingue": [
                {
                    "lingua": "string",
                    "livello_scritto": "A1/A2/B1/B2/C1/C2 or null",
                    "livello_parlato": "A1/A2/B1/B2/C1/C2 or null",
                    "certificazioni": "string or null"
                }
            ]
        }

        prompt = self._build_extraction_prompt(cv_text, extraction_schema)

        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {
                        "role": "system",
                        "content": "Sei un esperto HR assistant specializzato nell'analisi di CV. "
                                   "Estrai informazioni strutturate dai CV in formato JSON. "
                                   "Segui rigorosamente lo schema fornito. "
                                   "Se un'informazione non è presente nel CV, usa null. "
                                   "NON inventare o dedurre informazioni non presenti. "
                                   "Per le date, usa sempre il formato YYYY-MM-DD. "
                                   "Per il profilo_sintetico, crea un riassunto professionale di max 300 parole "
                                   "che evidenzi competenze chiave, esperienza e caratteristiche distintive."
                    },
                    {
                        "role": "user",
                        "content": prompt
                    }
                ],
                temperature=0.1,  # Low temperature for consistency
                response_format={"type": "json_object"}
            )

            # Parse the response
            extracted_data = json.loads(response.choices[0].message.content)

            # Validate and clean the data
            validated_data = self._validate_and_clean_data(extracted_data)

            return validated_data

        except Exception as e:
            raise Exception(f"Errore durante l'estrazione dei dati: {str(e)}")

    def _build_extraction_prompt(self, cv_text: str, schema: Dict) -> str:
        """Build the extraction prompt with CV text and schema"""
        return f"""
Analizza il seguente CV e estrai tutte le informazioni strutturate secondo lo schema JSON fornito.

SCHEMA JSON DA SEGUIRE:
{json.dumps(schema, indent=2, ensure_ascii=False)}

REGOLE IMPORTANTI:
1. Se un campo non è presente nel CV, usa null (non inventare dati)
2. Per le date usa il formato YYYY-MM-DD
3. Per le province usa le sigle a 2 caratterere (es: MI, RM, TO)
4. Per il genere: M (maschio), F (femmina), A (altro), null se non specificato
5. Per i livelli di competenza: 1 (base) a 5 (esperto)
6. Per i livelli linguistici: A1, A2, B1, B2, C1, C2 (standard CEFR)
7. Per il campo "attuale" nelle esperienze: true solo se è specificato come lavoro attuale
8. Per profilo_sintetico: crea un riassunto professionale di max 300 parole che catturi:
   - Competenze tecniche principali
   - Anni di esperienza e settori di specializzazione
   - Punti di forza distintivi
   - Risultati o progetti rilevanti
   - **IMPORTANTE: Includi anche le lingue conosciute con i relativi livelli alla fine del profilo**
   Esempio: "...esperto in gestione progetti. Lingue: Italiano (madrelingua), Inglese (C1), Spagnolo (B2)."

TESTO DEL CV:
{cv_text}

Rispondi SOLO con il JSON strutturato, senza altro testo.
"""

    def _validate_and_clean_data(self, data: Dict) -> Dict:
        """Validate and clean extracted data"""

        # Helper function to convert empty strings to None
        def clean_empty(value):
            """Convert empty strings to None"""
            if value == '' or value == 'null' or value == 'NULL':
                return None
            return value

        # Ensure main structure exists
        if "candidato" not in data:
            data["candidato"] = {}
        if "esperienze_lavorative" not in data:
            data["esperienze_lavorative"] = []
        if "formazione" not in data:
            data["formazione"] = []
        if "competenze" not in data:
            data["competenze"] = []
        if "lingue" not in data:
            data["lingue"] = []

        # Clean candidato data - convert empty strings to None
        candidato = data["candidato"]

        # Clean all text fields
        for key in candidato:
            if isinstance(candidato[key], str):
                candidato[key] = clean_empty(candidato[key])

        # Validate email format (basic check)
        if candidato.get("email") and "@" not in str(candidato["email"]):
            candidato["email"] = None

        # Validate dates
        candidato["data_nascita"] = self._validate_date(candidato.get("data_nascita"))

        # Validate boolean fields
        candidato["disponibilita_trasferte"] = self._to_boolean(
            candidato.get("disponibilita_trasferte")
        )
        candidato["disponibilita_remoto"] = self._to_boolean(
            candidato.get("disponibilita_remoto")
        )

        # Validate genere
        if candidato.get("genere") not in ["M", "F", "A", None]:
            candidato["genere"] = None

        # Validate provincia (2 chars uppercase)
        if candidato.get("provincia"):
            prov = str(candidato["provincia"]).upper()[:2]
            candidato["provincia"] = prov if len(prov) == 2 else None

        # Clean esperienze
        for exp in data["esperienze_lavorative"]:
            # Clean all text fields in experience
            for key in exp:
                if isinstance(exp[key], str):
                    exp[key] = clean_empty(exp[key])

            exp["data_inizio"] = self._validate_date(exp.get("data_inizio"))
            exp["data_fine"] = self._validate_date(exp.get("data_fine"))
            exp["attuale"] = self._to_boolean(exp.get("attuale"))

            if exp.get("provincia"):
                prov = str(exp["provincia"]).upper()[:2] if exp["provincia"] else None
                exp["provincia"] = prov if prov and len(prov) == 2 else None

        # Clean formazione
        for edu in data["formazione"]:
            # Clean all text fields in education
            for key in edu:
                if isinstance(edu[key], str):
                    edu[key] = clean_empty(edu[key])

            edu["data_inizio"] = self._validate_date(edu.get("data_inizio"))
            edu["data_fine"] = self._validate_date(edu.get("data_fine"))

            # Validate tipo
            valid_types = ["università", "master", "corso_professionale", "certificazione"]
            if edu.get("tipo") and edu["tipo"].lower() not in valid_types:
                edu["tipo"] = "corso_professionale"  # default

            if edu.get("provincia"):
                prov = str(edu["provincia"]).upper()[:2] if edu["provincia"] else None
                edu["provincia"] = prov if prov and len(prov) == 2 else None

        # Clean competenze
        for comp in data["competenze"]:
            # Clean all text fields in competenze
            for key in comp:
                if isinstance(comp[key], str):
                    comp[key] = clean_empty(comp[key])

            # Validate livello (1-5)
            try:
                livello = int(comp.get("livello", 3))
                comp["livello"] = max(1, min(5, livello))
            except (ValueError, TypeError):
                comp["livello"] = 3  # default medio

            # Validate anni_esperienza
            try:
                anni = comp.get("anni_esperienza")
                comp["anni_esperienza"] = int(anni) if anni else None
            except (ValueError, TypeError):
                comp["anni_esperienza"] = None

            # Validate tipo
            valid_types = ["soft_skill", "hard_skill", "linguistica", "tecnica"]
            if comp.get("tipo") and comp["tipo"] not in valid_types:
                comp["tipo"] = "hard_skill"  # default

        # Clean lingue
        valid_levels = ["A1", "A2", "B1", "B2", "C1", "C2"]
        for lang in data["lingue"]:
            # Clean all text fields in lingue
            for key in lang:
                if isinstance(lang[key], str):
                    lang[key] = clean_empty(lang[key])

            # Validate levels
            if lang.get("livello_scritto"):
                lang["livello_scritto"] = lang["livello_scritto"].upper() if lang["livello_scritto"] else None
                if lang["livello_scritto"] and lang["livello_scritto"] not in valid_levels:
                    lang["livello_scritto"] = None

            if lang.get("livello_parlato"):
                lang["livello_parlato"] = lang["livello_parlato"].upper() if lang["livello_parlato"] else None
                if lang["livello_parlato"] and lang["livello_parlato"] not in valid_levels:
                    lang["livello_parlato"] = None

        return data

    def _validate_date(self, date_str: Any) -> Optional[str]:
        """Validate and format date string to YYYY-MM-DD"""
        if not date_str:
            return None

        try:
            # Try parsing various date formats
            date_str = str(date_str).strip()

            # Already in correct format
            if len(date_str) == 10 and date_str[4] == '-' and date_str[7] == '-':
                datetime.strptime(date_str, "%Y-%m-%d")
                return date_str

            # Try other common formats
            for fmt in ["%d/%m/%Y", "%d-%m-%Y", "%Y/%m/%d"]:
                try:
                    dt = datetime.strptime(date_str, fmt)
                    return dt.strftime("%Y-%m-%d")
                except ValueError:
                    continue

            return None
        except Exception:
            return None

    def _to_boolean(self, value: Any) -> Optional[bool]:
        """Convert various values to boolean"""
        if value is None:
            return None
        if isinstance(value, bool):
            return value
        if isinstance(value, str):
            return value.lower() in ["true", "yes", "si", "sì", "1"]
        return bool(value)


# Singleton instance
cv_data_extractor = CVDataExtractor()