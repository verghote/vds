-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: vds
-- ------------------------------------------------------
-- Server version 	9.1.0
-- Date: Mon, 05 May 2025 22:35:31 +0200

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
INSERT INTO `membre` VALUES (1,'admin','$2y$10$/w.ezHQKYaw/Hp3dj74y6u1aKWtkv1LvL2OoNXQHxsI1bDi..fCH2','VERGHOTE','GUY','guy.verghote@saint-remi.net',NULL,NULL,0,25),(2,'jbernard','$2y$10$hdAU5Q0k1dBVhU3D1pHER.IKkXF7ptl684V5o5RMwoLPUtS0SfeBK','BERNARD','JULIEN','julien.bernard@saint-remi.net',NULL,NULL,0,4),(3,'acaron','$2y$10$c4Zm0GGkSn/H6dpYcVw1We7omEkG5/J2uoCeY6TfBGo8AKNxqpVHG','CARON','ADAM','adam.caron@saint-remi.net',NULL,NULL,0,1),(4,'mboularbi','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','BOULARBI','MEDDHY','meddhy.boularbi@saint-remi.net',NULL,NULL,0,0),(5,'rcharkaoui','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHARKAOUI','RAYANE','rayane.charkaoui@saint-remi.net',NULL,NULL,0,0),(6,'achastagner','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHASTAGNER','ARTHUR','arthur.chastagner@saint-remi.net',NULL,NULL,0,0),(7,'acoulon','$2y$10$5p4GUjjQj.LNJa4mHgL6WO3TCZX59xhlWtsrkdG7Hw.icmlwWrLbW','COULON','ALEXANDRE','alexandre.coulon@saint-remi.net',NULL,NULL,0,1),(8,'adubois','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUBOIS','ALEXANDRE','alexandre.dubois@saint-remi.net',NULL,NULL,0,0),(9,'tjosse','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','JOSSE','THOMAS','thomas.josse@saint-remi.net',NULL,NULL,0,0),(10,'mlecanu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LE CANU','MATHIS','mathis.le-canu@saint-remi.net',NULL,NULL,0,0),(11,'zlion','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LION','ZIGGY','ziggy.lion@saint-remi.net',NULL,NULL,0,0),(12,'rlongby','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LONGBY','RENEDI','renedi.longby@saint-remi.net',NULL,NULL,0,0),(13,'mlourdel','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LOURDEL','MATHIS','mathis.lourdel@saint-remi.net',NULL,NULL,0,0),(14,'smorales','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','MORALES','SIMON','simon.morales@saint-remi.net',NULL,NULL,0,0),(15,'fnedelec','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','NEDELEC','FLORE','flore.nedelec@saint-remi.net',NULL,NULL,0,0),(16,'tparis','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','PARIS','THOMAS','thomas.paris@saint-remi.net',NULL,NULL,0,0),(17,'trichard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TONNY','tonny.richard@saint-remi.net',NULL,NULL,0,0),(18,'trichard1','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TOM','tom.richard@saint-remi.net',NULL,NULL,0,0),(19,'groelens','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','ROELENS','GABRIEL','gabriel.roelens@saint-remi.net',NULL,NULL,0,0),(20,'lsouktani','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SOUKTANI','LEO','leo.souktani@saint-remi.net',NULL,NULL,0,0),(21,'msuberu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SUBERU','MOUBARAK','moubarak.suberu@saint-remi.net',NULL,NULL,0,0),(22,'ctison','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','TISON','CLAIRE','claire.tison@saint-remi.net',NULL,NULL,0,0);
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
/*!40000 ALTER TABLE `oubli` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oubli` with 0 row(s)
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
INSERT INTO `statpage` VALUES ('/',10),('/afficherclassement.php?id=2024-09-01%204%20saisons%20ete%2010%20km%20as.pdf',9),('/afficherclassement.php?id=2024-09-01%204%20saisons%20ete%2010%20km%20populaire.pdf',1),('/membre/connexion/',2);
/*!40000 ALTER TABLE `statpage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statpage` with 4 row(s)
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
INSERT INTO `statvisite` VALUES ('2025-03-06',226),('2025-03-07',146),('2025-03-08',202),('2025-03-09',255),('2025-03-10',257),('2025-03-11',244),('2025-03-12',153),('2025-03-13',141),('2025-03-14',150),('2025-03-15',237),('2025-03-16',111),('2025-03-17',274),('2025-03-18',119),('2025-03-19',208),('2025-03-20',206),('2025-03-21',174),('2025-03-22',121),('2025-03-23',111),('2025-03-24',245),('2025-03-25',272),('2025-03-26',137),('2025-03-27',105),('2025-03-28',162),('2025-03-29',270),('2025-03-30',295),('2025-03-31',168),('2025-04-01',283),('2025-04-02',248),('2025-04-03',218),('2025-04-04',181),('2025-04-05',129),('2025-04-06',189),('2025-04-07',105),('2025-04-08',279),('2025-04-09',263),('2025-04-10',246),('2025-04-11',154),('2025-04-12',276),('2025-04-13',108),('2025-04-14',256),('2025-04-15',223),('2025-04-16',186),('2025-04-17',136),('2025-04-18',198),('2025-04-19',185),('2025-04-20',142),('2025-04-21',276),('2025-04-22',246),('2025-04-23',217),('2025-04-24',113),('2025-04-25',217),('2025-04-26',290),('2025-04-27',177),('2025-04-28',300),('2025-04-29',273),('2025-04-30',121),('2025-05-01',212),('2025-05-02',279),('2025-05-03',294),('2025-05-04',231),('2025-05-05',4);
/*!40000 ALTER TABLE `statvisite` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statvisite` with 61 row(s)
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentative`
--

LOCK TABLES `tentative` WRITE;
/*!40000 ALTER TABLE `tentative` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tentative` VALUES (1,'2024-08-12 20:43:07','::1','test','test'),(2,'2024-08-12 20:43:47','::1','test','test'),(3,'2024-08-12 20:43:48','::1','test','test'),(4,'2024-08-12 20:43:48','::1','test','test'),(5,'2024-08-12 20:44:13','::1','test','test'),(6,'2024-08-12 20:54:43','::1','test','test'),(7,'2024-08-12 20:54:45','::1','test','test'),(8,'2024-08-12 20:54:45','::1','test','test'),(9,'2024-08-12 20:54:46','::1','test','test'),(10,'2024-08-12 20:54:46','::1','test','test'),(11,'2024-08-13 11:53:14','::1','admin','123456'),(12,'2024-08-13 12:01:42','::1','admin','0000'),(13,'2024-08-13 12:02:19','::1','gverghote','0000'),(14,'2024-08-13 12:12:12','::1','gverghote','00000'),(15,'2024-08-13 12:12:27','::1','gverghote','Test.001'),(16,'2024-08-13 12:12:33','::1','gverghote','Test.002'),(17,'2024-08-13 15:36:03','::1','admin','Test.000'),(18,'2024-08-13 15:36:06','::1','admin','Test.002'),(19,'2024-08-13 15:36:13','::1','admin','Test.001'),(20,'2024-08-13 20:09:13','::1','gverghote','Test.000'),(21,'2024-08-15 18:02:51','::1','admin','Admin133!'),(22,'2024-08-15 18:08:59','::1','jbernard','1111'),(23,'2024-08-15 18:50:18','::1','JBERNARD','1111'),(24,'2024-08-16 11:32:02','::1','admin','Admin123!'),(25,'2024-08-16 11:32:13','::1','admin','Test.000'),(26,'2024-08-16 11:32:23','::1','admin','Test.001'),(27,'2024-08-16 11:32:40','::1','admin','Test.000'),(28,'2024-08-17 18:59:06','::1','admin','Vds!fr.2024'),(29,'2024-08-18 11:15:42','::1','admin','Test.004'),(30,'2024-08-18 11:15:55','::1','admin','Test.005'),(31,'2024-08-22 19:43:20','::1','admin','Test.005'),(32,'2024-08-22 19:45:32','::1','admin','Admin4123!'),(33,'2024-08-22 19:45:32','::1','admin','Admin4123!'),(34,'2024-08-23 16:47:24','::1','test','test'),(35,'2024-08-23 16:48:45','::1','test','test'),(36,'2024-08-23 16:48:46','::1','test','test'),(37,'2024-08-23 16:48:46','::1','test','test'),(38,'2024-08-23 16:48:50','::1','test','test'),(39,'2024-08-23 16:50:00','::1','test','test'),(40,'2024-08-23 16:50:01','::1','test','test'),(41,'2024-08-23 17:10:52','::1','test','test'),(42,'2024-08-23 17:10:53','::1','test','test'),(43,'2024-08-23 17:10:54','::1','test','test'),(44,'2024-08-23 17:10:54','::1','test','test'),(45,'2024-08-23 17:10:55','::1','test','test'),(46,'2024-08-23 17:10:57','::1','test','test'),(47,'2024-08-23 17:39:51','::1','test','tets'),(48,'2024-08-23 17:39:53','::1','test','tets'),(49,'2024-08-23 17:39:55','::1','test','tets'),(50,'2024-08-23 17:39:56','::1','test','tets'),(51,'2024-08-23 17:39:58','::1','test','tets'),(52,'2024-08-23 17:40:09','::1','admin','Admin!123'),(53,'2024-08-23 17:41:24','::1','admin','Admin133!'),(54,'2024-08-23 17:54:30','::1','test','test'),(55,'2024-08-23 17:54:31','::1','test','test'),(56,'2024-08-23 17:54:31','::1','test','test'),(57,'2024-08-23 17:54:32','::1','test','test'),(58,'2024-08-23 17:54:35','::1','test','test'),(59,'2024-11-13 06:21:59','::1','test','1111'),(60,'2025-04-30 11:33:37','::1','admin','Test!000'),(61,'2025-04-30 11:33:56','::1','admin','Test!111'),(62,'2025-05-04 07:45:48','::1','admin','Test.00O'),(63,'2025-05-04 07:46:06','::1','admin','Test.00O');
/*!40000 ALTER TABLE `tentative` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tentative` with 63 row(s)
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
INSERT INTO `traficip` VALUES ('::1','2025-05-05 20:35:19','/'),('::1','2025-05-05 20:35:26','/backoffice/'),('::1','2025-05-05 20:35:28','/backoffice/sauvegarde/'),('::1','2025-05-05 20:35:31','/backoffice/sauvegarde/sauvegarder.php');
/*!40000 ALTER TABLE `traficip` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `traficip` with 4 row(s)
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

-- Dump completed on: Mon, 05 May 2025 22:35:31 +0200
