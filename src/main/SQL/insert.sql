
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('sabatocelentano@gmail.com', SHA1('Sabato12!') ,'Sabato', 'Celentano', 'Via Villanova 21, Nocera Inferiore', 3473285607, true);
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('gennarorascato@gmail.com', SHA1('Gennaro12!'), 'Gennaro', 'Rascatp', 'Via Abita a Torre 23', 1234567890, true);
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('marcopastore@gmail.com', SHA1('Marco12!'), 'Marco', 'Pastore', 'Via e di Salerno 91', 0987654321, false);

INSERT into spacegaming.acquisto(metPagamento, dataAcquisto, utente) VALUES ('Contanti', 06/06/2021, 'sabatocelentano@gmail.com');
INSERT into spacegaming.acquisto(metPagamento, dataAcquisto, utente) VALUES ('Carta di Credito', 08/07/2021, 'sabatocelentano@gmail.com');
INSERT into spacegaming.acquisto(metPagamento, dataAcquisto, utente) VALUES ('Contanti', 06/06/2021, 'gennarorascato@gmail.com');

INSERT into spacegaming.carrello(utente, prezzoTot) VALUES ('sabatocelentano@gmail.com', 0);
INSERT into spacegaming.carrello(utente, prezzoTot) VALUES ('gennarorascato@gmail.com', 0);
INSERT into spacegaming.carrello(utente, prezzoTot) VALUES ('marcopastore@gmail.com', 0);

INSERT into spacegaming.console(nome, descrizione) VALUES ('XBOX ONE', 'test xbox');
INSERT into spacegaming.console(nome, descrizione) VALUES ('PS4', 'Test PS4');
INSERT into spacegaming.console(nome, descrizione) VALUES ('SWITCH', 'Test SWITCH');

INSERT into spacegaming.product(qty, nome, prezzo, descrizione, image) VALUES (30, 'Elder Ring', 66.90, 'PEGI : Età consigliata 16 e oltre', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\001.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, image) VALUES (20, 'Fifa 21', 50, 'PEGI : 14', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\002.jpeg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, image) VALUES (30, 'The Last of Us 2', 60.99, 'Pegi : 18', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\003.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, image) VALUES (13, 'Halo 4', 24.99, 'Pegi : 16', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\004.jpg'));

INSERT into spacegaming.inserimentocart(videogame, carrello, nCopie) VALUES (1, 'sabatocelentano@gmail.com' ,1);
INSERT into spacegaming.inserimentocart(videogame, carrello, nCopie) VALUES (3, 'sabatocelentano@gmail.com',2);
INSERT into spacegaming.inserimentocart(videogame, carrello, nCopie) VALUES (1, 'gennarorascato@gmail.com',1);
INSERT into spacegaming.inserimentocart(videogame, carrello, nCopie) VALUES (2, 'gennarorascato@gmail.com',1);

INSERT into spacegaming.platform(console, product) VALUES ('PS4', 1);
INSERT into spacegaming.platform(console, product) VALUES ('PS4', 2);
INSERT into spacegaming.platform(console, product) VALUES ('PS4', 3);
INSERT into spacegaming.platform(console, product) VALUES ('XBOX ONE', 1);
INSERT into spacegaming.platform(console, product) VALUES ('XBOX ONE', 2);
INSERT into spacegaming.platform(console, product) VALUES ('XBOX ONE', 3);
INSERT into spacegaming.platform(console, product) VALUES ('SWITCH', 2);

