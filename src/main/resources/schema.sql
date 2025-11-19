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
