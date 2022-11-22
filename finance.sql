-- Créaton de la DATABSE
--
CREATE DATABASE IF NOT EXISTS finance;
USE finance;
--  Création des tables
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
    classe_actif VARCHAR(32),
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
INSERT INTO transaction (nom, nomEquipe, date, lieu, prix) VALUES 
('AXA SA', 'equipe1', '2021-06-15', 'PARIS', 26),
('TotalEnergies', 'equipe2', '2004-09-03', 'PARIS', 57),
('Apple Inc', 'equipe1', '2014-09-05', 'USA', 150),
('Dubai Elec', 'equipe3', '2020-11-22', 'DUBAI', 1),
('Amazon', 'equipe3', '2010-07-12', 'USA', 100),
('Naspers', 'equipe2', '1997-08-16', 'SOUTH AFRICA', 120),
('PetroChina', 'equipe5', '2019-04-20', 'HONG KONG', 10),
('ETF Vanguard','equipe7', '2015-02-22', 'LA', 200),
('Dassault Aviation', 'equipe6', '2016-01-01', 'PARIS', 140);

INSERT INTO trader (nom, classe_actif, anneeExperience, nomEquipe) VALUES
('Yannick', 'fixed income', 10, 'equipe1'),
('Patrick', 'action', 10, 'equipe1'),
('Cedrick', 'commodities', 10, 'equipe1'),
('Jordan', 'change', 2, 'equipe2'),
('Gaelle', 'exotic', 4, 'equipe3'),
('Georges', 'CDS', 20, 'equipe6');

INSERT INTO equipe (nom, style, chef) VALUES
('equipe1', 'market making', 'leonardo'),
('equipe2', 'arbitrage', 'michaelgelo'),
('equipe3', 'trading de volatilite', 'raphael'),
('equipe4', 'trading haute frequence', 'donatello'),
('equipe5', 'arbitrage statistique', 'Smith'),
('equipe6', 'arbitrage statistique', 'Smith'),
('equipe7', 'strategie fond de fond', 'Ray');