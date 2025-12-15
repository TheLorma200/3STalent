-- PostgreSQL script to expand sample data

-- Double offerte_lavoro entries (adding 10 more job offers to the existing 10)
INSERT INTO offerte_lavoro (titolo, descrizione, requisiti, responsabilita, tipo_contratto, durata_contratto, stipendio_min, stipendio_max, benefit, data_pubblicazione, data_scadenza, stato, lavoro_remoto, full_time, disponibilita_immediata, interno_esterno, priorita, note_interne) VALUES
('Psicologo per Centro di Salute Mentale',
'La Cooperativa Sociale Insieme Si Può cerca un Psicologo da inserire nel proprio Centro di Salute Mentale di Milano, che offre servizi di supporto psicologico, riabilitazione psicosociale e progetti di inclusione sociale per persone con problemi di salute mentale.

Il Centro opera in stretta collaborazione con i servizi psichiatrici territoriali e gestisce diverse tipologie di intervento: colloqui individuali, gruppi terapeutici, laboratori espressivi, supporto all''autonomia abitativa e inserimento lavorativo.

Lo psicologo selezionato farà parte di un''équipe multidisciplinare composta da psichiatri, educatori, assistenti sociali e tecnici della riabilitazione psichiatrica.',
'Requisiti richiesti:
- Laurea in Psicologia e iscrizione all''Albo professionale
- Specializzazione in Psicoterapia (preferibilmente ad orientamento sistemico-relazionale o cognitivo-comportamentale)
- Esperienza di almeno 2 anni nel campo della salute mentale
- Competenze nella valutazione psicodiagnostica
- Capacità di conduzione di gruppi terapeutici
- Attitudine al lavoro in équipe multidisciplinare
- Conoscenza dei servizi territoriali di salute mentale
- Flessibilità oraria

Competenze specifiche apprezzate:
- Esperienza nella riabilitazione psicosociale
- Formazione in EMDR o altre tecniche per il trattamento del trauma
- Competenze nella conduzione di gruppi con approccio corporeo
- Esperienza in progetti di residenzialità leggera o housing first',
'Principali responsabilità:
- Valutazione psicologica e psicodiagnostica
- Conduzione di colloqui psicologici individuali
- Facilitazione di gruppi terapeutici e di auto-aiuto
- Progettazione e monitoraggio di interventi riabilitativi individualizzati
- Partecipazione alla definizione dei progetti terapeutici in équipe
- Supporto ai familiari
- Coordinamento con i servizi psichiatrici invianti
- Partecipazione alle riunioni d''équipe e alle supervisioni
- Documentazione degli interventi e redazione di relazioni psicologiche
- Collaborazione alla valutazione degli esiti degli interventi',
'Tempo indeterminato',
NULL,
1800.00,
2200.00,
'- Supervisione clinica mensile
- Formazione continua
- Flessibilità oraria
- Possibilità di crescita professionale
- Ambiente di lavoro stimolante e collaborativo',
'2025-04-05',
'2025-05-10',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
4,
'Cerchiamo una figura con solide competenze cliniche ma anche con capacità di lavoro in équipe e sensibilità verso l''approccio riabilitativo alla salute mentale. Il candidato ideale dovrebbe avere un orientamento alla recovery e all''empowerment delle persone con disagio psichico.'),

('Mediatore Culturale per Servizi di Accoglienza',
'La Cooperativa Sociale Mani Tese cerca un Mediatore Culturale da inserire nei propri Servizi di Accoglienza per richiedenti asilo e rifugiati a Bologna, che comprendono un Centro di Accoglienza Straordinaria (CAS) e un progetto SAI (Sistema Accoglienza Integrazione).

Il mediatore culturale avrà il compito di facilitare la comunicazione e la comprensione reciproca tra gli operatori dei servizi e i beneficiari, supportando i percorsi di integrazione sociale e l''accesso ai servizi del territorio.

Si richiede una figura con conoscenza delle lingue e delle culture dell''Africa Occidentale (in particolare francese e bambara/wolof/pular) o del Corno d''Africa (in particolare tigrino/amarico/arabo).',
'Requisiti richiesti:
- Conoscenza approfondita della cultura e delle lingue di una delle aree geografiche indicate
- Ottima conoscenza della lingua italiana (almeno livello B2)
- Esperienza, anche di tirocinio o volontariato, nell''ambito dell''accoglienza di migranti
- Conoscenza di base della normativa sull''immigrazione e l''asilo
- Capacità di lavoro in équipe multiculturale
- Buone capacità relazionali e comunicative
- Flessibilità oraria
- Patente B (preferenziale)

Titoli preferenziali:
- Titolo di studio in mediazione culturale o ambiti affini
- Esperienza specifica in servizi di accoglienza per richiedenti asilo
- Conoscenza dei servizi del territorio bolognese
- Esperienza nella conduzione di laboratori interculturali',
'Principali responsabilità:
- Mediazione linguistico-culturale durante i colloqui con operatori, servizi sanitari, uffici pubblici
- Orientamento dei beneficiari ai servizi del territorio
- Supporto nella comprensione di pratiche amministrative e burocratiche
- Facilitazione della comunicazione e prevenzione/gestione di conflitti interculturali
- Conduzione di laboratori di educazione civica e conoscenza del territorio
- Supporto nella ricerca di soluzioni abitative e lavorative
- Sensibilizzazione del territorio sui temi dell''accoglienza e dell''intercultura
- Partecipazione alle riunioni d''équipe
- Collaborazione nella stesura e aggiornamento dei progetti individualizzati
- Mantenimento dei rapporti con le comunità di riferimento sul territorio',
'Tempo determinato con possibilità di rinnovo',
'12 mesi',
1400.00,
1600.00,
'- Formazione continua
- Supervisione mensile
- Ambiente di lavoro multiculturale e stimolante
- Possibilità di partecipazione a progetti europei
- Flessibilità oraria',
'2025-04-08',
'2025-05-15',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
5,
'Ricerca urgente per sostituzione mediatore uscente. Preferenza per candidati con esperienza pregressa in progetti SAI e con conoscenza del tigrino/amarico, data la composizione attuale degli ospiti. Richiesta disponibilità per turni serali due volte a settimana.'),

('Coordinatore Servizi Domiciliari Anziani',
'La Cooperativa Sociale Arcobaleno cerca un Coordinatore per i propri Servizi di Assistenza Domiciliare rivolti ad anziani non autosufficienti nella città di Firenze.

Il servizio gestisce circa 150 utenti con un team di 30 operatori socio-sanitari e collabora con i servizi sociali del Comune, i servizi sanitari territoriali e le famiglie.

Il coordinatore avrà la responsabilità di garantire la qualità del servizio, coordinare il personale e gestire le relazioni con gli enti committenti e le famiglie degli assistiti.',
'Requisiti richiesti:
- Laurea in ambito sociale, educativo o sanitario
- Esperienza di almeno 3 anni nel coordinamento di servizi alla persona
- Competenze nella gestione e organizzazione dei servizi domiciliari
- Capacità di coordinamento e gestione del personale
- Conoscenza della rete dei servizi socio-sanitari per anziani
- Buone capacità relazionali con utenti fragili e famiglie
- Ottima capacità di problem solving e gestione dello stress
- Competenze informatiche per la gestione del servizio
- Patente B e disponibilità a spostarsi sul territorio
- Disponibilità a turni di reperibilità

Titoli preferenziali:
- Formazione specifica in management dei servizi alla persona
- Esperienza nella gestione di servizi accreditati
- Conoscenza degli strumenti di valutazione geriatrica
- Esperienza nella gestione di sistemi informativi per i servizi domiciliari',
'Principali responsabilità:
- Coordinamento e supervisione del team di operatori
- Organizzazione dei turni di lavoro e gestione delle sostituzioni
- Valutazione dei bisogni dell''utenza e definizione dei piani assistenziali in collaborazione con i servizi sociali
- Monitoraggio della qualità delle prestazioni erogate
- Gestione delle relazioni con le famiglie e gestione dei reclami
- Rapporti con gli enti committenti e rendicontazione delle attività
- Selezione, inserimento e valutazione del personale
- Gestione delle riunioni d''équipe e della formazione del personale
- Gestione amministrativa del servizio
- Implementazione di procedure e protocolli operativi',
'Tempo indeterminato',
NULL,
1900.00,
2300.00,
'- Auto aziendale per spostamenti di servizio
- Smartphone aziendale
- Formazione continua
- Indennità di reperibilità
- Flessibilità oraria',
'2025-03-20',
'2025-04-30',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
4,
'Figura chiave per la gestione di un servizio in espansione. Cerchiamo una persona con capacità organizzative e di leadership, ma anche con sensibilità verso i bisogni dell''utenza anziana e delle famiglie. Importante la conoscenza del territorio fiorentino e della rete dei servizi. Formazione specifica sul coordinamento verrà garantita in fase di inserimento.'),

('Logopedista per Servizi Età Evolutiva',
'La Cooperativa Sociale Il Girasole cerca un Logopedista da inserire nei propri Servizi per l''Età Evolutiva a Roma, che comprendono un Centro di Riabilitazione accreditato e interventi nelle scuole.

Il logopedista lavorerà con bambini e ragazzi con disturbi del linguaggio, disturbi dell''apprendimento, disturbi dello spettro autistico e altre condizioni che richiedono un intervento logopedico specializzato.

Si prevede un''attività sia presso il Centro di Riabilitazione che presso le scuole convenzionate, in collaborazione con un''équipe multidisciplinare composta da neuropsichiatri infantili, psicologi, terapisti della neuropsicomotricità ed educatori.',
'Requisiti richiesti:
- Laurea in Logopedia e iscrizione all''Albo professionale
- Esperienza di almeno 1 anno con bambini con disturbi del linguaggio e dell''apprendimento
- Conoscenza dei principali strumenti di valutazione logopedica in età evolutiva
- Competenze nell''ambito dei Disturbi Specifici dell''Apprendimento
- Capacità di lavoro in équipe multidisciplinare
- Buone capacità relazionali con bambini e famiglie
- Disponibilità a lavorare sia in sede che presso scuole
- Patente B

Competenze specifiche apprezzate:
- Formazione specifica sui disturbi dello spettro autistico
- Conoscenza della Comunicazione Aumentativa Alternativa
- Esperienza nella riabilitazione di bambini con disturbi della fluenza
- Competenze nell''utilizzo di software per la riabilitazione logopedica',
'Principali responsabilità:
- Valutazione logopedica di bambini e ragazzi
- Progettazione e realizzazione di interventi logopedici individualizzati
- Trattamento di disturbi del linguaggio, della comunicazione e dell''apprendimento
- Counseling e formazione per genitori e insegnanti
- Collaborazione con l''équipe multidisciplinare nella definizione dei progetti riabilitativi
- Partecipazione agli incontri di rete con scuole e servizi territoriali
- Documentazione degli interventi e stesura di relazioni logopediche
- Partecipazione alle riunioni d''équipe e alle supervisioni
- Collaborazione in progetti di screening nelle scuole
- Aggiornamento professionale continuo',
'Tempo determinato con possibilità di trasformazione',
'12 mesi',
1700.00,
2000.00,
'- Rimborso chilometrico per spostamenti di servizio
- Supervisione e formazione continua
- Flessibilità oraria
- Possibilità di crescita professionale',
'2025-04-12',
'2025-05-20',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
3,
'Cerchiamo una figura che si integri in un''équipe giovane e dinamica, con un approccio collaborativo e innovativo alla riabilitazione. Il candidato ideale dovrebbe avere particolare interesse verso i Disturbi Specifici dell''Apprendimento e i disturbi del linguaggio in età scolare. La posizione è inizialmente a tempo determinato con concrete possibilità di stabilizzazione.'),

('Responsabile Amministrativo',
'La Cooperativa Sociale Nuovi Orizzonti cerca un Responsabile Amministrativo per la sede centrale di Napoli, che coordini tutte le attività amministrative, contabili e finanziarie della cooperativa.

La cooperativa gestisce diversi servizi nel campo dell''educazione, dell''assistenza sociale e dell''inserimento lavorativo, con un fatturato annuo di circa 3 milioni di euro e 120 dipendenti.

Il responsabile amministrativo avrà il compito di garantire la corretta gestione economico-finanziaria della cooperativa, supervisionando l''ufficio amministrativo e collaborando direttamente con la direzione e il consiglio di amministrazione.',
'Requisiti richiesti:
- Laurea in Economia, Finanza o discipline affini
- Esperienza di almeno 5 anni in ruoli amministrativi, preferibilmente nel terzo settore
- Conoscenza approfondita della contabilità e del bilancio delle cooperative sociali
- Competenze nella gestione finanziaria e nel controllo di gestione
- Conoscenza della normativa fiscale e civilistica relativa alle cooperative
- Esperienza nella rendicontazione di progetti finanziati
- Capacità di coordinamento di un team amministrativo
- Ottime competenze informatiche (pacchetto Office, software gestionali)
- Capacità di analisi e problem solving

Titoli preferenziali:
- Master in management delle imprese sociali
- Esperienza in revisione contabile o in studi commercialisti
- Conoscenza dei principali bandi di finanziamento per il terzo settore
- Esperienza nella pianificazione strategica e nel business planning',
'Principali responsabilità:
- Supervisione e coordinamento dell''ufficio amministrativo
- Gestione della contabilità generale e analitica
- Elaborazione del bilancio d''esercizio e delle situazioni infrannuali
- Gestione dei rapporti con istituti bancari, consulenti fiscali e revisori
- Supervisione del ciclo attivo e passivo
- Gestione degli adempimenti fiscali e civilistici
- Controllo di gestione e reportistica periodica per la direzione
- Rendicontazione di progetti finanziati
- Gestione degli aspetti amministrativi del personale in collaborazione con il consulente del lavoro
- Supporto alla direzione nelle decisioni strategiche',
'Tempo indeterminato',
NULL,
2200.00,
2600.00,
'- Auto aziendale
- Smartphone e laptop aziendali
- Formazione specialistica
- Flessibilità oraria
- Possibilità di smart working parziale',
'2025-03-25',
'2025-05-05',
'aperta',
TRUE,
TRUE,
FALSE,
'esterno',
4,
'Figura chiave per la cooperativa in un momento di espansione e diversificazione delle attività. Cerchiamo una persona con solide competenze tecniche ma anche con visione strategica e sensibilità ai valori della cooperazione sociale. Il candidato ideale dovrebbe avere capacità di innovazione nei processi amministrativi e di gestione.'),

