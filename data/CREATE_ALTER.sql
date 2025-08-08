/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ancienniteiten` (
  `Jaar` int NOT NULL,
  `Salaris` int NOT NULL,
  PRIMARY KEY (`Jaar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cursussen` (
  `Cursusnr` int NOT NULL AUTO_INCREMENT,
  `Docent_id` int NOT NULL,
  `Specialisatie_id` int DEFAULT NULL,
  `Titel` varchar(50) NOT NULL,
  `Studiepunten` int NOT NULL,
  `Bijkomende_Kost` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`Cursusnr`),
  UNIQUE KEY `Titel` (`Titel`),
  KEY `Docent_id` (`Docent_id`),
  KEY `Specialisatie_id` (`Specialisatie_id`),
  CONSTRAINT `Cursussen_ibfk_1` FOREIGN KEY (`Docent_id`) REFERENCES `Docenten` (`Docent_id`),
  CONSTRAINT `Cursussen_ibfk_2` FOREIGN KEY (`Specialisatie_id`) REFERENCES `Specialisaties` (`Specialisatie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Docenten` (
  `Docent_id` int NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(255) NOT NULL,
  `Achernaam` varchar(255) NOT NULL,
  `Woonplaats` varchar(150) NOT NULL,
  `Aanstellingsdatum` date NOT NULL,
  PRIMARY KEY (`Docent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inschrijvingen` (
  `Student_id` int NOT NULL,
  `Cursusnr` int NOT NULL,
  `Kost_betaald` decimal(4,2) NOT NULL,
  `Punten` int DEFAULT NULL,
  PRIMARY KEY (`Student_id`,`Cursusnr`),
  KEY `Cursusnr` (`Cursusnr`),
  CONSTRAINT `Inschrijvingen_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Studenten` (`Student_id`),
  CONSTRAINT `Inschrijvingen_ibfk_2` FOREIGN KEY (`Cursusnr`) REFERENCES `Cursussen` (`Cursusnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Specialisaties` (
  `Specialisatie_id` int NOT NULL AUTO_INCREMENT,
  `Code` char(8) NOT NULL,
  `Naam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Specialisatie_id`),
  UNIQUE KEY `Code` (`Code`),
  UNIQUE KEY `Code_2` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Studenten` (
  `Student_id` int NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Geboortedatum` date DEFAULT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;