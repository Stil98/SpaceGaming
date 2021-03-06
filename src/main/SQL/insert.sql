INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('sabatocelentano@gmail.com', SHA1('Sabato12!') ,'Sabato', 'Celentano', 'Via Villanova 21, Nocera Inferiore', 3473285607, true);
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('gennarorascato@gmail.com', SHA1('Gennaro12!'), 'Gennaro', 'Rascatp', 'Via Abita a Torre 23', 1234567890, true);
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('marcopastore@gmail.com', SHA1('Marco12!'), 'Marco', 'Pastore', 'Via e di Salerno 91', 0987654321, false);
INSERT into spacegaming.utente(email, pword, fname, lname, address, phone_number, is_admin) VALUES ('sabamilan@hotmail.it', SHA1('Gennaro12!'), 'S', 'C', 'A', 1234567890, false);

INSERT into spacegaming.acquisto(dataAcquisto, prezzoTot, utente) VALUES ('20210618', 329.93, 'sabatocelentano@gmail.com');
INSERT into spacegaming.acquisto(dataAcquisto, prezzoTot, utente) VALUES ('20210718',50.99, 'gennarorascato@gmail.com');
INSERT into spacegaming.acquisto(dataAcquisto, prezzoTot, utente) VALUES ('20210728', 140.97, 'sabatocelentano@gmail.com');

INSERT into spacegaming.console(nome, descrizione) VALUES ('XBOX', 'All’interno ospita un processore octa-core AMD Jaguar con velocità di clock di 1,75 GHz, con GPU TFLOPS 1.2, 8 GB di RAM e memoria interna da 500 GB o 1 TB a seconda delle versione. La console dispone di un lettore DVD/Blu-ray 6x, con connettività Wi-Fi, Ethernet e Bluetooth, input e output HDMI, supporto per il 4K e la risoluzione 1080 pixel');
INSERT into spacegaming.console(nome, descrizione) VALUES ('PS4', 'La PS4 contiene 8 GB di memoria RAM di tipo GDDR5, un hard disk interno da 500 GB, 1 o 2 TB , lettore Blu-ray 6x, DVD 8x, due porte USB 3.0 e una porta AUX. Presente la connettività Ethernet, Wi-Fi  e Bluetooth 2.1');
INSERT into spacegaming.console(nome, descrizione) VALUES ('SWITCH', 'Nintendo Switch è una console "ibrida" tra un sistema di gioco portatile e uno casalingo. Come console fissa Nintendo Switch si collega alla televisione tramite una docking station, chiamata Nintendo Switch Dock; due joypad rimovibili, chiamati Joy-Con, vengono tenuti insieme da un''impugnatura alla quale si agganciano creando un gamepad dalla forma squadrata.');

INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (30, 'Elder Ring', 69.99, 'PEGI : 16','PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\001.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (20, 'Fifa 21', 39.99, 'PEGI : 14','PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\002.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (30, 'The Last of Us 2', 50.99, 'PEGI : 18','PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\003.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (13, 'Halo', 24.99, 'Pegi : 16', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\004.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (10, 'Farcry Primal', 19.99, 'PEGI : 18', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\005.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (12, 'Uncharted 4', 24.99, 'PEGI : 16', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\006.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (16, 'Doom Eternal', 44.99, 'PEGI : 18', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\007.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (8, 'Call of Duty: Advanced Warfare', 18.99, 'PEGI : 18', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\008.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (5, 'Mafia III', 15.99, 'PEGI : 18', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\009.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (22, 'Tom Clancy: Ghost Recon', 49.99,'PEGI : 18', 'PS4', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\010.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (12, 'GreedFall', 69.99, 'PEGI : 16', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\011.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (3, 'Jumanji', 9.99, 'PEGI : 7', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\012.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (19,'Saints Row', 29.99, 'PEGI : 18', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\013.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (20, 'Forza Horizon 4', 39.99, 'PEGI : 10', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\014.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (13, 'Doom Eternal', 44.99, 'PEGI : 18', 'XBOX', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\015.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (30 , 'Pokemon Scudo', 59.99, 'PEGI : 8', 'SWITCH', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\016.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (20, 'Mario Tennis Aces', 49.99, 'PEGI : 8' , 'SWITCH', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\017.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (10, 'Mario e Sonic ai Giochi Olimpici', 45.99, 'PEGI : 10', 'SWITCH', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\018.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (7, 'Mario Kart 8: Deluxe', 45.99, 'PEGI : 8', 'SWITCH', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\019.jpg'));
INSERT into spacegaming.product(qty, nome, prezzo, descrizione, console, image) VALUES (18, 'Arms', 49.99, 'PEGI : 12', 'SWITCH', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products\\020.jpg'));

INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (17, 1, 3);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (18, 1, 1);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (19, 1, 2);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (15, 1, 1);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (18, 2, 1);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (18, 3, 1);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (16, 3, 1);
INSERT into spacegaming.acqprod(prodotto, acquisto, nCopie) VALUES (15, 3, 1);