('Educatore per Comunità Minori',
'La Cooperativa Sociale Arcobaleno cerca un Educatore Professionale da inserire nella propria Comunità Educativa per Minori "Casa del Sole" a Torino, che accoglie ragazzi dai 6 ai 17 anni allontanati temporaneamente dalle famiglie d''origine.

La comunità ospita 10 minori in regime residenziale, con un progetto educativo che valorizza la quotidianità, la relazione educativa e il supporto scolastico, in stretto raccordo con i servizi sociali, le famiglie e le scuole.

L''educatore selezionato lavorerà in un''équipe educativa composta da 6 educatori e un coordinatore, coprendo turni diurni, serali e notturni secondo una turnazione programmata.',
'Requisiti richiesti:
- Laurea in Scienze dell''Educazione (L-19) o Educazione Professionale (L/SNT2)
- Esperienza di almeno 1 anno nel lavoro educativo con minori, preferibilmente in contesti residenziali
- Capacità di gestione delle dinamiche di gruppo e dei conflitti
- Competenze nella progettazione educativa individualizzata
- Attitudine al lavoro in équipe
- Equilibrio emotivo e capacità di gestione dello stress
- Patente B
- Disponibilità a lavorare su turni, anche notturni e festivi

Competenze specifiche apprezzate:
- Formazione in pedagogia del trauma
- Esperienza con minori con problematiche comportamentali
- Competenze in tecniche di gestione dell''aggressività
- Capacità di conduzione di laboratori espressivi',
'Principali responsabilità:
- Gestione della quotidianità educativa in comunità
- Costruzione di relazioni educative significative con i minori
- Progettazione e realizzazione di attività educative individuali e di gruppo
- Supporto scolastico e accompagnamento nei percorsi di apprendimento
- Gestione delle relazioni con le famiglie d''origine, quando previste
- Accompagnamento dei minori alle attività esterne (sport, visite mediche, incontri con familiari)
- Partecipazione alla stesura e realizzazione dei progetti educativi individualizzati
- Documentazione degli interventi e stesura di relazioni educative
- Partecipazione alle riunioni d''équipe e alle supervisioni
- Collaborazione con la rete dei servizi territoriali',
'Tempo indeterminato',
NULL,
1500.00,
1700.00,
'- Formazione continua e supervisione
- Ambiente di lavoro supportivo e collaborativo
- Opportunità di crescita professionale
- Possibilità di partecipazione a progetti innovativi',
'2025-04-15',
'2025-05-25',
'aperta',
FALSE,
TRUE,
TRUE,
'esterno',
5,
'Ricerca urgente per sostituzione di un educatore. Cerchiamo una figura con solida formazione pedagogica e capacità di gestione delle dinamiche complesse. Richiesta particolare attenzione alla dimensione emotiva e relazionale del lavoro educativo. Necessaria disponibilità immediata, con inserimento previsto entro giugno 2025.'),

('Esperto Fundraising e Progettazione',
'La Cooperativa Sociale Il Girasole cerca un Esperto di Fundraising e Progettazione per rafforzare l''Area Sviluppo e sostenere la crescita e la diversificazione delle fonti di finanziamento.

La figura selezionata avrà il compito di pianificare e implementare strategie di raccolta fondi e di elaborare proposte progettuali per bandi pubblici e privati, contribuendo allo sviluppo complessivo dell''organizzazione.

La posizione prevede il coordinamento con le diverse aree operative della cooperativa e la costruzione di partnership strategiche con enti finanziatori, aziende, fondazioni e altri stakeholder.',
'Requisiti richiesti:
- Laurea in ambiti pertinenti (economia, scienze politiche, comunicazione)
- Esperienza di almeno 3 anni nel fundraising e nella progettazione per il terzo settore
- Conoscenza approfondita delle tecniche di fundraising (individui, aziende, fondazioni)
- Competenze nella progettazione sociale e nella partecipazione a bandi
- Ottima capacità di scrittura e comunicazione efficace
- Capacità di costruire e gestire relazioni con stakeholder diversificati
- Conoscenza dei principali strumenti digitali per il fundraising
- Ottima conoscenza della lingua inglese
- Autonomia operativa e capacità organizzative
- Attitudine al lavoro per obiettivi

Titoli preferenziali:
- Master in fundraising o management del non profit
- Esperienza nella progettazione europea
- Certificazioni professionali in fundraising
- Competenze in digital marketing
- Rete di contatti nel mondo delle fondazioni e delle aziende',
'Principali responsabilità:
- Elaborazione del piano strategico di fundraising
- Identificazione e analisi di bandi di finanziamento pubblici e privati
- Redazione di proposte progettuali in risposta a bandi
- Gestione e sviluppo di campagne di raccolta fondi multicanale
- Sviluppo di partnership con aziende e fondazioni
- Organizzazione di eventi di raccolta fondi
- Gestione dei rapporti con i donor e attività di donor care
- Monitoraggio e valutazione delle attività di fundraising
- Coordinamento con l''area comunicazione per allineare messaggi e strategie
- Formazione interna sulle tematiche del fundraising e della progettazione',
'Tempo determinato con possibilità di trasformazione',
'12 mesi',
1800.00,
2200.00,
'- Bonus legato al raggiungimento degli obiettivi di raccolta fondi
- Formazione specialistica nel settore
- Flessibilità oraria
- Possibilità di smart working parziale
- Laptop e smartphone aziendali',
'2025-04-10',
'2025-05-15',
'aperta',
TRUE,
TRUE,
FALSE,
'esterno',
4,
'Figura strategica per lo sviluppo futuro della cooperativa e la diversificazione delle fonti di finanziamento. Cerchiamo una persona creativa, proattiva e con visione strategica. Fondamentale la capacità di costruire reti e partnership e di tradurre i valori e l''impatto sociale della cooperativa in proposte convincenti per potenziali finanziatori.'),

('Fisioterapista per Centro Diurno Disabili',
'La Cooperativa Sociale Insieme Si Può cerca un Fisioterapista da inserire nel proprio Centro Diurno per persone con disabilità fisica e intellettiva di Milano.

Il Centro accoglie quotidianamente 25 persone adulte con diverse tipologie di disabilità e offre attività riabilitative, educative, occupazionali e di socializzazione.

Il fisioterapista lavorerà in collaborazione con un''équipe multidisciplinare composta da educatori, OSS, terapisti occupazionali e psicologo, per garantire un approccio globale al benessere degli utenti.',
'Requisiti richiesti:
- Laurea in Fisioterapia e iscrizione all''Albo professionale
- Esperienza di almeno 1 anno nel lavoro con persone con disabilità
- Conoscenza delle principali metodologie riabilitative per diverse tipologie di disabilità
- Competenze nella progettazione di attività motorie di gruppo adattate
- Capacità di lavorare in équipe multidisciplinare
- Empatia e capacità relazionali con persone con disabilità
- Flessibilità e creatività nell''adattare gli interventi alle diverse esigenze
- Patente B

Competenze specifiche apprezzate:
- Formazione in Attività Fisica Adattata
- Esperienza in idrokinesiterapia
- Conoscenza di tecniche di rilassamento e psicomotricità
- Competenze nell''utilizzo di ausili e tecnologie assistive',
'Principali responsabilità:
- Valutazione fisioterapica degli utenti
- Progettazione e realizzazione di interventi riabilitativi individualizzati
- Conduzione di attività motorie di gruppo adattate
- Prevenzione e gestione di problematiche secondarie all''immobilità
- Consulenza sulla corretta postura e mobilizzazione
- Formazione agli operatori su tecniche di movimentazione sicura
- Partecipazione alla definizione dei progetti individualizzati
- Collaborazione con l''équipe nella progettazione delle attività del Centro
- Gestione e aggiornamento della documentazione fisioterapica
- Relazioni con i familiari e i servizi sanitari di riferimento',
'Tempo indeterminato',
NULL,
1600.00,
1900.00,
'- Formazione continua e aggiornamento professionale
- Possibilità di partecipazione a progetti innovativi
- Ambiente di lavoro stimolante e collaborativo
- Flessibilità oraria',
'2025-04-18',
'2025-05-25',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
3,
'Cerchiamo un professionista con attitudine al lavoro in équipe e capacità di integrare l''approccio riabilitativo con quello educativo. La persona dovrà essere creativa nell''adattare le metodologie fisioterapiche alle diverse capacità degli utenti e alle attività generali del Centro. Gradita esperienza specifica con persone con disabilità intellettiva e fisica.'),

('Operatore Socio Sanitario per Comunità Alloggio',
'La Cooperativa Sociale Mani Tese cerca Operatori Socio Sanitari (OSS) da inserire nella propria Comunità Alloggio per persone con disabilità "Casa Gialla" di Bergamo.

La Comunità ospita 10 persone adulte con disabilità intellettiva medio-lieve, in un contesto di tipo familiare che promuove l''autonomia, la socializzazione e l''inclusione sociale.

Gli operatori selezionati lavoreranno su turni (mattina, pomeriggio, notte) garantendo assistenza nella vita quotidiana e supporto nelle attività interne ed esterne alla Comunità.',
'Requisiti richiesti:
- Qualifica professionale di Operatore Socio Sanitario
- Esperienza, anche minima, nel lavoro con persone con disabilità
- Capacità relazionali e di gestione delle dinamiche di gruppo
- Attitudine al lavoro in équipe
- Sensibilità alle tematiche dell''inclusione sociale
- Flessibilità oraria e disponibilità al lavoro su turni (inclusi notti e festivi)
- Patente B

Titoli preferenziali:
- Esperienza in contesti residenziali simili
- Formazione specifica sulla disabilità intellettiva
- Competenze in ambito educativo o animativo
- Capacità di gestione di situazioni problematiche',
'Principali responsabilità:
- Assistenza nella cura della persona e nelle attività della vita quotidiana
- Supporto nella gestione della casa (preparazione pasti, pulizie, bucato)
- Accompagnamento degli ospiti nelle attività esterne (lavoro, sport, tempo libero)
- Somministrazione delle terapie farmacologiche secondo prescrizione medica
- Monitoraggio delle condizioni di salute e segnalazione di eventuali problematiche
- Supporto alla socializzazione e alle relazioni interpersonali
- Promozione dell''autonomia personale e sociale
- Collaborazione nella realizzazione dei progetti educativi individualizzati
- Partecipazione alle riunioni d''équipe e ai momenti formativi
- Compilazione della documentazione relativa alle attività svolte',
'Tempo indeterminato',
NULL,
1400.00,
1600.00,
'- Formazione continua
- Supervisione periodica
- Ambiente di lavoro familiare e collaborativo
- Possibilità di crescita professionale
- Welfare aziendale',
'2025-04-20',
'2025-05-30',
'aperta',
FALSE,
FALSE,
TRUE,
'esterno',
5,
'Ricerca di diverse figure (3-4 operatori) per ampliamento dell''organico. Cerchiamo persone che, oltre alle competenze assistenziali, abbiano una spiccata sensibilità relazionale e una visione della disabilità orientata alle potenzialità e non ai limiti. Importante la capacità di lavorare in autonomia nei turni di coppia o singoli. Inserimento immediato con contratto iniziale a tempo determinato e prospettiva di stabilizzazione.'),
-- Continuing with offerte_lavoro entries
('Tecnico dell''Inserimento Lavorativo',
'La Cooperativa Sociale Nuovi Orizzonti cerca un Tecnico dell''Inserimento Lavorativo per il proprio Servizio di Integrazione Lavorativa, che si occupa di progettare e realizzare percorsi di inserimento lavorativo per persone con disabilità, disagio psichico e altre forme di svantaggio sociale.

Il servizio opera in stretta collaborazione con i Centri per l''Impiego, i servizi sociali e sanitari, le aziende del territorio e le attività produttive interne alla cooperativa (manutenzione del verde, pulizie, assemblaggio).

Il tecnico dell''inserimento lavorativo avrà il compito di accompagnare le persone in tutte le fasi del percorso di integrazione lavorativa, dalla valutazione iniziale al supporto sul posto di lavoro.',
'Requisiti richiesti:
- Laurea in ambito educativo, sociale o psicologico
- Esperienza di almeno 2 anni nel campo dell''inserimento lavorativo
- Conoscenza della normativa sul collocamento mirato e sull''inclusione lavorativa
- Competenze nella valutazione delle capacità lavorative e nella progettazione di percorsi personalizzati
- Capacità di relazione con le aziende e gli enti pubblici
- Attitudine al lavoro in rete con i servizi territoriali
- Buone capacità organizzative e di problem solving
- Patente B e disponibilità a spostamenti sul territorio

Titoli preferenziali:
- Formazione specifica sul disability management
- Esperienza nel settore produttivo o delle risorse umane
- Conoscenza del tessuto imprenditoriale locale
- Esperienza nella gestione di progetti finanziati in ambito di politiche attive del lavoro',
'Principali responsabilità:
- Valutazione delle competenze e delle potenzialità lavorative
- Progettazione di percorsi personalizzati di inserimento lavorativo
- Ricerca e selezione delle aziende ospitanti
- Tutoraggio e monitoraggio degli inserimenti lavorativi
- Supporto alle persone nelle fasi di ricerca attiva del lavoro
- Formazione e sensibilizzazione dei contesti lavorativi accoglienti
- Mediazione nelle relazioni tra lavoratore e azienda
- Coordinamento con i servizi invianti per la progettazione integrata
- Gestione della documentazione e rendicontazione delle attività
- Partecipazione a tavoli di lavoro territoriali sul tema dell''inclusione lavorativa',
'Tempo indeterminato',
NULL,
1700.00,
2000.00,
'- Auto aziendale per gli spostamenti di servizio
- Formazione specialistica
- Smartphone aziendale
- Flessibilità oraria
- Possibilità di smart working parziale',
'2025-04-22',
'2025-05-30',
'aperta',
FALSE,
TRUE,
FALSE,
'interno',
4,
'Cerchiamo una figura con capacità di mediazione e un approccio orientato alle potenzialità e non ai limiti delle persone. È importante la capacità di costruire relazioni positive con le aziende del territorio e di "tradurre" il linguaggio sociale in linguaggio aziendale. Il candidato dovrà essere autonomo negli spostamenti sul territorio provinciale.'),

('Educatore di Strada',
'La Cooperativa Sociale Arcobaleno cerca un Educatore di Strada per il proprio Progetto di Educativa Territoriale rivolto a gruppi informali di adolescenti e giovani nella zona Nord di Torino.

Il progetto ha l''obiettivo di prevenire situazioni di disagio e comportamenti a rischio, promuovere il protagonismo giovanile e facilitare l''accesso ai servizi del territorio attraverso l''aggancio nei luoghi di ritrovo informali.

L''educatore selezionato lavorerà in coppia con un altro educatore e in rete con i servizi sociali, le scuole, i centri di aggregazione e le altre agenzie educative del territorio.',
'Requisiti richiesti:
- Laurea in Scienze dell''Educazione, Educazione Professionale o titoli affini
- Esperienza, anche di tirocinio, nell''ambito del lavoro di strada o con adolescenti
- Attitudine al lavoro in contesti informali e non strutturati
- Capacità relazionali con adolescenti e giovani
- Flessibilità oraria e disponibilità al lavoro in orario pomeridiano e serale
- Competenze nella progettazione partecipata con i giovani
- Capacità di lavoro in rete con i servizi del territorio
- Patente B

Titoli preferenziali:
- Formazione specifica sull''adolescenza e la prevenzione del disagio giovanile
- Esperienza in progetti di protagonismo giovanile
- Competenze in ambito artistico, musicale, sportivo o digitale
- Conoscenza del territorio e delle sue dinamiche giovanili',
'Principali responsabilità:
- Mappatura del territorio e individuazione dei luoghi di aggregazione giovanile
- Aggancio di gruppi informali nei loro contesti di vita
- Costruzione di relazioni significative con gli adolescenti
- Progettazione e realizzazione di interventi educativi contestualizzati
- Facilitazione dell''accesso ai servizi e alle opportunità del territorio
- Mediazione nei conflitti tra giovani e comunità locale
- Promozione di progetti di protagonismo giovanile
- Sensibilizzazione della comunità sui temi della condizione giovanile
- Coordinamento con i servizi sociali e le altre agenzie educative
- Documentazione dell''attività e reporting',
'Tempo determinato con possibilità di rinnovo',
'12 mesi',
1500.00,
1700.00,
'- Formazione continua e supervisione
- Smartphone aziendale
- Flessibilità oraria
- Team giovane e dinamico
- Ambiente di lavoro stimolante',
'2025-04-25',
'2025-05-30',
'aperta',
FALSE,
FALSE,
FALSE,
'esterno',
3,
'Cerchiamo una figura dinamica e creativa, con capacità di lavoro in contesti destrutturati e non formali. Importante la predisposizione a lavorare in orari non convenzionali (pomeriggio/sera) e la capacità di costruire relazioni autentiche con gli adolescenti. Preferibile conoscenza del territorio e delle sue dinamiche.');



