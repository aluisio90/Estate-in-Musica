CREATE DATABASE my_estateinfesta;
/*...*/
/*Dichiarazione delle tabelle*/

/*CREAZIONE DELLA TABELLA SPETTATORI*/
CREATE TABLE SPETTATORI (
	Nome VARCHAR(45) NOT NULL,
	Cognome VARCHAR(45) NOT NULL,
	Email VARCHAR(100) UNIQUE,
	Telefono VARCHAR(15) UNIQUE,
	ID INT(15) PRIMARY KEY AUTO_INCREMENT
	
);

/*CREAZIONE DELLA TABELLA CONCERTI*/
CREATE TABLE CONCERTI(
	Descrizione VARCHAR(50) DEFAULT ' ',
	Titolo VARCHAR(25) NOT NULL,
	Codice_Concerto INT(8)PRIMARY KEY
);

/*CREAZIONE DELLA TABELLA BIGLIETTI*/
CREATE TABLE BIGLIETTI(
	Matricola INT(15) PRIMARY KEY AUTO_INCREMENT,
	Descrizione VARCHAR(50)DEFAULT ' ',
	ID INT(15) NOT NULL,
	Codice_Concerto INT(8) NOT NULL,
	Prezzo FLOAT(4) NOT NULL,
	
	FOREIGN KEY(Codice_Concerto) REFERENCES CONCERTI(Codice_Concerto)
	
	ON UPDATE CASCADE,
	FOREIGN KEY(ID) REFERENCES SPETTATORI(ID)
	ON DELETE CASCADE
	
	
);

CREATE TABLE SALE_CONCERTI(
	Capienza_Massima INT(10) NOT NULL,
	Numero_Posti INT(10) NOT NULL,
	Codice_Sala INT(2) PRIMARY KEY,
	Nome VARCHAR(45) NOT NULL,
	Indirizzo VARCHAR(45) NOT NULL 	
);

CREATE TABLE PRENOTATE(
	Codice_Concerto INT(8)NOT NULL,
	Data_Prenotazione DATE NOT NULL,
	Codice_Sala INT(2) NOT NULL,
	PRIMARY KEY(Codice_Concerto, Codice_Sala),
	FOREIGN KEY(Codice_Concerto) REFERENCES CONCERTI(Codice_Concerto) ON DELETE CASCADE,
	FOREIGN KEY(Codice_Sala) REFERENCES SALE_CONCERTI(Codice_Sala)ON DELETE CASCADE
	
	
	
	
);

CREATE TABLE TELEFONI(
	Numero VARCHAR(15) PRIMARY KEY,
	Tipologia VARCHAR(10) DEFAULT ' ',
	Codice_Sala INT(2) NOT NULL,
	
	FOREIGN KEY (Codice_Sala) REFERENCES SALE_CONCERTI(Codice_Sala)
	ON UPDATE CASCADE
);

CREATE TABLE BRANI(
	Codice_Brano INT(8) PRIMARY KEY,
	Titolo VARCHAR(45) NOT NULL,
	Descrizione VARCHAR(50) DEFAULT ' '
	
);

CREATE TABLE PROGRAMMATI(
	Ordine INT(4) NOT NULL,
	Codice_Concerto INT(8) NOT NULL,
	Codice_Brano INT(8)NOT NULL,
	
	PRIMARY KEY( Codice_Concerto, Codice_Brano, Ordine),
	
	FOREIGN KEY (Codice_Concerto) REFERENCES CONCERTI(Codice_Concerto) ON UPDATE CASCADE,
	FOREIGN KEY (Codice_Brano) REFERENCES BRANI(Codice_Brano) ON DELETE CASCADE
	
	
	
);

CREATE TABLE AUTORI(
	Codice_Autore INT(4) PRIMARY KEY,
	Nome VARCHAR(25) NOT NULL,
	Cognome VARCHAR(25) NOT NULL
);

CREATE TABLE SCRIVONO(
	Codice_Autore INT(4),
	Codice_Brano INT (2),
	
	PRIMARY KEY(Codice_Brano, Codice_Autore),
	
	FOREIGN KEY(Codice_Autore) REFERENCES AUTORI(Codice_Autore) ON UPDATE CASCADE,
	FOREIGN KEY(Codice_Brano) REFERENCES BRANI(Codice_Brano) ON UPDATE CASCADE
	
	
	
	
);

CREATE TABLE ESECUTORI(
	Stato_Di_Provenienza VARCHAR(25) NOT NULL,
	Matricola INT(4) PRIMARY KEY, 
	Nome VARCHAR(25) NOT NULL
	
	
);

CREATE TABLE SOLISTI(
	Strumento_Suonato VARCHAR(45),
	Matricola INT(4) PRIMARY KEY,
	
	FOREIGN KEY (Matricola) REFERENCES ESECUTORI(Matricola) ON DELETE CASCADE ON UPDATE CASCADE
	
	
);

CREATE TABLE ORCHESTRE(
	Nome_Direttore VARCHAR(50) NOT NULL,
	Numero_Di_Elementi TINYINT DEFAULT 0,
	Matricola INT(4) PRIMARY KEY,
	
	FOREIGN KEY(Matricola) REFERENCES ESECUTORI(Matricola) ON DELETE CASCADE ON UPDATE CASCADE
	
);

CREATE TABLE ORCHESTRALI(
	Codice_Orchestrale INT(4) PRIMARY KEY,
	Nome VARCHAR(50),
	Data_Nascita DATE,
	Matricola INT(4) NOT NULL,
	Strumento_Suonato VARCHAR(25) NOT NULL,
	FOREIGN KEY(Matricola) REFERENCE ORCHESTRE(Matricola)
	
);

CREATE TABLE SUONANO(
	Matricola INT(4),
	Codice_Brano INT(8),
	
	PRIMARY KEY(Matricola, Codice_Brano),
	FOREIGN KEY(Matricola) REFERENCES ESECUTORI(Matricola) ON DELETE CASCADE,
	FOREIGN KEY(Codice_Brano) REFERENCES BRANI(Codice_Brano) ON UPDATE CASCADE
	
	 
);


