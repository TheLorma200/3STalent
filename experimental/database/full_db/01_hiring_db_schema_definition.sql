-- Database schema per piattaforma di ricerca candidati per cooperative sociali

-- Tabella degli utenti (staff HR)
CREATE TABLE utenti (
    id_utente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    ruolo VARCHAR(50) NOT NULL,
    data_creazione TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultimo_accesso TIMESTAMP
);

-- Tabella delle organizzazioni (cooperative sociali)
CREATE TABLE organizzazioni (
    id_organizzazione SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(255),
    citta VARCHAR(100),
    provincia CHAR(2),
    cap VARCHAR(5),
    telefono VARCHAR(20),
    email VARCHAR(150),
    sito_web VARCHAR(255),
    partita_iva VARCHAR(11),
    codice_fiscale VARCHAR(16),
    descrizione TEXT,
    data_creazione TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabella delle sedi operative
CREATE TABLE sedi (
    id_sede SERIAL PRIMARY KEY,
    id_organizzazione INT NOT NULL REFERENCES organizzazioni(id_organizzazione),
    nome VARCHAR(200) NOT NULL,
    indirizzo VARCHAR(255),
    citta VARCHAR(100),
    provincia CHAR(2),
    cap VARCHAR(5),
    telefono VARCHAR(20),
    email VARCHAR(150),
    descrizione TEXT
);

-- Tabella delle categorie professionali
CREATE TABLE categorie_professionali (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descrizione TEXT
);

-- Tabella delle competenze
CREATE TABLE competenze (
    id_competenza SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descrizione TEXT,
    tipo VARCHAR(50) NOT NULL -- soft_skill, hard_skill, linguistica, tecnica, etc.
);

-- Tabella delle posizioni lavorative
CREATE TABLE posizioni (
    id_posizione SERIAL PRIMARY KEY,
    id_categoria INT NOT NULL REFERENCES categorie_professionali(id_categoria),
    titolo VARCHAR(150) NOT NULL,
    descrizione TEXT,
    requisiti TEXT,
    livello_esperienza VARCHAR(50) -- entry_level, medio, senior, esperto
);

-- Tabella dei candidati esterni
CREATE TABLE candidati (
    id_candidato SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    codice_fiscale VARCHAR(16) UNIQUE,
    data_nascita DATE,
    luogo_nascita VARCHAR(100),
    genere CHAR(1), -- M, F, A (altro)
    indirizzo VARCHAR(255),
    citta VARCHAR(100),
    provincia CHAR(2),
    cap VARCHAR(5),
    telefono VARCHAR(20),
    email VARCHAR(150) UNIQUE NOT NULL,
    linkedin VARCHAR(255),
    portfolio VARCHAR(255),
    stato_candidato VARCHAR(50) DEFAULT 'nuovo', -- nuovo, in_valutazione, approvato, respinto
    disponibilita_trasferte BOOLEAN DEFAULT FALSE,
    disponibilita_remoto BOOLEAN DEFAULT FALSE,
    note_personali TEXT, -- Campo di testo libero per note personali
    lettera_presentazione TEXT, -- Campo di testo libero per lettera di presentazione
    data_inserimento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_ultimo_aggiornamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    profilo_sintetico TEXT
);

-- Tabella dei dipendenti (candidati interni)
CREATE TABLE dipendenti (
    id_dipendente SERIAL PRIMARY KEY,
    id_organizzazione INT NOT NULL REFERENCES organizzazioni(id_organizzazione),
    id_sede INT REFERENCES sedi(id_sede),
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    codice_fiscale VARCHAR(16) UNIQUE,
    matricola VARCHAR(20) UNIQUE,
    data_nascita DATE,
    luogo_nascita VARCHAR(100),
    genere CHAR(1), -- M, F, A (altro)
    indirizzo VARCHAR(255),
    citta VARCHAR(100),
    provincia CHAR(2),
    cap VARCHAR(5),
    telefono VARCHAR(20),
    email VARCHAR(150) UNIQUE NOT NULL,
    ruolo_attuale VARCHAR(150),
    id_posizione INT REFERENCES posizioni(id_posizione),
    reparto VARCHAR(100),
    data_assunzione DATE,
    tipo_contratto TEXT, -- indeterminato, determinato, partita_iva, ecc.
    disponibilita_cambio_ruolo BOOLEAN DEFAULT FALSE,
    disponibilita_ore_extra BOOLEAN DEFAULT FALSE,
    disponibilita_trasferte BOOLEAN DEFAULT FALSE,
    disponibilita_remoto BOOLEAN DEFAULT FALSE,
    note_interne TEXT, -- Campo di testo libero per note interne
    obiettivi_carriera TEXT, -- Campo di testo libero per obiettivi di carriera
    data_inserimento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_ultimo_aggiornamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabella delle esperienze lavorative
CREATE TABLE esperienze_lavorative (
    id_esperienza SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidati(id_candidato),
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    azienda VARCHAR(200) NOT NULL,
    settore VARCHAR(100),
    posizione VARCHAR(150) NOT NULL,
    descrizione TEXT,
    citta VARCHAR(100),
    provincia CHAR(2),
    data_inizio DATE NOT NULL,
    data_fine DATE, -- NULL se è l'esperienza attuale
    attuale BOOLEAN DEFAULT FALSE,
    referenze TEXT,
    progetti_rilevanti TEXT -- Campo di testo libero per progetti rilevanti
);

-- Tabella della formazione
CREATE TABLE formazione (
    id_formazione SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidati(id_candidato),
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    tipo VARCHAR(50) NOT NULL, -- università, master, corso_professionale, certificazione
    istituto VARCHAR(200) NOT NULL,
    titolo VARCHAR(200) NOT NULL,
    campo_studio VARCHAR(150),
    voto VARCHAR(20),
    citta VARCHAR(100),
    provincia CHAR(2),
    data_inizio DATE,
    data_fine DATE,
    descrizione TEXT
);

-- Tabella delle competenze candidati
CREATE TABLE competenze_candidati (
    id_candidato INT REFERENCES candidati(id_candidato),
    id_competenza INT REFERENCES competenze(id_competenza),
    livello INT CHECK (livello BETWEEN 1 AND 5), -- 1: base, 5: esperto
    anni_esperienza INT,
    descrizione TEXT,
    PRIMARY KEY (id_candidato, id_competenza)
);

-- Tabella delle competenze dipendenti
CREATE TABLE competenze_dipendenti (
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    id_competenza INT REFERENCES competenze(id_competenza),
    livello INT CHECK (livello BETWEEN 1 AND 5), -- 1: base, 5: esperto
    anni_esperienza INT,
    descrizione TEXT,
    PRIMARY KEY (id_dipendente, id_competenza)
);

-- Tabella delle lingue conosciute dai candidati
CREATE TABLE lingue_candidati (
    id_candidato INT REFERENCES candidati(id_candidato),
    lingua VARCHAR(50) NOT NULL,
    livello_scritto VARCHAR(2), -- A1, A2, B1, B2, C1, C2
    livello_parlato VARCHAR(2), -- A1, A2, B1, B2, C1, C2
    certificazioni VARCHAR(255),
    PRIMARY KEY (id_candidato, lingua)
);

-- Tabella delle lingue conosciute dai dipendenti
CREATE TABLE lingue_dipendenti (
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    lingua VARCHAR(50) NOT NULL,
    livello_scritto VARCHAR(2), -- A1, A2, B1, B2, C1, C2
    livello_parlato VARCHAR(2), -- A1, A2, B1, B2, C1, C2
    certificazioni VARCHAR(255),
    PRIMARY KEY (id_dipendente, lingua)
);

-- Tabella delle offerte di lavoro
CREATE TABLE offerte_lavoro (
    id_offerta SERIAL PRIMARY KEY,
    id_organizzazione INT NOT NULL REFERENCES organizzazioni(id_organizzazione),
    id_sede INT REFERENCES sedi(id_sede),
    id_posizione INT REFERENCES posizioni(id_posizione),
    titolo VARCHAR(200) NOT NULL,
    descrizione TEXT NOT NULL,
    requisiti TEXT NOT NULL,
    responsabilita TEXT,
    tipo_contratto TEXT,
    durata_contratto VARCHAR(50),
    stipendio_min DECIMAL(10, 2),
    stipendio_max DECIMAL(10, 2),
    benefit TEXT,
    data_pubblicazione DATE NOT NULL,
    data_scadenza DATE,
    stato VARCHAR(50) DEFAULT 'aperta', -- aperta, chiusa, in_sospeso
    lavoro_remoto BOOLEAN DEFAULT FALSE,
    full_time BOOLEAN DEFAULT TRUE,
    disponibilita_immediata BOOLEAN DEFAULT FALSE,
    interno_esterno VARCHAR(20) DEFAULT 'esterno', -- interno, esterno, entrambi
    priorita INT DEFAULT 3, -- 1: bassa, 3: media, 5: alta
    note_interne TEXT -- Campo di testo libero per note interne
);

-- Tabella delle competenze richieste per le offerte
CREATE TABLE competenze_richieste (
    id_offerta INT REFERENCES offerte_lavoro(id_offerta),
    id_competenza INT REFERENCES competenze(id_competenza),
    livello_richiesto INT CHECK (livello_richiesto BETWEEN 1 AND 5),
    obbligatorio BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_offerta, id_competenza)
);

-- Tabella delle candidature
CREATE TABLE candidature (
    id_candidatura SERIAL PRIMARY KEY,
    id_offerta INT REFERENCES offerte_lavoro(id_offerta),
    id_candidato INT REFERENCES candidati(id_candidato),
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    data_candidatura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    stato VARCHAR(50) DEFAULT 'ricevuta', -- ricevuta, in_valutazione, colloquio_fissato, offerta_inviata, accettata, rifiutata
    note TEXT, -- Campo di testo libero per note
    lettera_motivazionale TEXT, -- Campo di testo libero per lettera motivazionale
    disponibilita_colloquio DATE,
    data_ultimo_aggiornamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK ((id_candidato IS NULL AND id_dipendente IS NOT NULL) OR (id_candidato IS NOT NULL AND id_dipendente IS NULL))
);

-- Tabella dei colloqui
CREATE TABLE colloqui (
    id_colloquio SERIAL PRIMARY KEY,
    id_candidatura INT REFERENCES candidature(id_candidatura),
    data_ora TIMESTAMP NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- telefonico, videochiamata, di_persona
    luogo VARCHAR(255),
    id_utente INT REFERENCES utenti(id_utente), -- responsabile del colloquio
    stato VARCHAR(50) DEFAULT 'programmato', -- programmato, completato, cancellato, riprogrammato
    valutazione INT CHECK (valutazione BETWEEN 1 AND 5),
    note_intervistatore TEXT, -- Campo di testo libero per note dell'intervistatore
    feedback_candidato TEXT, -- Campo di testo libero per feedback del candidato
    decisione VARCHAR(50), -- accettato, rifiutato, da_rivedere
    data_decisione DATE
);

-- Tabella dei documenti allegati
CREATE TABLE documenti (
    id_documento SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidati(id_candidato),
    id_dipendente INT REFERENCES dipendenti(id_dipendente),
    tipo VARCHAR(50) NOT NULL, -- cv, certificato, portfolio, lettera_referenze
    nome_file VARCHAR(255) NOT NULL,
    percorso_file VARCHAR(255) NOT NULL,
    data_caricamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descrizione TEXT,
    contenuto_testuale TEXT -- Campo di testo libero per il contenuto testuale del documento
);

-- Tabella dei progetti interni
CREATE TABLE progetti (
    id_progetto SERIAL PRIMARY KEY,
    id_organizzazione INT NOT NULL REFERENCES organizzazioni(id_organizzazione),
    nome VARCHAR(200) NOT NULL,
    descrizione TEXT,
    data_inizio DATE,
    data_fine DATE,
    stato VARCHAR(50) DEFAULT 'pianificato', -- pianificato, in_corso, completato, sospeso
    priority INT DEFAULT 3, -- 1: bassa, 3: media, 5: alta
    note TEXT -- Campo di testo libero per note
);

-- Tabella delle assegnazioni dipendenti ai progetti
CREATE TABLE assegnazioni_progetti (
    id_assegnazione SERIAL PRIMARY KEY,
    id_progetto INT NOT NULL REFERENCES progetti(id_progetto),
    id_dipendente INT NOT NULL REFERENCES dipendenti(id_dipendente),
    ruolo VARCHAR(100) NOT NULL,
    percentuale_tempo INT NOT NULL CHECK (percentuale_tempo BETWEEN 0 AND 100),
    data_inizio DATE NOT NULL,
    data_fine DATE,
    note TEXT -- Campo di testo libero per note
);

-- Tabella delle valutazioni dipendenti
CREATE TABLE valutazioni (
    id_valutazione SERIAL PRIMARY KEY,
    id_dipendente INT NOT NULL REFERENCES dipendenti(id_dipendente),
    id_utente INT NOT NULL REFERENCES utenti(id_utente), -- valutatore
    periodo_inizio DATE NOT NULL,
    periodo_fine DATE NOT NULL,
    valutazione_complessiva INT CHECK (valutazione_complessiva BETWEEN 1 AND 5),
    obiettivi_raggiunti TEXT, -- Campo di testo libero per obiettivi raggiunti
    aree_miglioramento TEXT, -- Campo di testo libero per aree di miglioramento
    punti_forza TEXT, -- Campo di testo libero per punti di forza
    piano_sviluppo TEXT, -- Campo di testo libero per piano di sviluppo
    feedback_dipendente TEXT, -- Campo di testo libero per feedback del dipendente
    data_valutazione DATE NOT NULL,
    data_prossima_valutazione DATE
);

