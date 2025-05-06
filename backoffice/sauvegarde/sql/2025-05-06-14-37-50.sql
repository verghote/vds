-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: vds
-- ------------------------------------------------------
-- Server version 	9.1.0
-- Date: Tue, 06 May 2025 14:37:50 +0200

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
INSERT INTO `membre` VALUES (1,'admin','$2y$10$9Nvku2W6N1RE9F/AkqU1G.mlnXAUy0wodg2eJm/Rvwlf4Iaq7YR5i','VERGHOTE','GUY','guy.verghote@saint-remi.net',NULL,NULL,0),(2,'jbernard','$2y$10$2H9fSU3SVVke4QdjMK6A6eRfIz60JC6JzgdyjBMZq79DSasMGTi/2','BERNARD','JULIEN','julien.bernard@saint-remi.net',NULL,NULL,0),(3,'acaron','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CARON','ADAM','adam.caron@saint-remi.net',NULL,NULL,0),(4,'mboularbi','$2y$10$MW6t1UVzAI3/u8XNRCqoV.ERmoHvHm8MDNW5fuFF9c5vcFjVer.BW','BOULARBI','MEDDHY','meddhy.boularbi@saint-remi.net',NULL,NULL,0),(5,'rcharkaoui','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHARKAOUI','RAYANE','rayane.charkaoui@saint-remi.net',NULL,NULL,0),(6,'achastagner','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','CHASTAGNER','ARTHUR','arthur.chastagner@saint-remi.net',NULL,NULL,0),(7,'acoulon','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','COULON','ALEXANDRE','alexandre.coulon@saint-remi.net',NULL,NULL,0),(8,'adubois','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','DUBOIS','ALEXANDRE','alexandre.dubois@saint-remi.net',NULL,NULL,0),(9,'tjosse','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','JOSSE','THOMAS','thomas.josse@saint-remi.net',NULL,NULL,0),(10,'mlecanu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LE CANU','MATHIS','mathis.le-canu@saint-remi.net',NULL,NULL,0),(11,'zlion','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LION','ZIGGY','ziggy.lion@saint-remi.net',NULL,NULL,0),(12,'rlongby','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LONGBY','RENEDI','renedi.longby@saint-remi.net',NULL,NULL,0),(13,'mlourdel','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','LOURDEL','MATHIS','mathis.lourdel@saint-remi.net',NULL,NULL,0),(14,'smorales','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','MORALES','SIMON','simon.morales@saint-remi.net',NULL,NULL,0),(15,'fnedelec','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','NEDELEC','FLORE','flore.nedelec@saint-remi.net',NULL,NULL,0),(16,'tparis','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','PARIS','THOMAS','thomas.paris@saint-remi.net',NULL,NULL,0),(17,'trichard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TONNY','tonny.richard@saint-remi.net',NULL,NULL,0),(18,'trichard1','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','RICHARD','TOM','tom.richard@saint-remi.net',NULL,NULL,0),(19,'groelens','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','ROELENS','GABRIEL','gabriel.roelens@saint-remi.net',NULL,NULL,0),(20,'lsouktani','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SOUKTANI','LEO','leo.souktani@saint-remi.net',NULL,NULL,0),(21,'msuberu','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','SUBERU','MOUBARAK','moubarak.suberu@saint-remi.net',NULL,NULL,0),(22,'ctison','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','TISON','CLAIRE','claire.tison@saint-remi.net',NULL,NULL,0);
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
INSERT INTO `password` VALUES ('admin','3eb3fe66b31e3b4d10fa70b5cad49c7112294af6ae4e476a1c405155d45aa121','2025-05-06 14:21:44'),('jbernard','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','2025-05-06 14:25:49'),('mboularbi','9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','2025-05-06 14:22:21');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `password` with 3 row(s)
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
INSERT INTO `statpage` VALUES ('/membre/connexion/',1);
/*!40000 ALTER TABLE `statpage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statpage` with 1 row(s)
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
INSERT INTO `statvisite` VALUES ('2025-03-08',108),('2025-03-09',102),('2025-03-10',236),('2025-03-11',191),('2025-03-12',274),('2025-03-13',159),('2025-03-14',274),('2025-03-15',237),('2025-03-16',137),('2025-03-17',183),('2025-03-18',159),('2025-03-19',104),('2025-03-20',288),('2025-03-21',278),('2025-03-22',200),('2025-03-23',207),('2025-03-24',179),('2025-03-25',196),('2025-03-26',300),('2025-03-27',134),('2025-03-28',224),('2025-03-29',296),('2025-03-30',251),('2025-03-31',153),('2025-04-01',272),('2025-04-02',168),('2025-04-03',156),('2025-04-04',239),('2025-04-05',111),('2025-04-06',140),('2025-04-07',297),('2025-04-08',281),('2025-04-09',202),('2025-04-10',276),('2025-04-11',159),('2025-04-12',140),('2025-04-13',147),('2025-04-14',232),('2025-04-15',170),('2025-04-16',173),('2025-04-17',199),('2025-04-18',106),('2025-04-19',145),('2025-04-20',173),('2025-04-21',274),('2025-04-22',164),('2025-04-23',150),('2025-04-24',229),('2025-04-25',231),('2025-04-26',141),('2025-04-27',192),('2025-04-28',240),('2025-04-29',102),('2025-04-30',258),('2025-05-01',162),('2025-05-02',218),('2025-05-03',276),('2025-05-04',220),('2025-05-05',242),('2025-05-06',230);
/*!40000 ALTER TABLE `statvisite` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `statvisite` with 60 row(s)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentative`
--

LOCK TABLES `tentative` WRITE;
/*!40000 ALTER TABLE `tentative` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tentative` VALUES (1,'2024-11-26 13:30:17','::1','admin','test'),(2,'2025-05-06 14:15:10','::1','admin','Test.000');
/*!40000 ALTER TABLE `tentative` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tentative` with 2 row(s)
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
INSERT INTO `traficip` VALUES ('::1','2025-05-06 12:33:38','/backoffice/'),('::1','2025-05-06 12:36:54','/backoffice/sauvegarde/'),('::1','2025-05-06 12:37:31','/backoffice/sauvegarde/sauvegarder.php'),('::1','2025-05-06 12:37:31','/backoffice/sauvegarde/index.php'),('::1','2025-05-06 12:37:50','/backoffice/sauvegarde/sauvegarder.php');
/*!40000 ALTER TABLE `traficip` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `traficip` with 5 row(s)
--

DROP TRIGGER IF EXISTS `avantAjoutMembre`;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `avantAjoutMembre` BEFORE INSERT ON `membre` FOR EACH ROW begin
    # d??claration des variables
    declare nb INT;
    declare nouveauLogin varchar(50);
    declare baseLogin varchar(50);
    declare msg varchar(255);

    # contr??le de la colonne id
    if new.id is null or new.id = 0 or new.id not regexp '^[0-9]+$' or exists (select 1 from membre where id = new.id) then
        set new.id = (select coalesce(max(id), 0) + 1 from membre);
    end if;

    -- Contr??le sur la colonne nom
    if new.nom is null then
        signal sqlstate '45000' set message_text = '#Le nom doit ??tre renseign??';
    end if;

    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le nom doit comporter entre 3 et 30 caract??res';
    end if;

    if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le nom ', new.nom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contr??le sur la colonne prenom
    if new.prenom is null then
        signal sqlstate '45000' set message_text = '#Le pr??nom doit ??tre renseign??';
    end if;

    set new.prenom = ucase(new.prenom);

    if char_length(new.prenom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le pr??nom doit comporter entre 3 et 30 caract??res';
    end if;

    if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le pr??nom ', new.prenom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contr??le sur la colonne email
    if new.email is null then
        signal sqlstate '45000' set message_text = '#L\'email est obligatoire.';
    end if;
    if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
        set msg = concat('#L''email ne respecte pas le format attendu : ', new.email);
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contr??le sur la colonne telephone si le champ est renseign??
    if new.telephone is not null then
        if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
            set msg = concat('#Le num??ro de t??l??phone portable ne respecte pas le format attendu : ', new.telephone);
            signal sqlstate '45000' set message_text = msg;
        end if;
    end if;

    -- Contr??le de l'unicit?? du triplet nom, pr??nom, email
    if exists (select 1 from membre where nom = new.nom and prenom = new.prenom and email = new.email) then
        signal sqlstate '45000' set message_text = '#Ce membre est d??j?? inscrit';
    end if;

    # cr??ation du login : premi??re lettre du pr??nom suivie du nom en minuscules avec un suffixe en cas de doublon
    SET baseLogin = CONCAT(LOWER(LEFT(NEW.prenom, 1)), LOWER(replace(NEW.nom, ' ', '')));
    SET nouveauLogin = baseLogin;
    Set nb = 1;
    WHILE EXISTS (SELECT 1 FROM membre WHERE login = nouveauLogin) DO
            SET nouveauLogin = CONCAT(baseLogin, nb);
            SET nb = nb + 1;
        END WHILE;
    SET NEW.login = nouveauLogin;
    # initialisation du mot de passe par d??faut : 0000
    SET NEW.password = SHA2('0000', 256);
end */;;
DELIMITER ;

DROP TRIGGER IF EXISTS `apresModificationMembre`;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `apresModificationMembre` AFTER UPDATE ON `membre` FOR EACH ROW if new.password != old.password then
        insert into password (login, password) values (old.login, old.password);
    end if */;;
DELIMITER ;

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

-- Dump completed on: Tue, 06 May 2025 14:37:50 +0200
