-- Créaton de la DATABSE
--
CREATE DATABASE IF NOT EXISTS finance;
USE finance;
--Création des tables
--
CREATE TABLE IF NOT EXISTS transaction (
    nom VARCHAR(32) NOT NULL,
    nomEquipe VARCHAR(32),
    date DATETIME,
    lieu VARCHAR(32),
    prix FLOAT(32),
    PRIMARY KEY (nom)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS trader (
    nom VARCHAR(32) NOT NULL,
    class_actif VARCHAR(32),
    anneeExperience FLOAT(32),
    nomEquipe VARCHAR(32),
    PRIMARY KEY (nom)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS equipe (
    nom VARCHAR(32) NOT NULL,
    style VARCHAR(32),
    chef VARCHAR(32),
    PRIMARY KEY (nom)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Insertion des données
--
INSERT INTO transaction

