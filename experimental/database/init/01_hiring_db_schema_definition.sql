-- Enable the pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

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
    profilo_sintetico TEXT,
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on candidati
CREATE INDEX ON candidati USING hnsw (embedding vector_cosine_ops);

-- Tabella delle esperienze lavorative
CREATE TABLE esperienze_lavorative (
    id_esperienza SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidati(id_candidato),
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
    progetti_rilevanti TEXT, -- Campo di testo libero per progetti rilevanti
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on esperienze_lavorative
CREATE INDEX ON esperienze_lavorative USING hnsw (embedding vector_cosine_ops);

-- Tabella della formazione
CREATE TABLE formazione (
    id_formazione SERIAL PRIMARY KEY,
    id_candidato INT REFERENCES candidati(id_candidato),
    tipo VARCHAR(50) NOT NULL, -- università, master, corso_professionale, certificazione
    istituto VARCHAR(200) NOT NULL,
    titolo VARCHAR(200) NOT NULL,
    campo_studio VARCHAR(150),
    voto VARCHAR(20),
    citta VARCHAR(100),
    provincia CHAR(2),
    data_inizio DATE,
    data_fine DATE,
    descrizione TEXT,
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on formazione
CREATE INDEX ON formazione USING hnsw (embedding vector_cosine_ops);

-- Tabella delle competenze candidati
CREATE TABLE competenze_candidati (
    id_candidato INT REFERENCES candidati(id_candidato),
    livello INT CHECK (livello BETWEEN 1 AND 5), -- 1: base, 5: esperto
    anni_esperienza INT,
    descrizione TEXT,
    -- Single comprehensive embedding
    embedding vector(1536),
    PRIMARY KEY (id_candidato)
);

-- Create vector index for similarity search on competenze_candidati
CREATE INDEX ON competenze_candidati USING hnsw (embedding vector_cosine_ops);

-- Tabella delle offerte di lavoro
CREATE TABLE offerte_lavoro (
    id_offerta SERIAL PRIMARY KEY,
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
    note_interne TEXT, -- Campo di testo libero per note interne
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on offerte_lavoro
CREATE INDEX ON offerte_lavoro USING hnsw (embedding vector_cosine_ops);

-- Tabella delle candidature
CREATE TABLE candidature (
    id_candidatura SERIAL PRIMARY KEY,
    id_offerta INT REFERENCES offerte_lavoro(id_offerta),
    id_candidato INT REFERENCES candidati(id_candidato),
    data_candidatura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    stato VARCHAR(50) DEFAULT 'ricevuta', -- ricevuta, in_valutazione, colloquio_fissato, offerta_inviata, accettata, rifiutata
    note TEXT, -- Campo di testo libero per note
    lettera_motivazionale TEXT, -- Campo di testo libero per lettera motivazionale
    disponibilita_colloquio DATE,
    data_ultimo_aggiornamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on candidature
CREATE INDEX ON candidature USING hnsw (embedding vector_cosine_ops);

-- Tabella dei colloqui
CREATE TABLE colloqui (
    id_colloquio SERIAL PRIMARY KEY,
    id_candidatura INT REFERENCES candidature(id_candidatura),
    data_ora TIMESTAMP NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- telefonico, videochiamata, di_persona
    luogo VARCHAR(255),
    stato VARCHAR(50) DEFAULT 'programmato', -- programmato, completato, cancellato, riprogrammato
    valutazione INT CHECK (valutazione BETWEEN 1 AND 5),
    note_intervistatore TEXT, -- Campo di testo libero per note dell'intervistatore
    feedback_candidato TEXT, -- Campo di testo libero per feedback del candidato
    decisione VARCHAR(50), -- accettato, rifiutato, da_rivedere
    data_decisione DATE,
    -- Single comprehensive embedding
    embedding vector(1536)
);

-- Create vector index for similarity search on colloqui
CREATE INDEX ON colloqui USING hnsw (embedding vector_cosine_ops);