-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: vds
-- ------------------------------------------------------
-- Server version 	9.1.0
-- Date: Sat, 03 May 2025 23:49:47 +0200

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `autMail` tinyint(1) NOT NULL DEFAULT '0',
  `nbConnexion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `nom` (`nom`,`prenom`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `membre` VALUES (1,'admin','$2y$10$GrNn8rMsRnov550LWCnUPeV3vBE9Dp517rdLsV.HC2./hLIK0LEbC','VERGHOTE','GUY','guy.verghote@saint-remi.net',NULL,NULL,0,22),(2,'jbernard','$2y$10$hdAU5Q0k1dBVhU3D1pHER.IKkXF7ptl684V5o5RMwoLPUtS0SfeBK','BERNARD','JULIEN','julien.bernard@saint-remi.net',NULL,NULL,0,4),(3,'acaron','$2y$10$c4Zm0GGkSn/H6dpYcVw1We7omEkG5/J2uoCeY6TfBGo8AKNxqpVHG','CARON','ADAM','adam.caron@saint-remi.net',NULL,NULL,0,1),(4,'mboularbi','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','BOULARBI','MEDDHY','meddhy.boularbi@saint-remi.net',NULL,NULL,0,0),(5,'rcharkaoui','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHARKAOUI','RAYANE','rayane.charkaoui@saint-remi.net',NULL,NULL,0,0),(6,'achastagner','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHASTAGNER','ARTHUR','arthur.chastagner@saint-remi.net',NULL,NULL,0,0),(7,'acoulon','$2y$10$5p4GUjjQj.LNJa4mHgL6WO3TCZX59xhlWtsrkdG7Hw.icmlwWrLbW','COULON','ALEXANDRE','alexandre.coulon@saint-remi.net',NULL,NULL,0,1),(8,'adubois','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUBOIS','ALEXANDRE','alexandre.dubois@saint-remi.net',NULL,NULL,0,0),(9,'tjosse','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','JOSSE','THOMAS','thomas.josse@saint-remi.net',NULL,NULL,0,0),(10,'mlecanu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LE CANU','MATHIS','mathis.le-canu@saint-remi.net',NULL,NULL,0,0),(11,'zlion','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LION','ZIGGY','ziggy.lion@saint-remi.net',NULL,NULL,0,0),(12,'rlongby','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LONGBY','RENEDI','renedi.longby@saint-remi.net',NULL,NULL,0,0),(13,'mlourdel','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LOURDEL','MATHIS','mathis.lourdel@saint-remi.net',NULL,NULL,0,0),(14,'smorales','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','MORALES','SIMON','simon.morales@saint-remi.net',NULL,NULL,0,0),(15,'fnedelec','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','NEDELEC','FLORE','flore.nedelec@saint-remi.net',NULL,NULL,0,0),(16,'tparis','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','PARIS','THOMAS','thomas.paris@saint-remi.net',NULL,NULL,0,0),(17,'trichard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TONNY','tonny.richard@saint-remi.net',NULL,NULL,0,0),(18,'trichard1','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TOM','tom.richard@saint-remi.net',NULL,NULL,0,0),(19,'groelens','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','ROELENS','GABRIEL','gabriel.roelens@saint-remi.net',NULL,NULL,0,0),(20,'lsouktani','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SOUKTANI','LEO','leo.souktani@saint-remi.net',NULL,NULL,0,0),(21,'msuberu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SUBERU','MOUBARAK','moubarak.suberu@saint-remi.net',NULL,NULL,0,0),(22,'ctison','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','TISON','CLAIRE','claire.tison@saint-remi.net',NULL,NULL,0,0);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `membre` with 22 row(s)
--

--
-- Table structure for table `oubli`
--

DROP TABLE IF EXISTS `oubli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oubli` (
  `login` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`login`),
  UNIQUE KEY `token` (`token`),
  CONSTRAINT `oubli_ibfk_1` FOREIGN KEY (`login`) REFERENCES `membre` (`login`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oubli`
--

