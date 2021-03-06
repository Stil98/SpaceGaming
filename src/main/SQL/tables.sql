DROP DATABASE IF EXISTS SpaceGaming;
CREATE DATABASE SpaceGaming;
USE SpaceGaming;

CREATE TABLE Utente(
                       email varchar(40) PRIMARY KEY,
                       pword char(40) NOT NULL,
                       fname varchar(20) NOT NULL,
                       lname varchar(20) NOT NULL,
                       address varchar(100) NOT NULL,
                       phone_number char(13) NOT NULL,
                       is_admin boolean NOT NULL
);

CREATE TABLE Acquisto(
                         id int PRIMARY KEY auto_increment,
                         dataAcquisto datetime NOT NULL,
                         utente char(30) NOT NULL,
                         prezzoTot float,
                         FOREIGN KEY (utente) references Utente (email)
);

CREATE TABLE Console(
                        nome varchar(20) PRIMARY KEY,
                        descrizione varchar(400) NOT NULL
);


CREATE TABLE Product(
                        id int PRIMARY KEY auto_increment,
                        qty int NOT NULL,
                        nome char(50) NOT NULL,
                        prezzo float NOT NULL,
                        descrizione varchar(200) NOT NULL,
                        console char(12) NOT NULL,
                        image longblob NOT NULL,
                        FOREIGN KEY (console) references Console(nome)
);

CREATE TABLE AcqProd(
                        prodotto int NOT NULL ,
                        acquisto int NOT NULL ,
                        nCopie int NOT NULL ,
                        PRIMARY KEY (prodotto, acquisto),
                        FOREIGN KEY (prodotto) references Product(id),
                        FOREIGN KEY (acquisto) references Acquisto(id)

);
