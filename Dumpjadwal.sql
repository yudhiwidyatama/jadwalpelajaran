-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: jadwal
-- ------------------------------------------------------
-- Server version	5.1.35-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `jadwal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jadwal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jadwal`;

--
-- Table structure for table `aktivitas`
--

DROP TABLE IF EXISTS `aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aktivitas` (
  `id` varchar(45) NOT NULL DEFAULT 'C',
  `zzz` int(11) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktivitas`
--

LOCK TABLES `aktivitas` WRITE;
/*!40000 ALTER TABLE `aktivitas` DISABLE KEYS */;
INSERT INTO `aktivitas` VALUES ('BI',3,1,'Bahasa Indonesia',NULL,NULL),('CN',1,1,'Conversation',NULL,NULL),('HAQ',7,1,'H Al Quran',NULL,NULL),('IPA',4,1,'IPA',NULL,NULL),('ISM',10,3,'Ishoma',NULL,NULL),('IST',9,3,'Sholat dhuha/Istirahat',NULL,NULL),('MA',2,1,'Matematika',NULL,NULL),('OR',6,1,'Olah Raga',NULL,NULL),('PS',5,1,'Pengetahuan Sosial',NULL,NULL),('UP',8,2,'Upacara',NULL,NULL);
/*!40000 ALTER TABLE `aktivitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `haris`
--

DROP TABLE IF EXISTS `haris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  `kode` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `haris`
--

LOCK TABLES `haris` WRITE;
/*!40000 ALTER TABLE `haris` DISABLE KEYS */;
INSERT INTO `haris` VALUES (1,'Senin','ID',NULL,NULL),(2,'Selasa','ID',NULL,NULL),(3,'Rabu','ID',NULL,NULL),(4,'Kamis','ID',NULL,NULL),(5,'Jum\'at','ID',NULL,NULL),(6,'Sabtu','ID',NULL,NULL);
/*!40000 ALTER TABLE `haris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwals`
--

DROP TABLE IF EXISTS `jadwals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HariId` int(11) DEFAULT NULL,
  `AktivitaId` varchar(45) DEFAULT NULL,
  `WaktuId` varchar(45) DEFAULT NULL,
  `seqno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk2` (`HariId`),
  KEY `fk3` (`WaktuId`),
  KEY `fk1` (`AktivitaId`),
  KEY `fka` (`WaktuId`),
  CONSTRAINT `fka` FOREIGN KEY (`WaktuId`) REFERENCES `waktus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwals`
--

LOCK TABLES `jadwals` WRITE;
/*!40000 ALTER TABLE `jadwals` DISABLE KEYS */;
INSERT INTO `jadwals` VALUES (2,1,'UP','S45',1),(3,1,'CN','I35',2),(4,1,'CN','I35',3),(5,1,'MA','I35',4),(6,1,'IST','I35',5),(7,1,'MA','I35',6),(8,1,'BI','I35',7),(9,1,'BI','I35',8),(10,1,'ISM','I55',9),(11,1,'IPA','I35',10),(12,1,'IPA','I35',11),(13,1,'PS','I35',12),(14,1,'PS','I35',13),(15,1,'PS','I35',13);
/*!40000 ALTER TABLE `jadwals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waktus`
--

DROP TABLE IF EXISTS `waktus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waktus` (
  `id` varchar(45) NOT NULL DEFAULT 'C',
  `mulaijam` int(11) DEFAULT NULL,
  `mulaimenit` int(11) DEFAULT NULL,
  `jenis` char(1) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waktus`
--

LOCK TABLES `waktus` WRITE;
/*!40000 ALTER TABLE `waktus` DISABLE KEYS */;
INSERT INTO `waktus` VALUES ('I30',NULL,NULL,'I',30,NULL,NULL),('I35',NULL,NULL,'I',35,NULL,NULL),('I45',NULL,NULL,'I',45,NULL,NULL),('I55',NULL,NULL,'I',55,NULL,NULL),('S30',7,15,'S',30,NULL,NULL),('S45',7,45,'S',45,NULL,NULL);
/*!40000 ALTER TABLE `waktus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-14  7:27:08