LOCK TABLES `oubli` WRITE;
/*!40000 ALTER TABLE `oubli` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `oubli` VALUES ('admin','03b224a92990179f55067c993fa5daed95628afcf577a03270768e585d05','2024-08-17 14:32:02');
/*!40000 ALTER TABLE `oubli` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oubli` with 1 row(s)
--

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password` (
  `login` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`login`,`password`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`login`) REFERENCES `membre` (`login`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `password` VALUES ('admin','$2y$10$4ZnZ/tC/0gHb469n.U2oUeX70Al6dHUuqh1GIq0Nzcz/jgm3NCqRW','2024-08-17 17:23:36'),('admin','$2y$10$9o6REgwn9FLS1Jf4WOvHjuGWPiDhM1WU0fYUAnbBTbm/ayiYoSGzm','2024-08-17 18:59:55'),('admin','$2y$10$mE0gW3UIHOl6/eZ6ICsRjuXGowq41JcJA2xX1Tfm33DlaDyFqNlFa','2024-08-17 17:17:19'),('admin','$2y$10$MwkYKx/Vnb.FZ3.K8yoyS..ieye69N0WRD3ubT9ACAv98grpYLN3m','2024-08-18 11:17:01'),('admin','$2y$10$Q3BzU6/6D7097R.U9wi91.Yoc2Wgmr3pTrF6042eYMFPyWYG4Oeeu','2024-08-17 19:00:41'),('admin','$2y$10$uEjOOUTvS3TS4KvdG/9P7u4/S.tHI6gHf45NmAGoW5wmUeuKN/E3m','2024-08-17 17:22:28'),('admin','$2y$10$WeOipT93GFJ4tW53fA740uxhEolP4ycfzGyyxe/ZPocHbD66BdF2q','2024-08-17 17:22:53'),('admin','4d5a29d68fec1f600bc29e3bb877a7617e71f8ab8b8be765e67fdb8a37554af5','2024-08-18 11:17:10');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `password` with 8 row(s)
--

--
-- Table structure for table `statpage`
--

DROP TABLE IF EXISTS `statpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statpage` (
  `nom` varchar(150) NOT NULL,
  `nb` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statpage`
--

LOCK TABLES `statpage` WRITE;
/*!40000 ALTER TABLE `statpage` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `statpage` VALUES ('Accueil',50),('Classement 2024-05-08 soiree piste a camon.pdf',1),('Classement 2024-05-22 soiree piste du 22 mai 2024.pdf',1),('Classement 2024-06-20 soiree piste du 19 juin 2024.pdf',1),('Connexion',28),('Modification du mot de passe',4);
/*!40000 ALTER TABLE `statpage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statpage` with 6 row(s)
--

--
-- Table structure for table `statvisite`
--

DROP TABLE IF EXISTS `statvisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statvisite` (
  `date` date NOT NULL,
  `nb` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statvisite`
--

LOCK TABLES `statvisite` WRITE;
/*!40000 ALTER TABLE `statvisite` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `statvisite` VALUES ('2024-06-20',244),('2024-06-21',140),('2024-06-22',186),('2024-06-23',297),('2024-06-24',132),('2024-06-25',222),('2024-06-26',226),('2024-06-27',270),('2024-06-28',274),('2024-06-29',200),('2024-06-30',209),('2024-07-01',181),('2024-07-02',267),('2024-07-03',150),('2024-07-04',127),('2024-07-05',196),('2024-07-06',251),('2024-07-07',119),('2024-07-08',216),('2024-07-09',287),('2024-07-10',239),('2024-07-11',135),('2024-07-12',112),('2024-07-13',176),('2024-07-14',289),('2024-07-15',123),('2024-07-16',209),('2024-07-17',207),('2024-07-18',242),('2024-07-19',167),('2024-07-20',299),('2024-07-21',208),('2024-07-22',147),('2024-07-23',210),('2024-07-24',268),('2024-07-25',142),('2024-07-26',182),('2024-07-27',155),('2024-07-28',165),('2024-07-29',123),('2024-07-30',250),('2024-07-31',142),('2024-08-01',187),('2024-08-02',299),('2024-08-03',134),('2024-08-04',292),('2024-08-05',141),('2024-08-06',239),('2024-08-07',251),('2024-08-08',171),('2024-08-09',168),('2024-08-10',123),('2024-08-11',116),('2024-08-12',253),('2024-08-13',283),('2024-08-14',288),('2024-08-15',218),('2024-08-16',234),('2024-08-17',217),('2024-08-18',252),('2024-08-21',1),('2024-08-22',14),('2024-08-23',3),('2024-08-24',2),('2024-11-13',2),('2024-11-14',2),('2024-11-15',1),('2024-11-17',1),('2025-04-30',1),('2025-05-02',1),('2025-05-03',1);
/*!40000 ALTER TABLE `statvisite` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statvisite` with 71 row(s)
--

--
-- Table structure for table `tentative`
--

DROP TABLE IF EXISTS `tentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tentative` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentative`
--

LOCK TABLES `tentative` WRITE;
/*!40000 ALTER TABLE `tentative` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tentative` VALUES (1,'2024-08-12 20:43:07','::1','test','test'),(2,'2024-08-12 20:43:47','::1','test','test'),(3,'2024-08-12 20:43:48','::1','test','test'),(4,'2024-08-12 20:43:48','::1','test','test'),(5,'2024-08-12 20:44:13','::1','test','test'),(6,'2024-08-12 20:54:43','::1','test','test'),(7,'2024-08-12 20:54:45','::1','test','test'),(8,'2024-08-12 20:54:45','::1','test','test'),(9,'2024-08-12 20:54:46','::1','test','test'),(10,'2024-08-12 20:54:46','::1','test','test'),(11,'2024-08-13 11:53:14','::1','admin','123456'),(12,'2024-08-13 12:01:42','::1','admin','0000'),(13,'2024-08-13 12:02:19','::1','gverghote','0000'),(14,'2024-08-13 12:12:12','::1','gverghote','00000'),(15,'2024-08-13 12:12:27','::1','gverghote','Test.001'),(16,'2024-08-13 12:12:33','::1','gverghote','Test.002'),(17,'2024-08-13 15:36:03','::1','admin','Test.000'),(18,'2024-08-13 15:36:06','::1','admin','Test.002'),(19,'2024-08-13 15:36:13','::1','admin','Test.001'),(20,'2024-08-13 20:09:13','::1','gverghote','Test.000'),(21,'2024-08-15 18:02:51','::1','admin','Admin133!'),(22,'2024-08-15 18:08:59','::1','jbernard','1111'),(23,'2024-08-15 18:50:18','::1','JBERNARD','1111'),(24,'2024-08-16 11:32:02','::1','admin','Admin123!'),(25,'2024-08-16 11:32:13','::1','admin','Test.000'),(26,'2024-08-16 11:32:23','::1','admin','Test.001'),(27,'2024-08-16 11:32:40','::1','admin','Test.000'),(28,'2024-08-17 18:59:06','::1','admin','Vds!fr.2024'),(29,'2024-08-18 11:15:42','::1','admin','Test.004'),(30,'2024-08-18 11:15:55','::1','admin','Test.005'),(31,'2024-08-22 19:43:20','::1','admin','Test.005'),(32,'2024-08-22 19:45:32','::1','admin','Admin4123!'),(33,'2024-08-22 19:45:32','::1','admin','Admin4123!'),(34,'2024-08-23 16:47:24','::1','test','test'),(35,'2024-08-23 16:48:45','::1','test','test'),(36,'2024-08-23 16:48:46','::1','test','test'),(37,'2024-08-23 16:48:46','::1','test','test'),(38,'2024-08-23 16:48:50','::1','test','test'),(39,'2024-08-23 16:50:00','::1','test','test'),(40,'2024-08-23 16:50:01','::1','test','test'),(41,'2024-08-23 17:10:52','::1','test','test'),(42,'2024-08-23 17:10:53','::1','test','test'),(43,'2024-08-23 17:10:54','::1','test','test'),(44,'2024-08-23 17:10:54','::1','test','test'),(45,'2024-08-23 17:10:55','::1','test','test'),(46,'2024-08-23 17:10:57','::1','test','test'),(47,'2024-08-23 17:39:51','::1','test','tets'),(48,'2024-08-23 17:39:53','::1','test','tets'),(49,'2024-08-23 17:39:55','::1','test','tets'),(50,'2024-08-23 17:39:56','::1','test','tets'),(51,'2024-08-23 17:39:58','::1','test','tets'),(52,'2024-08-23 17:40:09','::1','admin','Admin!123'),(53,'2024-08-23 17:41:24','::1','admin','Admin133!'),(54,'2024-08-23 17:54:30','::1','test','test'),(55,'2024-08-23 17:54:31','::1','test','test'),(56,'2024-08-23 17:54:31','::1','test','test'),(57,'2024-08-23 17:54:32','::1','test','test'),(58,'2024-08-23 17:54:35','::1','test','test'),(59,'2024-11-13 06:21:59','::1','test','1111'),(60,'2025-04-30 11:33:37','::1','admin','Test!000'),(61,'2025-04-30 11:33:56','::1','admin','Test!111');
/*!40000 ALTER TABLE `tentative` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tentative` with 61 row(s)
--

--
-- Table structure for table `traficip`
--

DROP TABLE IF EXISTS `traficip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traficip` (
  `ip` varchar(50) NOT NULL,
  `horodatage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traficip`
--

LOCK TABLES `traficip` WRITE;
/*!40000 ALTER TABLE `traficip` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `traficip` VALUES ('::1','2025-05-03 14:24:02','/backoffice/trafic/index.php'),('::1','2025-05-03 14:24:09','/backoffice/trafic/index.php'),('::1','2025-05-03 14:24:39','/backoffice/journaux/'),('::1','2025-05-03 14:24:39','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:24:42','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:26:33','/backoffice/journaux/'),('::1','2025-05-03 14:26:33','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:26:37','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:26:41','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:26:44','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:28:24','/backoffice/journaux/'),('::1','2025-05-03 14:28:25','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:28:28','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:30:17','/backoffice/journaux/'),('::1','2025-05-03 14:30:18','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:30:19','/backoffice/journaux/'),('::1','2025-05-03 14:30:20','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:30:22','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:32:35','/backoffice/journaux/'),('::1','2025-05-03 14:32:36','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:32:38','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:33:58','/backoffice/journaux/'),('::1','2025-05-03 14:33:58','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:34:38','/backoffice/journaux/'),('::1','2025-05-03 14:34:38','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:34:40','/backoffice/journaux/'),('::1','2025-05-03 14:34:41','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:13','/backoffice/journaux/'),('::1','2025-05-03 14:35:14','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:15','/backoffice/journaux/'),('::1','2025-05-03 14:35:15','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:18','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:33','/backoffice/journaux/'),('::1','2025-05-03 14:35:34','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:51','/backoffice/journaux/'),('::1','2025-05-03 14:35:52','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:35:59','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:52:45','/backoffice/journaux/'),('::1','2025-05-03 14:53:41','/backoffice/journaux/'),('::1','2025-05-03 14:53:42','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:54:05','/backoffice/journaux/'),('::1','2025-05-03 14:54:05','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:54:21','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:56:14','/backoffice/journaux/'),('::1','2025-05-03 14:56:15','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:56:17','/backoffice/journaux/'),('::1','2025-05-03 14:56:18','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 14:56:22','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:00:42','/backoffice/journaux/'),('::1','2025-05-03 15:00:43','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:03:31','/backoffice/journaux/'),('::1','2025-05-03 15:03:32','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:04:59','/backoffice/journaux/ajax/supprimer.php'),('::1','2025-05-03 15:05:01','/backoffice/journaux/'),('::1','2025-05-03 15:05:02','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:06:44','/backoffice/journaux/'),('::1','2025-05-03 15:06:45','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:07:05','/backoffice/journaux/'),('::1','2025-05-03 15:07:06','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:07:21','/backoffice/journaux/'),('::1','2025-05-03 15:07:22','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:07:24','/backoffice/journaux/'),('::1','2025-05-03 15:07:25','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:10:07','/backoffice/journaux/'),('::1','2025-05-03 15:10:08','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:10:16','/backoffice/journaux/'),('::1','2025-05-03 15:10:17','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:11:23','/backoffice/journaux/'),('::1','2025-05-03 15:11:24','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:11:43','/backoffice/journaux/'),('::1','2025-05-03 15:11:43','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:11:48','/backoffice/journaux/'),('::1','2025-05-03 15:11:48','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:11:56','/backoffice/journaux/'),('::1','2025-05-03 15:11:57','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:17:01','/backoffice/journaux/'),('::1','2025-05-03 15:17:02','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:18:32','/backoffice/journaux/'),('::1','2025-05-03 15:18:32','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:20:28','/backoffice/journaux/ajax/supprimer.php'),('::1','2025-05-03 15:20:32','/backoffice/journaux/'),('::1','2025-05-03 15:20:32','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:20:40','/backoffice/journaux/'),('::1','2025-05-03 15:20:41','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:21:30','/backoffice/journaux/'),('::1','2025-05-03 15:21:30','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:21:32','/backoffice/journaux/'),('::1','2025-05-03 15:21:33','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:21:33','/backoffice/journaux/'),('::1','2025-05-03 15:21:34','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:32:48','/backoffice/journaux/'),('::1','2025-05-03 15:32:49','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:35:39','/backoffice/journaux/'),('::1','2025-05-03 15:35:41','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:36:55','/backoffice/journaux/'),('::1','2025-05-03 15:36:55','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:36:58','/backoffice/journaux/'),('::1','2025-05-03 15:36:59','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:37:49','/backoffice/journaux/'),('::1','2025-05-03 15:37:50','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:38:23','/backoffice/journaux/'),('::1','2025-05-03 15:38:24','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:38:25','/backoffice/journaux/'),('::1','2025-05-03 15:38:26','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:46:52','/backoffice/journaux/'),('::1','2025-05-03 15:46:53','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:46:58','/backoffice/journaux/'),('::1','2025-05-03 15:46:59','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 15:47:46','/backoffice/journaux/'),('::1','2025-05-03 15:47:46','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:26:59','/backoffice/journaux/'),('::1','2025-05-03 16:27:01','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:27:14','/backoffice/journaux/vider.php?journal=evenement'),('::1','2025-05-03 16:27:14','/backoffice/journaux/index.php'),('::1','2025-05-03 16:27:14','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:28:15','/backoffice/journaux/vider.php?journal=evenement'),('::1','2025-05-03 16:28:15','/backoffice/journaux/index.php'),('::1','2025-05-03 16:28:15','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:47:38','/backoffice/journaux/index.php'),('::1','2025-05-03 16:47:38','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:53:19','/backoffice/journaux/index.php'),('::1','2025-05-03 16:53:19','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:54:11','/backoffice/journaux/index.php'),('::1','2025-05-03 16:54:11','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:55:02','/backoffice/journaux/index.php'),('::1','2025-05-03 16:55:02','/backoffice/journaux/ajax/afficher.php'),('::1','2025-05-03 16:57:26','/backoffice/trafic/'),('::1','2025-05-03 17:12:12','/backoffice/trafic/'),('::1','2025-05-03 17:12:34','/backoffice/trafic/'),('::1','2025-05-03 17:12:39','/'),('::1','2025-05-03 17:12:43','/'),('::1','2025-05-03 17:12:44','/'),('::1','2025-05-03 17:12:44','/'),('::1','2025-05-03 17:12:44','/'),('::1','2025-05-03 17:12:44','/'),('::1','2025-05-03 17:12:45','/'),('::1','2025-05-03 17:12:45','/'),('::1','2025-05-03 17:12:46','/'),('::1','2025-05-03 17:12:46','/'),('::1','2025-05-03 17:12:46','/'),('::1','2025-05-03 17:12:47','/'),('::1','2025-05-03 21:23:02','/'),('::1','2025-05-03 21:23:11','/backoffice/'),('::1','2025-05-03 21:23:13','/backoffice/sauvegarde/'),('::1','2025-05-03 21:23:19','/backoffice/sauvegarde/vider.php'),('::1','2025-05-03 21:23:19','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:24:22','/backoffice/sauvegarde/vider.php'),('::1','2025-05-03 21:24:22','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:24:58','/backoffice/sauvegarde/vider.php'),('::1','2025-05-03 21:24:59','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:30:07','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:30:09','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:30:11','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:30:11','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:31:17','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:31:17','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:32:55','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:13','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:15','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:16','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:18','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:36','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:33:39','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:35:33','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:35:39','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:35:39','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:37:17','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:37:25','/backoffice/sauvegarde/vider.php'),('::1','2025-05-03 21:37:25','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:37:27','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:37:27','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:37:29','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:37:29','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:44:45','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:44:50','/backoffice/sauvegarde/ajax/supprimer.php'),('::1','2025-05-03 21:48:57','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:49:02','/backoffice/sauvegarde/ajax/supprimer.php'),('::1','2025-05-03 21:49:09','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:49:13','/backoffice/sauvegarde/ajax/supprimer.php'),('::1','2025-05-03 21:49:15','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:49:36','/backoffice/sauvegarde/ajax/supprimer.php'),('::1','2025-05-03 21:49:40','/backoffice/sauvegarde/ajax/supprimer.php'),('::1','2025-05-03 21:49:41','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-03 21:49:41','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:49:45','/backoffice/sauvegarde/vider.php'),('::1','2025-05-03 21:49:45','/backoffice/sauvegarde/index.php'),('::1','2025-05-03 21:49:47','/backoffice/sauvegarde/sauvegarder.php');
/*!40000 ALTER TABLE `traficip` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `traficip` with 187 row(s)
--

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP FUNCTION IF EXISTS `getTotalVisite` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!40101 SET character_set_client = utf8mb4 */;
/*!40101 SET character_set_results = utf8mb4 */;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
DELIMITER ;;
CREATE FUNCTION `getTotalVisite`() RETURNS int
begin
    declare _nb int;
    select sum(nb) into _nb from statvisite;
    return _nb;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50106 SET TIME_ZONE= @saved_time_zone */ ;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `comptabiliserPage` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `comptabiliserPage`(_nom varchar(150))
