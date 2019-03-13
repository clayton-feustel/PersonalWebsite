-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: publicationSystem
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `idAuthor` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAuthor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (1,'Matthew','K','Hong','https://www.cc.gatech.edu/~mhong39/index.html'),(2,'Lauren','','Wilcox','http://wilcox.gatech.edu/'),(3,'Karen','','Wasileski-Masker',''),(4,'Thomas','A','Olson',''),(5,'Stephen','F','Simoneaux',''),(6,'Clayton','E','Feustel',''),(7,'Meeshu','','Agnihotri',''),(8,'Shyamak','','Aggarwal',''),(10,'Bongshin','','Lee','http://bongshiny.com/'),(11,'Max','','Silverman','');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthorPublication`
--

DROP TABLE IF EXISTS `AuthorPublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthorPublication` (
  `idAuthorPublication` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL,
  `publication` int(11) NOT NULL,
  `authorOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAuthorPublication`),
  KEY `author` (`author`),
  KEY `publication` (`publication`),
  CONSTRAINT `AuthorPublication_ibfk_1` FOREIGN KEY (`author`) REFERENCES `Author` (`idAuthor`),
  CONSTRAINT `AuthorPublication_ibfk_2` FOREIGN KEY (`publication`) REFERENCES `Publication` (`idPublication`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorPublication`
--

LOCK TABLES `AuthorPublication` WRITE;
/*!40000 ALTER TABLE `AuthorPublication` DISABLE KEYS */;
INSERT INTO `AuthorPublication` VALUES (1,6,1,1),(2,8,1,2),(3,10,1,3),(4,2,1,4),(5,1,2,1),(6,6,2,2),(7,7,2,3),(8,11,2,4),(9,5,2,5),(10,2,2,6),(11,1,3,1),(12,2,3,2),(13,6,3,3),(14,3,3,4),(15,4,3,5),(16,5,3,6);
/*!40000 ALTER TABLE `AuthorPublication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conference`
--

DROP TABLE IF EXISTS `Conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conference` (
  `idConference` int(11) NOT NULL AUTO_INCREMENT,
  `platform` int(11) NOT NULL,
  `acceptance` float DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`idConference`),
  KEY `platform` (`platform`),
  CONSTRAINT `Conference_ibfk_1` FOREIGN KEY (`platform`) REFERENCES `Platform` (`idPlatform`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conference`
--

LOCK TABLES `Conference` WRITE;
/*!40000 ALTER TABLE `Conference` DISABLE KEYS */;
INSERT INTO `Conference` VALUES (1,3,0.27,'Singapore',NULL,'Singapore','2018-10-08','2018-10-12'),(2,2,0.25,'United States of America','Colorado','Denver','2017-05-06','2017-05-11'),(3,1,NULL,'United States of America','Illinois','Chicago','2016-11-12','2017-11-16');
/*!40000 ALTER TABLE `Conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platform`
--

DROP TABLE IF EXISTS `Platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platform` (
  `idPlatform` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `abreviation` varchar(255) DEFAULT NULL,
  `impactFactor` float DEFAULT NULL,
  PRIMARY KEY (`idPlatform`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platform`
--

LOCK TABLES `Platform` WRITE;
/*!40000 ALTER TABLE `Platform` DISABLE KEYS */;
INSERT INTO `Platform` VALUES (1,'American Medical Informatics Association','AMIA',NULL),(2,'Conference on Human Factors in Computing Systems','CHI',NULL),(3,'Interactive, Mobile, Wearable and Ubiquitous Technologies','IMWUT',NULL);
/*!40000 ALTER TABLE `Platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
  `idPublication` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `conference` int(11) NOT NULL,
  `pdfLink` varchar(255) DEFAULT NULL,
  `slideLink` varchar(255) DEFAULT NULL,
  `webSource` varchar(255) DEFAULT NULL,
  `webLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPublication`),
  KEY `conference` (`conference`),
  CONSTRAINT `Publication_ibfk_1` FOREIGN KEY (`conference`) REFERENCES `Publication` (`idPublication`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publication`
--

LOCK TABLES `Publication` WRITE;
/*!40000 ALTER TABLE `Publication` DISABLE KEYS */;
INSERT INTO `Publication` VALUES (1,'People Like Me: Designing for Reflection on Aggregate Cohort Data in Personal Informatics Systems',1,'http://hx.gatech.edu/media/People_Like_Me_Ubicomp.pdf',NULL,'ACM','https://dl.acm.org/citation.cfm?id=3264917'),(2,'Supporting Families in Reviewing and Communicating about Radiology Imaging Studies',2,'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5600522/',NULL,'ACM','https://dl.acm.org/citation.cfm?id=3264917'),(3,'Adolescent and Caregiver use of a Tethered Personal Health Record System',3,'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5333234/pdf/2498353.pdf',NULL,'PMC','https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5333234/');
/*!40000 ALTER TABLE `Publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 18:48:15
