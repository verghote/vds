-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: vds
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Current Database: `vds`
--

/*!40000 DROP DATABASE IF EXISTS `vds`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vds` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vds`;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1,'admin','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','VERGHOTE','GUY','guy.verghote@saint-remi.net',NULL,NULL,0,0),(2,'jbernard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','BERNARD','JULIEN','julien.bernard@saint-remi.net',NULL,NULL,0,0),(3,'acaron','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CARON','ADAM','adam.caron@saint-remi.net',NULL,NULL,0,0),(4,'mboularbi','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','BOULARBI','MEDDHY','meddhy.boularbi@saint-remi.net',NULL,NULL,0,0),(5,'rcharkaoui','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHARKAOUI','RAYANE','rayane.charkaoui@saint-remi.net',NULL,NULL,0,0),(6,'achastagner','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHASTAGNER','ARTHUR','arthur.chastagner@saint-remi.net',NULL,NULL,0,0),(7,'acoulon','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','COULON','ALEXANDRE','alexandre.coulon@saint-remi.net',NULL,NULL,0,0),(8,'adubois','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUBOIS','ALEXANDRE','alexandre.dubois@saint-remi.net',NULL,NULL,0,0),(9,'tjosse','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','JOSSE','THOMAS','thomas.josse@saint-remi.net',NULL,NULL,0,0),(10,'mlecanu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LE CANU','MATHIS','mathis.le-canu@saint-remi.net',NULL,NULL,0,0),(11,'zlion','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LION','ZIGGY','ziggy.lion@saint-remi.net',NULL,NULL,0,0),(12,'rlongby','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LONGBY','RENEDI','renedi.longby@saint-remi.net',NULL,NULL,0,0),(13,'mlourdel','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LOURDEL','MATHIS','mathis.lourdel@saint-remi.net',NULL,NULL,0,0),(14,'smorales','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','MORALES','SIMON','simon.morales@saint-remi.net',NULL,NULL,0,0),(15,'fnedelec','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','NEDELEC','FLORE','flore.nedelec@saint-remi.net',NULL,NULL,0,0),(16,'tparis','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','PARIS','THOMAS','thomas.paris@saint-remi.net',NULL,NULL,0,0),(17,'trichard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TONNY','tonny.richard@saint-remi.net',NULL,NULL,0,0),(18,'trichard1','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TOM','tom.richard@saint-remi.net',NULL,NULL,0,0),(19,'groelens','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','ROELENS','GABRIEL','gabriel.roelens@saint-remi.net',NULL,NULL,0,0),(20,'lsouktani','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SOUKTANI','LEO','leo.souktani@saint-remi.net',NULL,NULL,0,0),(21,'msuberu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SUBERU','MOUBARAK','moubarak.suberu@saint-remi.net',NULL,NULL,0,0),(22,'ctison','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','TISON','CLAIRE','claire.tison@saint-remi.net',NULL,NULL,0,0),(23,'aboully','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','BOULLY','ALEXANDRE','alexandre.boully@saint-remi.net',NULL,NULL,0,0),(24,'tcazin','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CAZIN','TOM','tom.cazin@saint-remi.net',NULL,NULL,0,0),(25,'idiani','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DIANI','ISMAEL','ismael.diani@saint-remi.net',NULL,NULL,0,0),(26,'hdumont','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUMONT','HUGO','hugo.dumont@saint-remi.net',NULL,NULL,0,0),(27,'mdupressoir','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUPRESSOIR','MATHIEU','mathieu.dupressoir@saint-remi.net',NULL,NULL,0,0),(28,'mfoulon','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','FOULON','MATHYS','mathys.foulon@saint-remi.net',NULL,NULL,0,0),(29,'kgarnier','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','GARNIER','KYLLIAN','kyllian.garnier@saint-remi.net',NULL,NULL,0,0),(30,'amercier','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','MERCIER','ALEXI','alexi.mercier@saint-remi.net',NULL,NULL,0,0),(31,'lvasseur','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','VASSEUR','LORENZO','lorenzo.vasseur@saint-remi.net',NULL,NULL,0,0),(32,'myildiz','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','YILDIZ','MUHAMMEDALI','muhammedali.yildiz@saint-remi.net',NULL,NULL,0,0),(33,'jzon','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','ZON','JEREMY','jeremy.zon@saint-remi.net',NULL,NULL,0,0);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutMembre` BEFORE INSERT ON `membre` FOR EACH ROW begin
    # déclaration des variables
    declare nb INT;
    declare nouveauLogin varchar(50);
    declare baseLogin varchar(50);
    declare msg varchar(255);

    # contrôle de la colonne id
    if new.id is null or new.id = 0 or new.id not regexp '^[0-9]+$' or exists (select 1 from membre where id = new.id) then
        set new.id = (select coalesce(max(id), 0) + 1 from membre);
    end if;

    -- Contrôle sur la colonne nom
    if new.nom is null then
        signal sqlstate '45000' set message_text = '#Le nom doit être renseigné';
    end if;

    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le nom doit comporter entre 3 et 30 caractères';
    end if;

    if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le nom ', new.nom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne prenom
    if new.prenom is null then
        signal sqlstate '45000' set message_text = '#Le prénom doit être renseigné';
    end if;

    set new.prenom = ucase(new.prenom);

    if char_length(new.prenom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le prénom doit comporter entre 3 et 30 caractères';
    end if;

    if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le prénom ', new.prenom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne email
    if new.email is null then
        signal sqlstate '45000' set message_text = '#L\'email est obligatoire.';
    end if;
    if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
        set msg = concat('#L''email ne respecte pas le format attendu : ', new.email);
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne telephone si le champ est renseigné
    if new.telephone is not null then
        if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
            set msg = concat('#Le numéro de téléphone portable ne respecte pas le format attendu : ', new.telephone);
            signal sqlstate '45000' set message_text = msg;
        end if;
    end if;

    -- Contrôle de l'unicité du triplet nom, prénom, email
    if exists (select 1 from membre where nom = new.nom and prenom = new.prenom and email = new.email) then
        signal sqlstate '45000' set message_text = '#Ce membre est déjà inscrit';
    end if;

    # création du login : première lettre du prénom suivie du nom en minuscules avec un suffixe en cas de doublon
    SET baseLogin = CONCAT(LOWER(LEFT(NEW.prenom, 1)), LOWER(replace(NEW.nom, ' ', '')));
    SET nouveauLogin = baseLogin;
    Set nb = 1;
    WHILE EXISTS (SELECT 1 FROM membre WHERE login = nouveauLogin) DO
            SET nouveauLogin = CONCAT(baseLogin, nb);
            SET nb = nb + 1;
        END WHILE;
    SET NEW.login = nouveauLogin;
    # initialisation du mot de passe par défaut : 0000
    SET NEW.password = SHA2('0000', 256);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `apresModificationMembre` AFTER UPDATE ON `membre` FOR EACH ROW if new.password != old.password then
        insert into password (login, password) values (old.login, old.password);
    end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `oubli`
--

DROP TABLE IF EXISTS `oubli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `oubli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statpage`
--

DROP TABLE IF EXISTS `statpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `statpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statvisite`
--

DROP TABLE IF EXISTS `statvisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `statvisite` VALUES ('2025-03-09',249),('2025-03-10',157),('2025-03-11',280),('2025-03-12',113),('2025-03-13',196),('2025-03-14',189),('2025-03-15',216),('2025-03-16',198),('2025-03-17',291),('2025-03-18',252),('2025-03-19',223),('2025-03-20',187),('2025-03-21',137),('2025-03-22',133),('2025-03-23',277),('2025-03-24',183),('2025-03-25',113),('2025-03-26',295),('2025-03-27',153),('2025-03-28',190),('2025-03-29',166),('2025-03-30',180),('2025-03-31',144),('2025-04-01',281),('2025-04-02',254),('2025-04-03',296),('2025-04-04',175),('2025-04-05',159),('2025-04-06',174),('2025-04-07',137),('2025-04-08',137),('2025-04-09',283),('2025-04-10',192),('2025-04-11',125),('2025-04-12',179),('2025-04-13',290),('2025-04-14',189),('2025-04-15',119),('2025-04-16',236),('2025-04-17',253),('2025-04-18',109),('2025-04-19',199),('2025-04-20',261),('2025-04-21',202),('2025-04-22',217),('2025-04-23',127),('2025-04-24',173),('2025-04-25',280),('2025-04-26',242),('2025-04-27',210),('2025-04-28',236),('2025-04-29',290),('2025-04-30',171),('2025-05-01',222),('2025-05-02',279),('2025-05-03',291),('2025-05-04',158),('2025-05-05',201),('2025-05-06',115),('2025-05-07',158);
/*!40000 ALTER TABLE `statvisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tentative`
--

DROP TABLE IF EXISTS `tentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tentative` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentative`
--

LOCK TABLES `tentative` WRITE;
/*!40000 ALTER TABLE `tentative` DISABLE KEYS */;
/*!40000 ALTER TABLE `tentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traficip`
--

DROP TABLE IF EXISTS `traficip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `traficip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vds'
--
/*!50003 DROP FUNCTION IF EXISTS `getTotalVisite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalVisite`() RETURNS int
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
/*!50003 DROP PROCEDURE IF EXISTS `initVisite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `initVisite`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07  9:41:48
