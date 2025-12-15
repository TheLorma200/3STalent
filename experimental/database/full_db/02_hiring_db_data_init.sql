

-- Inserimento di progetti interni
INSERT INTO progetti (id_progetto,id_organizzazione, nome, descrizione, data_inizio, data_fine, stato, priority, note) VALUES
(1,1, 'Spazio Aperto - Centro Educativo Diffuso', 'Progetto di riqualificazione di spazi urbani per creare luoghi di aggregazione e attività educative rivolte a minori e famiglie in quartieri periferici. Il progetto prevede la creazione di 3 poli educativi in collaborazione con scuole, parrocchie e associazioni locali.', '2025-01-15', '2026-01-14', 'in_corso', 4, 'Progetto finanziato dalla Fondazione Cariplo con un contributo di € 150.000. Coinvolge diversi servizi della cooperativa e prevede l''assunzione di 3 nuovi educatori. Il coordinamento è affidato a Giovanni Rossi. Partner del progetto: Comune di Milano, Istituto Comprensivo G. Verdi, Associazione Quartiere Vivo.'),
(2,2, 'Orti Urbani Inclusivi', 'Creazione e gestione di orti urbani come strumento di inserimento lavorativo per persone con disabilità e disagio psichico. Il progetto prevede l''allestimento di 5 aree verdi in zone urbane, la formazione di 15 persone svantaggiate in tecniche di orticoltura biologica e la vendita dei prodotti coltivati.', '2024-09-01', '2026-08-31', 'in_corso', 5, 'Progetto strategico per la cooperativa, che unisce inserimento lavorativo e sostenibilità ambientale. Finanziato dalla Regione Emilia-Romagna con € 200.000. Richiede competenze specifiche in agricoltura biologica e formazione per il personale coinvolto. Responsabile: Luigi Marini. Partner: Università di Bologna - Dipartimento di Scienze Agrarie, Comune di Bologna, Associazione Orti Urbani.'),

(3,3, 'Anziani in Rete', 'Progetto di contrasto all''isolamento sociale degli anziani attraverso l''uso delle tecnologie digitali e la creazione di reti di prossimità. Prevede la formazione digitale di 100 anziani, la creazione di 10 punti di facilitazione digitale nei centri anziani e l''attivazione di una piattaforma di condivisione di servizi e competenze tra anziani del quartiere.', '2025-03-01', '2027-02-28', 'in_corso', 4, 'Progetto innovativo che coniuga inclusione digitale e contrasto alla solitudine. Finanziato dal Ministero del Lavoro e delle Politiche Sociali con € 180.000. Responsabile: Elena Rizzo. Partner: Municipio Roma I, Associazione Pensionati Attivi, Istituto Tecnico G. Galilei (per il coinvolgimento di studenti in attività di tutoraggio digitale).'),

(4,4, 'Crescere Insieme - Supporto alla Genitorialità', 'Progetto di sostegno alla genitorialità rivolto a famiglie con figli nella fascia 0-6 anni, con particolare attenzione a situazioni di vulnerabilità. Prevede l''attivazione di gruppi di parola per genitori, laboratori genitori-bambini, sportello di consulenza educativa e psicologica, interventi domiciliari di supporto.', '2024-11-01', '2026-10-31', 'in_corso', 3, 'Progetto che risponde ai bisogni emergenti delle famiglie, in particolare a seguito della pandemia. Finanziato dalla Fondazione Compagnia di San Paolo con € 120.000. Responsabile: Chiara Fabbri. Partner: Consultori Familiari ASL Torino, Nidi d''infanzia comunali, Centro per le Famiglie.'),

(5,5, 'Artigianato 2.0', 'Progetto di innovazione nel settore dell''artigianato sociale, che unisce tecniche tradizionali e nuove tecnologie per creare prodotti di design realizzati da persone svantaggiate. Prevede l''allestimento di un FabLab accessibile, la formazione di 20 persone con disabilità su tecniche digitali di progettazione e produzione, lo sviluppo di una linea di prodotti eco-sostenibili.', '2025-02-01', '2027-01-31', 'in_corso', 4, 'Progetto innovativo che mira a rinnovare il settore dell''inserimento lavorativo attraverso le nuove tecnologie. Finanziato dal POR FSE Toscana con € 220.000. Responsabile: Anna Martelli. Partner: ISIA Firenze (Istituto Superiore per le Industrie Artistiche), FabLab Firenze, Confartigianato.'),

(6,1, 'Community Lab - Laboratorio di Comunità', 'Progetto di sviluppo di comunità in un quartiere periferico di Milano, finalizzato a promuovere la coesione sociale, la partecipazione attiva dei cittadini e la co-progettazione di servizi di welfare comunitario. Prevede l''attivazione di un laboratorio permanente di cittadinanza attiva, percorsi di formazione per abitanti-attivatori, micro-progetti di rigenerazione urbana partecipata.', '2024-06-01', '2026-05-31', 'in_corso', 3, 'Progetto strategico per lo sviluppo dell''area innovazione sociale della cooperativa. Finanziato da Fondazione Cariplo e Comune di Milano con € 180.000. Responsabile: Laura Rossi. Partner: Politecnico di Milano - Dipartimento di Architettura e Studi Urbani, Municipio 4, Associazione Laboratorio di Quartiere.'),

(7,2, 'Job Coaching per l''Inclusione', 'Sperimentazione del modello di job coaching per l''inserimento lavorativo di persone con disabilità intellettiva e disagio psichico. Il progetto prevede la formazione di 5 job coach, l''attivazione di 30 percorsi personalizzati di inserimento lavorativo, la sensibilizzazione di 50 aziende del territorio.', '2025-01-15', '2027-01-14', 'in_corso', 4, 'Progetto che introduce un approccio innovativo all''inserimento lavorativo, basato sull''accompagnamento individualizzato e continuativo. Finanziato dalla Fondazione Con il Sud con € 160.000. Responsabile: Francesca Moretti. Partner: Centro per l''Impiego di Bologna, Dipartimento di Salute Mentale AUSL Bologna, Associazione Industriali.'),

(8,3, 'Domiciliarità 2.0', 'Progetto di innovazione nei servizi di assistenza domiciliare per anziani attraverso l''integrazione di tecnologie assistive e telemedicina. Prevede l''implementazione di un sistema di telemonitoraggio per 50 anziani fragili, la formazione di 20 operatori all''uso delle nuove tecnologie, la creazione di una centrale operativa per la gestione integrata dei servizi.', '2024-10-01', '2026-09-30', 'in_corso', 5, 'Progetto strategico per l''innovazione dei servizi domiciliari. Finanziato dal PNRR - Missione Salute con € 300.000. Responsabile: Roberto Ferretti. Partner: ASL Roma 1, Dipartimento di Ingegneria Biomedica Università La Sapienza, Azienda di telemedicina HealthTech.'),

(9,4, 'Edu-Lab: Laboratori Educativi Innovativi', 'Progetto di innovazione pedagogica nei servizi per l''infanzia, basato sull''approccio dello STEAM (Scienza, Tecnologia, Ingegneria, Arte, Matematica) e dell''outdoor education. Prevede l''allestimento di 3 laboratori STEAM nei nidi e scuole dell''infanzia gestiti dalla cooperativa, la formazione di 25 educatori, la sperimentazione di un curricolo integrato 0-6 anni.', '2025-03-01', '2027-02-28', 'pianificato', 3, 'Progetto che mira a qualificare l''offerta educativa con approcci pedagogici innovativi. Finanziato dalla Fondazione Agnelli con € 140.000. Responsabile: Marco Ricci. Partner: Dipartimento di Scienze dell''Educazione Università di Torino, Reggio Children Foundation, Museo della Scienza e della Tecnologia.'),

(10,5, 'Negozio Solidale Diffuso', 'Progetto di economia circolare che prevede la creazione di una rete di punti vendita fisici e digitali per la commercializzazione di prodotti artigianali realizzati da persone svantaggiate e di prodotti del commercio equo-solidale. Include l''apertura di 2 nuovi punti vendita, la creazione di un e-commerce, la formazione di 10 persone svantaggiate in competenze di vendita e marketing digitale.', '2025-05-01', '2027-04-30', 'pianificato', 4, 'Progetto strategico per lo sviluppo commerciale della cooperativa e per la creazione di nuove opportunità di inserimento lavorativo. Finanziato da Fondo Sociale Europeo e autofinanziamento per un totale di € 250.000. Responsabile: Michele Longo. Partner: Altromercato, Scuola di Design IED Firenze, Camera di Commercio di Firenze.');

-- Inserimento delle assegnazioni dipendenti ai progetti
INSERT INTO assegnazioni_progetti (id_progetto, id_dipendente, ruolo, percentuale_tempo, data_inizio, data_fine, note) VALUES
(1, 1, 'Coordinatore Progetto', 50, '2025-01-15', '2026-01-14', 'Responsabile complessivo del progetto, gestisce i rapporti con i partner e gli enti finanziatori. Coordina l''équipe di progetto e supervisiona tutte le attività. Si occupa del monitoraggio e della valutazione dei risultati.'),
(1, 2, 'Educatrice Referente Centro Lambrate', 70, '2025-01-15', '2026-01-14', 'Referente operativa per il polo educativo di Lambrate. Progetta e realizza le attività educative, gestisce i rapporti con le scuole e le famiglie del quartiere, coordina i volontari coinvolti.'),
(3, 6, 'Direttore Progetto', 30, '2025-03-01', '2027-02-28', 'Supervisiona l''intero progetto, gestisce i rapporti istituzionali con i partner e gli enti finanziatori. Responsabile della rendicontazione e del rispetto del budget. Coordina le diverse aree di intervento.'),
(3, 7, 'Referente Area Sanitaria', 40, '2025-03-01', '2027-02-28', 'Responsabile degli aspetti sanitari del progetto, in particolare per quanto riguarda il telemonitoraggio e la telemedicina. Forma gli operatori sugli aspetti sanitari e collabora con i partner medici.'),
(2, 4, '<R>esponsabile Inserimenti Lavorativi', 60, '2024-09-01', '2026-08-31', 'Coordina i percorsi di inserimento lavorativo delle persone svantaggiate coinvolte nel progetto. Gestisce i rapporti con i servizi invianti, progetta e monitora i percorsi individualizzati, supervisiona i tutor.'),
(2, 5, 'Responsabile Tecnico Agricolo', 80, '2024-09-01', '2026-08-31', 'Responsabile degli aspetti tecnici legati alla coltivazione degli orti urbani. Progetta gli spazi verdi, definisce le tecniche colturali, forma le persone inserite sulle competenze agricole, supervisiona la produzione.'),
(4, 8, 'Coordinatrice Pedagogica', 40, '2024-11-01', '2026-10-31', 'Supervisiona gli aspetti pedagogici del progetto, garantendo la qualità educativa degli interventi. Progetta le attività, forma gli operatori coinvolti, monitora e valuta l''efficacia delle azioni realizzate.'),
(4, 9, 'Educatore Referente Laboratori', 60, '2024-11-01', '2026-10-31', 'Responsabile della progettazione e conduzione dei laboratori genitori-bambini. Gestisce i rapporti con le famiglie coinvolte, documenta le attività, collabora alla valutazione degli interventi.'),
(5, 10, 'Responsabile Produzione', 70, '2025-02-01', '2027-01-31', 'Coordina la produzione artigianale, gestisce il laboratorio e le attrezzature, forma le persone inserite sulle tecniche artigianali, supervisiona la qualità dei prodotti realizzati.'),
(5, 11, 'Responsabile Commerciale', 60, '2025-02-01', '2027-01-31', 'Cura gli aspetti commerciali e di marketing del progetto, definisce le strategie di vendita, gestisce l''e-commerce e i rapporti con i clienti, promuove i prodotti attraverso eventi e campagne di comunicazione.');



-- Inserimento di competenze richieste per le offerte
INSERT INTO competenze_richieste (id_offerta, id_competenza, livello_richiesto, obbligatorio) VALUES
(1, 1, 4, TRUE), -- Ascolto Attivo
(1, 2, 4, TRUE), -- Empatia
(1, 3, 4, TRUE), -- Lavoro di Squadra
(1, 6, 4, TRUE), -- Comunicazione Efficace
(1, 9, 5, TRUE), -- Tecniche Educative
(1, 10, 3, FALSE), -- Tecniche di Animazione
(1, 11, 4, TRUE), -- Gestione di Gruppi

(2, 3, 4, TRUE), -- Lavoro di Squadra
(2, 5, 4, TRUE), -- Problem Solving
(2, 7, 4, TRUE), -- Flessibilità
(2, 25, 2, FALSE), -- Tecniche di Giardinaggio
(2, 26, 2, FALSE), -- Tecniche di Pulizia
(2, 27, 5, TRUE), -- Tecniche Artigianali
(2, 29, 3, FALSE), -- Marketing Sociale

(3, 2, 5, TRUE), -- Empatia
(3, 4, 4, TRUE), -- Gestione dello Stress
(3, 7, 4, TRUE), -- Flessibilità
(3, 13, 5, TRUE), -- Assistenza Infermieristica
(3, 14, 5, TRUE), -- Gestione Farmaci
(3, 15, 5, TRUE), -- Primo Soccorso
(3, 32, 4, FALSE), -- Supporto Psicologico

(4, 3, 5, TRUE), -- Lavoro di Squadra
(4, 6, 5, TRUE), -- Comunicazione Efficace
(4, 8, 5, TRUE), -- Leadership
(4, 9, 5, TRUE), -- Tecniche Educative
(4, 11, 5, TRUE), -- Gestione di Gruppi
(4, 21, 4, TRUE), -- Progettazione Sociale
(4, 33, 4, TRUE), -- Gestione dei Conflitti

(5, 5, 5, TRUE), -- Problem Solving
(5, 6, 4, TRUE), -- Comunicazione Efficace
(5, 8, 4, TRUE), -- Leadership
(5, 21, 5, TRUE), -- Progettazione Sociale
(5, 22, 3, FALSE), -- Fundraising
(5, 23, 4, TRUE), -- Normativa Cooperative
(5, 29, 3, FALSE), -- Marketing Sociale

(6, 5, 4, TRUE), -- Problem Solving
(6, 6, 5, TRUE), -- Comunicazione Efficace
(6, 19, 4, TRUE), -- Informatica di Base
(6, 22, 5, TRUE), -- Fundraising
(6, 29, 5, TRUE), -- Marketing Sociale
(6, 33, 3, FALSE), -- Gestione dei Conflitti

(7, 1, 5, TRUE), -- Ascolto Attivo
(7, 2, 5, TRUE), -- Empatia
(7, 5, 4, TRUE), -- Problem Solving
(7, 6, 4, TRUE), -- Comunicazione Efficace
(7, 21, 4, TRUE), -- Progettazione Sociale
(7, 33, 4, TRUE), -- Gestione dei Conflitti

(8, 1, 4, TRUE), -- Ascolto Attivo
(8, 2, 5, TRUE), -- Empatia
(8, 4, 4, TRUE), -- Gestione dello Stress
(8, 7, 5, TRUE), -- Flessibilità
(8, 12, 5, TRUE), -- Tecniche di Assistenza di Base
(8, 15, 3, FALSE), -- Primo Soccorso

(9, 2, 5, TRUE), -- Empatia
(9, 6, 4, TRUE), -- Comunicazione Efficace
(9, 10, 5, TRUE), -- Tecniche di Animazione
(9, 11, 4, TRUE), -- Gestione di Gruppi