begin
   insert into statpage (nom, nb) values (_nom, 1)
          on duplicate key update nb = nb + 1;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `comptabiliserVisite` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `comptabiliserVisite`()
begin
    declare _date date;
    set _date = curdate();
    if exists(select 1 from statvisite where date = _date) then
        update statvisite
        set nb = nb + 1
        where date = _date;
    else
        insert into statvisite(date) values (_date);
    end if;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `getLesPages` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `getLesPages`()
begin
    SELECT nom, nb
    FROM statpage
    order by nb desc;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `getLesVisites` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `getLesVisites`()
begin
    SELECT date, date_format(date, '%d/%m/%Y') as dateFr, nb
    FROM statvisite
    order by date desc;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `getStatVisite` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `getStatVisite`()
begin
    Select max(nb) as max, min(nb) as min, ceiling(avg(nb)) as moyenne
    from statvisite end;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'vds'
--

/*!50003 DROP PROCEDURE IF EXISTS `initVisite` */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DELIMITER ;;
CREATE PROCEDURE `initVisite`()
begin
    declare i int default 0;
    declare date date;
    declare nb int;
    while i < 60
        do
            set date = curdate() - interval i day;
            set nb = floor(100 + rand() * (300 - 100 + 1));
            insert into statvisite(date, nb) values (date, nb);
            set i = i + 1;
        end while;
end ;;
DELIMITER ;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET AUTOCOMMIT=@OLD_AUTOCOMMIT */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Sat, 03 May 2025 23:49:47 +0200
