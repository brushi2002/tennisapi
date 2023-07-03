-- MySQL dump 10.13  Distrib 8.0.33, for macos12.6 (arm64)
--
-- Host: localhost    Database: tennisapp
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `League`
--

DROP TABLE IF EXISTS `League`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `League` (
  `LeagueID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Active` tinyint DEFAULT NULL,
  PRIMARY KEY (`LeagueID`),
  KEY `LT_idx` (`TypeID`),
  CONSTRAINT `LT` FOREIGN KEY (`TypeID`) REFERENCES `LeagueType` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `League`
--

LOCK TABLES `League` WRITE;
/*!40000 ALTER TABLE `League` DISABLE KEYS */;
INSERT INTO `League` VALUES (1,'VistaFlex',1,'2023-05-01 00:00:00','2023-07-01 00:00:00',NULL),(2,'CarlsbadLadder',2,'2023-05-01 00:00:00','2023-05-01 00:00:00',NULL);
/*!40000 ALTER TABLE `League` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LeagueResults`
--

DROP TABLE IF EXISTS `LeagueResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LeagueResults` (
  `LeagueID` int NOT NULL,
  `PlayerID1` int DEFAULT NULL,
  `PlayerID2` int DEFAULT NULL,
  `ScoreSet1` varchar(45) DEFAULT NULL,
  `ScoreSet2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LeagueID`),
  KEY `pl2_idx` (`PlayerID2`),
  KEY `pl1_idx` (`PlayerID1`),
  CONSTRAINT `pl1` FOREIGN KEY (`PlayerID1`) REFERENCES `Player` (`PlayerID`),
  CONSTRAINT `pl2` FOREIGN KEY (`PlayerID2`) REFERENCES `Player` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LeagueResults`
--

LOCK TABLES `LeagueResults` WRITE;
/*!40000 ALTER TABLE `LeagueResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `LeagueResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LeagueType`
--

DROP TABLE IF EXISTS `LeagueType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LeagueType` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeDescr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LeagueType`
--

LOCK TABLES `LeagueType` WRITE;
/*!40000 ALTER TABLE `LeagueType` DISABLE KEYS */;
INSERT INTO `LeagueType` VALUES (1,'FlexLeague'),(2,'Ladder');
/*!40000 ALTER TABLE `LeagueType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (1,'Carlos',5,NULL),(2,'Maria',4,NULL),(3,'Eric',3.5,NULL),(4,'Trout',5.5,'t@t.com'),(5,'Trout',5.5,'t@t.com');
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registration`
--

DROP TABLE IF EXISTS `Registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registration` (
  `LeagueID` int NOT NULL,
  `PlayerID` varchar(45) NOT NULL,
  PRIMARY KEY (`LeagueID`,`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registration`
--

LOCK TABLES `Registration` WRITE;
/*!40000 ALTER TABLE `Registration` DISABLE KEYS */;
INSERT INTO `Registration` VALUES (1,'1'),(1,'2');
/*!40000 ALTER TABLE `Registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-03 16:48:25