INSERT INTO candidati (nome, cognome, codice_fiscale, data_nascita, luogo_nascita, genere, indirizzo, citta, provincia, cap, telefono, email, linkedin, portfolio, stato_candidato, disponibilita_trasferte, disponibilita_remoto, note_personali, lettera_presentazione) VALUES
-- Additional candidati (9-16)
('Chiara', 'Moretti', 'MRTCHR91M48F205T', '1991-08-08', 'Milano', 'F', 'Via Solferino 25', 'Milano', 'MI', '20121', '333 9876543', 'chiara.moretti@email.it', 'linkedin.com/in/chiaramoretti', NULL, 'nuovo', TRUE, TRUE,
'Sono una pedagogista specializzata in educazione inclusiva con particolare attenzione ai bambini con disturbi dello spettro autistico. Ho sviluppato competenze nell''applicazione del metodo ABA e nell''utilizzo della CAA (Comunicazione Aumentativa Alternativa). Negli ultimi tre anni ho lavorato come educatrice di sostegno in diverse scuole primarie, collaborando con insegnanti e famiglie per creare piani educativi individualizzati efficaci. Sono particolarmente appassionata di tecnologie assistive e di come possano migliorare l''apprendimento. Cerco un ambiente di lavoro che valorizzi l''innovazione pedagogica e il lavoro di équipe multidisciplinare.',
'Gentile Responsabile della Selezione,

Con la presente desidero candidarmi per la posizione di Educatore Professionale presso il vostro Centro Educativo. La mia formazione in Pedagogia Speciale e l''esperienza maturata con bambini con disturbi dello spettro autistico mi hanno fornito strumenti specifici per progettare e realizzare interventi educativi personalizzati ed efficaci.

Negli ultimi tre anni ho lavorato come educatrice di sostegno in diverse scuole primarie di Milano, sviluppando competenze nella gestione di gruppi eterogenei e nella promozione di dinamiche inclusive. Ho dedicato particolare attenzione alla formazione continua, specializzandomi nell''applicazione del metodo ABA e nell''utilizzo della CAA come strumento di comunicazione.

La vostra cooperativa è riconosciuta per l''attenzione alla qualità degli interventi educativi e per l''approccio innovativo alle situazioni di fragilità. Sarei entusiasta di poter contribuire con le mie competenze e la mia passione educativa alla mission del vostro Centro.

Sono una persona creativa, resiliente e con spiccate capacità relazionali, abituata a lavorare in team multidisciplinari. La mia naturale attitudine all''ascolto e all''empatia mi permette di costruire relazioni significative con i bambini e le loro famiglie.

Sono disponibile a lavorare sia in orario pomeridiano che durante i centri estivi, con la flessibilità necessaria per rispondere alle esigenze del servizio.

Resto a disposizione per un colloquio in cui poter approfondire la mia candidatura.

Cordiali saluti,
Chiara Moretti'),

('Paolo', 'Rizzo', 'RZZPLA83E17H501S', '1983-05-17', 'Roma', 'M', 'Via Cassia 234', 'Roma', 'RM', '00123', '339 8765432', 'paolo.rizzo@email.it', 'linkedin.com/in/paolorizzo', 'paolorizzo.portfolio.it', 'in_valutazione', FALSE, TRUE,
'Sono un assistente sociale con esperienza specifica nel settore delle dipendenze patologiche. Ho lavorato sia in servizi pubblici (SerD) che in comunità terapeutiche, sviluppando competenze nella presa in carico di persone con dipendenza da sostanze, alcol e gioco d''azzardo. Mi occupo di colloqui motivazionali, progettazione di percorsi terapeutici individualizzati e lavoro di rete con i servizi territoriali. Negli ultimi anni mi sono specializzato nei programmi di riduzione del danno e nei progetti di strada rivolti a persone con dipendenze. Ho una buona conoscenza delle politiche sociali e sanitarie del settore e delle metodologie di intervento evidence-based.',
'Spettabile Direzione,

Sono venuto a conoscenza della vostra ricerca di un Assistente Sociale per il Servizio Dipendenze e desidero propormi per questa posizione.

La mia esperienza professionale, maturata sia nei SerD che in comunità terapeutiche, mi ha permesso di sviluppare competenze specifiche nella presa in carico di persone con problemi di dipendenza e delle loro famiglie. Negli ultimi cinque anni ho lavorato presso il SerD di Roma Est, dove ho potuto affrontare situazioni complesse che richiedevano un approccio integrato e multidisciplinare.

Ho sviluppato una particolare competenza nei colloqui motivazionali e nella progettazione di percorsi terapeutici individualizzati, sempre in collaborazione con l''équipe multidisciplinare e la rete dei servizi territoriali. La mia esperienza include anche la gestione di gruppi terapeutici e la facilitazione di gruppi di auto-mutuo aiuto per familiari.

Credo fermamente nell''importanza di un approccio rispettoso della dignità della persona con dipendenza, centrato sulle risorse e non solo sui problemi. La vostra cooperativa è conosciuta per la qualità dei servizi offerti e per l''attenzione alla formazione continua degli operatori, aspetti che considero fondamentali in questo ambito di intervento.

Sono una persona empatica ma con buoni confini professionali, capace di lavorare in équipe e di gestire lo stress anche in situazioni complesse. La mia formazione continua, anche in ambito psicologico, mi ha fornito strumenti utili per la relazione d''aiuto e la gestione di situazioni emotivamente sfidanti.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze del vostro servizio.

Distinti saluti,
Paolo Rizzo'),

('Elena', 'Costa', 'CSTLNE89B49G273R', '1989-02-09', 'Palermo', 'F', 'Via Maqueda 78', 'Palermo', 'PA', '90133', '347 7654321', 'elena.costa@email.it', 'linkedin.com/in/elenacosta', 'elenacosta.portfolio.it', 'approvato', TRUE, TRUE,
'Sono una psicologa con specializzazione in Psicologia di Comunità e un''esperienza specifica nel settore dell''immigrazione e dell''intercultura. Ho lavorato in progetti di accoglienza per richiedenti asilo e rifugiati, occupandomi di supporto psicologico, mediazione culturale e facilitazione dell''integrazione sociale. Ho competenze nella gestione di gruppi multiculturali e nella formazione degli operatori su tematiche interculturali. Parlo fluentemente italiano, inglese e francese, con una buona conoscenza dello spagnolo e nozioni di arabo. Sono particolarmente interessata ai progetti che promuovono il dialogo interculturale e l''empowerment delle comunità migranti.',
'Gentile Direzione,

Sono Elena Costa, psicologa specializzata in Psicologia di Comunità, e desidero candidarmi per la posizione di Coordinatrice del Progetto di Accoglienza Rifugiati.

La mia esperienza professionale si è sviluppata principalmente nell''ambito dell''immigrazione e dell''intercultura, dove ho lavorato sia in contesti di prima accoglienza che in progetti di integrazione sociale. Negli ultimi tre anni ho coordinato un progetto SAI per minori stranieri non accompagnati, gestendo un''équipe multidisciplinare e curando i rapporti con la rete territoriale e le istituzioni.

Ho sviluppato competenze specifiche nel supporto psicologico a persone che hanno vissuto traumi migratori, nell''orientamento ai servizi del territorio e nella progettazione di percorsi di integrazione personalizzati. La mia formazione in Psicologia di Comunità mi ha fornito strumenti utili per la lettura dei contesti e per la progettazione di interventi che valorizzano le risorse della comunità locale.

La vostra cooperativa è riconosciuta per l''attenzione alla qualità dei servizi di accoglienza e per l''approccio integrato all''inclusione sociale dei migranti, valori che condivido pienamente. La possibilità di coordinare un progetto che affronta queste tematiche in modo sistemico rappresenta per me una sfida stimolante.

Sono una persona con spiccate capacità organizzative e relazionali, abituata a lavorare in contesti multiculturali e a gestire situazioni complesse con flessibilità e creatività. La mia competenza linguistica (italiano, inglese, francese, spagnolo e nozioni di arabo) facilita la comunicazione diretta con molte delle persone accolte.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze del vostro progetto.

Cordiali saluti,
Elena Costa'),

('Marco', 'Vitale', 'VTLMRC76C21L219S', '1976-03-21', 'Torino', 'M', 'Corso Re Umberto 45', 'Torino', 'TO', '10128', '335 6543210', 'marco.vitale@email.it', 'linkedin.com/in/marcovitale', NULL, 'approvato', TRUE, FALSE,
'Sono un educatore professionale con lunga esperienza nel settore delle dipendenze patologiche. Ho lavorato sia in comunità terapeutiche che in servizi a bassa soglia, sviluppando competenze specifiche nell''approccio alla riduzione del danno e nel trattamento delle diverse forme di dipendenza. Ho una formazione specifica in counseling sistemico-relazionale che integro nel mio lavoro educativo. Negli ultimi anni mi sono specializzato nei progetti di housing first per persone senza dimora con problemi di dipendenza. Sono particolarmente interessato a progetti innovativi che combinano l''approccio educativo con l''inserimento lavorativo e abitativo.',
'Alla cortese attenzione della Direzione,

Sono venuto a conoscenza della vostra ricerca di un Educatore Professionale per il Centro di Accoglienza Notturna e desidero candidarmi per questa posizione.

La mia lunga esperienza nel settore delle dipendenze e della grave marginalità, unita alla formazione in counseling sistemico-relazionale, mi ha permesso di sviluppare competenze specifiche nel lavoro con persone in situazione di forte vulnerabilità sociale. Negli ultimi cinque anni ho coordinato un servizio di housing first per persone senza dimora con problemi di dipendenza, sviluppando un approccio centrato sulla persona e orientato alla riduzione del danno.

Il lavoro in un Centro di Accoglienza Notturna richiede capacità di gestione delle emergenze, competenze relazionali solide e la capacità di costruire percorsi individualizzati anche in situazioni di risorse limitate, tutte competenze che ho potuto sviluppare e affinare nel mio percorso professionale. La vostra cooperativa è conosciuta per l''attenzione alla dignità delle persone accolte e per la capacità di innovare i servizi, aspetti che condivido pienamente.

Sono una persona resiliente, con buone capacità di gestione dello stress e una naturale attitudine all''ascolto e all''empatia. La mia esperienza in diversi contesti operativi mi ha insegnato l''importanza del lavoro di équipe e della supervisione per mantenere alta la qualità dell''intervento educativo.

Sono disponibile a lavorare su turni, anche notturni e nei weekend, e posso iniziare immediatamente. Sarei lieto di poter approfondire la mia candidatura in un colloquio personale.

Distinti saluti,
Marco Vitale'),

('Laura', 'Fabbri', 'FBBLRA84H64A944X', '1984-06-24', 'Bologna', 'F', 'Via Indipendenza 32', 'Bologna', 'BO', '40121', '339 5432109', 'laura.fabbri@email.it', 'linkedin.com/in/laurafabbri', NULL, 'nuovo', FALSE, TRUE,
'Sono una terapista occupazionale specializzata in riabilitazione neuromotoria e cognitiva. Ho esperienza nella riabilitazione di persone con disabilità acquisite (post ictus, trauma cranico) e patologie neurodegenerative. Nel mio lavoro utilizzo un approccio centrato sulla persona, valorizzando le autonomie residue e adattando l''ambiente alle specifiche esigenze. Ho competenze nell''utilizzo di ausili e tecnologie assistive per migliorare l''autonomia nella vita quotidiana. Sono particolarmente interessata a progetti che integrano la riabilitazione tradizionale con attività espressive e ricreative, credendo fermamente nel potenziale terapeutico di queste attività.',
'Spettabile Cooperativa,

Sono venuta a conoscenza della vostra ricerca di una Terapista Occupazionale per il Centro Diurno per persone con disabilità e desidero candidarmi per questa posizione.

La mia formazione in Terapia Occupazionale e l''esperienza maturata in diversi contesti riabilitativi mi hanno permesso di sviluppare competenze specifiche nella riabilitazione di persone con disabilità fisica e cognitiva. Negli ultimi tre anni ho lavorato presso il Centro di Riabilitazione "Nuove Prospettive", dove ho potuto approfondire l''approccio centrato sulla persona e sviluppare progetti riabilitativi individualizzati.

Credo fermamente nel valore dell''autonomia e nella possibilità di ogni persona, indipendentemente dalla sua condizione, di partecipare attivamente alla vita sociale. Il mio approccio riabilitativo si concentra sulle abilità e non sui deficit, cercando di valorizzare le capacità residue e di adattare l''ambiente per favorire la massima indipendenza possibile.

La vostra cooperativa è conosciuta per l''attenzione alla qualità della vita delle persone con disabilità e per l''approccio innovativo alla riabilitazione, valori che condivido pienamente. La possibilità di lavorare in un contesto che valorizza sia gli aspetti riabilitativi che quelli relazionali e di socializzazione rappresenta per me una grande opportunità professionale.

Sono una persona creativa, paziente e con buone capacità di problem solving, abituata a lavorare in équipe multidisciplinari e a collaborare con famiglie e caregiver. La mia formazione continua mi permette di essere aggiornata sulle più recenti tecniche riabilitative e sull''utilizzo delle tecnologie assistive.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze del vostro centro.

Cordiali saluti,
Laura Fabbri'),

('Alessandro', 'Romano', 'RMNLSN82P13E506Y', '1982-09-13', 'Lecce', 'M', 'Via Trinchese 42', 'Lecce', 'LE', '73100', '338 4321098', 'alessandro.romano@email.it', 'linkedin.com/in/alessandroromano', 'alessandroromano.portfolio.it', 'in_valutazione', TRUE, TRUE,
'Sono un infermiere con specializzazione in cure palliative e terapia del dolore. Ho lavorato sia in hospice che in servizi di assistenza domiciliare per pazienti terminali, sviluppando competenze tecniche specifiche e un approccio particolarmente attento agli aspetti relazionali ed emotivi dell''assistenza. Ho esperienza nella gestione di terapie complesse, nel controllo del dolore e dei sintomi, e nel supporto alla famiglia. Ho seguito corsi specifici su comunicazione difficile, elaborazione del lutto e prevenzione del burnout negli operatori. Sono interessato a progetti che promuovono la diffusione delle cure palliative e il miglioramento della qualità di vita nelle fasi terminali della malattia.',
'Gentile Direzione,

Desidero candidarmi per la posizione di Infermiere presso il vostro Hospice, convinto che le mie competenze e la mia esperienza nel campo delle cure palliative possano rappresentare un valore aggiunto per il vostro team.

Negli ultimi otto anni ho lavorato nell''ambito delle cure palliative, prima presso l''Hospice di Lecce e poi nel servizio di assistenza domiciliare per pazienti terminali della ASL. Questa esperienza mi ha permesso di sviluppare competenze tecniche specifiche nella gestione del dolore e dei sintomi, nella somministrazione di terapie complesse e nel monitoraggio costante della qualità di vita del paziente.

Il lavoro in cure palliative mi ha insegnato l''importanza di un approccio olistico, che considera non solo gli aspetti fisici ma anche quelli emotivi, relazionali e spirituali della sofferenza. Ho dedicato particolare attenzione alla formazione continua, seguendo corsi specifici su comunicazione difficile, elaborazione del lutto e supporto ai caregiver.

La vostra cooperativa è riconosciuta per l''attenzione alla qualità dell''assistenza e per l''approccio umano e professionale alle cure palliative, valori che condivido profondamente. La possibilità di contribuire a un servizio che pone al centro la dignità della persona e il sollievo dalla sofferenza rappresenta per me una grande motivazione professionale.

Sono una persona empatica ma con solidi confini professionali, capace di gestire situazioni emotivamente intense senza perdere lucidità e competenza tecnica. La mia naturale propensione all''ascolto e alla presenza autentica sono qualità che ritengo fondamentali in questo ambito.

Sono disponibile a lavorare su turni, anche notturni e festivi, e posso garantire la flessibilità necessaria per un servizio di assistenza continuativa. Sarei lieto di poter approfondire la mia candidatura in un colloquio personale.

Distinti saluti,
Alessandro Romano'),

('Giulia', 'Marini', 'MRNGLI77T50D612S', '1977-12-10', 'Firenze', 'F', 'Viale dei Mille 53', 'Firenze', 'FI', '50131', '347 3210987', 'giulia.marini@email.it', 'linkedin.com/in/giuliamarini', NULL, 'respinto', TRUE, FALSE,
'Sono una coordinatrice con esperienza nella gestione di servizi educativi per minori. Ho lavorato sia in contesti di comunità residenziale che in centri diurni, sviluppando competenze nella supervisione delle équipe educative, nella progettazione pedagogica e nella gestione delle relazioni con i servizi invianti. Ho una formazione specifica in coordinamento di servizi socio-educativi e in supervisione pedagogica. Negli ultimi anni mi sono specializzata nella gestione di progetti per minori stranieri non accompagnati, con particolare attenzione agli aspetti interculturali e ai percorsi di autonomia. Sono particolarmente interessata a contesti lavorativi che valorizzano l''innovazione pedagogica e la qualità della relazione educativa.',
'Alla cortese attenzione della Direzione,

Sono venuta a conoscenza della vostra ricerca di un Coordinatore Pedagogico per i servizi educativi per minori e desidero candidarmi per questa posizione.

La mia esperienza professionale si è sviluppata principalmente nell''ambito dei servizi educativi per minori in situazioni di fragilità, dove ho avuto modo di ricoprire ruoli di crescente responsabilità fino all''attuale incarico di coordinatrice di una comunità educativa per minori. In questo ruolo mi occupo della supervisione dell''équipe educativa, della progettazione pedagogica del servizio e della gestione delle relazioni con i servizi sociali e le altre istituzioni del territorio.

Ho sviluppato una particolare competenza nella gestione di progetti per minori stranieri non accompagnati, affrontando le sfide specifiche legate all''interculturalità e ai percorsi di integrazione e autonomia. La mia formazione in coordinamento di servizi socio-educativi e in supervisione pedagogica mi ha fornito strumenti utili per sostenere il lavoro degli educatori e per garantire la qualità del servizio.

La vostra cooperativa è conosciuta per l''attenzione alla qualità dei servizi educativi e per l''approccio innovativo alle problematiche dell''infanzia e dell''adolescenza, aspetti che condivido pienamente. La possibilità di coordinare servizi diversificati rappresenta per me una sfida stimolante e un''opportunità di crescita professionale.

Sono una persona con buone capacità organizzative e relazionali, con un approccio al coordinamento basato sulla valorizzazione delle competenze del team e sulla cura della relazione educativa. La mia naturale propensione all''ascolto e alla mediazione facilita la gestione dei gruppi di lavoro e la risoluzione dei conflitti.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze dei vostri servizi.

Cordiali saluti,
Giulia Marini'),

('Davide', 'Lombardi', 'LMBDVD88M09G702P', '1988-08-09', 'Pisa', 'M', 'Via San Francesco 21', 'Pisa', 'PI', '56127', '333 2109876', 'davide.lombardi@email.it', 'linkedin.com/in/davidelombardi', 'davidelombardi.portfolio.it', 'nuovo', FALSE, TRUE,
'Sono un fisioterapista con specializzazione in riabilitazione neurologica e geriatrica. Ho esperienza nella riabilitazione di pazienti con esiti di ictus, Parkinson, sclerosi multipla e altre patologie neurologiche. Utilizzo un approccio funzionale orientato al miglioramento dell''autonomia nelle attività quotidiane. Ho competenze specifiche in tecniche di neuroriabilitazione (Bobath, Perfetti) e nell''utilizzo di tecnologie riabilitative avanzate. Negli ultimi anni ho sviluppato un particolare interesse per la riabilitazione cognitivo-motoria e per l''utilizzo di attività ludiche e artistiche come complemento alla riabilitazione tradizionale. Sono orientato al lavoro in équipe multidisciplinare e alla personalizzazione del percorso riabilitativo.',
'Spettabile Cooperativa,

Desidero candidarmi per la posizione di Fisioterapista presso il vostro Centro Diurno per Anziani, convinto che le mie competenze in riabilitazione geriatrica e neurologica possano contribuire significativamente alla qualità del vostro servizio.

La mia esperienza professionale si è sviluppata principalmente in contesti riabilitativi dedicati a pazienti anziani con patologie neurologiche e ortopediche. Negli ultimi cinque anni ho lavorato presso una RSA dove mi sono occupato sia di riabilitazione individuale che di attività di gruppo per la prevenzione delle cadute e il mantenimento delle autonomie.

Ho sviluppato un approccio riabilitativo personalizzato, che valuta attentamente le risorse e i limiti di ogni persona per definire obiettivi realistici e significativi. Credo fermamente nell''importanza di integrare la riabilitazione con le attività quotidiane, per rendere il percorso più significativo e sostenibile nel tempo.

La vostra cooperativa è conosciuta per l''attenzione alla qualità della vita degli anziani e per l''approccio globale alla persona, valori che condivido pienamente. La possibilità di lavorare in un Centro Diurno rappresenta per me un''opportunità stimolante, potendo contribuire non solo al mantenimento delle capacità fisiche ma anche alla socializzazione e al benessere generale degli ospiti.

Sono una persona empatica, paziente e con buone capacità comunicative, abituata a lavorare in équipe multidisciplinari e a collaborare con familiari e caregiver. La mia attitudine al problem solving mi permette di adattare costantemente l''intervento riabilitativo alle esigenze dell''anziano.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze del vostro centro.

Cordiali saluti,
Davide Lombardi');
                                                                                                                                                                                                                                                                              -- Adding 5 more entries to candidati table
-- Inserimento di candidati di esempio
INSERT INTO candidati (nome, cognome, codice_fiscale, data_nascita, luogo_nascita, genere, indirizzo, citta, provincia, cap, telefono, email, linkedin, portfolio, stato_candidato, disponibilita_trasferte, disponibilita_remoto, profilo_sintetico, note_personali, lettera_presentazione) VALUES
('Sofia', 'Bianchi', 'BNCSFN92L54F205R', '1992-07-14', 'Milano', 'F', 'Via Montenapoleone 12', 'Milano', 'MI', '20121', '333 1234567', 'sofia.bianchi@email.it', 'linkedin.com/in/sofiabianchi', NULL, 'nuovo', TRUE, FALSE,
'Educatrice con formazione in Scienze dell''Educazione e passione per metodologie educative innovative e inclusive. Ha esperienza di volontariato con bambini con bisogni speciali presso l''associazione "Amici dei Bambini", dove ha sviluppato empatia e competenze pratiche nell''assistenza educativa. Possiede capacità di resilienza, problem solving e costruzione di relazioni di fiducia con bambini e famiglie.',
'Ho maturato una forte passione per il settore educativo lavorando con bambini con bisogni speciali durante il mio percorso universitario. La mia esperienza di volontariato presso l''associazione "Amici dei Bambini" mi ha permesso di sviluppare empatia e competenze pratiche nell''assistenza educativa. Sono particolarmente interessata a metodologie educative innovative e inclusive. Ho acquisito capacità di resilienza e problem solving durante le mie esperienze sul campo. Vorrei mettere a disposizione le mie competenze in un ambiente che valorizza il benessere dei bambini e il lavoro di squadra.',
'Gentili Signori,
Con la presente desidero candidarmi per la posizione di Educatore Professionale presso la vostra cooperativa. La mia formazione in Scienze dell''Educazione e le esperienze maturate nel campo dell''assistenza a bambini con bisogni speciali mi hanno fornito le competenze teoriche e pratiche necessarie per questo ruolo. Sono particolarmente attratta dalla filosofia della vostra cooperativa, che pone l''accento sull''inclusione e lo sviluppo personale. Credo fermamente che ogni bambino meriti un''educazione personalizzata che valorizzi le sue potenzialità. La mia capacità di costruire relazioni di fiducia con i bambini e le loro famiglie, unita all''attitudine al lavoro di squadra, mi rendono una candidata ideale per il vostro team. Sarei entusiasta di poter contribuire alla vostra missione educativa e crescere professionalmente in un ambiente stimolante. Resto a disposizione per un colloquio in cui poter approfondire le mie motivazioni e competenze.
Cordiali saluti,
Sofia Bianchi'),

('Luca', 'Ferrari', 'FRRLCU88M25H501P', '1988-08-25', 'Roma', 'M', 'Via Appia Nuova 45', 'Roma', 'RM', '00183', '339 2345678', 'luca.ferrari@email.it', 'linkedin.com/in/lucaferrari', 'lucaferrari.portfolio.it', 'in_valutazione', TRUE, TRUE,
'Operatore Socio-Sanitario con cinque anni di esperienza in residenze per anziani, specializzato nell''assistenza a persone con diversi gradi di non autosufficienza e patologie neurologiche. Possiede solide competenze tecniche e ottime capacità di gestione dello stress e problem solving rapido. Lavora efficacemente in autonomia e in équipe multidisciplinari, con esperienza in situazioni di emergenza. Disponibile per turni, festivi e notturni.',
'Sono un professionista con esperienza nel supporto a persone con disabilità fisiche e cognitive. La mia formazione come OSS mi ha dato una solida base di competenze tecniche, ma è stato il rapporto quotidiano con le persone assistite a insegnarmi il vero valore dell''empatia e della pazienza. Ho sviluppato ottime capacità di gestione dello stress e di problem solving rapido. Lavoro bene in autonomia ma trovo stimolante il confronto in équipe multidisciplinari. Sono disponibile a lavorare su turni e nei weekend. Cerco un ambiente lavorativo in cui possa continuare a crescere professionalmente mentre faccio la differenza nella vita delle persone.',
'Spettabile Cooperativa,
Vi scrivo per manifestare il mio interesse a collaborare con la vostra organizzazione come Operatore Socio-Sanitario. Negli ultimi cinque anni ho lavorato presso una residenza per anziani, dove ho sviluppato competenze specifiche nell''assistenza a persone con diversi gradi di non autosufficienza e patologie neurologiche. Ciò che mi ha sempre guidato nel mio lavoro è la convinzione che ogni persona, indipendentemente dalla sua condizione, meriti dignità, rispetto e la migliore qualità di vita possibile. La vostra cooperativa si distingue per l''attenzione alla persona e l''approccio innovativo ai servizi assistenziali, valori che condivido pienamente. Sono disposto a lavorare su turni, compresi festivi e notturni, e sono automunito. La mia esperienza in situazioni di emergenza mi ha insegnato a mantenere la calma e ad agire con prontezza e precisione. Sarei felice di poter approfondire la mia candidatura in un colloquio personale.
Distinti saluti,
Luca Ferrari'),

('Martina', 'Russo', 'RSSMTN95P47L219N', '1995-09-07', 'Torino', 'F', 'Corso Francia 78', 'Torino', 'TO', '10139', '338 3456789', 'martina.russo@email.it', 'linkedin.com/in/martinarusso', NULL, 'approvato', FALSE, TRUE,
'Assistente sociale con tre anni di esperienza presso il Servizio Sociale del Comune di Torino, specializzata nel lavoro con famiglie vulnerabili e minori a rischio. Ha sviluppato progetti di supporto familiare con risultati significativi e possiede competenze nell''analisi dei bisogni, progettazione di interventi personalizzati e lavoro di rete con istituzioni territoriali. Appassionata di innovazione sociale e soluzioni creative ai problemi complessi, con particolare sensibilità verso marginalità e povertà educativa.',
'La mia esperienza come assistente sociale in contesti urbani difficili mi ha insegnato l''importanza di costruire reti di supporto efficaci e di adottare un approccio sistemico ai problemi sociali. Ho sviluppato una particolare sensibilità verso le situazioni di marginalità e povertà educativa. Le mie competenze principali includono la capacità di analisi dei bisogni, la progettazione di interventi personalizzati e il lavoro di rete con le istituzioni del territorio. Sono appassionata di innovazione sociale e ricerca di soluzioni creative ai problemi complessi. Il mio obiettivo professionale è contribuire a ridurre le disuguaglianze sociali attraverso interventi mirati ed efficaci.',
'Alla cortese attenzione della Direzione Risorse Umane,
Sono una assistente sociale con tre anni di esperienza nel lavoro con famiglie vulnerabili e minori a rischio. La vostra cooperativa è riconosciuta nel territorio per l''approccio innovativo ai problemi sociali emergenti e per questo motivo sarei entusiasta di poter contribuire al vostro team. Nel mio attuale ruolo presso il Servizio Sociale del Comune di Torino, ho sviluppato progetti di supporto familiare che hanno portato a un miglioramento significativo delle condizioni di vita di numerosi nuclei in difficoltà. La mia capacità di creare relazioni di fiducia con l''utenza e di collaborare efficacemente con le reti territoriali potrebbe essere una risorsa preziosa per i vostri servizi. Sono particolarmente interessata al vostro progetto "Famiglie al Centro", di cui apprezzo l''approccio preventivo e comunitario. Sarei lieta di poter condividere le mie idee e la mia visione in un colloquio conoscitivo.
Cordialmente,
Martina Russo'),

('Andrea', 'Esposito', 'SPSNDR80R12F839W', '1980-10-12', 'Napoli', 'M', 'Via Toledo 23', 'Napoli', 'NA', '80132', '347 4567890', 'andrea.esposito@email.it', 'linkedin.com/in/andreaesposito', 'andreaesposito.portfolio.it', 'in_valutazione', TRUE, FALSE,
'Manager con decennale esperienza nel settore profit e Master in Management delle Imprese Sociali, in transizione verso il terzo settore. Ha coordinato reti commerciali di 20 persone con leadership partecipativa e pianificazione strategica efficace. Possiede competenze in pianificazione strategica, gestione finanziaria, sviluppo organizzativo e gestione di team multidisciplinari. Cerca ruoli di coordinamento o direzione che combinino competenze manageriali e sensibilità sociale.',
'Vengo da un percorso professionale nell''ambito della gestione d''impresa, ma ho sempre avuto una forte vocazione sociale. Ho deciso di reindirizzare la mia carriera verso il settore delle cooperative sociali perché credo fermamente nell''impatto positivo che possono avere sulla comunità. Le mie competenze in pianificazione strategica, gestione finanziaria e sviluppo organizzativo potrebbero essere utili per migliorare l''efficienza e la sostenibilità dei progetti sociali. Sono abituato a lavorare per obiettivi e a gestire team multidisciplinari. Ho una particolare attenzione alla qualità dei servizi e alla soddisfazione degli stakeholder. Sono disponibile per ruoli di coordinamento o direzione che mi permettano di combinare competenze manageriali e sensibilità sociale.',
'Spettabile Direzione,
Con la presente intendo propormi per il ruolo di Responsabile di Area all''interno della vostra cooperativa. Dopo un decennio di esperienza nel settore profit come manager commerciale, ho deciso di mettermi al servizio di organizzazioni che creano valore sociale oltre che economico. Ho completato recentemente un Master in Management delle Imprese Sociali che ha integrato le mie competenze gestionali con conoscenze specifiche del terzo settore. Nella mia ultima esperienza lavorativa, ho coordinato una rete di vendita di 20 persone, raggiungendo obiettivi ambiziosi grazie a una leadership partecipativa e a una pianificazione strategica efficace. Sono convinto che queste competenze, unite alla mia naturale propensione all''ascolto e alla valorizzazione delle persone, possano contribuire significativamente alla crescita sostenibile della vostra cooperativa. La vostra reputazione di eccellenza nel settore dei servizi alla persona e il vostro impegno nell''innovazione sociale mi hanno spinto a contattarvi. Sarei onorato di poter discutere come le mie competenze possano allinearsi con le vostre esigenze organizzative.
Distinti saluti,
Andrea Esposito'),

('Valentina', 'Marino', 'MRNVNT90E56G273S', '1990-05-16', 'Palermo', 'F', 'Via Libertà 120', 'Palermo', 'PA', '90143', '333 5678901', 'valentina.marino@email.it', 'linkedin.com/in/valentinamarino', NULL, 'nuovo', TRUE, TRUE,
'Mediatrice interculturale con formazione in Scienze della Mediazione Linguistica e Culturale ed esperienza pluriennale in centri di accoglienza per rifugiati. Parla fluentemente italiano, inglese, arabo e francese. Specializzata nella facilitazione della comunicazione tra culture diverse e nella prevenzione e gestione dei conflitti interculturali. Possiede sensibilità interculturale sviluppata attraverso origini siciliane ed esperienze di studio in Nord Africa, con approccio basato su ascolto attivo e valorizzazione delle differenze.',
'Ho una formazione nell''ambito dell''educazione e delle politiche sociali, con particolare attenzione ai contesti multiculturali. La mia esperienza come mediatrice culturale mi ha permesso di sviluppare competenze nella facilitazione della comunicazione tra persone di culture diverse e nella prevenzione/gestione dei conflitti interculturali. Parlo fluentemente italiano, inglese, arabo e francese. Sono particolarmente interessata a progetti che promuovono l''inclusione sociale e l''interculturalità. Ho una buona capacità di adattamento a contesti complessi e multiculturali. Il mio approccio è basato sull''ascolto attivo e sulla valorizzazione delle differenze come risorsa.',
'Gentili Responsabili,
Sono venuta a conoscenza della vostra ricerca di un Mediatore Interculturale per il progetto di accoglienza e integrazione rivolto ai rifugiati e desidero candidarmi per questa posizione. Il mio percorso formativo in Scienze della Mediazione Linguistica e Culturale e la mia esperienza pluriennale come mediatrice presso centri di accoglienza mi hanno fornito gli strumenti per facilitare la comunicazione e la comprensione reciproca tra persone di culture diverse. La mia origine siciliana e le mie esperienze di studio in Nord Africa mi hanno permesso di sviluppare una sensibilità interculturale e una comprensione profonda delle dinamiche migratorie nel Mediterraneo. Sono particolarmente interessata al vostro approccio olistico all''accoglienza, che considera non solo i bisogni primari ma anche gli aspetti psicologici, sociali e culturali dell''integrazione. La mia capacità di creare ponti tra culture e di gestire situazioni delicate con empatia e professionalità potrebbe contribuire significativamente al successo del vostro progetto. Sono disponibile a lavorare con flessibilità oraria e a spostarmi sul territorio secondo le necessità del servizio.
Cordiali saluti,
Valentina Marino'),

('Roberto', 'Conti', 'CNTRRT85D21A662E', '1985-04-21', 'Bari', 'M', 'Via Sparano 45', 'Bari', 'BA', '70121', '335 6789012', 'roberto.conti@email.it', 'linkedin.com/in/robertoconti', 'robertoconti.portfolio.it', 'respinto', FALSE, FALSE,
'Dottore commercialista con dieci anni di esperienza nella gestione contabile e amministrativa di aziende di medie dimensioni e cooperative. Ha competenze specifiche nella contabilità delle cooperative sociali, gestione completa del ciclo contabile, predisposizione di bilanci, adempimenti fiscali e controllo di gestione. Possiede competenze informatiche avanzate e buona conoscenza della normativa fiscale relativa alle cooperative sociali, con esperienza in contesti dinamici e gestione di molteplici priorità.',
'La mia esperienza nel campo della contabilità e gestione amministrativa si è sviluppata principalmente in ambito profit, ma da sempre seguo con interesse il mondo della cooperazione sociale. Ho una solida preparazione tecnica in contabilità, bilancio e controllo di gestione, unita a competenze informatiche avanzate. Sono abituato a lavorare con precisione e nel rispetto delle scadenze. Ho una buona conoscenza della normativa fiscale relativa alle cooperative sociali. Cerco un''opportunità professionale che mi permetta di mettere le mie competenze tecniche al servizio di progetti con impatto sociale positivo.',
'Alla c.a. Ufficio Risorse Umane,
Vi scrivo per candidarmi alla posizione di Responsabile Amministrativo presso la vostra cooperativa. Sono un dottore commercialista con dieci anni di esperienza nella gestione contabile e amministrativa di aziende di medie dimensioni e cooperative. La mia esperienza include la gestione completa del ciclo contabile, la predisposizione dei bilanci, gli adempimenti fiscali e il controllo di gestione. Ho sviluppato una particolare competenza nella contabilità delle cooperative sociali e nella relativa normativa fiscale durante la mia collaborazione con uno studio specializzato nel terzo settore. Sono abituato a lavorare in contesti dinamici dove è richiesta flessibilità e capacità di gestire molteplici priorità. La vostra reputazione di eccellenza nel settore dei servizi alla persona e la vostra struttura in crescita rappresentano per me un''opportunità stimolante. Sono convinto che la mia esperienza e la mia attenzione ai dettagli potrebbero contribuire significativamente alla solidità amministrativa della vostra organizzazione.
Distinti saluti,
Roberto Conti'),

('Francesca', 'Ricci', 'RCCFNC93H68H501Y', '1993-06-28', 'Roma', 'F', 'Via Nomentana 187', 'Roma', 'RM', '00161', '339 7890123', 'francesca.ricci@email.it', 'linkedin.com/in/francescaricci', NULL, 'approvato', TRUE, TRUE,
'Psicologa specializzata in età evolutiva con esperienza nel lavoro clinico individuale e interventi di gruppo in contesti educativi. Ha coordinato sportelli di ascolto psicologico in scuole secondarie e possiede competenze specifiche nel trattamento di disturbi dell''apprendimento e problemi comportamentali. Utilizza un approccio sistemico-relazionale e di psicologia positiva, lavorando in collaborazione con famiglie, scuole e servizi territoriali. Appassionata di formazione e supervisione degli operatori educativi.',
'Sono una psicologa con specializzazione in età evolutiva e ho sempre dedicato la mia attività professionale al supporto dei minori in situazioni di difficoltà. Ho esperienza sia nel lavoro clinico individuale che negli interventi di gruppo in contesti educativi. Mi interessa particolarmente l''approccio sistemico-relazionale e la psicologia positiva. Ho sviluppato competenze specifiche nel trattamento di disturbi dell''apprendimento e problemi comportamentali. Sono appassionata di formazione e supervisione degli operatori educativi. Il mio obiettivo professionale è contribuire al benessere psicologico dei bambini e adolescenti attraverso interventi tempestivi ed efficaci.',
'Gentile Direzione,
Desidero propormi per il ruolo di Psicologo presso i vostri servizi dedicati all''infanzia e all''adolescenza. La mia specializzazione in Psicologia dell''Età Evolutiva e l''esperienza maturata presso centri di neuropsichiatria infantile mi hanno fornito solide competenze nella valutazione e nel supporto psicologico di minori con diverse problematiche. Negli ultimi due anni, ho coordinato uno sportello di ascolto psicologico in una scuola secondaria, dove ho potuto constatare l''importanza della prevenzione e dell''intervento precoce nelle situazioni di disagio. Ho sviluppato un approccio che integra la dimensione individuale con quella relazionale e contestuale, lavorando sempre in stretta collaborazione con famiglie, scuole e servizi territoriali. Sono particolarmente interessata al vostro progetto "Crescere Insieme" per la qualità dell''approccio multidisciplinare e l''attenzione alla rete territoriale. La mia capacità di creare un ambiente accogliente e di fiducia, unita alla competenza tecnica e all''aggiornamento continuo, potrebbe rappresentare un valore aggiunto per i vostri servizi. Sono disponibile per colloqui o periodi di prova che possano confermare la compatibilità reciproca.
Cordiali saluti,
Francesca Ricci'),

('Marco', 'Gallo', 'GLLMRC87L10L219Z', '1987-07-10', 'Torino', 'M', 'Via Madama Cristina 35', 'Torino', 'TO', '10125', '347 8901234', 'marco.gallo@email.it', 'linkedin.com/in/marcogallo', 'marcogallo.portfolio.it', 'nuovo', TRUE, FALSE,
'Agronomo specializzato in agricoltura sociale con cinque anni di esperienza nella gestione di orti comunitari e progetti di inserimento lavorativo per persone con disabilità. Ha coordinato un progetto di orto sociale che ha portato alla creazione di un punto vendita di prodotti biologici gestito dai partecipanti. Possiede competenze tecniche in orticoltura, floricoltura e tecniche agricole biologiche, con formazione specifica sull''agricoltura sociale e inclusione lavorativa. Appassionato di sostenibilità ambientale e valore terapeutico del lavoro a contatto con la natura.',
'Dopo una formazione in ambito agricolo, ho deciso di orientare la mia attività professionale verso progetti di agricoltura sociale. Ho esperienza nella gestione di orti comunitari e attività agricole inclusive che coinvolgono persone con disabilità o in situazione di svantaggio. Amo trasmettere la passione per la natura e l''importanza della sostenibilità ambientale. Ho competenze tecniche in orticoltura, floricoltura e tecniche agricole biologiche. Ho seguito corsi di formazione specifici sull''agricoltura sociale e l''inclusione lavorativa. Cerco un''opportunità che mi permetta di combinare le mie competenze agricole con un progetto di valore sociale.',
'Spettabile Cooperativa,
Vi contatto per propormi come Responsabile di Progetti di Agricoltura Sociale. Ho appreso del vostro interesse ad avviare un progetto di inserimento lavorativo nell''ambito agricolo e ritengo che la mia esperienza possa essere rilevante per questa iniziativa. Negli ultimi cinque anni ho coordinato un progetto di orto sociale che ha coinvolto persone con disabilità psichica e fisico-motoria, creando un percorso di formazione e inserimento lavorativo nel settore agricolo. Il progetto ha portato alla creazione di un piccolo punto vendita di prodotti biologici gestito dagli stessi partecipanti. La mia formazione tecnica in agronomia, unita all''esperienza sul campo e alla sensibilità verso le tematiche dell''inclusione sociale, mi permettono di progettare attività adatte alle diverse abilità e potenzialità dei partecipanti. Sono particolarmente interessato alla vostra cooperativa per il vostro approccio innovativo e il forte radicamento nel territorio. Credo fermamente nel valore terapeutico e inclusivo del lavoro a contatto con la natura e sarei entusiasta di poter contribuire allo sviluppo di un nuovo progetto in questo ambito.
Distinti saluti,
Marco Gallo');


-- Double esperienze_lavorative entries (not present in original data)
INSERT INTO esperienze_lavorative (id_candidato, azienda, settore, posizione, descrizione, citta, provincia, data_inizio, data_fine, attuale, referenze, progetti_rilevanti) VALUES
(1, 'Scuola Primaria G. Rodari', 'Educazione', 'Educatrice di sostegno', 'Supporto educativo personalizzato a bambini con bisogni educativi speciali. Collaborazione con insegnanti e famiglie per l''attuazione del PEI. Progettazione e realizzazione di attività inclusive.', 'Milano', 'MI', '2023-09-01', NULL, TRUE, 'Prof.ssa Maria Rossi, Dirigente Scolastico', 'Progetto "Impariamo Insieme": laboratorio di apprendimento cooperativo che ha coinvolto l''intera classe in attività inclusive. Progetto "Emozioni in Gioco": percorso di educazione emotiva attraverso giochi ed espressione artistica.'),
(1, 'Associazione Amici dei Bambini', 'Sociale', 'Educatrice volontaria', 'Attività educative e ricreative con bambini in situazioni di fragilità sociale. Supporto scolastico e laboratori espressivi. Partecipazione all''organizzazione di eventi e raccolte fondi.', 'Milano', 'MI', '2021-06-01', '2023-08-31', FALSE, 'Dott. Luca Bianchi, Coordinatore Progetti Educativi', 'Centro Estivo "Estate Creativa": progettazione e realizzazione di attività ludico-ricreative per bambini dai 6 ai 12 anni. Progetto "Aiuto Compiti": supporto scolastico personalizzato per bambini con difficoltà di apprendimento.'),
(2, 'Residenza Anziani Serena', 'Assistenza Sanitaria', 'Operatore Socio-Sanitario', 'Assistenza quotidiana agli ospiti della struttura. Supporto nelle attività di base (igiene, alimentazione, mobilizzazione). Partecipazione alle attività ricreative e socializzanti. Monitoraggio e segnalazione di problematiche sanitarie.', 'Roma', 'RM', '2020-03-01', NULL, TRUE, 'Dott.ssa Antonella Verdi, Responsabile Assistenziale', 'Progetto "Stimolazione Cognitiva": partecipazione a un programma di attività quotidiane per il mantenimento delle capacità cognitive degli ospiti. Progetto "Movimento Dolce": supporto alle attività motorie adattate per anziani con diverse capacità fisiche.'),
(2, 'Ospedale San Giovanni', 'Sanità', 'Operatore Socio-Sanitario', 'Assistenza ai pazienti ricoverati nel reparto di Medicina Interna. Supporto al personale infermieristico nelle attività di assistenza. Accompagnamento dei pazienti per esami diagnostici. Gestione della documentazione di base.', 'Roma', 'RM', '2018-05-01', '2020-02-28', FALSE, 'Caposala Giovanna Neri', 'Partecipazione al progetto pilota di umanizzazione delle cure, con particolare attenzione alla comunicazione con il paziente e alla gestione degli spazi ospedalieri. Collaborazione all''implementazione di nuovi protocolli per la prevenzione delle cadute.'),
(3, 'Servizio Sociale Comune di Torino', 'Pubblico', 'Assistente Sociale', 'Presa in carico di nuclei familiari in situazione di fragilità sociale. Valutazione dei bisogni e progettazione di interventi personalizzati. Gestione dei rapporti con la rete dei servizi territoriali. Conduzione di colloqui professionali e visite domiciliari.', 'Torino', 'TO', '2021-02-01', NULL, TRUE, 'Dott.ssa Laura Neri, Responsabile Area Minori', 'Progetto "Famiglie Solidali": costruzione di una rete di famiglie di supporto per nuclei in difficoltà. Progetto "Emergenza Abitativa": interventi coordinati per situazioni di sfratto e precarietà abitativa.'),
(3, 'Cooperativa Sociale Nuovi Percorsi', 'Sociale', 'Assistente Sociale', 'Coordinamento di progetti di inclusione sociale per persone con disagio psichico. Supervisione degli operatori. Progettazione e monitoraggio degli interventi individualizzati. Gestione dei rapporti con i servizi sanitari e sociali.', 'Torino', 'TO', '2018-09-01', '2021-01-31', FALSE, 'Dott. Marco Belli, Direttore Cooperativa', 'Progetto "Casa Solidale": percorsi di autonomia abitativa per persone con disagio psichico in fase di reinserimento sociale. Progetto "Lavoro e Dignità": inserimenti lavorativi protetti in collaborazione con aziende del territorio.'),
(4, 'Consorzio Servizi Sociali', 'Pubblico', 'Manager Commerciale', 'Sviluppo commerciale e gestione dei rapporti con enti pubblici e privati. Partecipazione a gare d''appalto e redazione di offerte tecniche. Monitoraggio della qualità dei servizi e gestione dei feedback dei clienti. Coordinamento del team commerciale.', 'Napoli', 'NA', '2019-06-01', NULL, TRUE, 'Dott. Roberto Esposito, Direttore Generale', 'Acquisizione di nuovi contratti con Comuni della provincia per servizi di assistenza domiciliare, con un incremento del 30% del fatturato. Riorganizzazione del processo di partecipazione alle gare, con miglioramento dell''efficienza e aumento del tasso di successo.'),
(4, 'Azienda di Consulenza Organizzativa Business Solutions', 'Servizi alle Imprese', 'Consulente Senior', 'Consulenza organizzativa per aziende di medie dimensioni. Analisi dei processi aziendali e progettazione di interventi migliorativi. Formazione del personale sui nuovi processi. Supporto all''implementazione di sistemi di gestione della qualità.', 'Napoli', 'NA', '2015-03-01', '2019-05-31', FALSE, 'Dott.ssa Claudia Marino, CEO', 'Ristrutturazione organizzativa di un''azienda manifatturiera con 150 dipendenti, con riduzione dei costi del 15% e aumento della produttività. Implementazione di un sistema di gestione della qualità ISO 9001 in una catena di cliniche private.'),
(5, 'Centro di Mediazione Culturale', 'Sociale', 'Mediatrice Culturale', 'Mediazione linguistica e culturale per servizi pubblici (scuole, ospedali, servizi sociali). Supporto all''integrazione di famiglie migranti. Formazione agli operatori su tematiche interculturali. Traduzione di materiali informativi in arabo e francese.', 'Palermo', 'PA', '2022-01-01', NULL, TRUE, 'Dott.ssa Francesca Rizzo, Coordinatrice Servizi', 'Progetto "Scuola per Tutti": facilitazione dell''inserimento scolastico di minori stranieri attraverso laboratori interculturali e supporto alle famiglie. Progetto "Salute Senza Frontiere": miglioramento dell''accesso ai servizi sanitari per la popolazione migrante.'),

(5, 'ONG Mediterraneo Solidale', 'Cooperazione Internazionale', 'Operatrice Umanitaria', 'Supporto ai migranti nei centri di prima accoglienza. Informativa legale e orientamento ai servizi territoriali. Mediazione linguistica e culturale. Gestione di laboratori di educazione civica e lingua italiana.', 'Palermo', 'PA', '2019-05-01', '2021-12-31', FALSE, 'Dott. Ahmed Hassan, Coordinatore Progetti', 'Progetto "Prima Accoglienza": supporto legale e psicosociale a migranti appena sbarcati. Progetto "Donne Migranti": creazione di uno spazio protetto per donne migranti vittime di violenza o tratta.'),

(6, 'Studio Commercialisti Associati', 'Servizi Professionali', 'Dottore Commercialista', 'Gestione contabile e fiscale di aziende e cooperative sociali. Predisposizione di bilanci e dichiarazioni fiscali. Consulenza amministrativa e fiscale. Relazioni con enti pubblici e revisori.', 'Bari', 'BA', '2021-01-01', NULL, TRUE, 'Dott. Giorgio Conti, Partner Studio', 'Ristrutturazione amministrativa di una cooperativa sociale in difficoltà economica, con ritorno all''equilibrio finanziario in 18 mesi. Implementazione di un sistema di controllo di gestione per una rete di comunità educative.'),

(6, 'Cooperativa Sociale Aurora', 'Sociale', 'Responsabile Amministrativo', 'Gestione amministrativa e contabile della cooperativa. Predisposizione del bilancio e gestione dei rapporti con consulenti esterni. Rendicontazione di progetti finanziati. Supervisione dell''ufficio amministrativo.', 'Bari', 'BA', '2017-06-01', '2020-12-31', FALSE, 'Dott.ssa Maria Verdi, Presidente', 'Riorganizzazione del sistema amministrativo con introduzione di software gestionale integrato. Implementazione di procedure per il controllo di gestione e la rendicontazione di progetti complessi.'),

(7, 'Centro di Neuropsichiatria Infantile', 'Sanitario', 'Psicologa', 'Valutazioni psicodiagnostiche di bambini e adolescenti. Colloqui clinici con minori e famiglie. Progetti di prevenzione nelle scuole. Consulenza agli insegnanti per casi specifici.', 'Roma', 'RM', '2020-09-01', NULL, TRUE, 'Dott. Alberto Rossi, Direttore Sanitario', 'Progetto "Screening Precoce": individuazione tempestiva di difficoltà di apprendimento nella scuola primaria. Progetto "Genitori Efficaci": percorso di sostegno alle competenze genitoriali per famiglie con figli con ADHD.'),

(7, 'Istituto Comprensivo G. Leopardi', 'Educazione', 'Psicologa Scolastica', 'Gestione dello sportello di ascolto psicologico per studenti, genitori e insegnanti. Interventi in classe su tematiche specifiche (bullismo, affettività, metodo di studio). Formazione agli insegnanti su gestione delle dinamiche di classe e inclusione.', 'Roma', 'RM', '2018-10-01', '2020-08-31', FALSE, 'Prof.ssa Giulia Martini, Dirigente Scolastico', 'Progetto "No al Bullismo": interventi di prevenzione e gestione di episodi di bullismo in tutte le classi della scuola secondaria. Progetto "Orientamento Consapevole": supporto alla scelta del percorso scolastico per gli studenti dell''ultimo anno.'),

(8, 'Azienda Agricola Bio Natura', 'Agricoltura', 'Responsabile Progetti di Agricoltura Sociale', 'Coordinamento di progetti di inserimento lavorativo in ambito agricolo per persone con disabilità. Progettazione e realizzazione di percorsi formativi personalizzati. Supervisione delle attività produttive. Gestione dei rapporti con i servizi sociali invianti.', 'Torino', 'TO', '2022-03-01', NULL, TRUE, 'Dott.ssa Anna Verdi, Titolare', 'Progetto "Orti Inclusivi": creazione di un orto sociale gestito da persone con disabilità intellettiva, con vendita diretta dei prodotti. Progetto "Fattoria Didattica": percorsi educativi per scuole con coinvolgimento attivo di persone con disabilità come tutor.'),

(8, 'Cooperativa Sociale Terra Viva', 'Sociale', 'Tecnico Agricolo', 'Gestione tecnica delle coltivazioni in un progetto di agricoltura sociale. Formazione pratica di persone con svantaggio inserite nel progetto. Pianificazione delle produzioni e organizzazione del lavoro. Controllo qualità dei prodotti.', 'Torino', 'TO', '2019-04-01', '2022-02-28', FALSE, 'Dott. Carlo Bianchi, Presidente', 'Conversione a produzione biologica di un terreno di 5 ettari, con ottenimento della certificazione. Sviluppo di una filiera corta con vendita diretta e mercati contadini, con coinvolgimento di persone con disabilità.'),

(9, 'Centro Autismo "Spazio Blu"', 'Sociale', 'Educatrice Specializzata', 'Interventi educativi individualizzati con bambini con disturbo dello spettro autistico. Applicazione del metodo ABA e utilizzo della CAA. Formazione e supporto alle famiglie. Collaborazione con l''équipe multidisciplinare.', 'Milano', 'MI', '2020-09-01', NULL, TRUE, 'Dott.ssa Lucia Verdi, Coordinatrice Centro', 'Progetto "Comunicazione Aumentativa": implementazione di un sistema di CAA personalizzato che ha migliorato significativamente le capacità comunicative di 5 bambini. Progetto "Transizione Scuola": supporto all''inserimento scolastico di bambini con autismo.'),

(9, 'Scuola Primaria A. Manzoni', 'Educazione', 'Educatrice di Sostegno', 'Supporto educativo a bambini con certificazione di disabilità. Collaborazione alla stesura e attuazione del PEI. Adattamento dei materiali didattici. Facilitazione dell''inclusione nel gruppo classe.', 'Milano', 'MI', '2018-09-01', '2020-08-31', FALSE, 'Prof. Giorgio Neri, Dirigente Scolastico', 'Progetto "Classi Inclusive": riorganizzazione degli spazi e delle attività didattiche per favorire la piena partecipazione di tutti gli alunni. Progetto "Tecnologie per l''Apprendimento": introduzione di software specifici per supportare l''apprendimento di bambini con DSA.'),

(10, 'SerD Roma Est', 'Sanitario', 'Assistente Sociale', 'Presa in carico di persone con dipendenza patologica. Valutazione sociale e progettazione di percorsi di recupero. Colloqui motivazionali e di sostegno. Gestione dei rapporti con la rete dei servizi e con le famiglie.', 'Roma', 'RM', '2018-01-01', NULL, TRUE, 'Dott.ssa Marina Rossi, Direttrice', 'Progetto "Genitorialità e Dipendenza": supporto a genitori con problemi di dipendenza per prevenire l''allontanamento dei figli. Progetto "Reinserimento Sociale": percorsi integrati di supporto abitativo e lavorativo per persone in fase di recupero.'),

(10, 'Comunità Terapeutica "Nuova Vita"', 'Sociale', 'Assistente Sociale', 'Valutazione sociale in fase di ingresso in comunità. Progettazione di percorsi personalizzati di recupero. Gestione dei gruppi terapeutici. Preparazione e accompagnamento al reinserimento sociale e familiare.', 'Roma', 'RM', '2014-03-01', '2017-12-31', FALSE, 'Dott. Stefano Belli, Coordinatore', 'Progetto "Famiglia al Centro": coinvolgimento attivo delle famiglie nel percorso terapeutico attraverso gruppi di auto-mutuo aiuto. Progetto "Dopo la Comunità": creazione di una rete di supporto post-comunità con gruppi di ex utenti e volontari.');

-- Double formazione entries
INSERT INTO formazione (id_candidato, tipo, istituto, titolo, campo_studio, voto, citta, provincia, data_inizio, data_fine, descrizione) VALUES
(1, 'università', 'Università degli Studi di Milano', 'Laurea in Scienze dell''Educazione', 'Educazione e pedagogia', '110/110 con lode', 'Milano', 'MI', '2018-09-01', '2021-07-15', 'Percorso di studi incentrato sull''educazione inclusiva e la pedagogia speciale. Tesi di laurea sulla didattica inclusiva per bambini con disturbi dell''apprendimento.'),
(1, 'corso_professionale', 'Centro di Formazione Accreditato Regione Lombardia', 'Certificazione in Didattica per DSA e BES', 'Educazione speciale', 'Ottimo', 'Milano', 'MI', '2022-01-10', '2022-06-30', 'Corso professionalizzante sulle metodologie didattiche per studenti con Disturbi Specifici dell''Apprendimento e Bisogni Educativi Speciali. Acquisizione di competenze specifiche nella progettazione di interventi personalizzati.'),
(2, 'corso_professionale', 'Scuola di Formazione Professionale San Giovanni', 'Qualifica di Operatore Socio-Sanitario', 'Assistenza socio-sanitaria', 'Distinto', 'Roma', 'RM', '2017-09-01', '2018-07-30', 'Formazione teorico-pratica nell''ambito dell''assistenza di base. Tirocinio svolto presso diverse strutture sanitarie e socio-assistenziali della regione.'),
(2, 'corso_professionale', 'Centro di Formazione Accreditato Regione Lazio', 'Specializzazione in Assistenza a Pazienti con Demenza', 'Geriatria', 'Ottimo', 'Roma', 'RM', '2019-03-15', '2019-06-15', 'Corso di specializzazione sulle tecniche di assistenza e comunicazione con persone affette da demenza e Alzheimer. Focus su approcci non farmacologici e gestione dei disturbi comportamentali.'),
(3, 'università', 'Università degli Studi di Torino', 'Laurea in Servizio Sociale', 'Servizio sociale', '108/110', 'Torino', 'TO', '2015-09-01', '2018-07-15', 'Percorso di studi focalizzato su politiche sociali, metodologia del servizio sociale e psicologia sociale. Tesi di laurea sugli interventi di sostegno alle famiglie vulnerabili.'),
(3, 'master', 'Università degli Studi di Torino', 'Master in Politiche Sociali e Gestione dei Servizi', 'Servizio sociale', '110/110', 'Torino', 'TO', '2019-01-10', '2019-12-20', 'Master di I livello orientato alla progettazione e gestione di servizi sociali innovativi. Project work su modelli di welfare comunitario e interventi di prossimità.'),
(4, 'università', 'Università degli Studi di Napoli Federico II', 'Laurea in Economia Aziendale', 'Management e organizzazione aziendale', '105/110', 'Napoli', 'NA', '2008-09-01', '2013-10-15', 'Percorso di studi focalizzato su economia e gestione delle imprese, con particolare attenzione al marketing e alla gestione delle risorse umane.'),
(4, 'master', 'SDA Bocconi', 'Master in Management delle Imprese Sociali', 'Management non profit', 'Eccellente', 'Milano', 'MI', '2022-01-15', '2022-12-15', 'Master executive focalizzato sulla gestione delle organizzazioni non profit e delle imprese sociali. Project work su modelli di business sostenibili per l''inserimento lavorativo di persone svantaggiate.'),
(5, 'università', 'Università degli Studi di Palermo', 'Laurea in Scienze della Mediazione Linguistica e Culturale', 'Mediazione linguistica e culturale', '110/110 con lode', 'Palermo', 'PA', '2015-09-01', '2018-07-15', 'Percorso di studi incentrato su lingue (arabo, francese, inglese), comunicazione interculturale e politiche migratorie. Tesi di laurea sul ruolo della mediazione culturale nei servizi sanitari.'),
(5, 'master', 'Università degli Studi di Palermo', 'Master in Studi Migratori e Politiche di Accoglienza', 'Migrazioni e integrazione', '110/110 con lode', 'Palermo', 'PA', '2018-11-01', '2019-10-30', 'Master di I livello sui fenomeni migratori nel Mediterraneo e sulle politiche di accoglienza e integrazione. Project work su percorsi di integrazione sociale e lavorativa per donne migranti.'),
(6, 'università', 'Università degli Studi di Bari', 'Laurea in Economia e Commercio', 'Economia e finanza', '105/110', 'Bari', 'BA', '2005-09-01', '2010-07-15', 'Percorso di studi focalizzato su economia aziendale, diritto commerciale e fiscalità. Tesi di laurea sulla fiscalità delle cooperative sociali.'),
(6, 'certificazione', 'Ordine dei Dottori Commercialisti', 'Abilitazione all''esercizio della professione', 'Economia e commercio', 'Idoneo', 'Bari', 'BA', '2011-02-01', '2011-11-15', 'Esame di stato per l''abilitazione alla professione di dottore commercialista. Tirocinio professionale svolto presso uno studio specializzato in enti non profit e cooperative.'),
(7, 'università', 'La Sapienza Università di Roma', 'Laurea in Psicologia', 'Psicologia clinica e dello sviluppo', '110/110 con lode', 'Roma', 'RM', '2014-09-01', '2016-10-15', 'Laurea magistrale con focus su psicologia dell''età evolutiva, psicopatologia dello sviluppo e metodi di valutazione psicologica. Tesi sperimentale sui disturbi dell''apprendimento in età scolare.'),
(7, 'certificazione', 'Ordine degli Psicologi del Lazio', 'Abilitazione alla professione di Psicologo', 'Psicologia', 'Idoneo', 'Roma', 'RM', '2017-05-01', '2017-11-15', 'Esame di stato per l''abilitazione alla professione di psicologo. Tirocinio professionalizzante svolto presso un servizio di neuropsichiatria infantile.'),
(8, 'università', 'Università degli Studi di Torino', 'Laurea in Scienze Agrarie', 'Agronomia e produzioni vegetali', '106/110', 'Torino', 'TO', '2012-09-01', '2015-07-15', 'Percorso di studi focalizzato su produzioni vegetali, tecniche di coltivazione biologica e gestione sostenibile delle risorse agrarie. Tesi di laurea sulla agricoltura sociale come strumento di inclusione.'),
(8, 'corso_professionale', 'Ente di Formazione Agraria', 'Corso in Agricoltura Sociale', 'Agricoltura sociale', 'Eccellente', 'Torino', 'TO', '2018-02-01', '2018-06-30', 'Corso di specializzazione sui modelli di agricoltura sociale in Italia e in Europa, con focus sulla progettazione di percorsi di inserimento lavorativo in contesti agricoli.'),
(9, 'università', 'Università degli Studi di Milano', 'Laurea in Scienze della Formazione Primaria', 'Pedagogia e didattica', '110/110 con lode', 'Milano', 'MI', '2013-09-01', '2018-10-15', 'Percorso di studi incentrato su pedagogia, psicologia dell''educazione e didattica inclusiva. Tesi di laurea sulla didattica inclusiva per bambini con disturbo dello spettro autistico.'),
(9, 'corso_professionale', 'Centro Autismo e Disturbi dello Sviluppo', 'Certificazione in Metodologia ABA', 'Analisi comportamentale applicata', 'Ottimo', 'Milano', 'MI', '2019-03-01', '2019-09-30', 'Formazione specifica sulla metodologia ABA (Applied Behavior Analysis) per l''intervento educativo con bambini con disturbo dello spettro autistico. Tirocinio pratico supervisionato.'),
(10, 'università', 'Università degli Studi Roma Tre', 'Laurea in Servizio Sociale', 'Servizio sociale', '105/110', 'Roma', 'RM', '2010-09-01', '2013-07-15', 'Percorso di studi focalizzato su metodologia del servizio sociale, politiche sociali e psicologia sociale. Tesi di laurea sul trattamento sociale delle dipendenze patologiche.'),
(10, 'corso_professionale', 'Centro Studi Dipendenze', 'Specializzazione in Dipendenze Patologiche', 'Servizio sociale', 'Eccellente', 'Roma', 'RM', '2016-02-01', '2016-07-30', 'Corso di alta formazione sugli approcci evidence-based nel trattamento delle dipendenze patologiche. Focus su colloquio motivazionale e prevenzione delle ricadute.');

-- Double competenze_candidati entries
INSERT INTO competenze_candidati (id_candidato, livello, anni_esperienza, descrizione) VALUES
(1, 4, 3, 'Competenze nella progettazione e realizzazione di interventi educativi per minori con bisogni speciali. Capacità di lavoro in team multidisciplinari. Conoscenza approfondita delle metodologie didattiche inclusive e di supporto all''apprendimento. Esperienza nella gestione di piccoli gruppi educativi e nella relazione con le famiglie.'),
(2, 3, 5, 'Competenze tecniche nell''assistenza a persone con diversi livelli di non autosufficienza, con particolare riferimento a anziani e pazienti con patologie neurologiche. Capacità di supporto nelle ADL e gestione di situazioni di emergenza. Esperienza nella relazione con pazienti con demenza e nella gestione di alterazioni comportamentali.'),
(3, 4, 4, 'Competenze nella valutazione sociale, nella progettazione di interventi personalizzati e nel lavoro di rete con servizi territoriali. Specializzazione nel lavoro con famiglie vulnerabili e minori a rischio. Capacità di conduzione di colloqui professionali e gestione di gruppi. Conoscenza approfondita delle politiche sociali e della normativa di settore.'),
(4, 5, 10, 'Competenze avanzate in gestione commerciale, sviluppo strategico e organizzazione aziendale. Capacità di leadership e gestione di team. Esperienza nella pianificazione strategica e nel controllo di gestione. Conoscenza approfondita delle tecniche di marketing e vendita, con particolare riferimento al settore dei servizi.'),
(5, 4, 5, 'Competenze in mediazione linguistica e culturale, con specializzazione in contesti educativi e sanitari. Capacità di facilitazione della comunicazione in contesti multiculturali e prevenzione/gestione dei conflitti. Esperienza nella progettazione di interventi interculturali. Competenze linguistiche: italiano, arabo, francese, inglese (tutte a livello professionale).'),
(6, 5, 8, 'Competenze avanzate in contabilità, bilancio e fiscalità, con specializzazione in amministrazione di cooperative sociali ed enti non profit. Capacità di gestione amministrativa completa e di rendicontazione di progetti finanziati. Esperienza nel controllo di gestione e nell''analisi finanziaria. Conoscenza approfondita della normativa fiscale e amministrativa del terzo settore.'),
(7, 4, 5, 'Competenze in valutazione psicologica, supporto psicologico e progettazione di interventi per minori con problematiche evolutive. Specializzazione in disturbi dell''apprendimento e problematiche comportamentali in età scolare. Capacità di lavoro in équipe multidisciplinari e di consulenza agli insegnanti. Esperienza nella gestione di sportelli di ascolto psicologico.'),
(8, 4, 6, 'Competenze tecniche in agricoltura biologica, progettazione e gestione di progetti agricoli sociali. Capacità di formazione e tutoraggio di persone con svantaggio inserite in contesti agricoli. Esperienza nella gestione di gruppi di lavoro eterogenei. Conoscenza approfondita delle tecniche di coltivazione biologica di ortaggi e piante aromatiche.'),
(9, 5, 5, 'Competenze avanzate nell''educazione di bambini con disturbo dello spettro autistico, utilizzo del metodo ABA e della CAA. Capacità di progettazione educativa individualizzata e di lavoro in team multidisciplinari. Esperienza nella formazione di educatori e famiglie. Conoscenza approfondita delle tecniche di intervento educativo per bambini con bisogni speciali.'),
(10, 4, 9, 'Competenze nel trattamento sociale delle dipendenze patologiche, con specializzazione in colloquio motivazionale e prevenzione delle ricadute. Capacità di progettazione di percorsi di reinserimento sociale e lavorativo. Esperienza nel lavoro di rete con servizi pubblici e privati. Conoscenza approfondita della legislazione e delle politiche sulle dipendenze.');

-- Double candidature entries, fixing foreign keys
INSERT INTO candidature (id_offerta, id_candidato, data_candidatura, stato, note, lettera_motivazionale, disponibilita_colloquio, data_ultimo_aggiornamento) VALUES
(1, 1, '2025-03-20', 'in_valutazione', 'Candidata specializzata in educazione inclusiva con ottima formazione. Da valutare per il colloquio.', 'Gentile Responsabile della Selezione,

Con la presente desidero candidarmi con entusiasmo alla posizione di Educatore Professionale presso il vostro Centro Educativo di Lambrate.

La mia specializzazione in educazione inclusiva e l''esperienza maturata nel lavoro con bambini con disturbi dello spettro autistico mi hanno fornito competenze specifiche che ritengo possano essere valorizzate nel vostro servizio. Negli ultimi tre anni ho lavorato come educatrice specializzata presso il Centro Autismo "Spazio Blu", dove ho potuto approfondire l''applicazione di metodologie evidence-based come l''ABA e l''utilizzo della CAA.

Ho sviluppato una particolare competenza nella progettazione di attività inclusive che permettono a tutti i bambini, indipendentemente dalle loro difficoltà, di partecipare attivamente e di esprimere le proprie potenzialità. La mia esperienza nella scuola primaria mi ha inoltre permesso di acquisire strumenti efficaci per il supporto scolastico e per la creazione di un ponte tra contesto educativo extrascolastico e scuola.

Sono particolarmente attratta dalla vostra cooperativa per l''attenzione che dedicate alle situazioni di fragilità sociale e per l''approccio educativo che mette al centro il bambino e le sue potenzialità. Credo fermamente che ogni bambino abbia diritto a un''educazione di qualità che valorizzi le sue caratteristiche individuali e lo aiuti a sviluppare autonomia e autostima.

Sono una persona creativa, empatica e con una naturale propensione al lavoro di squadra. La mia formazione continua mi permette di essere aggiornata sulle più recenti metodologie educative e di portare innovazione nei contesti in cui opero.

Sarei disponibile a iniziare immediatamente, potendo garantire la flessibilità oraria richiesta, compreso il periodo estivo.

Vi ringrazio per l''attenzione e resto a disposizione per un colloquio in cui poter approfondire la mia candidatura.

Cordiali saluti,
Chiara Moretti', '2025-04-08', '2025-03-20'),

(2, 4, '2025-03-28', 'ricevuta', 'Candidato con esperienza in progetti sociali. Da valutare per il ruolo nel laboratorio.', 'Spettabile Cooperativa,

Desidero candidarmi con interesse alla posizione di Operatore di Laboratorio Artigianale presso il vostro Centro Verde.

La mia esperienza nel coordinamento di progetti di housing first per persone con marginalità sociale mi ha permesso di sviluppare una particolare sensibilità verso l''inclusione lavorativa come strumento di emancipazione e recupero della dignità personale. Pur non avendo una specifica formazione in ambito artigianale, ho coordinato negli ultimi anni diversi laboratori occupazionali all''interno dei progetti di housing, collaborando con artigiani e tecnici specializzati.

Ho potuto constatare come il lavoro manuale e creativo rappresenti un potente strumento terapeutico e riabilitativo, capace di valorizzare competenze spesso inespresse e di costruire percorsi di autonomia significativi. La mission della vostra cooperativa, orientata all''inserimento lavorativo di persone svantaggiate attraverso attività produttive concrete, risponde pienamente ai valori che guidano il mio lavoro quotidiano.

Ciò che posso offrire è una solida esperienza nella gestione di gruppi eterogenei, nella motivazione di persone con fragilità e nella costruzione di percorsi personalizzati che tengano conto dei punti di forza e delle aree di miglioramento di ciascuno. La mia naturale attitudine all''empatia e al problem solving mi permette di adattare costantemente l''intervento educativo al contesto e alle persone.

Sono disponibile ad approfondire le mie competenze tecniche in ambito artigianale, essendo un appassionato di lavori manuali e sempre desideroso di acquisire nuove competenze.

Sono disponibile a un colloquio per approfondire la mia candidatura e per comprendere meglio le specificità del vostro progetto.

Cordiali saluti,
Marco Vitale', '2025-04-15', '2025-03-28'),

(3, 6, '2025-04-08', 'colloquio_fissato', 'Candidato con ottima esperienza in cure palliative. Colloquio fissato per il 18/04/2025.', 'Alla cortese attenzione della Direzione,

Con la presente desidero candidarmi per la posizione di Infermiere presso il vostro Centro Diurno per Anziani.

La mia esperienza come infermiere specializzato in cure palliative e terapia del dolore, maturata sia in hospice che in assistenza domiciliare, mi ha permesso di sviluppare competenze specifiche nella gestione di situazioni complesse e nell''assistenza a persone fragili con bisogni sanitari articolati.

Negli ultimi anni, lavorando presso l''Hospice "La Casa del Sole", ho affinato non solo le competenze tecniche nell''ambito della gestione del dolore e dei sintomi, ma anche l''approccio relazionale con gli anziani e le loro famiglie, sviluppando una particolare sensibilità verso gli aspetti emotivi e psicologici della cura.

La vostra cooperativa si distingue per l''attenzione alla qualità dell''assistenza e per l''approccio olistico alla persona anziana, aspetti che condivido pienamente e che considero fondamentali in ogni intervento sanitario. La possibilità di lavorare in un Centro Diurno, contribuendo al mantenimento dell''anziano nel proprio contesto di vita, rappresenta per me un valore aggiunto e una sfida professionale stimolante.

Le mie competenze nella gestione di terapie complesse, nel monitoraggio dei parametri vitali e nello svolgimento di medicazioni e altre prestazioni infermieristiche, unite alla capacità di gestire situazioni di emergenza con lucidità e competenza, potrebbero essere una risorsa per il vostro team.

Sono una persona empatica, paziente e con un naturale approccio al lavoro in équipe multidisciplinare. La mia formazione continua mi permette di essere aggiornato sulle più recenti linee guida e procedure in ambito geriatrico.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze del vostro servizio.

Distinti saluti,
Alessandro Romano', '2025-04-18', '2025-04-10'),

(4, 7, '2025-03-18', 'in_valutazione', 'Candidata con ottima esperienza di coordinamento di servizi per minori. Da valutare con attenzione.', 'Gentile Direzione,

Con la presente desidero candidarmi per la posizione di Coordinatore Pedagogico Servizi Prima Infanzia.

La mia esperienza come coordinatrice pedagogica di servizi per minori, maturata negli ultimi anni presso la Comunità Educativa "Il Faro", mi ha permesso di sviluppare competenze specifiche nella supervisione di équipe educative, nella progettazione pedagogica e nella valutazione della qualità dei servizi.

Pur non avendo una specifica esperienza in servizi per la prima infanzia, ho coordinato servizi educativi per minori di diverse fasce d''età, sviluppando una visione pedagogica solida e un approccio al coordinamento basato sulla valorizzazione delle competenze del team e sulla qualità dell''offerta educativa.

La mia formazione, che include un Master in Coordinamento di Servizi Educativi, mi ha fornito strumenti teorici e metodologici che ritengo trasferibili anche al contesto dei servizi per la prima infanzia. Ho sempre investito nell''aggiornamento professionale, seguendo corsi e seminari sulla pedagogia dell''infanzia e sui modelli educativi innovativi.

Sono particolarmente interessata alla vostra cooperativa per l''attenzione che dedicate alla qualità dei servizi educativi e per l''approccio pedagogico orientato al benessere del bambino e al supporto alle famiglie. Credo fermamente nell''importanza dei primi anni di vita per lo sviluppo futuro e nella responsabilità che i servizi educativi hanno nel garantire contesti di crescita stimolanti e rispettosi.

Sono una persona con spiccate capacità organizzative e relazionali, con un approccio al coordinamento basato sull''ascolto attivo, sulla condivisione degli obiettivi e sulla formazione continua. La mia naturale propensione all''innovazione mi spinge a ricercare costantemente approcci pedagogici e organizzativi che possano migliorare la qualità del servizio.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze dei vostri servizi.

Cordiali saluti,
Giulia Marini', '2025-03-28', '2025-03-22'),

(5, 2, '2025-04-12', 'ricevuta', 'Candidato con specifica esperienza in dipendenze, da valutare per competenze trasferibili agli inserimenti lavorativi.', 'Gentile Responsabile della Selezione,

Desidero candidarmi per la posizione di Responsabile Inserimenti Lavorativi presso la vostra cooperativa.

La mia esperienza come assistente sociale nel settore delle dipendenze patologiche mi ha permesso di sviluppare competenze specifiche nella progettazione di percorsi di reinserimento sociale e lavorativo per persone con fragilità. Negli ultimi anni, lavorando presso il SerD di Roma Est, ho coordinato un progetto di inserimenti lavorativi per persone con problemi di dipendenza in fase di recupero, creando una rete di aziende disponibili e gestendo l''intero processo di matching, formazione e monitoraggio.

Ho potuto constatare come il lavoro rappresenti non solo un mezzo di sostentamento economico, ma un potente strumento di riabilitazione e di ricostruzione dell''identità personale. Il modello di inserimento lavorativo che ho contribuito a sviluppare si basa su un approccio personalizzato, che valuta attentamente le competenze, le aspirazioni e le criticità di ciascuna persona per individuare il contesto lavorativo più adatto.

Le mie competenze includono la valutazione delle capacità lavorative, la progettazione di percorsi formativi propedeutici, la sensibilizzazione delle aziende e il monitoraggio degli inserimenti. Ho sviluppato inoltre una metodologia di lavoro che coinvolge attivamente la persona in tutto il percorso, rendendola protagonista del proprio progetto di vita.

La vostra cooperativa è conosciuta per l''approccio innovativo all''inclusione lavorativa e per la capacità di creare opportunità concrete per persone svantaggiate, valori che condivido pienamente. La possibilità di ampliare la mia esperienza coordinando inserimenti lavorativi per diverse tipologie di svantaggio rappresenta per me una sfida professionale stimolante.

Sono una persona con buone capacità organizzative e relazionali, con un approccio al lavoro basato sull''empatia e sul pragmatismo. La mia naturale propensione al networking mi ha permesso di costruire negli anni una rete di contatti con aziende, enti formativi e servizi territoriali che potrebbe essere una risorsa anche per la vostra organizzazione.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze della vostra cooperativa.

Cordiali saluti,
Paolo Rizzo', '2025-04-22', '2025-04-12'),

(6, 3, '2025-04-15', 'in_valutazione', 'Candidata con ottima esperienza in progetti con migranti e capacità di comunicazione. Da convocare per colloquio.', 'Alla cortese attenzione della Direzione,

Sono Elena Costa, psicologa specializzata in Psicologia di Comunità, e desidero candidarmi per la posizione di Responsabile Comunicazione e Fundraising.

La mia esperienza professionale si è sviluppata principalmente nell''ambito dei progetti per migranti e rifugiati, dove oltre al lavoro clinico e di coordinamento, mi sono occupata della comunicazione esterna e delle attività di raccolta fondi per sostenere i progetti. Negli ultimi tre anni, come coordinatrice di un progetto SAI, ho gestito la comunicazione con gli stakeholder, sviluppato campagne di sensibilizzazione sul territorio e curato i rapporti con i media locali.

Ho contribuito alla progettazione e realizzazione di eventi di raccolta fondi e di campagne di crowdfunding, sviluppando competenze specifiche nella narrazione efficace di storie e progetti sociali e nella creazione di messaggi capaci di coinvolgere emotivamente il pubblico.

Le mie competenze linguistiche (italiano, inglese, francese, spagnolo e nozioni di arabo) rappresentano un valore aggiunto nella comunicazione interculturale e nella gestione di progetti internazionali. La mia formazione in psicologia di comunità mi ha fornito strumenti utili per comprendere le dinamiche sociali e per progettare interventi di comunicazione e fundraising che valorizzino le risorse della comunità.

Sono particolarmente interessata alla vostra cooperativa per la diversità dei servizi offerti e per l''impatto sociale che generate sul territorio. La possibilità di contribuire a comunicare il valore di questo impatto e a diversificare le fonti di finanziamento rappresenta per me una sfida professionale stimolante.

Sono una persona creativa, orientata agli obiettivi e con ottime capacità comunicative, sia scritte che verbali. La mia naturale curiosità mi spinge a tenermi costantemente aggiornata sulle nuove tendenze della comunicazione sociale e del fundraising nel terzo settore.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze della vostra organizzazione.

Cordiali saluti,
Elena Costa', '2025-04-25', '2025-04-18'),

(7, 5, '2025-04-02', 'offerta_inviata', 'Candidata con formazione ed esperienza in riabilitazione, offerta inviata il 22/04/2025, in attesa di risposta.', 'Gentile Direzione,

Con la presente desidero candidarmi per la posizione di Assistente Sociale presso i vostri Servizi per Anziani.

Pur non avendo una formazione specifica in servizio sociale, la mia esperienza come terapista occupazionale mi ha permesso di sviluppare competenze nella valutazione dei bisogni, nella progettazione di interventi personalizzati e nel lavoro di rete, che ritengo possano essere valorizzate anche in questo ruolo.

Negli ultimi anni, lavorando presso il Centro di Riabilitazione "Nuove Prospettive", ho collaborato strettamente con assistenti sociali nella presa in carico globale di anziani con diverse problematiche, sviluppando una visione integrata dei bisogni e delle risorse della persona anziana e del suo contesto di vita.

Il mio approccio professionale si basa sulla centralità della persona, sulla valorizzazione delle autonomie residue e sull''adattamento dell''ambiente per favorire la miglior qualità di vita possibile. Credo fermamente nell''importanza di un approccio di rete che coinvolga tutti gli attori significativi nella vita dell''anziano, dalla famiglia ai servizi del territorio.

La vostra cooperativa è conosciuta per l''attenzione alla qualità dei servizi per anziani e per l''approccio innovativo che va oltre l''assistenza tradizionale, valori che condivido pienamente. La possibilità di portare il mio contributo professionale in un contesto multidisciplinare rappresenta per me una stimolante opportunità di crescita.

Sono consapevole che la mia formazione di base è diversa da quella richiesta, ma sono convinta che le competenze acquisite nella valutazione funzionale, nella progettazione di interventi personalizzati e nel lavoro con le famiglie possano rappresentare un valore aggiunto nell''équipe. Sono inoltre disponibile a intraprendere eventuali percorsi formativi necessari per acquisire competenze specifiche del ruolo.

Sono una persona empatica, organizzata e con ottime capacità relazionali, abituata a lavorare in équipe multidisciplinari e a gestire situazioni complesse con professionalità e sensibilità.

Sono disponibile a un colloquio per approfondire la mia candidatura e comprendere meglio le specifiche esigenze dei vostri servizi.

Cordiali saluti,
Laura Fabbri', '2025-04-12', '2025-04-22'),

(8, 8, '2025-04-20', 'colloquio_fissato', 'Candidato con esperienza in riabilitazione geriatrica. Colloquio fissato per il 30/04/2025.', 'Spettabile Cooperativa,

Sono interessato alla posizione di Operatore Socio-Assistenziale per i vostri Servizi Domiciliari.

Pur avendo una formazione e un''esperienza professionale come fisioterapista, sono alla ricerca di un''opportunità lavorativa part-time che mi permetta di integrare le mie competenze in un servizio di assistenza domiciliare. Negli ultimi anni, lavorando presso la RSA Villa Serena, ho sviluppato una particolare sensibilità verso i bisogni degli anziani e una capacità di relazione empatica che ritengo possano essere valorizzate anche in questo ruolo.

La mia esperienza nella mobilizzazione di persone con ridotta autonomia, nella prevenzione delle lesioni da decubito e nella gestione di persone con demenza rappresenta un background di competenze che potrebbe essere utile nel lavoro domiciliare. Sono abituato a lavorare in autonomia ma anche in stretta collaborazione con altre figure professionali, adattandomi alle diverse situazioni e contesti.

Sono particolarmente interessato alla vostra cooperativa per l''attenzione alla qualità dell''assistenza e alla formazione continua degli operatori, aspetti che considero fondamentali in questo settore. La possibilità di portare un contributo professionale specifico in un contesto di assistenza di base rappresenta per me una stimolante opportunità.

Sono consapevole che la posizione richiede una qualifica di OSA/OSS che attualmente non possiedo, ma sono disponibile a intraprendere il percorso formativo necessario per acquisirla. Nel frattempo, posso offrire le mie competenze tecniche nella mobilizzazione sicura, negli esercizi di mantenimento e nella prevenzione dei danni da immobilità.

Sono disponibile a lavorare su turni, anche nei weekend, e sono automunito. Posso garantire flessibilità e puntualità, qualità che ritengo essenziali in un servizio domiciliare.

Resto a disposizione per un colloquio in cui poter approfondire la mia candidatura.

Cordiali saluti,
Davide Lombardi', '2025-04-30', '2025-04-22'),

(10, 12, '2025-04-28', 'in_valutazione', 'Candidato con esperienza in agricoltura biologica e sostenibilità, interessante per il negozio equo-solidale.', 'Alla cortese attenzione della Direzione,

Desidero candidarmi per la posizione di Addetto Vendite presso il vostro Negozio Equo-solidale nel centro di Firenze.

La mia esperienza in agricoltura biologica e sociale, maturata negli ultimi anni presso l''Azienda Agricola Bio Natura e in precedenza nella Cooperativa Sociale Terra Viva, mi ha permesso di sviluppare una profonda conoscenza dei principi di sostenibilità ambientale e sociale e dei processi produttivi rispettosi dell''ambiente e delle persone.

In particolare, ho contribuito alla creazione di una filiera corta che valorizza i prodotti biologici locali e che coinvolge persone con svantaggio nei processi produttivi e di vendita. Questa esperienza mi ha permesso di comprendere l''importanza di un''economia che mette al centro le persone e l''ambiente, principi che condivido con il movimento del commercio equo e solidale.

Nell''ambito della fattoria didattica che ho contribuito a sviluppare, mi sono occupato anche dell''accoglienza dei visitatori e della comunicazione dei valori e delle pratiche dell''agricoltura biologica e sociale, sviluppando capacità comunicative efficaci e adatte a diversi tipi di pubblico.

Sono particolarmente interessato al vostro negozio per la possibilità di contribuire alla diffusione di un modello di consumo consapevole e di un''economia più giusta. La vendita diretta rappresenta a mio avviso un momento fondamentale per sensibilizzare il pubblico e per creare una connessione tra produttori e consumatori.

Pur non avendo una specifica esperienza nella vendita al dettaglio tradizionale, sono una persona comunicativa, con una naturale predisposizione all''accoglienza e una forte motivazione a imparare. Sono disponibile a formarmi sugli aspetti tecnici della vendita e sulla gestione del negozio.

La mia conoscenza dei prodotti biologici e delle pratiche di produzione sostenibili potrebbe essere un valore aggiunto nella comunicazione con i clienti e nella valorizzazione dei prodotti del commercio equo.

Sono disponibile a lavorare nei weekend e in orari festivi, con la flessibilità richiesta dal ruolo, e posso iniziare immediatamente.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio la vostra realtà.

Cordiali saluti,
Matteo Santoro', '2025-05-10', '2025-04-30');

-- Double colloqui entries, fixing foreign keys
INSERT INTO colloqui (id_candidatura, data_ora, tipo, luogo, stato, valutazione, note_intervistatore, feedback_candidato, decisione, data_decisione) VALUES
(3, '2025-04-18 11:00:00', 'di_persona', 'Sede Centrale Roma, Via Garibaldi 78', 'completato', 4,
'Il candidato ha dimostrato buone competenze tecniche e un''esperienza rilevante in cure palliative e assistenza infermieristica agli anziani. Durante il colloquio ha mostrato una particolare sensibilità verso gli aspetti relazionali dell''assistenza e una buona conoscenza delle problematiche geriatriche. Ha risposto in modo adeguato alle domande tecniche e ha fatto domande pertinenti sull''organizzazione del servizio. Mi ha colpito positivamente la sua attenzione al benessere globale dell''anziano, non solo agli aspetti sanitari. Sarebbe necessario un periodo di affiancamento per adattare le sue competenze dal contesto delle cure palliative a quello del centro diurno.',
'Il candidato ha espresso un feedback positivo sul colloquio, apprezzando la chiarezza delle informazioni ricevute e l''atmosfera accogliente. Ha manifestato interesse per l''approccio multidisciplinare del centro e per la possibilità di lavorare in un contesto orientato alla prevenzione e al mantenimento delle autonomie degli anziani.',
'accettato',
'2025-04-22'),

(7, '2025-04-22 14:00:00', 'videochiamata', 'Piattaforma Zoom', 'completato', 5,
'La candidata ha impressionato positivamente per la sua preparazione e la sua esperienza nella riabilitazione. Nonostante la formazione diversa da quella richiesta, ha dimostrato una solida conoscenza delle problematiche degli anziani e una visione dell''assistenza che si integra perfettamente con l''approccio del nostro servizio. Ha portato esempi concreti del suo lavoro con gli anziani, evidenziando la capacità di valutazione globale e di lavoro in rete. Mi ha colpito la sua motivazione ad ampliare le proprie competenze in ambito sociale e la sua visione olistica del benessere dell''anziano. Potrebbe portare un valore aggiunto all''équipe grazie alle sue competenze nella valutazione funzionale e nell''adattamento ambientale.',
'La candidata ha espresso grande entusiasmo per il colloquio e per la possibilità di lavorare in un contesto che valorizza l''approccio multidisciplinare. Ha apprezzato la descrizione dettagliata del servizio e la chiarezza riguardo al ruolo. Ha manifestato particolare interesse per i progetti di comunità e per l''approccio preventivo del servizio.',
'accettato',
'2025-04-25'),

(8, '2025-04-30 10:30:00', 'di_persona', 'Sede Centrale Bologna, Via Dante 45', 'completato', 3,
'Il candidato ha mostrato una buona conoscenza dell''assistenza agli anziani, derivante dalla sua esperienza come fisioterapista. Ha evidenziato capacità relazionali e empatiche, ma è emersa la mancanza di formazione specifica come OSA/OSS, che limiterebbe le mansioni che potrebbe svolgere autonomamente. Ha mostrato disponibilità a formarsi e a integrare le sue competenze fisioterapiche nell''assistenza di base. È stato molto chiaro riguardo alla sua disponibilità part-time e alla flessibilità oraria. Potrebbe essere una risorsa interessante per il servizio, ma sarebbe necessario un percorso formativo specifico e un periodo significativo di affiancamento.',
'Il candidato ha espresso apprezzamento per la trasparenza riguardo ai requisiti formativi necessari. Ha manifestato interesse per il servizio e per l''approccio alla cura domiciliare. Ha confermato la sua disponibilità a intraprendere un percorso formativo per acquisire la qualifica necessaria.',
'da_rivedere',
'2025-05-02'),



(1, '2025-04-25 15:00:00', 'videochiamata', 'Piattaforma Teams', 'completato', 4,
'La candidata ha dimostrato una preparazione solida e un''esperienza interessante nel coordinamento di progetti per migranti. Durante il colloquio ha evidenziato buone capacità comunicative e una naturale predisposizione alla gestione delle relazioni pubbliche. Ha mostrato una conoscenza di base delle tecniche di fundraising e alcune esperienze di comunicazione sociale, sebbene non specifiche nel ruolo richiesto. Mi ha colpito la sua visione strategica e la capacità di connettere la comunicazione con la mission dell''organizzazione. Ha fatto domande pertinenti sulle priorità di comunicazione e sulle attuali fonti di finanziamento. Mostra entusiasmo e una forte motivazione ad apprendere.',
'La candidata ha espresso un feedback molto positivo sul colloquio. Ha apprezzato la visione innovativa della cooperativa e la chiarezza degli obiettivi di comunicazione e fundraising. Ha manifestato particolare interesse per la possibilità di sviluppare una narrazione efficace dell''impatto sociale dei servizi.',
'accettato',
'2025-04-28'),

(2, '2025-05-02 11:30:00', 'di_persona', 'Sede Cooperativa Torino, Via Garibaldi 25', 'completato', 3,
'Il candidato ha dimostrato un''autentica passione per l''educazione infantile e una naturale predisposizione al lavoro con i bambini, nonostante la mancanza di formazione specifica nel settore. Durante il colloquio ha condiviso alcune esperienze interessanti realizzate nell''ambito della fattoria didattica, mostrando creatività e capacità di progettare attività adatte a diverse fasce d''età. È emersa però la necessità di una formazione specifica sullo sviluppo infantile nella fascia 0-3 anni e sulle metodologie educative per il nido. Ha fatto domande pertinenti sul progetto pedagogico e sull''organizzazione della giornata educativa. Mostra entusiasmo e disponibilità all''apprendimento, ma richiederebbe un significativo investimento formativo iniziale.',
'Il candidato ha espresso apprezzamento per la professionalità del colloquio e per la chiarezza riguardo ai requisiti formativi necessari. Ha manifestato interesse per l''approccio pedagogico del nido e per la possibilità di integrare attività a contatto con la natura. Ha confermato la sua disponibilità a intraprendere un percorso formativo specifico.',
'da_rivedere',
'2025-05-05'),

(4, '2025-05-04 10:00:00', 'di_persona', 'Negozio Equo-solidale, Via dei Servi 45, Firenze', 'completato', 4,
'Il candidato ha mostrato una conoscenza approfondita dei principi di sostenibilità ambientale e sociale e un sincero interesse per il commercio equo-solidale. Durante il colloquio ha evidenziato buone capacità comunicative e una naturale predisposizione all''accoglienza. Pur non avendo esperienza specifica nella vendita al dettaglio, ha mostrato una forte motivazione ad apprendere e una buona comprensione delle dinamiche del negozio. La sua esperienza nella filiera corta e nella comunicazione dei valori dell''agricoltura biologica rappresenta un valore aggiunto. Ha fatto domande pertinenti sui prodotti, sui fornitori e sulle attività di sensibilizzazione del negozio. Sarebbe necessario un periodo di formazione sugli aspetti tecnici della vendita e sulla gestione del magazzino.',
'Il candidato ha espresso entusiasmo per la possibilità di lavorare nel negozio e ha apprezzato l''atmosfera e la varietà di prodotti. Ha manifestato particolare interesse per le attività di sensibilizzazione e per la connessione diretta con i produttori. Ha confermato la sua disponibilità a lavorare nei weekend e la sua flessibilità oraria.',
'accettato',
'2025-05-08');

