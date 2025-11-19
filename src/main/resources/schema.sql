
-- Création de la base et sélection
CREATE DATABASE IF NOT EXISTS taxi_api;
USE taxi_api;

-- Création des tables
CREATE TABLE `chauffeur` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `statut` enum('disponible','en_course','indisponible') DEFAULT NULL,
  `vehicule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_heure_arrivee` datetime(6) DEFAULT NULL,
  `date_heure_depart` datetime(6) DEFAULT NULL,
  `point_arrivee` varchar(255) DEFAULT NULL,
  `point_depart` varchar(255) DEFAULT NULL,
  `status` enum('demandee','en_cours','terminee','annulee') DEFAULT NULL,
  `tarif` decimal(38,2) DEFAULT NULL,
  `chauffeur_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_chauffeur` (`chauffeur_id`),
  KEY `FK_client` (`client_id`),
  CONSTRAINT `FK_chauffeur` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeur` (`id`),
  CONSTRAINT `FK_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Création d'un utilisateur applicatif avec droits limités
CREATE USER IF NOT EXISTS 'taxi_app'@'%' IDENTIFIED BY 'taxi_app_pwd';
GRANT SELECT, INSERT, UPDATE, DELETE ON taxi_api.* TO 'taxi_app'@'%';
FLUSH PRIVILEGES;

-- Insertion de données initiales exemple
INSERT INTO chauffeur (immatriculation, nom, statut, vehicule) VALUES ('AA-123-BB', 'Dupont', 'disponible', 'Peugeot 208');
INSERT INTO client (email, nom, tel) VALUES ('client1@mail.com', 'Martin', '0600000000');
INSERT INTO course (date_heure_arrivee, date_heure_depart, point_arrivee, point_depart, status, tarif, chauffeur_id, client_id) VALUES (NOW(), NOW(), 'Arrivée', 'Départ', 'demandee', 15.00, 1, 1);

-- Chauffeurs de test reconnaissables
INSERT INTO chauffeur (immatriculation, nom, statut, vehicule) VALUES
('TEST-001', 'TestChauffeur1', 'disponible', 'Renault Clio'),
('TEST-002', 'TestChauffeur2', 'indisponible', 'Toyota Prius'),
('TEST-003', 'TestChauffeur3', 'en_course', 'Citroen C3');

-- Clients de test reconnaissables
INSERT INTO client (email, nom, tel) VALUES
('testclient1@demo.com', 'TestClient1', '0600000001'),
('testclient2@demo.com', 'TestClient2', '0600000002'),
('testclient3@demo.com', 'TestClient3', '0600000003');
