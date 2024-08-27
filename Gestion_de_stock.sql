-- création de la base  de donnée
CREATE DATABASE GestionStock;
USE GestionStock;
-- Création de la table client
CREATE TABLE client(Idclient  INTEGER PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(225) NOT NULL,
prénom VARCHAR(225) NOT NULL,
adresse VARCHAR(225),
téléphone vARCHAR(225),
Email VARCHAR(20) UNIQUE
);
-- création de la table fournisseur
CREATE TABLE fournisseur(Idfournisseur INTEGER PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(225) NOT NULL,
prénom VARCHAR(225) NOT NULL,
adresse VARCHAR(225),
téléphone VARCHAR(225),
Email VARCHAR(20) UNIQUE,
contact VARCHAR(225)
);
-- CRéation de la table catégorie
CREATE TABLE catégorie(Idcatégorie INTEGER PRIMARY KEY AUTO_INCREMENT,
nom_catégorie VARCHAR(225) NOT NULL,
Description TEXT
);
-- Création de la table produits
CREATE TABLE produit(Idproduit INTEGER PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(225) NOT NULL,
Description TEXT,
prix_unitaire FLOAT NOT NULL,
Quantité_stock INTEGER DEFAULT 0,
Idcatégorie INTEGER,
FOREIGN KEY(Idcatégorie) REFERENCES catégorie(Idcatégorie)
);
-- création de la table mouvement de stock
CREATE TABLE mouvement_de_stock(Idmouvement INTEGER PRIMARY KEY AUTO_INCREMENT, 
date_mouvement DATE NOT NULL,
type_mouvement ENUM('entré' ,'sortie') NOT NULL,
quantité INTEGER NOT NULL,
Idproduit INTEGER,
FOREIGN KEY (Idproduit)REFERENCES produit(Idproduit)
);
-- Création de la table commandes
CREATE TABLE commande(Idcommande INTEGER PRIMARY KEY AUTO_INCREMENT,
date_commande DATE NOT NULL,
statut_commande VARCHAR(225),
Idclient INTEGER,
FOREIGN KEY (Idclient)REFERENCES client(Idclient) 
);
-- Création de la table ligne de commande
CREATE TABLE ligne_de_commande(Idligne INTEGER PRIMARY KEY AUTO_INCREMENT,
quantité_commandée INTEGER NOT NULL,
prix_unitaire INTEGER NOT NULL,
Idproduit INTEGER,
Idcommande INTEGER,
FOREIGN KEY (Idcommande)REFERENCES commande(Idcommande),
FOREIGN KEY (Idproduit)REFERENCES produit(Idproduit) 
);
-- Création de la table Retour client
CREATE TABLE retour_client(Idretour INTEGER PRIMARY KEY AUTO_INCREMENT,
quantité_retournée INTEGER NOT NULL,
raison_retour TEXT NOT NULL,
Idclient  INTEGER,
Idproduit INTEGER,
FOREIGN KEY (Idclient)REFERENCES client(Idclient),
FOREIGN KEY (Idproduit)REFERENCES produit(Idproduit) 
);
-- Création de la table livraison
CREATE TABLE livraison(idlivraison INTEGER PRIMARY KEY AUTO_INCREMENT,
Date_livraison DATE,
quantité_livréé INTEGER NOT NULL,
 Idproduit INTEGER,
 Idfournisseur INTEGER,
FOREIGN KEY (Idproduit)REFERENCES produit(Idproduit),
FOREIGN KEY (Idfournisseur)REFERENCES fournisseur(Idfournisseur)
 );