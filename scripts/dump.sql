CREATE DATABASE  IF NOT EXISTS `db_app_db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_app_db2`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: db_app_db2
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amizade`
--

DROP TABLE IF EXISTS `amizade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade` (
  `leitor_id1` int DEFAULT NULL,
  `leitor_id2` int DEFAULT NULL,
  KEY `leitor_id1` (`leitor_id1`),
  KEY `leitor_id2` (`leitor_id2`),
  CONSTRAINT `amizade_ibfk_1` FOREIGN KEY (`leitor_id1`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `amizade_ibfk_2` FOREIGN KEY (`leitor_id2`) REFERENCES `leitor` (`leitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade`
--

LOCK TABLES `amizade` WRITE;
/*!40000 ALTER TABLE `amizade` DISABLE KEYS */;
INSERT INTO `amizade` VALUES (1,2),(2,3),(3,1),(4,2),(1,2),(2,3),(3,4),(4,2),(1,2),(2,3),(1,4),(4,2);
/*!40000 ALTER TABLE `amizade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Fernando Pessoa',68,'Brasileiro'),(2,'Pedro Machado',78,'Brasileiro'),(3,'Felipe Andrade',31,'Brasileiro'),(4,'Maria Eduarda',28,'Brasileiro'),(7,'Joaquim',56,'Português');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `leitor_id` int DEFAULT NULL,
  `livro_id` int DEFAULT NULL,
  KEY `leitor_id` (`leitor_id`),
  KEY `livro_id` (`livro_id`),
  CONSTRAINT `biblioteca_ibfk_1` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `biblioteca_ibfk_2` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,2),(2,3),(3,1),(4,4),(1,3);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor` (
  `leitor_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES (1,'João',10,'Brasileiro'),(2,'Esmeralda',22,'Argentina'),(3,'Gustavo',20,'Brasileiro'),(4,'Pedro',21,'Brasileiro'),(5,'PEDRO',30,'Brasileiro'),(6,'João',12,'Brasileiro');
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `upper_case` BEFORE INSERT ON `leitor` FOR EACH ROW BEGIN
SET NEW.nome = UPPER(NEW.nome);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `inicio_leitura` date DEFAULT NULL,
  `fim_leitura` date DEFAULT NULL,
  `leitor_id` int DEFAULT NULL,
  `livro_id` int DEFAULT NULL,
  KEY `leitor_id` (`leitor_id`),
  KEY `livro_id` (`livro_id`),
  CONSTRAINT `leitura_ibfk_1` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `leitura_ibfk_2` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES ('2022-04-05','2022-04-10',1,2),('2022-08-07','2022-08-16',2,3),('2022-09-16','2022-10-18',3,1),('2022-11-11','2022-11-12',4,4);
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `livro_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `editora` varchar(100) DEFAULT NULL,
  `autor_id` int DEFAULT NULL,
  PRIMARY KEY (`livro_id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'A Montanha Mágica','Ficção','Fazcom',1),(2,'Dom Casmurro','Romance','Estrela',2),(3,'Dom Quixote','Fantasia','Estrela',3),(4,'Guerra e Paz','Ação','Culturama',4);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quantid_amgs`
--

DROP TABLE IF EXISTS `quantid_amgs`;
/*!50001 DROP VIEW IF EXISTS `quantid_amgs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantid_amgs` AS SELECT 
 1 AS `count(leitor_id1)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quantidade_amg`
--

DROP TABLE IF EXISTS `quantidade_amg`;
/*!50001 DROP VIEW IF EXISTS `quantidade_amg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantidade_amg` AS SELECT 
 1 AS `count(leitor_id1)`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_app_db2'
--

--
-- Dumping routines for database 'db_app_db2'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_insere_leitor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insere_leitor`(IN Ileitor_id INT, IN Inome VARCHAR(100), IN Iidade INT, IN Inacionalidade VARCHAR(100))
BEGIN
	INSERT INTO leitor (leitor_id, nome, idade, nacionalidade)
    VALUES (Ileitor_id, Inome, Iidade, Inacionalidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `quantid_amgs`
--

/*!50001 DROP VIEW IF EXISTS `quantid_amgs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantid_amgs` AS select count(`amizade`.`leitor_id1`) AS `count(leitor_id1)` from `amizade` where (`amizade`.`leitor_id1` = 1) group by `amizade`.`leitor_id1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantidade_amg`
--

/*!50001 DROP VIEW IF EXISTS `quantidade_amg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantidade_amg` AS select count(`amizade`.`leitor_id1`) AS `count(leitor_id1)` from `amizade` where ((`amizade`.`leitor_id1` = 1) and (`amizade`.`leitor_id2` = 1)) group by `amizade`.`leitor_id1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07 23:15:40