(10, 2, 3, FALSE), -- Empatia
(10, 6, 5, TRUE), -- Comunicazione Efficace
(10, 7, 4, TRUE), -- Flessibilità
(10, 19, 3, TRUE), -- Informatica di Base
(10, 29, 4, TRUE); -- Marketing Sociale

-- Inserimento di candidature
INSERT INTO candidature (id_offerta, id_candidato, id_dipendente, data_candidatura, stato, note, lettera_motivazionale, disponibilita_colloquio, data_ultimo_aggiornamento) VALUES
(1, 1, NULL, '2025-03-18', 'in_valutazione', 'Candidata con profilo molto interessante, da convocare per un colloquio.', 'Gentile Responsabile della Selezione,

Con la presente desidero candidarmi con entusiasmo alla posizione di Educatore Professionale presso il vostro Centro Educativo di Lambrate.

La mia recente laurea in Scienze dell''Educazione, unita all''esperienza maturata presso la Scuola Primaria G. Rodari dove attualmente lavoro come educatrice di supporto per bambini con bisogni educativi speciali, mi ha fornito le competenze necessarie per questo ruolo. Durante il mio percorso professionale ho sviluppato la capacità di progettare e realizzare interventi educativi personalizzati, di gestire gruppi eterogenei e di collaborare efficacemente con insegnanti e famiglie.

Sono particolarmente interessata al vostro Centro per l''approccio olistico all''educazione e l''attenzione dedicata ai minori con fragilità, valori che condivido pienamente. Vorrei poter contribuire con le mie competenze nel supporto scolastico e la mia passione per i laboratori espressivi, che ritengo strumenti fondamentali per favorire lo sviluppo di competenze trasversali e l''espressione emotiva.

La mia attitudine all''empatia, la capacità di ascolto e la naturale propensione al lavoro di squadra mi permetterebbero di integrarmi facilmente nel vostro team. Sarei inoltre disponibile a iniziare immediatamente, potendo garantire la flessibilità oraria richiesta.

Vi ringrazio per l''attenzione e resto a disposizione per un colloquio in cui poter approfondire la mia candidatura.

Cordiali saluti,
Sofia Bianchi', '2025-04-05', '2025-03-18'),

(2, 8, NULL, '2025-03-25', 'ricevuta', 'Da valutare. Esperienza interessante in agricoltura sociale.', 'Spettabile Cooperativa,

Mi candido con interesse per la posizione di Operatore di Laboratorio Artigianale presso il vostro Centro Verde.

Il mio percorso formativo in Scienze Agrarie e l''esperienza maturata nel campo dell''agricoltura sociale mi hanno fornito sia le competenze tecniche che la sensibilità necessarie per questo ruolo. Negli ultimi anni ho lavorato presso la Fattoria Sociale Il Girasole, dove ho coordinato laboratori di artigianato che coinvolgevano persone con diverse disabilità, specializzandomi nella lavorazione del legno e dei materiali naturali.

Ciò che mi appassiona maggiormente dell''agricoltura sociale è la possibilità di combinare la produzione di qualità con l''inclusione lavorativa di persone svantaggiate, valorizzando le capacità di ciascuno in un percorso di crescita personale e professionale. La mission della vostra cooperativa, orientata alla sostenibilità ambientale e sociale, risponde pienamente ai miei valori personali e professionali.

Oltre alle competenze tecniche in ambito artigianale, porto con me la capacità di adattare i processi produttivi alle diverse abilità delle persone, creando un ambiente di lavoro inclusivo e stimolante. Negli anni ho sviluppato anche competenze nella progettazione di prodotti artigianali con un occhio attento al design e alla commerciabilità.

Sono disponibile a un colloquio per approfondire le mie motivazioni e competenze e per conoscere meglio le vostre esigenze.

Cordiali saluti,
Marco Gallo', '2025-04-10', '2025-03-25'),

(3, 10, NULL, '2025-04-05', 'colloquio_fissato', 'Candidato con esperienza molto pertinente. Colloquio fissato per il 15/04/2025.', 'Alla cortese attenzione della Direzione,

Desidero candidarmi per la posizione di Infermiere presso il vostro Centro Diurno per Anziani.

La mia ventennale esperienza in ambito geriatrico, maturata sia in contesti ospedalieri che territoriali, mi ha permesso di sviluppare una profonda conoscenza delle problematiche legate all''invecchiamento e delle modalità di assistenza più appropriate. Negli ultimi anni, lavorando nel Servizio di Assistenza Domiciliare, ho affinato la capacità di gestire autonomamente situazioni complesse e di costruire relazioni significative con gli anziani e le loro famiglie.

La vostra cooperativa si distingue per l''attenzione alla qualità dell''assistenza e per l''approccio multidisciplinare, aspetti che condivido pienamente e che considero essenziali per un''assistenza efficace alla persona anziana. La possibilità di lavorare in un contesto diurno, contribuendo al mantenimento dell''anziano nel proprio ambiente familiare, rappresenta per me un valore aggiunto.

Le mie competenze tecniche infermieristiche, unite all''esperienza nella gestione di pazienti con patologie croniche e cognitive, potrebbero essere una risorsa per il vostro team. Sono particolarmente attento agli aspetti relazionali dell''assistenza, convinto che il benessere dell''anziano passi anche attraverso l''ascolto e il rispetto della sua storia e identità.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le vostre esigenze.

Distinti saluti,
Giuseppe Romano', '2025-04-15', '2025-04-08'),

(4, NULL, 1, '2025-03-15', 'in_valutazione', 'Candidatura interna da valutare con priorità. Il candidato ha un''ottima valutazione nel ruolo attuale.', 'Gentile Direzione,

Con la presente desidero candidarmi per la posizione di Coordinatore Pedagogico dei Servizi Prima Infanzia.

Nei miei 15 anni di esperienza all''interno della nostra cooperativa, prima come educatore e poi come coordinatore dei servizi educativi, ho sviluppato una visione pedagogica solida e un approccio al coordinamento basato sulla valorizzazione delle competenze del team e sulla qualità dell''offerta educativa.

La mia formazione continua, unita all''esperienza sul campo, mi ha permesso di acquisire competenze specifiche nella progettazione educativa, nella supervisione pedagogica e nella gestione dei gruppi di lavoro. Ho sempre investito nell''aggiornamento professionale, seguendo percorsi formativi sulla pedagogia della prima infanzia e sul coordinamento di servizi educativi.

In questi anni ho avuto modo di collaborare con diverse équipe educative della nostra cooperativa, sviluppando la capacità di adattare il mio stile di coordinamento alle diverse realtà e di facilitare processi di cambiamento e innovazione. Ho anche curato la relazione con le famiglie e con la rete territoriale, aspetti che ritengo fondamentali per un servizio educativo di qualità.

Sono convinto che i servizi per la prima infanzia rappresentino un ambito strategico per la nostra cooperativa, sia per il valore sociale che esprimono, sia per le potenzialità di sviluppo che offrono. La mia candidatura nasce dal desiderio di contribuire in modo più significativo alla crescita e al miglioramento di questi servizi.

Resto a disposizione per un colloquio in cui approfondire la mia visione pedagogica e le competenze che potrei mettere a disposizione in questo ruolo.

Cordiali saluti,
Giovanni Rossi', '2025-03-25', '2025-03-20'),

(5, 4, NULL, '2025-04-10', 'ricevuta', 'Profilo con esperienza in gestione team, da valutare anche se non ha esperienza specifica in inserimenti lavorativi.', 'Gentile Responsabile della Selezione,

Sono interessato alla posizione di Responsabile Inserimenti Lavorativi presso la vostra cooperativa.

Pur provenendo dal mondo profit, dove ho maturato un''esperienza pluriennale come manager commerciale e consulente organizzativo, ho recentemente deciso di orientare la mia carriera verso il settore sociale, completando un Master in Management delle Imprese Sociali che mi ha fornito le conoscenze teoriche fondamentali per questo passaggio.

Le mie competenze nella gestione di team, nello sviluppo di reti commerciali e nell''analisi organizzativa potrebbero rappresentare un valore aggiunto nel ruolo di Responsabile Inserimenti Lavorativi. La capacità di comprendere le esigenze delle aziende e di costruire relazioni commerciali solide potrebbe facilitare lo sviluppo di nuove opportunità di inserimento per le persone svantaggiate.

La vostra cooperativa si distingue per l''approccio innovativo all''inclusione lavorativa e per la varietà dei settori produttivi in cui opera, elementi che trovo particolarmente stimolanti. Sono motivato a mettere le mie competenze gestionali al servizio di una mission sociale in cui credo profondamente: dare a tutti la possibilità di esprimere le proprie potenzialità attraverso il lavoro.

Sono consapevole che il mio background è diverso da quello tipicamente richiesto per questo ruolo, ma sono convinto che la mia esperienza nel mondo delle imprese, unita a una naturale propensione all''empatia e all''ascolto, possa portare una prospettiva complementare e utile al vostro team.

Sono disponibile a un colloquio per approfondire la mia candidatura e per comprendere meglio le specifiche esigenze della vostra organizzazione.

Cordiali saluti,
Andrea Esposito', '2025-04-20', '2025-04-10'),

(6, 9, NULL, '2025-04-12', 'in_valutazione', 'Candidata con ottime competenze in progettazione e fundraising. Da convocare per un colloquio.', 'Alla cortese attenzione della Direzione,

Sono Elena Lombardi e desidero candidarmi con entusiasmo per la posizione di Responsabile Comunicazione e Fundraising presso la vostra cooperativa.

La mia esperienza come progettista sociale e consulente per diverse organizzazioni del terzo settore mi ha permesso di sviluppare competenze solide sia nell''ambito della comunicazione sociale che del fundraising. Ho gestito campagne di raccolta fondi attraverso diversi canali (fondazioni, aziende, crowdfunding, eventi) e curato la comunicazione di progetti sociali complessi, sviluppando la capacità di tradurre il valore sociale in messaggi efficaci per diversi pubblici.

La vostra cooperativa si distingue per la qualità dei servizi educativi e per l''impegno nell''innovazione sociale, elementi che considero fondamentali nel panorama attuale del terzo settore. La possibilità di contribuire alla crescita e alla sostenibilità di un''organizzazione con questi valori rappresenta per me una sfida stimolante.

Le mie competenze nella scrittura di progetti per bandi pubblici e privati, unite alla capacità di gestire relazioni con stakeholder diversificati e alla conoscenza dei principali strumenti di comunicazione digitale, potrebbero essere una risorsa per diversificare le fonti di finanziamento della cooperativa e aumentarne la visibilità.

Sono una persona creativa, organizzata e orientata agli obiettivi, abituata a lavorare sia in autonomia che in team. La mia naturale propensione alla comunicazione e la capacità di valorizzare l''impatto sociale mi hanno permesso di costruire relazioni solide con donatori e partner in diversi contesti.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le vostre esigenze e obiettivi.

Cordiali saluti,
Elena Lombardi', '2025-04-22', '2025-04-15'),

(7, 3, NULL, '2025-03-30', 'offerta_inviata', 'Candidata perfetta per il ruolo. Offerta inviata il 20/04/2025, in attesa di risposta.', 'Gentile Direzione,

Con la presente desidero candidarmi per la posizione di Assistente Sociale presso i vostri Servizi per Anziani.

La mia esperienza professionale come assistente sociale, maturata sia presso il Comune di Torino che in una cooperativa sociale, mi ha permesso di sviluppare competenze specifiche nel lavoro con la popolazione anziana. Ho seguito casi complessi di anziani non autosufficienti, coordinandomi con la rete dei servizi socio-sanitari e supportando le famiglie nella gestione dell''assistenza.

Il vostro approccio integrato all''assistenza agli anziani, che considera non solo gli aspetti sanitari ma anche quelli sociali e relazionali, corrisponde pienamente alla mia visione professionale. Credo fermamente che il benessere della persona anziana dipenda da un equilibrio tra diversi fattori e che il ruolo dell''assistente sociale sia fondamentale per coordinare gli interventi e valorizzare le risorse personali e familiari.

Le mie competenze nella valutazione multidimensionale dei bisogni, nella progettazione di interventi personalizzati e nel lavoro di rete potrebbero rappresentare un valore aggiunto per il vostro team. Sono particolarmente interessata ai progetti di comunità che la vostra cooperativa sta sviluppando, convinta che la prevenzione dell''isolamento sociale sia un fattore cruciale per la qualità di vita degli anziani.

Sono una persona empatica, organizzata e con ottime capacità comunicative, abituata a lavorare in équipe multidisciplinari e a gestire situazioni complesse con lucidità e sensibilità.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio le specifiche esigenze dei vostri servizi.

Cordiali saluti,
Martina Russo', '2025-04-10', '2025-04-20'),

(8, 2, NULL, '2025-04-18', 'colloquio_fissato', 'Candidato con esperienza pertinente. Colloquio fissato per il 28/04/2025.', 'Spettabile Cooperativa,

Sono interessato alla posizione di Operatore Socio-Assistenziale per i vostri Servizi Domiciliari.

La mia esperienza come OSS, maturata sia in RSA che in servizi domiciliari, mi ha permesso di sviluppare competenze specifiche nell''assistenza a persone non autosufficienti in diversi contesti. Negli ultimi anni, lavorando presso la Cooperativa Sociale Nuovi Percorsi, ho affinato la capacità di operare in autonomia al domicilio degli assistiti, adattandomi alle diverse esigenze e contesti familiari.

Quello che apprezzo maggiormente del lavoro domiciliare è la possibilità di costruire una relazione significativa con l''assistito e la sua famiglia, personalizzando l''intervento sulla base delle specifiche necessità e abitudini. La vostra cooperativa è conosciuta per l''attenzione alla qualità dell''assistenza e alla formazione degli operatori, aspetti che considero fondamentali in questo settore.

Sono una persona paziente, empatica e flessibile, in grado di gestire anche situazioni impreviste con calma e professionalità. La mia capacità di osservazione mi permette di cogliere cambiamenti significativi nelle condizioni dell''assistito e di segnalarli tempestivamente al coordinatore.

Sono disponibile a lavorare su turni, anche nei weekend, e sono automunito. Posso iniziare a lavorare immediatamente e sono disponibile a un periodo di affiancamento iniziale per conoscere le procedure specifiche della vostra cooperativa.

Resto a disposizione per un colloquio in cui poter approfondire la mia candidatura.

Cordiali saluti,
Luca Ferrari', '2025-04-28', '2025-04-20'),

(9, 7, NULL, '2025-05-05', 'ricevuta', 'Candidatura da esaminare. La formazione in psicologia potrebbe essere un plus per il ruolo educativo.', 'Gentile Responsabile della Selezione,

Sono Francesca Ricci, psicologa con specializzazione in età evolutiva, e desidero candidarmi per la posizione di Animatore Socio-Educativo presso il vostro Asilo Nido "Girotondo".

Pur avendo una formazione e un''esperienza principalmente in ambito psicologico, ho sempre avuto un forte interesse per l''educazione nella prima infanzia, convinta che questa fascia d''età sia fondamentale per lo sviluppo futuro del bambino. La mia esperienza nello sportello di ascolto psicologico in ambito scolastico mi ha permesso di collaborare con educatori e insegnanti, sviluppando una buona capacità di lavoro in team educativi.

Le mie competenze nella progettazione di attività adatte allo sviluppo cognitivo, emotivo e relazionale dei bambini potrebbero rappresentare una risorsa per il vostro nido. Sono particolarmente interessata alla possibilità di ideare e condurre laboratori espressivi che favoriscano la creatività e l''espressione emotiva dei bambini, anche molto piccoli.

Sono una persona empatica, paziente e creativa, con una naturale propensione al lavoro con i bambini. La mia formazione psicologica mi ha fornito strumenti utili per l''osservazione del comportamento infantile e per la gestione delle dinamiche relazionali.

La possibilità di lavorare part-time, principalmente nel pomeriggio, si concilia perfettamente con i miei altri impegni professionali. Sono disponibile a iniziare dal prossimo anno educativo e a partecipare alla formazione e alle riunioni d''équipe necessarie per integrarmi al meglio nel vostro team.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio la vostra realtà educativa.

Cordiali saluti,
Francesca Ricci', '2025-05-15', '2025-05-05'),

(10, 5, NULL, '2025-04-25', 'in_valutazione', 'Candidata con ottime competenze linguistiche e interculturali. Da valutare per il ruolo commerciale.', 'Alla cortese attenzione della Direzione,

Desidero candidarmi per la posizione di Addetto Vendite presso il vostro Negozio Equo-solidale nel centro di Firenze.

La mia formazione come mediatrice interculturale e l''esperienza maturata in contesti multiculturali mi hanno fornito competenze che ritengo preziose anche in un contesto commerciale orientato ai valori del commercio equo e solidale. La capacità di comunicare efficacemente con persone di culture diverse e di trasmettere valori e principi etici sono elementi che caratterizzano il mio approccio professionale.

Sono profondamente interessata ai temi dell''economia solidale, del consumo consapevole e del rispetto per le diversità culturali, valori che il commercio equo promuove concretamente. La possibilità di contribuire a questa missione, sensibilizzando i clienti su questi temi, rappresenta per me una motivazione forte.

Le mie competenze linguistiche (italiano, arabo, francese e inglese) potrebbero essere un valore aggiunto per relazionarmi con la clientela internazionale di Firenze. Sono una persona comunicativa, empatica e con una naturale predisposizione all''accoglienza, caratteristiche che ritengo importanti nel ruolo di addetto vendite.

Non ho una specifica esperienza nella vendita al dettaglio, ma sono una persona versatile, con una buona capacità di apprendimento e motivata a formarmi in questo ambito. Sono disponibile a lavorare nei weekend e in orari festivi, con la flessibilità richiesta dal ruolo.

Sono disponibile a un colloquio per approfondire la mia candidatura e conoscere meglio la vostra realtà.

Cordiali saluti,
Valentina Marino', '2025-05-10', '2025-04-28');

-- Inserimento di colloqui
INSERT INTO colloqui (id_candidatura, data_ora, tipo, luogo, id_utente, stato, valutazione, note_intervistatore, feedback_candidato, decisione, data_decisione) VALUES
(3, '2025-04-15 10:00:00', 'di_persona', 'Sede Centrale Roma, Via Garibaldi 78', 3, 'completato', 5,
'Il candidato ha dimostrato ottime competenze tecniche e un''esperienza molto pertinente nel settore geriatrico. Durante il colloquio ha mostrato grande empatia nel parlare degli anziani e ha proposto approcci innovativi per migliorare la qualità dell''assistenza nel centro diurno. Ha risposto in modo esauriente a tutte le domande tecniche e ha mostrato una buona conoscenza della normativa del settore. Ha anche fatto domande pertinenti sull''organizzazione del lavoro e sul team infermieristico. Mi ha colpito particolarmente la sua attenzione agli aspetti relazionali dell''assistenza e la sua visione olistica della cura.',
'Il candidato ha espresso un feedback molto positivo sul colloquio. Ha apprezzato la descrizione dettagliata del servizio e la chiarezza sui compiti e le responsabilità. Ha trovato l''ambiente accogliente e ha avuto un''impressione positiva del team. È rimasto particolarmente colpito dall''approccio multidisciplinare e dalla centralità data alla persona anziana.',
'accettato',
'2025-04-18'),

(7, '2025-04-10 15:30:00', 'videochiamata', 'Piattaforma Zoom', 2, 'completato', 5,
'La candidata ha dimostrato una preparazione eccellente e un''esperienza molto pertinente nel lavoro con gli anziani. Ha mostrato una conoscenza approfondita dei servizi territoriali e delle modalità di presa in carico multidimensionale. Durante il colloquio ha portato esempi concreti di casi seguiti e soluzioni trovate, dimostrando capacità di problem solving e di lavoro in rete. Mi ha colpito la sua sensibilità verso le problematiche degli anziani fragili e la sua visione dell''assistente sociale come figura di raccordo tra diversi servizi e risorse. Ha mostrato anche buone capacità organizzative e autonomia professionale.',
'La candidata ha dato un feedback molto positivo sul colloquio. Ha apprezzato la presentazione dettagliata dei servizi e dei progetti futuri della cooperativa. Ha trovato il colloquio stimolante e ha avuto l''impressione di un ambiente di lavoro dinamico e orientato alla qualità. Ha espresso particolare interesse per i progetti di comunità e per l''approccio integrato ai bisogni dell''anziano.',
'accettato',
'2025-04-15'),

(8, '2025-04-28 09:30:00', 'di_persona', 'Sede Centrale Bologna, Via Dante 45', 4, 'programmato', NULL, NULL, NULL, NULL, NULL);

-- Inserimento di documenti allegati
INSERT INTO documenti (id_candidato, id_dipendente, tipo, nome_file, percorso_file, data_caricamento, descrizione, contenuto_testuale) VALUES
(1, NULL, 'cv', 'CV_Sofia_Bianchi.pdf', '/storage/documenti/candidati/1/CV_Sofia_Bianchi.pdf', '2025-03-18', 'Curriculum Vitae aggiornato', 'CURRICULUM VITAE

INFORMAZIONI PERSONALI
Nome: Sofia Bianchi
Data di nascita: 14/07/1992
Indirizzo: Via Montenapoleone 12, 20121 Milano
Telefono: 333 1234567
Email: sofia.bianchi@email.it
LinkedIn: linkedin.com/in/sofiabianchi

PROFILO PROFESSIONALE
Educatrice professionale con formazione in Scienze dell''Educazione e esperienza nel supporto a minori con bisogni educativi speciali. Competenze nella progettazione di interventi educativi personalizzati, nell''utilizzo di metodologie inclusive e nella gestione di gruppi. Sensibilità, empatia e capacità di costruire relazioni educative significative caratterizzano il mio approccio professionale.

ESPERIENZE PROFESSIONALI

Educatrice di supporto
Scuola Primaria G. Rodari - Milano
Gennaio 2022 - Presente
• Supporto educativo individuale e di gruppo per bambini con bisogni educativi speciali
• Collaborazione con insegnanti nella progettazione di attività inclusive
• Mediazione nei conflitti e facilitazione delle relazioni nel gruppo classe
• Implementazione di un progetto di peer tutoring per favorire l''inclusione
• Sviluppo di materiali didattici personalizzati per diversi stili di apprendimento

Tirocinante Educatrice
Cooperativa Sociale Arcobaleno - Milano
Marzo 2021 - Settembre 2021
• Affiancamento agli educatori nelle attività quotidiane presso un centro educativo per minori
• Partecipazione alla progettazione e realizzazione di laboratori creativi
• Osservazione e documentazione dei casi seguiti
• Sviluppo di un laboratorio di narrazione creativa per adolescenti
• Partecipazione alle riunioni d''équipe e alla supervisione

Educatrice Volontaria
Associazione Amici dei Bambini - Milano
Settembre 2018 - Giugno 2020
• Attività di supporto educativo e animatrice');

-- Inserimento di offerte di lavoro
INSERT INTO offerte_lavoro (id_offerta,id_organizzazione, id_sede, id_posizione, titolo, descrizione, requisiti, responsabilita, tipo_contratto, durata_contratto, stipendio_min, stipendio_max, benefit, data_pubblicazione, data_scadenza, stato, lavoro_remoto, full_time, disponibilita_immediata, interno_esterno, priorita, note_interne) VALUES
(1,1, 2, 1, 'E  ducatore Professionale per Centro Educativo',
'La Cooperativa Sociale Nuovi Orizzonti cerca un Educatore Professionale da inserire nel proprio Centro Educativo di Lambrate (Milano), che offre servizi di supporto scolastico, laboratori espressivi e attività ricreative per minori dai 6 ai 14 anni, con particolare attenzione a situazioni di fragilità sociale e difficoltà di apprendimento.

Il Centro è attivo dal lunedì al venerdì, dalle 14:00 alle 18:00, con possibili attività straordinarie nei weekend. Durante il periodo estivo, vengono organizzati centri estivi con orario giornaliero completo.

L''educatore selezionato lavorerà in un team multidisciplinare composto da altri educatori, psicologi e volontari, in stretta collaborazione con le scuole e i servizi sociali del territorio.',
'Requisiti richiesti:
- Laurea in Scienze dell''Educazione (L-19) o titolo equipollente
- Esperienza di almeno 1 anno in contesti educativi simili
- Capacità di progettazione educativa individualizzata
- Competenze nella gestione di gruppi di minori
- Conoscenza delle principali problematiche dell''età evolutiva
- Buone capacità relazionali e di lavoro in équipe
- Flessibilità oraria
- Automunito (preferenziale)

Competenze specifiche apprezzate:
- Esperienza nel lavoro con minori con disturbi dell''apprendimento
- Competenze in ambito artistico, musicale o sportivo
- Conoscenza della rete dei servizi territoriali',
'Principali responsabilità:
- Progettazione e realizzazione di attività educative individuali e di gruppo
- Supporto scolastico e aiuto nei compiti
- Conduzione di laboratori espressivi e ricreativi
- Gestione delle relazioni con le famiglie e la rete dei servizi
- Monitoraggio e documentazione dei percorsi educativi
- Partecipazione alle riunioni d''équipe e alla supervisione
- Collaborazione nella programmazione generale del servizio',
'Tempo determinato con possibilità di rinnovo',
'12 mesi',
1400.00,
1600.00,
'- Formazione continua e supervisione
- Possibilità di partecipazione a progetti innovativi
- Ambiente di lavoro stimolante e collaborativo
- Flessibilità oraria compatibile con esigenze personali',
'2025-03-15',
'2025-04-30',
'aperta',
FALSE,
FALSE,
TRUE,
'esterno',
5,
'Posizione da coprire con urgenza per sostituzione maternità. Preferire candidati con esperienza nel lavoro con minori con DSA. Il candidato dovrà essere disponibile a iniziare entro maggio 2025.'),

(2,2, 4, 21, 'Operatore di Laboratorio Artigianale per Inserimenti Lavorativi',
'La Cooperativa Sociale Il Girasole cerca un Operatore di Laboratorio Artigianale per il proprio Centro Verde di Bologna, finalizzato all''inserimento lavorativo di persone con disabilità o in situazione di svantaggio sociale.

Il laboratorio si occupa della produzione artigianale di oggettistica in legno, ceramica e materiali riciclati, destinati alla vendita nei mercati locali e nel negozio della cooperativa.

L''operatore selezionato avrà il compito di coordinare le attività produttive, gestendo al contempo i percorsi formativi e di inserimento lavorativo delle persone svantaggiate inserite nel laboratorio.',
'Requisiti richiesti:
- Esperienza in lavorazioni artigianali (legno, ceramica, materiali di riciclo)
- Capacità di insegnare tecniche artigianali a persone con diverse abilità
- Sensibilità alle tematiche sociali e dell''inclusione
- Capacità di gestione di piccoli gruppi di lavoro
- Flessibilità e problem solving
- Patente B

Titoli preferenziali:
- Formazione in ambito educativo o sociale
- Esperienza pregressa in cooperative sociali o enti del terzo settore
- Competenze in ambito commerciale e di marketing
- Competenze nella progettazione di oggetti di design',
'Principali responsabilità:
- Coordinamento tecnico delle attività produttive del laboratorio
- Formazione e affiancamento delle persone in inserimento lavorativo
- Progettazione di nuovi prodotti e linee di produzione
- Controllo qualità dei prodotti
- Gestione del magazzino e degli approvvigionamenti
- Partecipazione a mercati ed eventi di promozione
- Collaborazione con l''équipe socio-educativa per il monitoraggio dei percorsi di inserimento
- Documentazione delle attività svolte',
'Tempo indeterminato',
NULL,
1500.00,
1700.00,
'- Orario flessibile
- Ambiente di lavoro inclusivo e creativo
- Possibilità di sviluppo professionale
- Partecipazione a fiere e eventi del settore artigianale',
'2025-03-20',
'2025-04-25',
'aperta',
FALSE,
TRUE,
TRUE,
'esterno',
4,
'Cerchiamo una persona con solide competenze tecniche ma anche con spiccate capacità relazionali e sensibilità verso l''inclusione. Il candidato ideale dovrebbe avere spirito imprenditoriale e creatività per sviluppare nuove linee di prodotti.'),

(3,3, 6, 9, 'Infermiere per Centro Diurno Anziani',
'La Cooperativa Sociale Insieme Si Può cerca un Infermiere da inserire nel proprio Centro Diurno per Anziani a Roma (zona Trastevere), che accoglie quotidianamente 30 persone anziane con diversi livelli di autonomia e necessità assistenziali.

Il Centro è aperto dal lunedì al venerdì, dalle 8:00 alle 18:00, e offre servizi di assistenza, animazione, riabilitazione e supporto alle famiglie.

L''infermiere selezionato sarà responsabile dell''assistenza sanitaria agli ospiti, in collaborazione con l''équipe multidisciplinare composta da OSS, fisioterapisti, animatori e assistente sociale.',
'Requisiti richiesti:
- Laurea in Infermieristica e iscrizione all''Ordine professionale
- Esperienza di almeno 2 anni in ambito geriatrico
- Conoscenza delle principali patologie dell''anziano
- Capacità di lavorare in équipe multidisciplinare
- Buone capacità relazionali con l''utenza fragile e i familiari
- Disponibilità a lavorare su turni diurni

Competenze specifiche apprezzate:
- Esperienza in servizi territoriali o domiciliari
- Formazione specifica in ambito geriatrico
- Conoscenza di tecniche di animazione e stimolazione cognitiva
- Esperienza nella gestione delle demenze',
'Principali responsabilità:
- Pianificazione e gestione dell''assistenza infermieristica
- Somministrazione delle terapie prescritte
- Monitoraggio dei parametri vitali e dello stato di salute
- Medicazioni e altre prestazioni infermieristiche
- Gestione della documentazione sanitaria
- Collaborazione con i medici di base degli ospiti
- Educazione sanitaria rivolta agli ospiti e ai familiari
- Partecipazione alla definizione dei progetti assistenziali individualizzati
- Supervisione del lavoro degli OSS per gli aspetti sanitari',
'Tempo indeterminato',
NULL,
1600.00,
1800.00,
'- Orario di lavoro diurno (no notti)
- Formazione continua e aggiornamento professionale
- Possibilità di crescita professionale
- Ambiente di lavoro collaborativo',
'2025-04-01',
'2025-05-05',
'aperta',
FALSE,
TRUE,
FALSE,
'entrambi',
3,
'Cerchiamo una figura con esperienza specifica nell''assistenza agli anziani e con buone capacità relazionali. La posizione prevede un inserimento in un team consolidato che lavora in modo integrato. Valutare anche eventuali candidature interne di OSS che hanno conseguito la laurea in infermieristica.'),

(4,4, 7, 17, 'Coordinatore Pedagogico Servizi Prima Infanzia',
'La Cooperativa Sociale Arcobaleno cerca un Coordinatore Pedagogico per i propri servizi educativi per la prima infanzia a Torino, che includono 2 asili nido (per un totale di 60 bambini) e 1 centro gioco (che accoglie bambini dai 18 ai 36 mesi con i loro genitori).

Il coordinatore pedagogico avrà il compito di garantire la qualità educativa dei servizi, supervisionando il lavoro delle équipe educative e curando i rapporti con le famiglie e la rete territoriale.

Si tratta di un ruolo chiave all''interno dell''organizzazione, che risponde direttamente alla Direzione della cooperativa e partecipa alla definizione delle strategie educative complessive.',
'Requisiti richiesti:
- Laurea Magistrale in Scienze Pedagogiche o Scienze dell''Educazione
- Esperienza di almeno 3 anni in ruoli di coordinamento di servizi educativi
- Conoscenza approfondita delle teorie e metodologie per la prima infanzia
- Competenze nella progettazione educativa e nella valutazione della qualità
- Capacità di gestione e coordinamento del personale
- Ottime capacità relazionali e comunicative
- Conoscenza della normativa di settore
- Patente B

Titoli preferenziali:
- Master o formazione specialistica in coordinamento pedagogico
- Esperienza in processi di accreditamento e certificazione qualità
- Pubblicazioni o docenze in ambito educativo
- Esperienza nella formazione di personale educativo',
'Principali responsabilità:
- Supervisione pedagogica delle équipe educative
- Progettazione e programmazione educativa dei servizi
- Monitoraggio e valutazione della qualità dei servizi
- Formazione e aggiornamento del personale educativo
- Gestione dei rapporti con le famiglie e conduzione di incontri tematici
- Coordinamento con i servizi territoriali (servizi sociali, neuropsichiatria infantile, ecc.)
- Gestione delle relazioni con gli enti pubblici (Comune, Regione)
- Partecipazione a tavoli di coordinamento territoriale
- Supervisione della documentazione educativa
- Collaborazione nella progettazione di nuovi servizi',
'Tempo indeterminato',
NULL,
2000.00,
2400.00,
'- Auto aziendale per spostamenti tra le sedi
- Formazione specialistica continua
- Partecipazione a convegni e seminari di settore
- Flessibilità oraria
- Possibilità di smart working parziale',
'2025-03-10',
'2025-04-20',
'aperta',
TRUE,
TRUE,
FALSE,
'entrambi',
4,
'Figura strategica per lo sviluppo dei nostri servizi educativi. Cerchiamo una persona con solide competenze pedagogiche ma anche con capacità gestionali e di innovazione. Oltre alla supervisione dei servizi esistenti, il coordinatore sarà coinvolto nella progettazione di nuovi servizi sperimentali per l''infanzia.'),

(5,5, 9, 28, 'Responsabile Inserimenti Lavorativi',
'La Cooperativa Sociale Mani Tese cerca un Responsabile Inserimenti Lavorativi per coordinare e sviluppare i percorsi di inclusione lavorativa di persone svantaggiate all''interno delle proprie attività produttive (laboratorio artigianale, negozio equo-solidale, servizi di manutenzione del verde, servizi di pulizia).

La figura selezionata avrà la responsabilità di progettare e monitorare i percorsi individuali di inserimento lavorativo, in collaborazione con i servizi invianti e le aziende partner del territorio, e di coordinare il lavoro dei tutor che seguono direttamente le persone inserite.

Si tratta di un ruolo chiave per la mission della cooperativa, che richiede competenze sia in ambito sociale che in ambito organizzativo e gestionale.',
'Requisiti richiesti:
- Laurea in ambito sociale, educativo o psicologico
- Esperienza di almeno 3 anni nel settore dell''inserimento lavorativo di persone svantaggiate
- Conoscenza della normativa sul lavoro e sull''inclusione lavorativa
- Competenze nella progettazione e gestione di percorsi individualizzati
- Capacità di networking e di relazione con enti pubblici e aziende
- Ottime doti organizzative e di pianificazione
- Capacità di coordinamento di team di lavoro
- Buona conoscenza dei principali strumenti informatici
- Patente B

Titoli preferenziali:
- Formazione specifica in politiche attive del lavoro
- Esperienza nella gestione di progetti finanziati
- Conoscenza del mercato del lavoro locale
- Esperienza in ambito di formazione professionale',
'Principali responsabilità:
- Progettazione e monitoraggio dei percorsi di inserimento lavorativo
- Coordinamento del team di tutor per l''inserimento lavorativo
- Gestione delle relazioni con i servizi sociali, sanitari e per l''impiego
- Sviluppo e mantenimento della rete di aziende partner
- Ricerca di opportunità lavorative interne ed esterne
- Matching tra caratteristiche delle persone e mansioni lavorative
- Gestione degli aspetti burocratici e documentali legati agli inserimenti
- Monitoraggio e valutazione dell''efficacia dei percorsi
- Partecipazione a bandi e progetti per il finanziamento degli inserimenti
- Reporting alla direzione sull''andamento delle attività',
'Tempo indeterminato',
NULL,
1800.00,
2200.00,
'- Auto aziendale per gli spostamenti di lavoro
- Formazione specialistica
- Smartphone aziendale
- Flessibilità oraria
- Possibilità di smart working parziale',
'2025-04-05',
'2025-05-10',
'aperta',
TRUE,
TRUE,
FALSE,
'esterno',
4,
'Cerchiamo una figura con forte orientamento al risultato ma anche con sensibilità sociale. Il candidato ideale deve saper coniugare le esigenze produttive con i bisogni delle persone inserite. È importante che abbia una buona rete di contatti sul territorio e capacità di sviluppare nuove partnership con aziende.'),

(6,1, 1, 29, 'Responsabile Comunicazione e Fundraising',
'La Cooperativa Sociale Nuovi Orizzonti cerca un Responsabile Comunicazione e Fundraising che coordini le attività di comunicazione interna ed esterna e sviluppi strategie di raccolta fondi per sostenere i progetti sociali della cooperativa.

La figura selezionata avrà il compito di aumentare la visibilità della cooperativa, valorizzarne l''impatto sociale e diversificare le fonti di finanziamento, riducendo la dipendenza dai fondi pubblici.

Si tratta di un ruolo strategico che risponde direttamente alla Direzione e collabora con i responsabili delle diverse aree di servizio.',
'Requisiti richiesti:
- Laurea in comunicazione, marketing, economia o discipline affini
- Esperienza di almeno 2 anni in ruoli simili, preferibilmente nel terzo settore
- Competenze in digital marketing e social media management
- Capacità di scrittura efficace per diversi canali e target
- Conoscenza delle principali tecniche di fundraising
- Capacità di progettazione e gestione di campagne di comunicazione e raccolta fondi
- Ottima conoscenza della lingua inglese
- Buone capacità relazionali e di public speaking
- Attitudine al lavoro per obiettivi

Titoli preferenziali:
- Master o formazione specialistica in fundraising o comunicazione sociale
- Esperienza nella gestione di progetti europei
- Conoscenza di software di grafica e video editing
- Rete di contatti con media e potenziali donatori',
'Principali responsabilità:
- Elaborazione e implementazione del piano di comunicazione
- Gestione dei canali social e del sito web della cooperativa
- Redazione di contenuti per diversi canali (newsletter, blog, comunicati stampa)
- Organizzazione di eventi di promozione e raccolta fondi
- Sviluppo e gestione delle relazioni con i media
- Elaborazione di strategie di fundraising mirate a diversi target
- Redazione di proposte progettuali per fondazioni e aziende
- Gestione delle campagne di crowdfunding e di raccolta fondi online
- Cura dell''immagine coordinata della cooperativa
- Misurazione e reportistica dei risultati delle attività di comunicazione e fundraising',
'Tempo determinato con possibilità di trasformazione',
'12 mesi',
1800.00,
2200.00,
'- Bonus legato al raggiungimento degli obiettivi di raccolta fondi
- Formazione specialistica
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
'Figura nuova all''interno dell''organigramma, creata per rispondere alla necessità di diversificare le fonti di finanziamento e aumentare la visibilità della cooperativa. Cerchiamo una persona creativa e dinamica, con esperienza nel terzo settore e capacità di lavorare in modo autonomo.'),

(7,3, 5, 7, 'Assistente Sociale per Servizi Anziani',
'La Cooperativa Sociale Insieme Si Può cerca un Assistente Sociale da inserire nel proprio team dei Servizi per Anziani, che include un centro diurno, servizi di assistenza domiciliare e progetti di comunità rivolti alla popolazione anziana.

La figura selezionata si occuperà della valutazione dei bisogni, della progettazione degli interventi individualizzati e del coordinamento con la rete dei servizi territoriali, con l''obiettivo di garantire la miglior qualità di vita possibile agli anziani seguiti.

Il ruolo prevede un approccio integrato che considera gli aspetti sociali, sanitari, relazionali e ambientali che influiscono sul benessere della persona anziana.',
'Requisiti richiesti:
- Laurea in Servizio Sociale e iscrizione all''Albo professionale
- Esperienza di almeno 2 anni nel lavoro con persone anziane
- Conoscenza della rete dei servizi socio-sanitari per anziani
- Capacità di valutazione multidimensionale dei bisogni
- Competenze nella progettazione di interventi individualizzati
- Buone capacità di lavoro in équipe multidisciplinare
- Conoscenza della normativa di settore
- Patente B

Titoli preferenziali:
- Specializzazione o formazione in ambito gerontologico
- Esperienza nella gestione di casi complessi (demenze, non autosufficienza)
- Conoscenza di strumenti di valutazione geriatrica
- Esperienza in progetti di comunità e di prevenzione dell''isolamento',
'Principali responsabilità:
- Valutazione sociale e dei bisogni degli anziani e delle loro famiglie
- Elaborazione e monitoraggio di progetti assistenziali individualizzati
- Gestione delle relazioni con la rete dei servizi territoriali
- Coordinamento con l''équipe multidisciplinare interna
- Supporto e consulenza alle famiglie sulle risorse disponibili
- Attivazione di servizi e interventi appropriati
- Gestione della documentazione sociale e delle pratiche amministrative
- Partecipazione a progetti di comunità per la popolazione anziana
- Monitoraggio della qualità dei servizi erogati
- Contributo allo sviluppo di nuovi servizi innovativi per anziani',
'Tempo indeterminato',
NULL,
1700.00,
2000.00,
'- Auto aziendale per visite domiciliari
- Formazione continua e supervisione professionale
- Smartphone aziendale
- Flessibilità oraria',
'2025-03-25',
'2025-04-30',
'aperta',
FALSE,
TRUE,
FALSE,
'esterno',
3,
'Cerchiamo un professionista con specifica esperienza nel settore anziani e con una visione innovativa dei servizi. È importante che il candidato abbia capacità di lavoro in rete e una buona conoscenza del territorio. La posizione prevede sia lavoro d''ufficio che visite domiciliari presso gli anziani seguiti.'),

(8,2, 3, 6, 'Operatore Socio-Assistenziale per Servizi Domiciliari',
'La Cooperativa Sociale Il Girasole cerca Operatori Socio-Assistenziali (OSA) da inserire nel proprio Servizio di Assistenza Domiciliare rivolto ad anziani, persone con disabilità e persone in situazione di fragilità temporanea.

Gli operatori selezionati forniranno assistenza di base presso il domicilio degli utenti, contribuendo al mantenimento della loro autonomia e qualità di vita nella propria casa.

Il servizio è attivo 7 giorni su 7, con turni distribuiti nell''arco della giornata in base alle esigenze degli utenti.',
'Requisiti richiesti:
- Qualifica professionale di Operatore Socio-Assistenziale o Operatore Socio-Sanitario
- Esperienza, anche minima, nell''assistenza domiciliare
- Capacità di relazione con persone fragili
- Attitudine al lavoro in autonomia
- Affidabilità e puntualità
- Flessibilità oraria
- Patente B e auto propria

Titoli preferenziali:
- Esperienza specifica con anziani non autosufficienti
- Formazione in tecniche di mobilizzazione
- Conoscenza di una seconda lingua (per assistenza a persone straniere)
- Disponibilità a lavorare nei weekend e in orari serali',
'Principali responsabilità:
- Assistenza nelle attività di vita quotidiana (igiene personale, alimentazione, mobilizzazione)
- Supporto nella gestione domestica (preparazione pasti, pulizia ambienti, commissioni)
- Accompagnamento dell''utente per visite mediche o attività esterne
- Monitoraggio delle condizioni generali dell''utente
- Segnalazione tempestiva di cambiamenti o problematiche al coordinatore
- Compilazione della documentazione di servizio
- Partecipazione alle riunioni di équipe e alla formazione
- Collaborazione con familiari e altri operatori coinvolti',
'Tempo determinato con possibilità di trasformazione',
'6 mesi',
1300.00,
1500.00,
'- Rimborso chilometrico per gli spostamenti di servizio
- Formazione continua
- Supervisione e supporto psicologico
- Possibilità di definire turni compatibili con esigenze personali',
'2025-04-15',
'2025-05-20',
'aperta',
FALSE,
FALSE,
TRUE,
'esterno',
5,
'Cerchiamo più figure (3-4 operatori) per ampliamento del servizio. Importante la disponibilità a lavorare in diverse zone della città e con flessibilità oraria. Gli operatori selezionati dovranno dimostrare capacità di lavorare in autonomia ma anche di coordinarsi efficacemente con il resto dell''équipe.'),

(9,4, 8, 2, 'Animatore Socio-Educativo per Asilo Nido',
'La Cooperativa Sociale Arcobaleno cerca un Animatore Socio-Educativo da inserire nel proprio Asilo Nido "Girotondo" di Torino, che accoglie bambini dai 3 ai 36 mesi.

La figura selezionata si occuperà di attività di animazione e di supporto al team educativo, contribuendo alla realizzazione del progetto pedagogico del servizio.

L''asilo è aperto dal lunedì al venerdì, dalle 7:30 alle 18:30, e l''animatore sarà inserito con un orario part-time, principalmente nella fascia pomeridiana.',
'Requisiti richiesti:
- Diploma in ambito educativo o sociale
- Esperienza, anche di tirocinio, con bambini nella fascia 0-3 anni
- Capacità creativa e propositiva nell''ideazione di attività
- Attitudine al lavoro in team
- Empatia e pazienza
- Disponibilità al lavoro pomeridiano e ad occasionali sostituzioni in orario mattutino

Titoli preferenziali:
- Formazione specifica in ambito di animazione o educazione
- Competenze artistiche, musicali o motorie da utilizzare nelle attività
- Esperienza in servizi educativi per l''infanzia
- Conoscenza di approcci pedagogici per la prima infanzia',
'Principali responsabilità:
- Supporto alle educatrici nelle attività quotidiane con i bambini
- Progettazione e realizzazione di laboratori ludico-espressivi
- Cura degli spazi e dei materiali educativi
- Collaborazione nella preparazione di feste ed eventi
- Partecipazione alle riunioni d''équipe
- Documentazione delle attività svolte attraverso foto e brevi relazioni
- Supporto nella relazione con le famiglie
- Partecipazione alla formazione del servizio',
'Tempo determinato con possibilità di trasformazione',
'10 mesi (anno educativo)',
800.00,
1000.00,
'- Part-time 25 ore settimanali
- Formazione continua
- Ambiente di lavoro stimolante e creativo
- Possibilità di crescita professionale',
'2025-05-01',
'2025-06-15',
'aperta',
FALSE,
FALSE,
FALSE,
'esterno',
3,
'Cerchiamo una figura con spiccate doti creative e relazionali che possa arricchire l''offerta educativa del nido nel pomeriggio, quando molti bambini sono ancora presenti e le attività assumono un carattere più ludico e laboratoriale. La posizione è inizialmente per l''anno educativo 2025-2026, con possibilità di stabilizzazione.'),

(10,5, 10, 4, 'Addetto Vendite Negozio Equo-solidale',
'La Cooperativa Sociale Mani Tese cerca un Addetto Vendite per il proprio Negozio Equo-solidale nel centro di Firenze, che commercializza prodotti del commercio equo e solidale, artigianato locale realizzato nel laboratorio della cooperativa e prodotti biologici.

La figura selezionata si occuperà della vendita e della promozione dei prodotti, contribuendo alla missione sociale della cooperativa attraverso la sensibilizzazione dei clienti sui temi dell''economia solidale e del consumo responsabile.

Il negozio è aperto dal martedì alla domenica, con orario 10:00-19:00.',
'Requisiti richiesti:
- Diploma di scuola superiore
- Esperienza, anche minima, nella vendita al dettaglio
- Interesse per i temi del commercio equo-solidale e dell''economia sociale
- Buone capacità relazionali e comunicative
- Disponibilità a lavorare nei weekend e in orari festivi
- Conoscenza base della lingua inglese
- Capacità di utilizzo del registratore di cassa e di sistemi informatici di base

Titoli preferenziali:
- Esperienza nel settore del commercio equo-solidale
- Conoscenza dei principi e dei prodotti del commercio equo
- Competenze in visual merchandising
- Conoscenza di una seconda lingua straniera
- Esperienza in attività di sensibilizzazione e educazione al consumo responsabile',
'Principali responsabilità:
- Assistenza e consulenza alla clientela
- Gestione della cassa e dei pagamenti
- Allestimento del negozio e vetrine
- Gestione del magazzino e degli ordini
- Controllo delle scadenze dei prodotti alimentari
- Promozione dei valori e principi del commercio equo
- Partecipazione a mercatini ed eventi esterni
- Supporto nell''organizzazione di eventi di sensibilizzazione
- Collaborazione con i volontari che supportano il negozio
- Reporting sull''andamento delle vendite',
'Tempo determinato con possibilità di trasformazione',
'12 mesi',
1200.00,
1400.00,
'- Sconto sui prodotti del negozio
- Formazione sui temi del commercio equo
- Possibilità di partecipare a viaggi di conoscenza presso i produttori
- Ambiente di lavoro stimolante e in linea con valori etici',
'2025-04-20',
'2025-05-25',
'aperta',
FALSE,FALSE,TRUE,'interno',2,' Principali aree di studio: progettazione e valutazione dei servizi sociali, management dei servizi, politiche sociali europee, metodologia della ricerca sociale.');

-- Inserimento di competenze dei candidati
INSERT INTO competenze_candidati (id_candidato, id_competenza, livello, anni_esperienza, descrizione) VALUES
(1, 1, 4, 3, 'Ho sviluppato questa competenza durante il lavoro con bambini con difficoltà di apprendimento, imparando ad ascoltare attentamente non solo le parole ma anche il linguaggio non verbale. L''ascolto attivo mi permette di comprendere meglio i bisogni educativi e le dinamiche relazionali.'),
(1, 2, 5, 3, 'L''empatia è una delle mie competenze più sviluppate, che mi consente di entrare in sintonia con i bambini e le loro famiglie. Riesco a percepire stati d''animo e necessità anche non espresse verbalmente, creando un clima di fiducia reciproca.'),
(1, 3, 4, 3, 'Ho sempre lavorato in team multidisciplinari, contribuendo attivamente al raggiungimento degli obiettivi comuni. So adattare il mio ruolo alle necessità del gruppo e condividere conoscenze e risorse.'),
(1, 6, 4, 3, 'Ho sviluppato buone capacità comunicative sia con i bambini che con colleghi e famiglie. So adattare il mio linguaggio ai diversi interlocutori e utilizzo efficacemente sia la comunicazione verbale che quella scritta.'),
(1, 9, 5, 3, 'La mia formazione universitaria e l''esperienza sul campo mi hanno permesso di acquisire diverse metodologie educative che so applicare in modo flessibile in base ai bisogni specifici dei bambini e del contesto.'),
(1, 10, 4, 2, 'Ho progettato e condotto numerosi laboratori creativi e attività di animazione per gruppi di diverse età. Utilizzo giochi cooperativi, tecniche artistiche e narrative per favorire la socializzazione e l''apprendimento.'),

(2, 4, 5, 8, 'Nel lavoro assistenziale ho sviluppato un''alta capacità di gestire lo stress, mantenendo la calma e la lucidità anche in situazioni di emergenza o particolarmente impegnative dal punto di vista emotivo.'),
(2, 7, 4, 8, 'L''assistenza a persone con diverse patologie e necessità mi ha reso estremamente flessibile e capace di adattarmi rapidamente a situazioni nuove e impreviste.'),
(2, 12, 5, 8, 'Ho acquisito tecniche specifiche per l''assistenza di base a persone non autosufficienti, dal supporto nell''igiene personale alla mobilizzazione, dall''alimentazione alla gestione dell''ambiente di vita.'),
(2, 15, 4, 5, 'Sono formato e aggiornato sulle tecniche di primo soccorso e sulla gestione delle emergenze sanitarie di base. So riconoscere tempestivamente i segnali di criticità e attivare le procedure appropriate.'),
(2, 24, 3, 3, 'Conosco e applico la normativa sulla sicurezza nei luoghi di lavoro, con particolare attenzione alla prevenzione dei rischi nel settore assistenziale (movimentazione carichi, rischi biologici, ecc.).'),
(2, 33, 4, 8, 'Ho sviluppato la capacità di gestire situazioni conflittuali, sia tra pazienti che tra colleghi, utilizzando tecniche di mediazione e comunicazione assertiva.'),

(3, 1, 5, 7, 'L''ascolto attivo è alla base del mio approccio professionale come assistente sociale. Ho affinato questa competenza attraverso la pratica quotidiana e la formazione continua, imparando a cogliere bisogni e risorse non sempre esplicitati.'),
(3, 5, 5, 7, 'Il lavoro sociale mi ha portato ad affrontare quotidianamente situazioni problematiche complesse, sviluppando un approccio sistematico all''analisi dei problemi e alla ricerca di soluzioni sostenibili e personalizzate.'),
(3, 6, 4, 7, 'Ho sviluppato una comunicazione efficace con utenti di diverse età e background culturali, adattando il mio stile comunicativo alle diverse situazioni e verificando sempre la comprensione reciproca.'),
(3, 11, 4, 5, 'Nel mio lavoro gestisco regolarmente gruppi di utenti diversificati (famiglie, adolescenti, gruppi di supporto), facilitando le dinamiche relazionali e orientando il gruppo verso obiettivi condivisi.'),
(3, 21, 5, 5, 'Ho acquisito competenze avanzate nella progettazione di interventi sociali, dall''analisi dei bisogni alla definizione degli obiettivi, dalla pianificazione delle attività alla valutazione dei risultati.'),
(3, 23, 4, 7, 'Conosco approfonditamente la normativa relativa alle politiche sociali, ai servizi alla persona e ai diritti dei soggetti fragili, competenza che utilizzo quotidianamente nel mio lavoro.'),
(3, 33, 5, 7, 'La gestione dei conflitti è una competenza che ho sviluppato in modo particolare nel lavoro con famiglie multiproblematiche, imparando a mediare tensioni e a facilitare la comunicazione in situazioni ad alto contenuto emotivo.'),

(4, 5, 5, 15, 'Ho sviluppato un approccio analitico e strutturato alla risoluzione dei problemi, scomponendo questioni complesse in elementi più semplici e identificando soluzioni praticabili anche in contesti ad alta complessità.'),
(4, 6, 5, 15, 'Le mie capacità comunicative sono state affinate in contesti professionali diversificati, dalla negoziazione commerciale alla presentazione di progetti complessi, dalla gestione di relazioni interpersonali alla comunicazione organizzativa.'),
(4, 8, 5, 12, 'Ho coordinato team di dimensioni variabili sviluppando uno stile di leadership partecipativo ma orientato ai risultati, che valorizza i talenti individuali e promuove la responsabilizzazione.'),
(4, 16, 4, 15, 'La mia formazione economica e l''esperienza professionale mi hanno fornito solide competenze contabili e finanziarie, dalla gestione del budget all''analisi di bilancio, dal controllo di gestione alla pianificazione finanziaria.'),
(4, 19, 5, 15, 'Utilizzo con padronanza diversi software e strumenti digitali per l''organizzazione del lavoro, l''analisi dei dati e la comunicazione professionale.'),
(4, 20, 4, 10, 'Ho esperienza nell''implementazione e utilizzo di diversi software gestionali per la pianificazione delle risorse, il monitoraggio dei processi e l''analisi delle performance aziendali.'),
(4, 22, 3, 3, 'Nell''ultimo anno ho acquisito competenze specifiche nel fundraising per il terzo settore, apprendendo tecniche e strategie per la diversificazione delle fonti di finanziamento nelle organizzazioni non profit.'),

(5, 1, 5, 8, 'L''ascolto attivo è fondamentale nel mio lavoro di mediazione, dove è essenziale cogliere non solo il contenuto del messaggio ma anche le sfumature culturali, le emozioni e le aspettative implicite.'),
(5, 2, 5, 8, 'L''empatia interculturale è una competenza che ho particolarmente sviluppato, permettendomi di comprendere prospettive culturali diverse dalla mia e di facilitare la comunicazione tra persone di background differenti.'),
(5, 6, 5, 8, 'La comunicazione efficace in contesti multiculturali è al centro del mio lavoro. So adattare stili e registri comunicativi a diversi interlocutori, gestendo le barriere linguistiche e culturali.'),
(5, 7, 4, 8, 'La mediazione interculturale richiede grande flessibilità e capacità di adattamento a situazioni e contesti sempre diversi, competenza che ho affinato nel corso degli anni.'),
(5, 30, 5, 8, 'La mediazione culturale è la mia competenza professionale principale, che implica la facilitazione della comunicazione tra persone di culture diverse, la prevenzione e gestione di incomprensioni e conflitti interculturali, la promozione di un dialogo costruttivo.'),
(5, 33, 4, 8, 'La gestione dei conflitti interculturali è una competenza che ho sviluppato attraverso formazione specifica ed esperienza sul campo, imparando a riconoscere e affrontare le principali cause di conflitto in contesti multiculturali.'),

(6, 5, 4, 15, 'Il problem solving strutturato è parte integrante del mio approccio professionale in ambito contabile e amministrativo. Ho sviluppato la capacità di analizzare problematiche complesse e trovare soluzioni efficaci e conformi alla normativa.'),
(6, 16, 5, 15, 'La contabilità è la mia competenza tecnica principale, con una specializzazione particolare nella contabilità delle organizzazioni non profit e delle cooperative sociali, inclusi gli aspetti fiscali specifici.'),
(6, 17, 4, 12, 'Ho esperienza pluriennale nell''elaborazione e gestione delle buste paga, con una conoscenza approfondita della normativa sul lavoro e dei contratti collettivi, in particolare quelli applicabili al settore cooperativo.'),
(6, 18, 5, 10, 'La rendicontazione di progetti finanziati da fondi pubblici e privati è una competenza che ho sviluppato negli ultimi anni, con particolare attenzione alle procedure e ai requisiti specifici dei diversi enti finanziatori.'),
(6, 19, 4, 15, 'Utilizzo con padronanza diversi software e strumenti informatici per la gestione contabile, l''elaborazione di dati e la reportistica finanziaria.'),
(6, 20, 5, 10, 'Ho esperienza nell''implementazione e utilizzo di software gestionali specifici per la contabilità e l''amministrazione, con particolare focus su soluzioni adatte alle cooperative sociali.'),
(6, 23, 5, 8, 'Ho una conoscenza approfondita della normativa relativa alle cooperative sociali, dagli aspetti societari a quelli fiscali, dal regime lavoristico alle agevolazioni specifiche, dalla governance ai controlli.'),

(7, 1, 5, 6, 'L''ascolto attivo è alla base del mio approccio come psicologa. Ho sviluppato tecniche specifiche per cogliere non solo il contenuto esplicito ma anche i messaggi impliciti, le emozioni e i modelli relazionali.'),
(7, 2, 5, 6, 'L''empatia è una competenza centrale nel mio lavoro, che mi permette di entrare in sintonia con i vissuti emotivi dei bambini e degli adolescenti, creando uno spazio sicuro per l''espressione e l''elaborazione delle emozioni.'),
(7, 5, 4, 6, 'Utilizzo un approccio strutturato al problem solving nella valutazione e nell''intervento psicologico, identificando i fattori critici e le risorse disponibili per sviluppare strategie efficaci.'),
(7, 11, 4, 4, 'La gestione di gruppi in ambito educativo e terapeutico è una competenza che ho sviluppato sia attraverso formazione specifica che esperienza sul campo, conducendo laboratori e interventi di gruppo in diversi contesti.'),
(7, 32, 5, 6, 'Il supporto psicologico è la mia competenza professionale principale, con una specializzazione nell''età evolutiva e nelle problematiche legate all''apprendimento e al contesto scolastico.'),
(7, 33, 4, 6, 'La gestione dei conflitti, sia individuali che relazionali, è una competenza che applico quotidianamente nel mio lavoro con bambini, adolescenti e famiglie, utilizzando tecniche di mediazione e comunicazione efficace.'),

(8, 4, 4, 10, 'Nel coordinamento di progetti agricoli con finalità sociali, ho sviluppato una buona capacità di gestire lo stress e le pressioni, mantenendo la calma e la lucidità anche in situazioni critiche.'),
(8, 7, 5, 10, 'L''agricoltura e il lavoro con persone svantaggiate richiedono un''elevata flessibilità e capacità di adattamento, sia alle condizioni ambientali che alle diverse esigenze delle persone coinvolte.'),
(8, 11, 4, 8, 'Ho esperienza nella gestione di gruppi eterogenei in contesti di agricoltura sociale, con particolare attenzione all''inclusione di persone con diverse abilità e background.'),
(8, 25, 5, 10, 'Le tecniche di giardinaggio e manutenzione del verde sono tra le mie competenze tecniche principali, con una specializzazione in pratiche biologiche e sostenibili.'),
(8, 27, 4, 6, 'Ho sviluppato competenze in diverse tecniche artigianali legate alla trasformazione dei prodotti agricoli, che utilizzo nei percorsi di formazione per persone con disabilità o svantaggio.'),
(8, 29, 3, 3, 'Negli ultimi anni ho acquisito competenze di base nel marketing sociale, per valorizzare e promuovere i prodotti dell''agricoltura sociale e comunicare efficacemente il valore aggiunto dei progetti inclusivi.'),

(9, 5, 5, 10, 'La progettazione sociale richiede un''elevata capacità di problem solving, che ho sviluppato affrontando problematiche complesse e multidimensionali, identificando soluzioni innovative e sostenibili.'),
(9, 6, 5, 10, 'La comunicazione efficace è essenziale nel mio lavoro, sia nella redazione di progetti e report, sia nella gestione delle relazioni con partner e stakeholder, sia nella facilitazione di processi partecipativi.'),
(9, 19, 5, 10, 'Utilizzo con padronanza diversi software e strumenti digitali per la progettazione, il monitoraggio e la rendicontazione di progetti complessi.'),
(9, 21, 5, 9, 'La progettazione sociale è la mia competenza professionale principale, dalla ricerca di opportunità di finanziamento alla stesura delle proposte, dalla gestione all''implementazione, dal monitoraggio alla valutazione.'),
(9, 22, 4, 7, 'Ho sviluppato competenze specifiche nel fundraising per progetti sociali, conoscendo i principali canali di finanziamento pubblici e privati e le strategie per accedervi.'),
(9, 23, 4, 10, 'Conosco la normativa relativa ai finanziamenti pubblici e privati nel settore sociale, con particolare riferimento ai fondi europei, nazionali e regionali per il terzo settore.'),
(9, 29, 4, 5, 'Ho acquisito competenze nel marketing sociale e nella comunicazione per il terzo settore, essenziali per promuovere progetti, coinvolgere stakeholder e comunicare efficacemente l''impatto sociale degli interventi.'),

(10, 4, 5, 20, 'Il lavoro infermieristico, specialmente in contesti critici, mi ha permesso di sviluppare un''elevata capacità di gestione dello stress, mantenendo la lucidità e l''efficienza anche in situazioni di emergenza.'),
(10, 7, 5, 20, 'L''assistenza a pazienti con patologie diverse e in contesti differenti richiede grande flessibilità e capacità di adattamento, che ho affinato nel corso della mia carriera.'),
(10, 11, 4, 12, 'Nel mio ruolo di coordinatore ho sviluppato competenze nella gestione di gruppi di lavoro in ambito sanitario, facilitando la collaborazione interdisciplinare e la risoluzione di conflitti.'),
(10, 13, 5, 20, 'L''assistenza infermieristica è la mia competenza tecnica principale, con una specializzazione particolare nella geriatria e nell''assistenza domiciliare a pazienti con patologie croniche.'),
(10, 14, 5, 20, 'Ho una competenza avanzata nella gestione dei farmaci, dalla preparazione alla somministrazione, dal monitoraggio degli effetti alla gestione degli effetti collaterali, con particolare attenzione alle problematiche della polifarmacoterapia nell''anziano.'),
(10, 15, 5, 20, 'Il primo soccorso è una competenza che ho sviluppato approfonditamente e che aggiorno regolarmente, sapendo gestire diverse situazioni di emergenza sia in contesti ospedalieri che territoriali.'),
(10, 24, 4, 15, 'Conosco e applico la normativa sulla sicurezza nei luoghi di lavoro in ambito sanitario, con particolare attenzione alla prevenzione dei rischi biologici e alla corretta movimentazione dei pazienti.');

-- Inserimento di lingue conosciute dai candidati
INSERT INTO lingue_candidati (id_candidato, lingua, livello_scritto, livello_parlato, certificazioni) VALUES
(1, 'Italiano', 'C2', 'C2', NULL),
(1, 'Inglese', 'B2', 'B2', 'First Certificate in English (FCE)'),
(1, 'Spagnolo', 'A2', 'B1', NULL),

(2, 'Italiano', 'C2', 'C2', NULL),
(2, 'Rumeno', 'C1', 'C2', NULL),
(2, 'Inglese', 'A2', 'A2', NULL),

(3, 'Italiano', 'C2', 'C2', NULL),
(3, 'Inglese', 'B2', 'B2', NULL),
(3, 'Francese', 'B1', 'B1', NULL),

(4, 'Italiano', 'C2', 'C2', NULL),
(4, 'Inglese', 'C1', 'C1', 'IELTS 7.5'),
(4, 'Tedesco', 'B1', 'B2', NULL),

(5, 'Italiano', 'C2', 'C2', NULL),
(5, 'Arabo', 'C1', 'C2', NULL),
(5, 'Francese', 'C1', 'C2', 'DALF C1'),
(5, 'Inglese', 'B2', 'B2', NULL),

(6, 'Italiano', 'C2', 'C2', NULL),
(6, 'Inglese', 'B1', 'B1', NULL),

(7, 'Italiano', 'C2', 'C2', NULL),
(7, 'Inglese', 'B2', 'B2', NULL),
(7, 'Francese', 'A2', 'B1', NULL),

(8, 'Italiano', 'C2', 'C2', NULL),
(8, 'Inglese', 'B1', 'B1', NULL),
(8, 'Spagnolo', 'A2', 'A2', NULL),

(9, 'Italiano', 'C2', 'C2', NULL),
(9, 'Inglese', 'C1', 'C1',  NULL);

-- Inserimento di formazione esempio
INSERT INTO formazione (id_candidato, tipo, istituto, titolo, campo_studio, voto, citta, provincia, data_inizio, data_fine, descrizione) VALUES
(1, 'università', 'Università degli Studi di Milano', 'Laurea Triennale', 'Scienze dell''Educazione', '110/110 con lode', 'Milano', 'MI', '2017-09-01', '2021-07-15', 'Tesi di laurea: "L''educazione inclusiva: strategie didattiche per bambini con disturbi dell''apprendimento". Principali aree di studio: pedagogia generale e speciale, psicologia dello sviluppo, metodologie educative, sociologia dell''educazione.'),
(1, 'corso_professionale', 'Centro Formazione META', 'Corso di Specializzazione', 'Tecniche di Animazione Educativa', 'Ottimo', 'Milano', 'MI', '2021-10-01', '2022-01-31', 'Corso intensivo sulle tecniche di animazione educativa per diverse fasce d''età. Approfondimento di metodologie ludico-creative, progettazione di attività educative, gestione di gruppi, tecniche espressive e teatrali.'),

(2, 'corso_professionale', 'Istituto Professionale Statale', 'Qualifica Professionale', 'Operatore Socio-Sanitario (OSS)', 'Ottimo', 'Roma', 'RM', '2014-09-01', '2015-06-30', 'Corso di formazione per OSS di 1000 ore, con 450 ore di tirocinio in strutture socio-sanitarie. Principali aree di studio: assistenza di base, elementi di infermieristica, psicologia relazionale, elementi di riabilitazione, etica professionale.'),
(2, 'certificazione', 'Croce Rossa Italiana', 'Attestato', 'Primo Soccorso e BLSD', 'Idoneo', 'Roma', 'RM', '2022-03-01', '2022-03-31', 'Corso di primo soccorso e utilizzo del defibrillatore semiautomatico esterno (DAE). Tecniche di rianimazione cardiopolmonare, gestione delle emergenze, manovre di disostruzione delle vie aeree.'),

(3, 'università', 'Università degli Studi di Torino', 'Laurea Triennale', 'Servizio Sociale', '108/110', 'Torino', 'TO', '2013-09-01', '2016-07-15', 'Tesi di laurea: "L''approccio di rete nel lavoro sociale con famiglie multiproblematiche". Principali aree di studio: metodi e tecniche del servizio sociale, politiche sociali, sociologia, psicologia, diritto pubblico e privato.'),
(3, 'università', 'Università degli Studi di Torino', 'Laurea Magistrale', 'Programmazione e Gestione dei Servizi Sociali', '110/110', 'Torino', 'TO', '2016-09-01', '2018-07-15', 'Tesi di laurea: "L''integrazione socio-sanitaria nei servizi per la non autosufficienza: analisi di un caso includono l''innovazione sociale, i servizi per l''infanzia e per gli anziani. Ho buone capacità di scrittura e sintesi, indispensabili nella redazione dei progetti. Sono una persona creativa, orientata al risultato e con buone doti organizzative. La mia attitudine alla ricerca mi permette di essere sempre aggiornata sulle opportunità di finanziamento e sulle buone pratiche del settore.');

-- Inserimento dei dipendenti
INSERT INTO dipendenti (id_organizzazione, id_sede, nome, cognome, codice_fiscale, matricola, data_nascita, luogo_nascita, genere, indirizzo, citta, provincia, cap, telefono, email, ruolo_attuale, id_posizione, reparto, data_assunzione, tipo_contratto, disponibilita_cambio_ruolo, disponibilita_ore_extra, disponibilita_trasferte, disponibilita_remoto, note_interne, obiettivi_carriera) VALUES
(1, 1, 'Giovanni', 'Rossi', 'RSSGNN75M01F205P', 'DIP001', '1975-08-01', 'Milano', 'M', 'Via Torino 45', 'Milano', 'MI', '20123', '334 1234567', 'giovanni.rossi@nuoviorizzonti.it', 'Coordinatore Servizi Educativi', 17, 'Area Educativa', '2010-03-15', 'indeterminato', TRUE, TRUE, TRUE, FALSE,
'Giovanni è un professionista molto competente e affidabile. Ha dimostrato ottime capacità di coordinamento e gestione del personale. Mantiene buone relazioni con i servizi del territorio e le famiglie degli utenti. Recentemente ha completato un corso di formazione su metodologie educative innovative che sta implementando nei nostri servizi. È disponibile a straordinari quando necessario ed è molto apprezzato dal team che coordina. Ha gestito efficacemente situazioni di crisi e conflitti interni. Mostra grande attenzione alla qualità dei servizi erogati e all''aggiornamento continuo degli operatori.',
'Giovanni aspira a crescere professionalmente all''interno della cooperativa, assumendo maggiori responsabilità nell''area della progettazione educativa. È interessato a coordinare nuovi progetti innovativi e a partecipare maggiormente alle decisioni strategiche. Ha espresso il desiderio di seguire un percorso formativo in management delle organizzazioni sociali per acquisire competenze gestionali più avanzate. È disponibile a supportare lo sviluppo della cooperativa in nuove aree territoriali e servizi. Mostra interesse per la ricerca e la sperimentazione di nuovi modelli educativi.'),

(1, 2, 'Maria', 'Bianchi', 'BNCMRA80E45F205C', 'DIP002', '1980-05-05', 'Milano', 'F', 'Via Padova 78', 'Milano', 'MI', '20132', '338 2345678', 'maria.bianchi@nuoviorizzonti.it', 'Educatrice Professionale', 1, 'Centro Educativo Lambrate', '2015-09-01', 'indeterminato', FALSE, TRUE, FALSE, FALSE,
'Maria è un''educatrice molto empatica e creativa. Ha un ottimo rapporto con i minori e riesce a gestire anche i casi più complessi. È particolarmente efficace nel lavoro con bambini con disturbi dell''apprendimento. Ha sviluppato diversi laboratori creativi molto apprezzati dagli utenti e dalle famiglie. È puntuale e affidabile. Collabora bene con i colleghi e partecipa attivamente alle riunioni d''équipe. Recentemente ha mostrato segni di stanchezza, potrebbe beneficiare di una rotazione su altri servizi. È comunque sempre disponibile quando c''è necessità di copertura turni.',
'Maria è interessata a specializzarsi ulteriormente nell''ambito dei disturbi dell''apprendimento. Ha espresso il desiderio di seguire un master in psicopedagogia per acquisire competenze più specifiche. È soddisfatta del suo ruolo attuale e non aspira a posizioni di coordinamento, preferendo il lavoro diretto con l''utenza. Vorrebbe contribuire maggiormente alla progettazione delle attività educative del centro. Ha manifestato interesse per lo sviluppo di un nuovo laboratorio di narrazione e teatro come strumento educativo.'),

(1, 1, 'Paolo', 'Verdi', 'VRDPLA79H22F205A', 'DIP003', '1979-06-22', 'Milano', 'M', 'Via Washington 34', 'Milano', 'MI', '20146', '339 3456789', 'paolo.verdi@nuoviorizzonti.it', 'Responsabile Amministrativo', 15, 'Amministrazione', '2012-01-10', 'indeterminato', FALSE, FALSE, FALSE, TRUE,
'Paolo è un professionista molto preciso e affidabile. Ha una conoscenza approfondita della normativa fiscale relativa alle cooperative sociali. Gestisce efficacemente la contabilità e i rapporti con fornitori, banche e commercialista. Ha implementato nuove procedure che hanno migliorato l''efficienza amministrativa. È riservato ma collaborativo quando necessario. Ha difficoltà a delegare compiti, tendendo ad accentrare su di sé molte responsabilità. Potrebbe beneficiare di un supporto amministrativo per alleggerire il suo carico di lavoro. È molto apprezzato dalla direzione per la sua correttezza e trasparenza.',
'Paolo è interessato principalmente a mantenere il suo ruolo attuale, migliorando ulteriormente le procedure amministrative della cooperativa. Ha espresso interesse per corsi di aggiornamento sulla digitalizzazione dei processi amministrativi e la contabilità analitica per centri di costo. Non aspira a ruoli di direzione generale, preferendo specializzarsi nella sua area di competenza. È disponibile a formare nuovi colleghi nell''area amministrativa per garantire continuità nei processi.'),

(2, 3, 'Francesca', 'Moretti', 'MRTFNC82B44A944R', 'DIP004', '1982-02-04', 'Bologna', 'F', 'Via Indipendenza 56', 'Bologna', 'BO', '40121', '335 4567890', 'francesca.moretti@ilgirasole.it', 'Responsabile Inserimenti Lavorativi', 28, 'Area Inserimento Lavorativo', '2014-05-20', 'indeterminato', TRUE, TRUE, TRUE, TRUE,
'Francesca ha una grande capacità di relazione sia con le persone in inserimento lavorativo che con le aziende partner. Ha sviluppato una rete di contatti territoriali molto preziosa per la cooperativa. È proattiva nella ricerca di nuove opportunità di collaborazione. Ha un approccio molto personalizzato nella gestione dei percorsi di inserimento, adattandoli alle specifiche esigenze delle persone. È ben organizzata e rispetta le scadenze. Ha buone competenze nella progettazione e rendicontazione di progetti finanziati da fondi pubblici. Mantiene un clima positivo nel team e gestisce efficacemente le criticità.',
'Francesca aspira a sviluppare ulteriormente l''area degli inserimenti lavorativi, ampliando la rete di aziende partner e diversificando i settori di intervento. È interessata a sperimentare nuovi modelli di accompagnamento al lavoro per persone con fragilità complesse. Ha espresso il desiderio di assumere un ruolo più strategico nella cooperativa, partecipando maggiormente alle decisioni relative allo sviluppo di nuovi servizi. È disponibile a coordinare progetti innovativi e a rappresentare la cooperativa in tavoli istituzionali.'),

(2, 4, 'Luigi', 'Marini', 'MRNLGU85P23A944Z', 'DIP005', '1985-09-23', 'Bologna', 'M', 'Via Saffi 78', 'Bologna', 'BO', '40131', '338 5678901', 'luigi.marini@ilgirasole.it', 'Operatore di Laboratorio', 21, 'Centro Verde', '2018-03-10', 'indeterminato', TRUE, FALSE, TRUE, FALSE,
'Luigi è un operatore molto paziente e attento ai bisogni delle persone che segue nei percorsi di inserimento lavorativo. Ha ottime competenze tecniche nel settore del giardinaggio e della manutenzione del verde. Sa trasmettere efficacemente le sue conoscenze alle persone in formazione. È pratico e concreto nella gestione delle attività quotidiane. Collabora bene con i colleghi ma talvolta ha difficoltà a seguire le procedure amministrative. È molto apprezzato dagli utenti per il suo approccio rispettoso e mai giudicante. Ha gestito con successo alcuni progetti di manutenzione del verde particolarmente complessi.',
'Luigi è interessato a specializzarsi ulteriormente nell''ambito dell''agricoltura sociale e dell''ortoterapia. Ha espresso il desiderio di seguire corsi specifici su tecniche di coltivazione biologica e permacultura. È disponibile ad assumere maggiori responsabilità nella gestione dei percorsi formativi nel settore del verde. Vorrebbe contribuire allo sviluppo di nuovi progetti che uniscano la produzione agricola con finalità sociali ed educative.'),

(3, 5, 'Elena', 'Rizzo', 'RZZLNE76D44H501T', 'DIP006', '1976-04-04', 'Roma', 'F', 'Via Nazionale 89', 'Roma', 'RM', '00184', '339 6789012', 'elena.rizzo@insiemesipuo.it', 'Direttore', 19, 'Direzione', '2008-06-15', 'indeterminato', FALSE, TRUE, TRUE, TRUE,
'Elena è una professionista molto competente con ottime capacità manageriali. Ha una visione strategica chiara e la capacità di tradurla in piani operativi efficaci. Gestisce bene le relazioni con il Consiglio di Amministrazione e con gli stakeholder esterni. Ha guidato la cooperativa in un percorso di crescita significativo, mantenendo l''attenzione alla qualità dei servizi e al benessere dei lavoratori. È rispettata dal team per la sua competenza e correttezza. Sa prendere decisioni difficili quando necessario. Ha sviluppato una rete di partnership strategiche con altre organizzazioni del territorio. È molto impegnata e talvolta tende a sovraccaricarsi di lavoro.',
'Elena è orientata a consolidare la posizione della cooperativa nel territorio, diversificando le fonti di finanziamento e sviluppando nuovi servizi innovativi. È interessata a promuovere processi di innovazione sociale e a sperimentare nuovi modelli organizzativi più partecipati. Vorrebbe dedicare più tempo alla formazione strategica del gruppo dirigente per garantire sostenibilità futura alla cooperativa. Ha espresso interesse per percorsi formativi avanzati in management dell''innovazione sociale.'),

(3, 6, 'Roberto', 'Ferretti', 'FRRRRT84C21H501E', 'DIP007', '1984-03-21', 'Roma', 'M', 'Via del Corso 123', 'Roma', 'RM', '00186', '334 7890123', 'roberto.ferretti@insiemesipuo.it', 'Infermiere', 9, 'Centro Anziani Trastevere', '2016-04-01', 'indeterminato', FALSE, TRUE, FALSE, FALSE,
'Roberto è un infermiere molto professionale e attento. Ha ottime competenze tecniche e una particolare sensibilità nella relazione con gli anziani. Gestisce efficacemente i piani terapeutici ed è molto preciso nella somministrazione dei farmaci. Collabora bene con i colleghi OSS e con le altre figure professionali. È puntuale e affidabile. Comunica in modo chiaro con i familiari degli utenti. Durante l''emergenza COVID ha dimostrato grande impegno e flessibilità. A volte tende a essere troppo autonomo nelle decisioni, bypassando il coordinamento. È comunque molto apprezzato dagli utenti e dai loro familiari.',
'Roberto è interessato a specializzarsi ulteriormente nell''assistenza geriatrica e nelle cure palliative. Ha espresso il desiderio di seguire un master in infermieristica geriatrica per acquisire competenze più specifiche. Non aspira a ruoli di coordinamento, preferendo il lavoro diretto con gli utenti. Vorrebbe contribuire maggiormente alla formazione degli OSS sui temi sanitari e alla definizione dei protocolli assistenziali.'),

(4, 7, 'Chiara', 'Fabbri', 'FBBCHR81H47L219Z', 'DIP008', '1981-06-07', 'Torino', 'F', 'Corso Re Umberto 45', 'Torino', 'TO', '10128', '338 8901234', 'chiara.fabbri@arcobaleno.it', 'Coordinatrice Pedagogica', 17, 'Area Educativa', '2013-09-01', 'indeterminato', FALSE, TRUE, TRUE, TRUE,
'Chiara è una professionista molto preparata con un solido background pedagogico. Coordina efficacemente il team educativo, offrendo supervisione e supporto metodologico. Ha sviluppato strumenti di progettazione e valutazione educativa molto apprezzati anche da altre cooperative del territorio. Mantiene buone relazioni con le famiglie e i servizi sociali. È molto attenta alla formazione continua del personale educativo. Sa gestire le situazioni di crisi con calma e competenza. È rispettata dal team per la sua preparazione e disponibilità. Ha pubblicato articoli su riviste specializzate in ambito educativo.',
'Chiara è interessata a sviluppare progetti educativi innovativi, integrando nuove metodologie e approcci pedagogici. Ha espresso il desiderio di approfondire i temi dell''outdoor education e della pedagogia del movimento. Aspira a un ruolo più strategico nella cooperativa, contribuendo maggiormente alla definizione delle linee educative. È disponibile a rappresentare la cooperativa in contesti formativi e convegni. Vorrebbe avviare collaborazioni con l''università per progetti di ricerca-azione.'),

(4, 8, 'Marco', 'Ricci', 'RCCMRC89M15L219X', 'DIP009', '1989-08-15', 'Torino', 'M', 'Via Nizza 67', 'Torino', 'TO', '10126', '335 9012345', 'marco.ricci@arcobaleno.it', 'Educatore Professionale', 1, 'Asilo Nido Girotondo', '2019-09-01', 'indeterminato', TRUE, FALSE, FALSE, FALSE,
'Marco è un educatore empatico ed energico, particolarmente efficace nel lavoro con bambini piccoli. Ha ottime capacità di progettazione educativa e di documentazione delle attività svolte. È creativo nell''ideazione di attività ludiche educative. Collabora bene con i colleghi e ha un ottimo rapporto con le famiglie. È puntuale e affidabile. Negli ultimi mesi ha mostrato grande iniziativa, proponendo nuove attività di psicomotricità molto apprezzate. È l''unico educatore maschio del servizio, aspetto che rappresenta un valore aggiunto in termini di diverse figure di riferimento per i bambini.',
'Marco è interessato a specializzarsi in psicomotricità educativa e sviluppo psicomotorio nella prima infanzia. Ha espresso il desiderio di seguire una formazione specifica in questo ambito. È disponibile ad assumere il ruolo di referente per le attività psicomotorie all''interno della cooperativa. A lungo termine, è interessato alla possibilità di coordinare servizi educativi per la prima infanzia. Vorrebbe contribuire allo sviluppo di nuovi approcci educativi che valorizzino maggiormente il movimento e il rapporto con la natura.'),

(5, 9, 'Anna', 'Martelli', 'MRTNNA77E65D612S', 'DIP010', '1977-05-25', 'Firenze', 'F', 'Via dei Serragli 45', 'Firenze', 'FI', '50124', '339 0123456', 'anna.martelli@manitese.it', 'Responsabile Produzione', 21, 'Laboratorio Artigianale', '2011-04-15', 'indeterminato', FALSE, TRUE, TRUE, FALSE,
'Anna è una professionista creativa con ottime competenze tecniche nell''ambito dell''artigianato. Coordina efficacemente il laboratorio artigianale, gestendo sia gli aspetti produttivi che quelli relativi all''inserimento lavorativo. Ha sviluppato linee di prodotti innovativi che hanno aumentato le vendite della cooperativa. Sa valorizzare le capacità delle persone inserite, adattando le mansioni alle specifiche abilità. È ben organizzata e rispetta le scadenze di produzione. Mantiene buone relazioni con i clienti e i fornitori. È rispettata dal team per la sua competenza e disponibilità. Ha seguito corsi di aggiornamento su design e tecniche artigianali.',
'Anna è interessata a sviluppare ulteriormente la linea di prodotti artigianali della cooperativa, migliorando la qualità e l''appeal commerciale. Ha espresso il desiderio di seguire corsi di marketing e comunicazione per migliorare la promozione dei prodotti. Aspira a creare un brand riconoscibile per i prodotti della cooperativa, posizionandoli nel mercato dell''artigianato etico e sostenibile. È disponibile a coordinare progetti di formazione artigianale per nuove persone in inserimento lavorativo.'),

(5, 10, 'Michele', 'Longo', 'LNGMHL90D12D612K', 'DIP011', '1990-04-12', 'Firenze', 'M', 'Via Ghibellina 34', 'Firenze', 'FI', '50122', '334 1234567', 'michele.longo@manitese.it', 'Addetto Vendite', 21, 'Negozio Equo-solidale', '2020-06-01', 'determinato', TRUE, TRUE, FALSE, FALSE,
'Michele è un operatore commerciale con ottime capacità relazionali. Gestisce efficacemente il punto vendita, curando l''esposizione dei prodotti e l''accoglienza dei clienti. Ha una buona conoscenza dei prodotti del commercio equo-solidale e sa comunicarne i valori ai clienti. Collabora bene con i colleghi e con i volontari che supportano l''attività del negozio. È creativo nell''organizzazione di eventi e momenti promozionali. È preciso nella gestione della cassa e del magazzino. È ancora in fase di apprendimento per quanto riguarda gli aspetti amministrativi e gestionali più complessi.',
'Michele è interessato a sviluppare competenze nella gestione commerciale e nel marketing sociale. Ha espresso il desiderio di seguire corsi specifici su visual merchandising e tecniche di vendita etica. Aspira ad assumere maggiori responsabilità nella gestione del punto vendita e nell''organizzazione di eventi promozionali. A lungo termine, è interessato alla possibilità di coordinare la rete commerciale della cooperativa qualora si decidesse di aprire nuovi punti vendita.');

-- Inserimento di esperienze lavorative esempio
INSERT INTO posizioni (id_categoria, titolo, descrizione, requisiti, livello_esperienza) VALUES
(1, 'Educatore Professionale', 'Figura professionale che realizza specifici progetti educativi e riabilitativi per favorire lo sviluppo personale, l''inserimento e la partecipazione sociale di persone in difficoltà.', 'Laurea in Scienze dell''Educazione o titolo equipollente. Capacità di progettazione educativa, gestione dei gruppi, documentazione e valutazione degli interventi.', 'medio'),
(1, 'Animatore Socio-Educativo', 'Si occupa di progettare e realizzare attività di animazione rivolte a diverse fasce di età, stimolando la socializzazione e promuovendo il benessere dei partecipanti.', 'Diploma in ambito socio-educativo o esperienza nel settore. Competenze in tecniche di animazione e gestione dei gruppi.', 'entry_level'),
(1, 'Mediatore Interculturale', 'Facilita l''integrazione di cittadini stranieri nel contesto sociale italiano, favorendo la comunicazione e la comprensione reciproca tra culture diverse.', 'Conoscenza approfondita di almeno due culture e relative lingue. Formazione specifica in mediazione interculturale.', 'medio'),
(1, 'Formatore', 'Progetta e realizza percorsi formativi rivolti a operatori del settore sociale, volontari o persone in percorsi di inserimento lavorativo.', 'Laurea e competenze pedagogiche. Esperienza pregressa nell''ambito della formazione degli adulti.', 'senior'),
(2, 'Assistente Sociale', 'Professionista che aiuta individui, famiglie e gruppi a risolvere problemi e migliorare il loro benessere attraverso l''assistenza sociale, l''intervento in situazioni di crisi e il collegamento con risorse comunitarie.', 'Laurea in Servizio Sociale e iscrizione all''Albo. Esperienza nella gestione di casi complessi e nella rete dei servizi territoriali.', 'medio'),
(2, 'Operatore Socio-Assistenziale (OSA)', 'Fornisce assistenza diretta alla persona in condizioni di non autosufficienza o disagio, aiutandola nelle attività quotidiane e nei bisogni primari.', 'Qualifica professionale di OSA. Esperienza nell''assistenza di base a persone fragili.', 'entry_level'),
(2, 'Operatore Socio-Sanitario (OSS)', 'Si occupa dell''assistenza diretta alle persone in ambito sociale e sanitario, collaborando con altre figure professionali alla realizzazione di progetti assistenziali.', 'Qualifica professionale di OSS. Esperienza in contesti socio-sanitari.', 'entry_level'),
(2, 'Assistente Familiare', 'Offre supporto a persone anziane o con disabilità presso il loro domicilio, occupandosi dell''assistenza personale e della gestione della casa.', 'Formazione in assistenza familiare. Esperienza nella cura domiciliare di persone non autosufficienti.', 'entry_level'),
(3, 'Infermiere', 'Fornisce assistenza sanitaria a persone di tutte le età, occupandosi della somministrazione delle terapie, del monitoraggio delle condizioni di salute e dell''educazione sanitaria.', 'Laurea in Infermieristica e iscrizione all''Albo. Esperienza in contesti socio-sanitari.', 'medio'),
(3, 'Fisioterapista', 'Si occupa della riabilitazione fisica di persone con problemi motori, neuromotori o posturali, utilizzando tecniche specifiche per migliorarne la funzionalità.', 'Laurea in Fisioterapia e iscrizione all''Albo. Esperienza in riabilitazione.', 'medio'),
(3, 'Psicologo', 'Offre supporto psicologico e interventi finalizzati al benessere mentale delle persone, attraverso colloqui individuali o di gruppo.', 'Laurea in Psicologia, iscrizione all''Albo e specializzazione. Esperienza in ambito clinico o sociale.', 'senior'),
(3, 'Logopedista', 'Si occupa della prevenzione e trattamento dei disturbi della comunicazione e del linguaggio in persone di diverse età.', 'Laurea in Logopedia e iscrizione all''Albo. Esperienza con disturbi del linguaggio.', 'medio'),
(4, 'Impiegato Amministrativo', 'Si occupa della gestione quotidiana delle pratiche amministrative e contabili della cooperativa.', 'Diploma o laurea in ambito economico-amministrativo. Competenze in gestione amministrativa e software gestionali.', 'entry_level'),
(4, 'Contabile', 'Gestisce la contabilità della cooperativa, occupandosi di registrazioni contabili, bilanci e adempimenti fiscali.', 'Laurea in Economia o diploma con esperienza. Conoscenza approfondita di contabilità e normativa fiscale.', 'medio'),
(4, 'Responsabile Risorse Umane', 'Si occupa della gestione del personale, dal reclutamento alla formazione, dalle relazioni sindacali alla gestione dei contratti.', 'Laurea in ambito umanistico o economico. Esperienza nella gestione delle risorse umane e conoscenza della normativa del lavoro.', 'senior'),
(4, 'Addetto Segreteria', 'Gestisce le attività di segreteria, l''accoglienza, lo smistamento delle comunicazioni e il supporto generale alle varie funzioni della cooperativa.', 'Diploma. Competenze organizzative e buona conoscenza degli strumenti informatici.', 'entry_level'),
(5, 'Coordinatore di Servizio', 'Coordina e supervisiona un servizio specifico della cooperativa, gestendo il personale assegnato e garantendo la qualità del servizio erogato.', 'Laurea e formazione specifica nel settore di riferimento. Esperienza pluriennale e capacità di leadership.', 'senior'),
(5, 'Responsabile di Area', 'Gestisce un''area specifica della cooperativa (es. area minori, anziani, disabilità), coordinando i vari servizi e progetti afferenti.', 'Laurea e formazione manageriale. Esperienza pluriennale di coordinamento e gestione di servizi.', 'senior'),
(5, 'Direttore', 'Responsabile dell''intera gestione operativa della cooperativa, coordina tutte le aree e risponde al Consiglio di Amministrazione.', 'Laurea e formazione manageriale avanzata. Esperienza di direzione in ambito sociale.', 'esperto'),
(5, 'Responsabile Qualità', 'Si occupa della gestione e del monitoraggio del sistema di qualità della cooperativa, garantendo il rispetto degli standard e l''attuazione di processi di miglioramento.', 'Laurea e formazione specifica sulla qualità. Esperienza nella gestione di sistemi di qualità.', 'senior'),
(6, 'Operatore di Laboratorio', 'Segue le attività produttive all''interno di laboratori protetti o finalizzati all''inserimento lavorativo di persone svantaggiate.', 'Diploma e formazione specifica nel settore produttivo di riferimento. Sensibilità alle tematiche sociali.', 'entry_level'),
(6, 'Addetto alle Pulizie', 'Si occupa della pulizia e sanificazione di ambienti, garantendo il rispetto degli standard igienici richiesti.', 'Formazione di base. Esperienza nelle tecniche di pulizia e utilizzo di prodotti specifici.', 'entry_level'),
(6, 'Giardiniere', 'Si occupa della manutenzione di aree verdi, giardini, parchi, svolgendo attività di giardinaggio e cura del verde.', 'Formazione specifica in ambito agricolo o esperienza nel settore. Conoscenza delle tecniche di giardinaggio.', 'entry_level'),
(6, 'Addetto Mensa', 'Si occupa della preparazione e distribuzione dei pasti in mense scolastiche, aziendali o sociali.', 'Formazione HACCP e esperienza in ambito alimentare. Conoscenza delle norme igieniche.', 'entry_level'),
(7, 'Tutor per l''Inserimento Lavorativo', 'Accompagna persone svantaggiate in percorsi di inserimento lavorativo, mediando tra le loro esigenze e quelle dell''ambiente di lavoro.', 'Laurea in ambito sociale o educativo. Esperienza nel settore dell''inserimento lavorativo.', 'medio'),
(7, 'Orientatore Professionale', 'Aiuta le persone a identificare le proprie competenze e aspirazioni professionali, supportandole nella scelta di un percorso formativo o lavorativo adeguato.', 'Laurea e formazione specifica in orientamento professionale. Conoscenza del mercato del lavoro.', 'medio'),
(7, 'Job Coach', 'Affianca direttamente la persona svantaggiata nel contesto lavorativo, supportandola nell''apprendimento delle mansioni e nell''integrazione.', 'Formazione specifica e esperienza nell''accompagnamento di persone con fragilità in contesti lavorativi.', 'medio'),
(7, 'Responsabile Inserimenti Lavorativi', 'Coordina i progetti di inserimento lavorativo della cooperativa, mantenendo i rapporti con aziende e servizi del territorio.', 'Laurea e formazione specialistica. Esperienza pluriennale nel settore e capacità di networking.', 'senior'),
(8, 'Progettista Sociale', 'Elabora progetti di intervento sociale in risposta a bandi pubblici o privati, definendo obiettivi, azioni, budget e sistemi di valutazione.', 'Laurea e formazione specifica in progettazione. Esperienza nella stesura e gestione di progetti sociali.', 'medio'),
(8, 'Fundraiser', 'Si occupa della ricerca e raccolta di fondi a sostegno delle attività della cooperativa, attraverso bandi, donazioni, campagne di crowdfunding.', 'Laurea e formazione specifica in fundraising. Capacità comunicative e relazionali.', 'medio'),
(8, 'Responsabile Comunicazione', 'Gestisce la comunicazione interna ed esterna della cooperativa, curando l''immagine, le relazioni con i media e le strategie comunicative.', 'Laurea in ambito comunicativo. Esperienza nella comunicazione sociale e conoscenza degli strumenti digitali.', 'medio'),
(8, 'Innovation Manager', 'Si occupa dell''innovazione nei servizi e nei processi della cooperativa, introducendo nuovi approcci e tecnologie per migliorare l''impatto sociale.', 'Laurea e formazione specifica sull''innovazione sociale. Visione strategica e capacità di problem solving.', 'senior');

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

-- Inserimento degli utenti (staff HR)
INSERT INTO utenti (nome, cognome, email, password_hash, ruolo,ultimo_accesso) VALUES
('Marco', 'Bianchi', 'marco.bianchi@cooperativa.it', 'hash_password_123', 'amministratore',Null),
('Laura', 'Rossi', 'laura.rossi@cooperativa.it', 'hash_password_456', 'responsabile_hr',Null),
('Stefano', 'Verdi', 'stefano.verdi@cooperativa.it', 'hash_password_789', 'selezionatore',Null),
('Francesca', 'Neri', 'francesca.neri@cooperativa.it', 'hash_password_321', 'coordinatore_formazione',Null),
('Paolo', 'Gialli', 'paolo.gialli@cooperativa.it', 'hash_password_654', 'selezionatore',Null);

-- Inserimento delle organizzazioni (cooperative sociali)
INSERT INTO organizzazioni (nome, tipo, indirizzo, citta, provincia, cap, telefono, email, sito_web, partita_iva, codice_fiscale, descrizione) VALUES
('Cooperativa Sociale Nuovi Orizzonti', 'Cooperativa Sociale di tipo A', 'Via Roma 123', 'Milano', 'MI', '20123', '02 12345678', 'info@nuoviorizzonti.it', 'www.nuoviorizzonti.it', '12345678901', 'QWERTY12B34Z567X', 'Cooperativa sociale che opera nel settore dell''assistenza a minori e famiglie in difficoltà. Offre servizi educativi, di sostegno scolastico e supporto psicologico.'),
('Cooperativa Sociale Il Girasole', 'Cooperativa Sociale di tipo B', 'Via Dante 45', 'Bologna', 'BO', '40123', '051 9876543', 'info@ilgirasole.it', 'www.ilgirasole.it', '23456789012', 'ASDFGH34C56V789Y', 'Cooperativa sociale che opera nell''inserimento lavorativo di persone svantaggiate attraverso attività di giardinaggio, pulizia e manutenzione.'),
('Cooperativa Sociale Insieme Si Può', 'Cooperativa Sociale Mista (A+B)', 'Via Garibaldi 78', 'Roma', 'RM', '00153', '06 45678901', 'info@insiemesipuo.it', 'www.insiemesipuo.it', '34567890123', 'ZXCVBN56D78N901W', 'Cooperativa sociale che combina servizi alla persona con attività di inserimento lavorativo. Si occupa di anziani, disabili e offre opportunità di lavoro a persone svantaggiate.'),
('Cooperativa Sociale Arcobaleno', 'Cooperativa Sociale di tipo A', 'Via Marconi 92', 'Torino', 'TO', '10128', '011 5678901', 'info@arcobaleno.it', 'www.arcobaleno.it', '45678901234', 'POIUYT78E90M123K', 'Cooperativa sociale specializzata in servizi educativi e ricreativi per bambini e adolescenti. Gestisce asili nido, centri estivi e doposcuola.'),
('Cooperativa Sociale Mani Tese', 'Cooperativa Sociale di tipo B', 'Via Verdi 56', 'Firenze', 'FI', '50123', '055 6789012', 'info@manitese.it', 'www.manitese.it', '56789012345', 'LKJHGF90F12P456J', 'Cooperativa sociale che promuove l''inserimento lavorativo attraverso attività artigianali, produzione di oggetti di design e gestione di negozi equo-solidali.');

-- Inserimento delle sedi operative
INSERT INTO sedi (id_organizzazione, nome, indirizzo, citta, provincia, cap, telefono, email, descrizione) VALUES
(1, 'Sede Centrale Milano', 'Via Roma 123', 'Milano', 'MI', '20123', '02 12345678', 'sede.milano@nuoviorizzonti.it', 'Sede principale con uffici amministrativi e centro di formazione'),
(1, 'Centro Educativo Lambrate', 'Via Palmanova 55', 'Milano', 'MI', '20132', '02 87654321', 'centro.lambrate@nuoviorizzonti.it', 'Centro educativo per minori con difficoltà di apprendimento'),
(2, 'Sede Centrale Bologna', 'Via Dante 45', 'Bologna', 'BO', '40123', '051 9876543', 'sede.bologna@ilgirasole.it', 'Sede principale con uffici amministrativi e centro operativo'),
(2, 'Centro Verde', 'Via dei Giardini 22', 'Bologna', 'BO', '40132', '051 8765432', 'centro.verde@ilgirasole.it', 'Centro per attività di giardinaggio e vivaio'),
(3, 'Sede Centrale Roma', 'Via Garibaldi 78', 'Roma', 'RM', '00153', '06 45678901', 'sede.roma@insiemesipuo.it', 'Sede principale con uffici amministrativi e centro servizi'),
(3, 'Centro Anziani Trastevere', 'Viale Trastevere 112', 'Roma', 'RM', '00153', '06 54321098', 'anziani.trastevere@insiemesipuo.it', 'Centro diurno per anziani con servizi assistenziali'),
(4, 'Sede Centrale Torino', 'Via Marconi 92', 'Torino', 'TO', '10128', '011 5678901', 'sede.torino@arcobaleno.it', 'Sede principale con uffici amministrativi e spazio ricreativo'),
(4, 'Asilo Nido Girotondo', 'Via Monte Rosa 34', 'Torino', 'TO', '10154', '011 4567890', 'nido.girotondo@arcobaleno.it', 'Asilo nido per bambini da 0 a 3 anni'),
(5, 'Sede Centrale Firenze', 'Via Verdi 56', 'Firenze', 'FI', '50123', '055 6789012', 'sede.firenze@manitese.it', 'Sede principale con uffici amministrativi e laboratorio artigianale'),
(5, 'Negozio Equo-solidale', 'Via dei Serragli 24', 'Firenze', 'FI', '50124', '055 7890123', 'negozio.firenze@manitese.it', 'Punto vendita di prodotti artigianali ed equo-solidali');

-- Inserimento delle categorie professionali
INSERT INTO categorie_professionali (nome, descrizione) VALUES
('Educazione e Formazione', 'Ruoli legati all''educazione, formazione e supporto pedagogico a minori, adulti, famiglie'),
('Assistenza Sociale', 'Ruoli di assistenza e supporto sociale a persone in difficoltà o con bisogni speciali'),
('Assistenza Sanitaria', 'Ruoli di assistenza sanitaria e servizi alla salute'),
('Amministrazione', 'Ruoli legati alla gestione amministrativa, contabile e finanziaria della cooperativa'),
('Coordinamento e Gestione', 'Ruoli di coordinamento, supervisione e gestione dei servizi e del personale'),
('Produzione e Servizi', 'Ruoli legati alle attività produttive, artigianali e di servizi della cooperativa'),
('Inserimento Lavorativo', 'Ruoli specializzati nell''accompagnamento e inserimento lavorativo di persone svantaggiate'),
('Progettazione e Sviluppo', 'Ruoli dedicati alla progettazione, fundraising e sviluppo di nuovi servizi');

-- Inserimento delle competenze
INSERT INTO competenze (nome, descrizione, tipo) VALUES
('Ascolto Attivo', 'Capacità di ascoltare con attenzione, comprendere e rispondere adeguatamente agli altri', 'soft_skill'),
('Empatia', 'Capacità di comprendere e condividere i sentimenti altrui', 'soft_skill'),
('Lavoro di Squadra', 'Capacità di collaborare efficacemente con gli altri membri del team', 'soft_skill'),
('Gestione dello Stress', 'Capacità di mantenere la calma e l''efficienza in situazioni di pressione', 'soft_skill'),
('Problem Solving', 'Capacità di identificare problemi e trovare soluzioni appropriate', 'soft_skill'),
('Comunicazione Efficace', 'Capacità di comunicare in modo chiaro e efficace sia oralmente che per iscritto', 'soft_skill'),
('Flessibilità', 'Capacità di adattarsi a nuove situazioni e cambiamenti', 'soft_skill'),
('Leadership', 'Capacità di guidare, motivare e ispirare gli altri', 'soft_skill'),
('Tecniche Educative', 'Conoscenza e applicazione di metodologie e tecniche educative', 'tecnica'),
('Tecniche di Animazione', 'Competenze nell''organizzazione e gestione di attività di animazione per gruppi', 'tecnica'),
('Gestione di Gruppi', 'Capacità di coordinare e gestire gruppi di persone', 'tecnica'),
('Tecniche di Assistenza di Base', 'Competenze nelle pratiche assistenziali di base per persone non autosufficienti', 'tecnica'),
('Assistenza Infermieristica', 'Competenze nelle pratiche infermieristiche e sanitarie', 'tecnica'),
('Gestione Farmaci', 'Competenze nella somministrazione e gestione di farmaci', 'tecnica'),
('Primo Soccorso', 'Conoscenze e capacità di intervento in situazioni di emergenza', 'tecnica'),
('Contabilità', 'Competenze nella gestione contabile e finanziaria', 'tecnica'),
('Elaborazione Buste Paga', 'Competenze nell''elaborazione e gestione delle buste paga', 'tecnica'),
('Rendicontazione Progetti', 'Capacità di gestire la rendicontazione economica di progetti', 'tecnica'),
('Informatica di Base', 'Utilizzo di software di base (Office, email, internet)', 'tecnica'),
('Software Gestionali', 'Utilizzo di software gestionali specifici per cooperative sociali', 'tecnica'),
('Progettazione Sociale', 'Competenze nella progettazione di interventi in ambito sociale', 'tecnica'),
('Fundraising', 'Capacità di raccolta fondi e finanziamenti per progetti sociali', 'tecnica'),
('Normativa Cooperative', 'Conoscenza della normativa relativa alle cooperative sociali', 'tecnica'),
('Normativa Sicurezza sul Lavoro', 'Conoscenza della normativa sulla sicurezza nei luoghi di lavoro', 'tecnica'),
('Tecniche di Giardinaggio', 'Competenze nelle attività di giardinaggio e manutenzione del verde', 'tecnica'),
('Tecniche di Pulizia', 'Competenze nelle attività di pulizia e sanificazione di ambienti', 'tecnica'),
('Tecniche Artigianali', 'Competenze in attività artigianali (falegnameria, ceramica, ecc.)', 'tecnica'),
('Cucina', 'Competenze nell''ambito della preparazione di cibi e gestione cucina', 'tecnica'),
('Marketing Sociale', 'Competenze nella promozione e comunicazione in ambito sociale', 'tecnica'),
('Mediazione Culturale', 'Capacità di facilitare la comunicazione e comprensione tra culture diverse', 'tecnica'),
('Tecniche di Riabilitazione', 'Competenze in attività di riabilitazione fisica', 'tecnica'),
('Supporto Psicologico', 'Capacità di fornire sostegno psicologico di base', 'tecnica'),
('Gestione dei Conflitti', 'Capacità di mediare e gestire situazioni conflittuali', 'tecnica');

