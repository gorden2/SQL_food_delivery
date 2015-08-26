CREATE DATABASE  IF NOT EXISTS `delivery_weidong_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `delivery_weidong_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery_weidong_db
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(20) unsigned NOT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'414 Hawkins AveBraddock, PA 15104','Braddock','PA','15104'),(2,'141 Hawthorne StGreentreeCarnegie, PA 15106','Carnegie','PA','15106'),(3,'2100 Washington PikeCarnegie, PA 15106','Carnegie','PA','15106'),(4,'1201 Washington AveCarnegie, PA 15106','Carnegie','PA','15106'),(5,'1073 Washington AveCarnegie, PA 15106','Carnegie','PA','15106'),(6,'202 3rd AveCarnegieCarnegie, PA 15106','Carnegie','PA','15106'),(7,'215 E Main StCarnegieCarnegie, PA 15106','Carnegie','PA','15106'),(8,'Raceway PlzCarnegie, PA 15106','Carnegie','PA','15106'),(9,'214 E Main StCarnegieCarnegie, PA 15106','Carnegie','PA','15106'),(10,'2180 Greentree RdPittsburgh, PA 15220','Pittsburgh','PA','15220'),(11,'200 E Main StCarnegieCarnegie, PA 15106','Carnegie','PA','15106'),(12,'400 Waterfront Dr EHomesteadHomestead, PA 15120','Homestead','PA','15120'),(13,'285 Waterfront Dr EHomesteadHomestead, PA 15120','Homestead','PA','15120'),(14,'650 E  Waterfront DrHomesteadMunhall, PA 15120','Munhall','PA','15120'),(15,'171 E Bridge StHomesteadHomestead, PA 15120','Homestead','PA','15120'),(16,'122 W 8th AveHomesteadHomestead, PA 15120','Homestead','PA','15120'),(17,'180 E Waterfront DrHomesteadHomestead, PA 15120','Homestead','PA','15120'),(18,'171 E Bridge StHomesteadHomestead, PA 15120','Homestead','PA','15120'),(19,'244 W Bridge StHomesteadWest Homestead, PA 15120','West Homestead','PA','15120'),(20,'3360 Main StMunhall, PA 15120','Munhall','PA','15120'),(21,'185 Waterfront Dr WHomesteadHomestead, PA 15120','Homestead','PA','15120'),(22,'205 East Waterfront DriveHomesteadHomestead, PA 15120','Homestead','PA','15120'),(23,'The Waterfront148 W Bridge StHomesteadHomestead, PA 15120','Homestead','PA','15120'),(24,'210 West Bridge StreetHomesteadWest Homestead, PA 15120','West Homestead','PA','15120'),(25,'3502 Main StHomestead, PA 15120','Homestead','PA','15120'),(26,'245 Waterfront Dr EHomesteadHomestead, PA 15120','Homestead','PA','15120'),(27,'185 W. Waterfront DriveHomesteadPittsburgh/Waterfront, PA 15120','Pittsburgh/Waterfront','PA','15120'),(28,'Kennywood & HoffmanWest Mifflin, PA 15122','West Mifflin','PA','15122'),(29,'4426 Kennywood BlvdWest Mifflin, PA 15122','West Mifflin','PA','15122'),(30,'1842 Homeville RdWest Mifflin, PA 15122','West Mifflin','PA','15122');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver_detail`
--

DROP TABLE IF EXISTS `deliver_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliver_detail` (
  `orderid` int(10) unsigned NOT NULL,
  `driverid` int(10) unsigned NOT NULL,
  `currentstatus` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '0: undergoing\n1: deliverying\n2: finished',
  `deliveraddress_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `fk_deliver_detail_driver_profile1_idx` (`driverid`),
  KEY `fk_deliver_detail_order1_idx` (`orderid`),
  KEY `fk_deliver_detail_address1_idx` (`deliveraddress_id`),
  CONSTRAINT `fk_deliver_detail_address1` FOREIGN KEY (`deliveraddress_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_deliver_detail_driver_profile1` FOREIGN KEY (`driverid`) REFERENCES `driver_profile` (`driverid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_deliver_detail_order1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver_detail`
--

LOCK TABLES `deliver_detail` WRITE;
/*!40000 ALTER TABLE `deliver_detail` DISABLE KEYS */;
INSERT INTO `deliver_detail` VALUES (1,90,1,30),(2,80,1,30),(3,64,1,30),(4,81,1,30),(5,66,1,30),(6,79,1,30),(7,68,1,30),(8,73,1,30),(9,81,1,30),(10,82,1,30),(11,89,1,30),(12,74,1,30),(13,77,1,30),(14,62,1,30),(15,66,1,30),(16,76,1,30),(17,63,1,30),(18,73,1,30),(19,69,1,30),(20,85,1,30),(21,80,1,30),(22,85,1,30),(23,66,1,30),(24,78,1,30),(25,88,1,30),(26,72,1,30),(27,74,0,21),(28,74,0,20),(29,69,0,25),(30,76,0,30);
/*!40000 ALTER TABLE `deliver_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_profile`
--

DROP TABLE IF EXISTS `driver_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_profile` (
  `driverid` int(20) unsigned NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `driverlicense` varchar(45) NOT NULL,
  PRIMARY KEY (`driverid`),
  CONSTRAINT `fk_driver_profile_user_login1` FOREIGN KEY (`driverid`) REFERENCES `user_login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_profile`
--

LOCK TABLES `driver_profile` WRITE;
/*!40000 ALTER TABLE `driver_profile` DISABLE KEYS */;
INSERT INTO `driver_profile` VALUES (61,'Susan',NULL,'Williams','1',NULL,'Susan@gmail.com','F25592150094'),(62,'Brady',NULL,'Williams','1',NULL,'Brady@gmail.com','F25592150094'),(63,'Sarah',NULL,'Williams','0',NULL,'Sarah@gmail.com','F25592150094'),(64,'Ed',NULL,'Williams','0',NULL,'Ed@gmail.com','F25592150094'),(65,'Mike',NULL,'Williams','0',NULL,'Mike@gmail.com','F25592150094'),(66,'Breanne',NULL,'Williams','0',NULL,'Breanne@gmail.com','F25592150094'),(67,'Madison',NULL,'Williams','0',NULL,'Madison@gmail.com','F25592150094'),(68,'Ron',NULL,'Williams','0',NULL,'Ron@gmail.com','F25592150094'),(69,'Christy',NULL,'Williams','1',NULL,'Christy@gmail.com','F25592150094'),(70,'K',NULL,'Williams','0',NULL,'K@gmail.com','F25592150094'),(71,'Kevin',NULL,'Williams','0',NULL,'Kevin@gmail.com','F25592150094'),(72,'Arvind',NULL,'Williams','1',NULL,'Arvind@gmail.com','F25592150094'),(73,'Kat',NULL,'Williams','0',NULL,'Kat@gmail.com','F25592150094'),(74,'Jennifer',NULL,'Williams','0',NULL,'Jennifer@gmail.com','F25592150094'),(75,'Dolores-Carlos',NULL,'Williams','1',NULL,'Dolores-Carlos@gmail.com','F25592150094'),(76,'Antony',NULL,'Williams','0',NULL,'Antony@gmail.com','F25592150094'),(77,'Phil',NULL,'Williams','0',NULL,'Phil@gmail.com','F25592150094'),(78,'Latasha',NULL,'Williams','0',NULL,'Latasha@gmail.com','F25592150094'),(79,'Melina',NULL,'Williams','1',NULL,'Melina@gmail.com','F25592150094'),(80,'Amanda',NULL,'Williams','1',NULL,'Amanda@gmail.com','F25592150094'),(81,'Dan',NULL,'Williams','1',NULL,'Dan@gmail.com','F25592150094'),(82,'Robert',NULL,'Williams','1',NULL,'Robert@gmail.com','F25592150094'),(83,'Anny',NULL,'Williams','1',NULL,'Anny@gmail.com','F25592150094'),(84,'Mallory',NULL,'Williams','0',NULL,'Mallory@gmail.com','F25592150094'),(85,'Nita',NULL,'Williams','1',NULL,'Nita@gmail.com','F25592150094'),(86,'Seth',NULL,'Williams','0',NULL,'Seth@gmail.com','F25592150094'),(87,'Dannie',NULL,'Williams','1',NULL,'Dannie@gmail.com','F25592150094'),(88,'Gin',NULL,'Williams','0',NULL,'Gin@gmail.com','F25592150094'),(89,'Jane',NULL,'Williams','0',NULL,'Jane@gmail.com','F25592150094'),(90,'Matthew',NULL,'Williams','0',NULL,'Matthew@gmail.com','F25592150094');
/*!40000 ALTER TABLE `driver_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `late_delivery`
--

DROP TABLE IF EXISTS `late_delivery`;
/*!50001 DROP VIEW IF EXISTS `late_delivery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `late_delivery` (
  `orderid` tinyint NOT NULL,
  `placetime` tinyint NOT NULL,
  `finishtime` tinyint NOT NULL,
  `estimatetime` tinyint NOT NULL,
  `diff` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maxtime`
--

DROP TABLE IF EXISTS `maxtime`;
/*!50001 DROP VIEW IF EXISTS `maxtime`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maxtime` (
  `orderid` tinyint NOT NULL,
  `maxtime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!50001 DROP VIEW IF EXISTS `menus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `menus` (
  `restname` tinyint NOT NULL,
  `menu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `orderid` int(10) unsigned NOT NULL,
  `foodid` int(20) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderid`,`foodid`),
  KEY `fk_order_detail_order1_idx` (`orderid`),
  KEY `fk_order_detail_rest_menu1_idx` (`foodid`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_detail_rest_menu1` FOREIGN KEY (`foodid`) REFERENCES `rest_menu` (`foodid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,16,1),(1,17,3),(1,20,3),(2,111,1),(2,113,1),(2,114,3),(3,51,1),(3,54,3),(3,55,1),(4,56,3),(4,58,2),(4,60,2),(5,36,1),(5,39,3),(5,40,2),(6,21,3),(6,24,2),(6,25,1),(7,48,2),(7,49,2),(7,50,2),(8,102,3),(8,103,2),(8,104,2),(9,121,1),(9,123,3),(9,125,3),(10,87,3),(10,88,1),(10,89,3),(11,57,3),(11,58,1),(11,59,2),(12,136,3),(12,139,3),(12,140,2),(13,47,2),(13,48,3),(13,49,2),(14,47,1),(14,49,1),(14,50,3),(15,66,2),(15,68,3),(15,70,1),(16,91,1),(16,92,1),(16,95,2),(17,112,1),(17,113,1),(17,115,1),(18,17,3),(18,18,1),(18,19,2),(19,121,2),(19,122,2),(19,125,1),(20,102,3),(20,103,3),(20,104,1),(21,111,3),(21,112,2),(21,115,1),(22,46,2),(22,48,3),(22,49,3),(23,97,2),(23,98,3),(23,100,3),(24,136,3),(24,139,2),(24,140,2),(25,111,3),(25,114,1),(25,115,3),(26,43,3),(26,44,2),(26,45,1),(27,122,3),(27,123,1),(27,125,1),(28,17,2),(28,18,3),(28,20,3),(29,71,1),(29,72,2),(29,74,1),(30,122,3),(30,124,3),(30,125,3);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `order_history_5_2`
--

DROP TABLE IF EXISTS `order_history_5_2`;
/*!50001 DROP VIEW IF EXISTS `order_history_5_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_history_5_2` (
  `orderid` tinyint NOT NULL,
  `userid` tinyint NOT NULL,
  `foodname` tinyint NOT NULL,
  `foodprice` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `subtotal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_total`
--

DROP TABLE IF EXISTS `order_total`;
/*!50001 DROP VIEW IF EXISTS `order_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_total` (
  `orderid` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `restid` int(10) unsigned NOT NULL,
  `placedate` date DEFAULT NULL,
  `placetime` time NOT NULL DEFAULT '00:00:00',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `deliverable` tinyint(1) NOT NULL DEFAULT '1',
  `billingaddress_id` int(20) unsigned DEFAULT NULL,
  `finishtime` time DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `fk_order_address1_idx` (`billingaddress_id`),
  KEY `fk_order_rest_profile1_idx` (`restid`),
  KEY `fk_order_user_login2` (`userid`),
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`billingaddress_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_rest_profile1` FOREIGN KEY (`restid`) REFERENCES `rest_profile` (`restid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user_login2` FOREIGN KEY (`userid`) REFERENCES `user_login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,18,4,'2015-05-01','11:00:00',1,1,30,'11:43:00'),(2,21,23,'2015-05-01','12:00:00',1,1,30,'12:21:00'),(3,5,11,'2015-05-01','11:00:00',1,1,30,'11:37:00'),(4,3,12,'2015-05-01','12:00:00',1,1,30,'12:46:00'),(5,18,8,'2015-05-02','11:00:00',1,1,30,'11:45:00'),(6,10,5,'2015-05-01','11:00:00',1,1,30,'11:41:00'),(7,28,10,'2015-05-01','12:00:00',1,1,30,'12:38:00'),(8,16,21,'2015-05-01','11:00:00',1,1,30,'11:47:00'),(9,12,25,'2015-05-01','11:00:00',1,1,30,'11:44:00'),(10,4,18,'2015-05-01','11:00:00',1,1,30,'11:38:00'),(11,14,12,'2015-05-01','11:00:00',1,1,30,'11:30:00'),(12,24,28,'2015-05-01','11:00:00',1,1,30,'11:36:00'),(13,21,10,'2015-05-02','11:00:00',1,1,30,'11:45:00'),(14,25,10,'2015-05-01','11:00:00',1,1,30,'11:34:00'),(15,8,14,'2015-05-01','11:00:00',1,1,30,'11:36:00'),(16,26,19,'2015-05-02','11:20:00',1,1,30,'12:00:00'),(17,23,23,'2015-05-01','11:00:00',1,1,30,'11:29:00'),(18,7,4,'2015-05-01','11:00:00',1,1,30,'11:50:00'),(19,4,25,'2015-05-02','11:50:00',1,1,30,'12:29:00'),(20,30,21,'2015-05-01','11:00:00',1,1,30,'11:43:00'),(21,25,23,'2015-05-01','11:00:00',1,1,30,'11:31:00'),(22,14,10,'2015-05-02','11:00:00',1,1,30,'11:45:00'),(23,15,20,'2015-05-01','11:00:00',1,1,30,'11:44:00'),(24,20,28,'2015-05-01','11:00:00',1,1,30,'11:35:00'),(25,5,23,'2015-05-02','11:00:00',1,1,30,'11:27:00'),(26,28,9,'2015-05-02','11:30:00',1,1,30,'12:15:00'),(27,20,25,'2015-05-02','11:00:00',0,1,30,NULL),(28,20,4,'2015-05-03','11:40:00',0,1,30,NULL),(29,26,15,'2015-05-03','11:00:00',0,1,30,NULL),(30,18,25,'2015-05-01','11:00:00',0,1,30,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ctime` 
BEFORE INSERT ON orders FOR EACH ROW 
BEGIN
SET NEW.placedate = CURDATE();
SET NEW.placetime = CURTIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `rec_user7`
--

DROP TABLE IF EXISTS `rec_user7`;
/*!50001 DROP VIEW IF EXISTS `rec_user7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `rec_user7` (
  `restname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rest_menu`
--

DROP TABLE IF EXISTS `rest_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rest_menu` (
  `foodid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `restid` int(10) unsigned NOT NULL,
  `foodname` varchar(45) NOT NULL,
  `foodprice` decimal(5,2) NOT NULL DEFAULT '0.00',
  `preparetime` time DEFAULT NULL,
  PRIMARY KEY (`foodid`,`restid`),
  KEY `fk_rest_menu_rest_profile1_idx` (`restid`),
  CONSTRAINT `fk_rest_menu_rest_profile1` FOREIGN KEY (`restid`) REFERENCES `rest_profile` (`restid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_menu`
--

LOCK TABLES `rest_menu` WRITE;
/*!40000 ALTER TABLE `rest_menu` DISABLE KEYS */;
INSERT INTO `rest_menu` VALUES (1,1,'Chicken fried steak',11.81,'00:34:00'),(2,1,'Cioppino',11.34,'00:32:00'),(3,1,'Nachos',10.36,'00:24:00'),(4,1,'Banana split',2.23,'00:16:00'),(5,1,'Chicken fried steak',0.29,'00:17:00'),(6,2,'New Mexican flat enchiladas',13.28,'00:11:00'),(7,2,'Twinkies',14.11,'00:27:00'),(8,2,'Macaroni and cheese',2.82,'00:21:00'),(9,2,'Cioppino',7.31,'00:22:00'),(10,2,'New Mexican flat enchiladas',17.75,'00:35:00'),(11,3,'Chocolate-chip cookies',8.50,'00:10:00'),(12,3,'Blueberry cobbler',8.28,'00:11:00'),(13,3,'Chicago-style pizza',16.16,'00:13:00'),(14,3,'New Mexican flat enchiladas',18.00,'00:12:00'),(15,3,'San Francisco sourdough bread',6.97,'00:34:00'),(16,4,'Fajitas',5.76,'00:31:00'),(17,4,'Reuben sandwich',1.59,'00:40:00'),(18,4,'Grits',10.06,'00:12:00'),(19,4,'Jerky',1.87,'00:30:00'),(20,4,'Jambalaya',15.40,'00:31:00'),(21,5,'Tater tots',14.56,'00:23:00'),(22,5,'Blueberry cobbler',17.25,'00:16:00'),(23,5,'California roll',10.37,'00:17:00'),(24,5,'Chocolate-chip cookies',10.04,'00:31:00'),(25,5,'California roll',2.35,'00:31:00'),(26,6,'Grits',7.48,'00:36:00'),(27,6,'Thanksgiving dinner',7.37,'00:32:00'),(28,6,'San Francisco sourdough bread',12.71,'00:10:00'),(29,6,'Tater tots',15.11,'00:22:00'),(30,6,'Lobster rolls',0.45,'00:17:00'),(31,7,'Macaroni and cheese',0.96,'00:35:00'),(32,7,'Smithfield ham',9.91,'00:17:00'),(33,7,'Key lime pie',2.16,'00:20:00'),(34,7,'Reuben sandwich',14.72,'00:36:00'),(35,7,'Chicken fried steak',19.65,'00:17:00'),(36,8,'Reuben sandwich',13.25,'00:39:00'),(37,8,'Chicken fried steak',8.64,'00:28:00'),(38,8,'Fajitas',10.65,'00:27:00'),(39,8,'Chocolate-chip cookies',18.68,'00:38:00'),(40,8,'Popcorn',12.32,'00:34:00'),(41,9,'Fajitas',10.42,'00:29:00'),(42,9,'Tater tots',8.88,'00:27:00'),(43,9,'Nachos',18.05,'00:17:00'),(44,9,'Blueberry cobbler',19.90,'00:38:00'),(45,9,'Fried chicken and waffles',8.32,'00:12:00'),(46,10,'Apple pie',6.43,'00:24:00'),(47,10,'Delmonico\'s steak',5.33,'00:21:00'),(48,10,'Pot roast',10.91,'00:37:00'),(49,10,'Chicken fried steak',18.97,'00:29:00'),(50,10,'S\'mores',15.38,'00:10:00'),(51,11,'Key lime pie',12.49,'00:16:00'),(52,11,'Apple pie',12.36,'00:37:00'),(53,11,'Tater tots',8.50,'00:25:00'),(54,11,'Apple pie',6.66,'00:37:00'),(55,11,'Maryland crabcakes',6.10,'00:35:00'),(56,12,'Meatloaf',3.41,'00:40:00'),(57,12,'Smithfield ham',6.90,'00:29:00'),(58,12,'Apple pie',13.12,'00:15:00'),(59,12,'Potato chips',12.09,'00:17:00'),(60,12,'BLT',2.01,'00:14:00'),(61,13,'Jerky',13.83,'00:34:00'),(62,13,'Tater tots',16.51,'00:20:00'),(63,13,'Indian frybread',8.89,'00:38:00'),(64,13,'Pot roast',3.38,'00:11:00'),(65,13,'Pot roast',3.47,'00:35:00'),(66,14,'Chocolate-chip cookies',17.59,'00:25:00'),(67,14,'Jerky',16.79,'00:31:00'),(68,14,'Fajitas',12.07,'00:35:00'),(69,14,'Baked beans',7.11,'00:19:00'),(70,14,'Cornbread',10.71,'00:15:00'),(71,15,'Grits',17.91,'00:15:00'),(72,15,'Key lime pie',0.77,'00:38:00'),(73,15,'GORP',16.50,'00:23:00'),(74,15,'Cornbread',13.24,'00:12:00'),(75,15,'Green chili stew',15.88,'00:19:00'),(76,16,'Cheeseburger',10.37,'00:33:00'),(77,16,'Cornbread',19.43,'00:32:00'),(78,16,'Maryland crabcakes',0.16,'00:20:00'),(79,16,'Blueberry cobbler',7.53,'00:18:00'),(80,16,'Chicken fried steak',16.36,'00:33:00'),(81,17,'Banana split',10.01,'00:12:00'),(82,17,'Reuben sandwich',9.54,'00:37:00'),(83,17,'Peanut butter sandwich',1.46,'00:32:00'),(84,17,'Buffalo wings',16.75,'00:18:00'),(85,17,'BLT',12.62,'00:27:00'),(86,18,'Cornbread',4.35,'00:34:00'),(87,18,'Cioppino',11.22,'00:36:00'),(88,18,'Peanut butter sandwich',18.05,'00:24:00'),(89,18,'Lobster rolls',12.91,'00:26:00'),(90,18,'Banana split',0.70,'00:33:00'),(91,19,'Delmonico\'s steak',12.02,'00:12:00'),(92,19,'Biscuits \'n\' gravy',8.70,'00:37:00'),(93,19,'Lobster rolls',1.63,'00:19:00'),(94,19,'Biscuits \'n\' gravy',5.10,'00:26:00'),(95,19,'Indian frybread',6.66,'00:39:00'),(96,20,'Jerky',2.92,'00:28:00'),(97,20,'BLT',10.75,'00:15:00'),(98,20,'Buffalo wings',18.13,'00:40:00'),(99,20,'Barbecue ribs',10.23,'00:17:00'),(100,20,'Pot roast',5.06,'00:16:00'),(101,21,'San Francisco sourdough bread',4.78,'00:39:00'),(102,21,'Peanut butter sandwich',18.84,'00:11:00'),(103,21,'Peanut butter sandwich',6.54,'00:14:00'),(104,21,'Cheeseburger',3.72,'00:38:00'),(105,21,'Frito pie',18.64,'00:10:00'),(106,22,'Pot roast',16.06,'00:17:00'),(107,22,'Jambalaya',13.39,'00:31:00'),(108,22,'Macaroni and cheese',8.51,'00:21:00'),(109,22,'Buffalo wings',6.50,'00:10:00'),(110,22,'Delmonico\'s steak',6.55,'00:29:00'),(111,23,'Jambalaya',10.24,'00:13:00'),(112,23,'Cioppino',8.11,'00:28:00'),(113,23,'Nachos',19.44,'00:10:00'),(114,23,'Barbecue ribs',7.23,'00:10:00'),(115,23,'Peanut butter sandwich',9.91,'00:21:00'),(116,24,'Meatloaf',9.97,'00:30:00'),(117,24,'Philly cheese steak',7.54,'00:22:00'),(118,24,'Chicago-style pizza',16.72,'00:37:00'),(119,24,'Maryland crabcakes',6.33,'00:21:00'),(120,24,'S\'mores',14.51,'00:28:00'),(121,25,'Biscuits \'n\' gravy',1.90,'00:34:00'),(122,25,'Baked beans',6.33,'00:18:00'),(123,25,'California roll',9.78,'00:34:00'),(124,25,'Green chili stew',5.06,'00:36:00'),(125,25,'Jerky',3.56,'00:36:00'),(126,26,'Reuben sandwich',10.08,'00:38:00'),(127,26,'Apple pie',8.98,'00:28:00'),(128,26,'Cobb salad',10.81,'00:40:00'),(129,26,'Green chili stew',4.53,'00:14:00'),(130,26,'Barbecue ribs',4.23,'00:11:00'),(131,27,'Green chili stew',17.16,'00:15:00'),(132,27,'Jerky',13.62,'00:17:00'),(133,27,'Macaroni and cheese',14.85,'00:22:00'),(134,27,'Peanut butter sandwich',18.31,'00:13:00'),(135,27,'Macaroni and cheese',7.59,'00:33:00'),(136,28,'Chicago-style pizza',15.17,'00:28:00'),(137,28,'Po\' boy',9.87,'00:38:00'),(138,28,'Cobb salad',15.54,'00:23:00'),(139,28,'Macaroni and cheese',12.31,'00:10:00'),(140,28,'San Francisco sourdough bread',1.19,'00:34:00'),(141,29,'Chicago-style pizza',6.12,'00:35:00'),(142,29,'Banana split',6.69,'00:16:00'),(143,29,'San Francisco sourdough bread',3.83,'00:30:00'),(144,29,'Chocolate-chip cookies',0.17,'00:38:00'),(145,29,'Hot dogs',7.75,'00:14:00'),(146,30,'Tater tots',12.44,'00:36:00'),(147,30,'Green chili stew',13.47,'00:11:00'),(148,30,'Po\' boy',12.26,'00:35:00'),(149,30,'Fortune cookies',18.95,'00:38:00'),(150,30,'Lobster rolls',7.31,'00:39:00');
/*!40000 ALTER TABLE `rest_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_profile`
--

DROP TABLE IF EXISTS `rest_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rest_profile` (
  `restid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restname` varchar(45) NOT NULL,
  `address_id` int(20) unsigned NOT NULL,
  `reststar` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`restid`),
  KEY `fk_rest_profile_address1_idx` (`address_id`),
  CONSTRAINT `fk_rest_profile_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_profile`
--

LOCK TABLES `rest_profile` WRITE;
/*!40000 ALTER TABLE `rest_profile` DISABLE KEYS */;
INSERT INTO `rest_profile` VALUES (1,'Emil\'s Lounge',1,4.5),(2,'Alexion\'s Bar & Grill',2,4.0),(3,'Kings Family Restaurant',3,3.5),(4,'Rocky\'s Lounge',4,4.0),(5,'Gab & Eat',5,4.5),(6,'Barb\'s Country Junction Cafe',6,4.0),(7,'Paddy\'s Pour House',7,3.5),(8,'Long John Silver\'s',8,3.5),(9,'Don Don Chinese Restaurant',9,2.5),(10,'Denny\'s',10,4.0),(11,'Papa J\'s',11,3.5),(12,'McDonald\'s',12,2.0),(13,'Eat\'n Park Hospitality Group',13,2.5),(14,'Steak \'n Shake',14,2.0),(15,'Sing Sing',15,3.5),(16,'Duke\'s Upper Deck Cafe',16,3.5),(17,'Dave & Buster\'s',17,3.0),(18,'Rock Bottom',18,3.5),(19,'Bar Louie',19,2.5),(20,'The Dragon Chinese Cuisine',20,2.5),(21,'T.G.I. Friday\'s',21,2.5),(22,'Uno Pizzeria & Grill',22,3.0),(23,'P F Chang\'s China Bistro',23,3.0),(24,'Panera Bread',24,3.0),(25,'The Pizza Company',25,3.0),(26,'Eat\'n Park Restaurant',26,3.0),(27,'Mitchell\'s Fish Market',27,4.0),(28,'McDonald\'s',28,1.0),(29,'Latina Pizza',29,4.0),(30,'Bellisario Pizza Shop',30,3.5);
/*!40000 ALTER TABLE `rest_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `rest_reviews`
--

DROP TABLE IF EXISTS `rest_reviews`;
/*!50001 DROP VIEW IF EXISTS `rest_reviews`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `rest_reviews` (
  `restname` tinyint NOT NULL,
  `review_star` tinyint NOT NULL,
  `review_count` tinyint NOT NULL,
  `customers` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review_order`
--

DROP TABLE IF EXISTS `review_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_order` (
  `orderid` int(10) unsigned NOT NULL,
  `userid` int(20) unsigned NOT NULL,
  `review_detail` varchar(300) NOT NULL,
  `review_star` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`orderid`,`userid`),
  KEY `fk_review_order1_idx` (`orderid`),
  KEY `fk_review_order_user_login1_idx` (`userid`),
  CONSTRAINT `fk_review_order1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_review_order_user_login1` FOREIGN KEY (`userid`) REFERENCES `user_login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_order`
--

LOCK TABLES `review_order` WRITE;
/*!40000 ALTER TABLE `review_order` DISABLE KEYS */;
INSERT INTO `review_order` VALUES (1,18,'dr. goldberg offers everything i look for in a general practitioner.  he\'s nice and easy to talk to without being patronizing; he\'s always on time in seeing his patients; he\'s affiliated with a top-notch hospital (nyu) which my parents have explained',5),(2,21,'Unfortunately, the frustration of being Dr. Goldberg\'s patient is a repeat of the experience I\'ve had with so many other doctors in NYC -- good doctor, terrible staff.  It seems that his staff simply never answers the phone.  It usually takes 2 hours',2),(3,5,'Dr. Goldberg has been my doctor for years and I like him.  I\'ve found his office to be fairly efficient.  Today I actually got to see the doctor a few minutes early!    He seems very engaged with his patients and his demeanor is friendly, yet authori',4),(4,3,'Been going to Dr. Goldberg for over 10 years. I think I was one of his 1st patients when he started at MHMG. He\'s been great over the years and is really all about the big picture. It is because of him, not my now former gyn Dr. Markoff, that I found',4),(5,18,'Got a letter in the mail last week that said Dr. Goldberg is moving to Arizona to take a new position there in June.  He will be missed very much.    I think finding a new doctor in NYC that you actually like might almost be as awful as trying to fin',4),(6,10,'I don\'t know what Dr. Goldberg was like before  moving to Arizona, but let me tell you, STAY AWAY from this doctor and this office. I was going to Dr. Johnson before he left and Goldberg took over when Johnson left. He is not a caring doctor. He is o',1),(7,28,'Top notch doctor in a top notch practice. Can\'t say I am surprised when I was referred to him by another doctor who I think is wonderful and because he went to one of the best medical schools in the country.  It is really easy to get an appointment. ',5),(8,16,'Dr. Eric Goldberg is a fantastic doctor who has correctly diagnosed every issue that my wife and I have had. Unlike many of my past doctors, Dr. Goldberg is very accessible and we have been able to schedule appointments with him and his staff very qu',5),(9,12,'I\'m writing this review to give you a heads up before you see this Doctor. The office staff and administration are very unprofessional. I left a message with multiple people regarding my bill, and no one ever called me back. I had to hound them to ge',1),(10,4,'I love Dr. Goldberg. Best doctor I\'ve ever had, and I\'ve had a bunch after moving around a lot in the past 25 years. Good listener, friendly & straightforward. Always presents options and takes a \'let\'s try the least extreme course\' first. Office sta',5),(11,14,'All the food is great here. But the best thing they have is their wings. Their wings are simply fantastic!!  The \'Wet Cajun\' are by the best & most popular.  I also like the seasoned salt wings.  Wing Night is Monday & Wednesday night, $0.75 whole wi',5),(12,24,'We checked this place out this past Monday for their wing night. We have heard that their wings are great and decided it was finally time to check it out. Their wings are whole wings and crispy, which is a nice change of pace. I got their wet Cajun s',3),(13,21,'Wing sauce is like water. Pretty much a lot of butter and some hot sauce (franks red hot maybe).  The whole wings are good size and crispy, but for $1 a wing the sauce could be better. The hot and extra hot are about the same flavor/heat.  The fish s',2),(14,25,'Cold cheap beer. Good bar food. Good service.   Looking for a great Pittsburgh style fish sandwich, this is the place to go. The breading is light, fish is more than plentiful and a good side of home cut fries.   Good grilled chicken salads or steak.',4),(15,8,'Decent range somewhat close to the city.  The mats are pretty solid; however, the grass range needs to be tended too.  It\'s like hitting out of US Open type rough...not very amenable to practicing.  Which kind of defeats the purpose of going to a gol',3),(16,26,'Owning a driving range inside the city limits is like a license to print money.  I don\'t think I ask much out of a driving range.  Decent mats, clean balls and accessible hours.  Hell you need even less people now with the advent of the machine that ',1),(17,23,'This place is absolute garbage...  Half of the tees are not available, including all the grass tees.  It is cash only, and they sell the last bucket at 8, despite having lights.  And if you finish even a minute after 8, don\'t plan on getting a drink.',1),(18,7,'Before I finally made it over to this range I heard the same thing from most people - it\'s just fine to go work on your swing. I had such a low expectation I was pleasantly surprised.   It\'s a fairly big range - if you are familiar with Scally\'s in M',4),(19,4,'I drove by yesterday to get a sneak peak.  It re-opens on July 14th and I can\'t wait to take my kids.  The new range looks amazing.  The entire range appears to be turf, which may or many not help your game, but it looks really nice.  The tee boxes l',4),(20,30,'THANK YOU ROB! i truly appreciated all the help i received from this agent today who was able to removed the extra charges on my bill that the Pasadena Verizon Store on Lake was charging me on my bill for upgrading my phone.   When i went in i was ha',5),(21,25,'After waiting for almost 30 minutes to trade in an old phone part of the buy back program, our customer service rep incorrectly processed the transaction. This led to us waiting another 30 minutes for him to correct it. Don\'t visit this store if you ',2),(22,14,'I visited this store several months ago to simply ask about smartphone plans. The agent was pleasant and helpful. I would recommend a visit to this store.',4),(23,15,'This place was DELICIOUS!!  My parents saw a recommendation to visit this place from Rick Sebak\'s \'25 Things I Like About Pittsburgh\' and he\'s usually pretty accurate.  His recommendations were to try the Reuben, Fish Sandwich and Open-Faced Steak Sa',5),(24,20,'Can\'t miss stop for the best Fish Sandwich in Pittsburgh.',5),(25,5,'This place should have a lot more reviews - but I\'m glad it doesn\'t, they don\'t need to get any busier.  Its been there ages, and looks it. If you\'re all about ambiance, don\'t bother. If you pretend you\'re in a movie set in Pittsburgh 30 years ago it',5),(26,28,'This place was very good. I found out about Emil\'s when watching a show called \'25 Things I Love About Pittsburgh\' on WQED hosted by Rick Seback. This place ain\'t a luxurious restaurant...it\'s a beer & a shot bar / lounge. But the people are friendly',4),(27,20,'Old school.....traditional \'mom \'n pop\' quality and perfection. The best fish and chips you\'ll ever enjoy and equally superb fried shrimp. A great out of the way, non-corporate, vestige of Americana. You will love it.',5),(28,20,'Seen this restaurant on 25 best places in Pittsburgh with Rick Seback ack. Went there with my girlfriend she grew up with the owner. She\'s very nice all employees are super nice service was excellent i had the fish sandwich my girlfriend had the Rube',5),(29,26,'Wonderful reuben.  Map shown on Yelp page is incorrect. It is actually a different Hawkins.  I\'d recommend a call for directions 412-271-9911.',4),(30,18,'Good fish sandwich.',5);
/*!40000 ALTER TABLE `review_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `undeliver_detail`
--

DROP TABLE IF EXISTS `undeliver_detail`;
/*!50001 DROP VIEW IF EXISTS `undeliver_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `undeliver_detail` (
  `orderid` tinyint NOT NULL,
  `driver` tinyint NOT NULL,
  `deliver_address` tinyint NOT NULL,
  `paid` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user7`
--

DROP TABLE IF EXISTS `user7`;
/*!50001 DROP VIEW IF EXISTS `user7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user7` (
  `restid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user7r`
--

DROP TABLE IF EXISTS `user7r`;
/*!50001 DROP VIEW IF EXISTS `user7r`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user7r` (
  `restid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user7u`
--

DROP TABLE IF EXISTS `user7u`;
/*!50001 DROP VIEW IF EXISTS `user7u`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user7u` (
  `userid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_admin`
--

DROP TABLE IF EXISTS `user_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_admin` (
  `adminid` int(20) unsigned NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  CONSTRAINT `fk_user_admin_user_login1` FOREIGN KEY (`adminid`) REFERENCES `user_login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_admin`
--

LOCK TABLES `user_admin` WRITE;
/*!40000 ALTER TABLE `user_admin` DISABLE KEYS */;
INSERT INTO `user_admin` VALUES (31,'Heather',NULL,'Johnson','0',NULL,'Heather@gmail.com','manager'),(32,'Melisa',NULL,'Johnson','0',NULL,'Melisa@gmail.com','manager'),(33,'Olivia',NULL,'Johnson','0',NULL,'Olivia@gmail.com','manager'),(34,'C',NULL,'Johnson','0',NULL,'C@gmail.com','manager'),(35,'Anthony',NULL,'Johnson','0',NULL,'Anthony@gmail.com','manager'),(36,'Angela',NULL,'Johnson','1',NULL,'Angela@gmail.com','manager'),(37,'R',NULL,'Johnson','1',NULL,'R@gmail.com','manager'),(38,'Caroline',NULL,'Johnson','1',NULL,'Caroline@gmail.com','manager'),(39,'Maya',NULL,'Johnson','0',NULL,'Maya@gmail.com','manager'),(40,'Stacey',NULL,'Johnson','1',NULL,'Stacey@gmail.com','manager'),(41,'Tiffany',NULL,'Johnson','1',NULL,'Tiffany@gmail.com','manager'),(42,'Jessica',NULL,'Johnson','1',NULL,'Jessica@gmail.com','manager'),(43,'Dan',NULL,'Johnson','0',NULL,'Dan@gmail.com','manager'),(44,'Matt',NULL,'Johnson','0',NULL,'Matt@gmail.com','manager'),(45,'Chris',NULL,'Johnson','0',NULL,'Chris@gmail.com','manager'),(46,'Angela',NULL,'Johnson','0',NULL,'Angela@gmail.com','manager'),(47,'Sonia',NULL,'Johnson','1',NULL,'Sonia@gmail.com','manager'),(48,'Shari',NULL,'Johnson','0',NULL,'Shari@gmail.com','manager'),(49,'Chad',NULL,'Johnson','1',NULL,'Chad@gmail.com','manager'),(50,'Steve',NULL,'Johnson','0',NULL,'Steve@gmail.com','manager'),(51,'Kyle',NULL,'Johnson','0',NULL,'Kyle@gmail.com','manager'),(52,'Ting',NULL,'Johnson','0',NULL,'Ting@gmail.com','manager'),(53,'Angela',NULL,'Johnson','0',NULL,'Angela@gmail.com','manager'),(54,'Karen',NULL,'Johnson','1',NULL,'Karen@gmail.com','manager'),(55,'Holly',NULL,'Johnson','0',NULL,'Holly@gmail.com','manager'),(56,'Tony',NULL,'Johnson','1',NULL,'Tony@gmail.com','manager'),(57,'Emy',NULL,'Johnson','1',NULL,'Emy@gmail.com','manager'),(58,'Dave',NULL,'Johnson','1',NULL,'Dave@gmail.com','manager'),(59,'Jennifer',NULL,'Johnson','1',NULL,'Jennifer@gmail.com','manager'),(60,'Stephanie',NULL,'Johnson','0',NULL,'Stephanie@gmail.com','manager');
/*!40000 ALTER TABLE `user_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `userid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'user1','123456'),(2,'user2','123456'),(3,'user3','123456'),(4,'user4','123456'),(5,'user5','123456'),(6,'user6','123456'),(7,'user7','123456'),(8,'user8','123456'),(9,'user9','123456'),(10,'user10','123456'),(11,'user11','123456'),(12,'user12','123456'),(13,'user13','123456'),(14,'user14','123456'),(15,'user15','123456'),(16,'user16','123456'),(17,'user17','123456'),(18,'user18','123456'),(19,'user19','123456'),(20,'user20','123456'),(21,'user21','123456'),(22,'user22','123456'),(23,'user23','123456'),(24,'user24','123456'),(25,'user25','123456'),(26,'user26','123456'),(27,'user27','123456'),(28,'user28','123456'),(29,'user29','123456'),(30,'user30','123456'),(31,'user31','123456'),(32,'user32','123456'),(33,'user33','123456'),(34,'user34','123456'),(35,'user35','123456'),(36,'user36','123456'),(37,'user37','123456'),(38,'user38','123456'),(39,'user39','123456'),(40,'user40','123456'),(41,'user41','123456'),(42,'user42','123456'),(43,'user43','123456'),(44,'user44','123456'),(45,'user45','123456'),(46,'user46','123456'),(47,'user47','123456'),(48,'user48','123456'),(49,'user49','123456'),(50,'user50','123456'),(51,'user51','123456'),(52,'user52','123456'),(53,'user53','123456'),(54,'user54','123456'),(55,'user55','123456'),(56,'user56','123456'),(57,'user57','123456'),(58,'user58','123456'),(59,'user59','123456'),(60,'user60','123456'),(61,'user61','123456'),(62,'user62','123456'),(63,'user63','123456'),(64,'user64','123456'),(65,'user65','123456'),(66,'user66','123456'),(67,'user67','123456'),(68,'user68','123456'),(69,'user69','123456'),(70,'user70','123456'),(71,'user71','123456'),(72,'user72','123456'),(73,'user73','123456'),(74,'user74','123456'),(75,'user75','123456'),(76,'user76','123456'),(77,'user77','123456'),(78,'user78','123456'),(79,'user79','123456'),(80,'user80','123456'),(81,'user81','123456'),(82,'user82','123456'),(83,'user83','123456'),(84,'user84','123456'),(85,'user85','123456'),(86,'user86','123456'),(87,'user87','123456'),(88,'user88','123456'),(89,'user89','123456'),(90,'user90','123456');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `userid` int(20) unsigned NOT NULL,
  `displayname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `fk_user_profile_user_login` FOREIGN KEY (`userid`) REFERENCES `user_login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'user1','Russel',NULL,'Smith','0',NULL,'Russel@gmail.com'),(2,'user2','Jeremy',NULL,'Smith','1',NULL,'Jeremy@gmail.com'),(3,'user3','Michael',NULL,'Smith','0',NULL,'Michael@gmail.com'),(4,'user4','Ken',NULL,'Smith','1',NULL,'Ken@gmail.com'),(5,'user5','Katherine',NULL,'Smith','1',NULL,'Katherine@gmail.com'),(6,'user6','Joan',NULL,'Smith','1',NULL,'Joan@gmail.com'),(7,'user7','Ryo',NULL,'Smith','1',NULL,'Ryo@gmail.com'),(8,'user8','George',NULL,'Smith','0',NULL,'George@gmail.com'),(9,'user9','Mary',NULL,'Smith','1',NULL,'Mary@gmail.com'),(10,'user10','Nader',NULL,'Smith','0',NULL,'Nader@gmail.com'),(11,'user11','Joseph',NULL,'Smith','0',NULL,'Joseph@gmail.com'),(12,'user12','Helen',NULL,'Smith','1',NULL,'Helen@gmail.com'),(13,'user13','Yishan',NULL,'Smith','1',NULL,'Yishan@gmail.com'),(14,'user14','N',NULL,'Smith','1',NULL,'N@gmail.com'),(15,'user15','Suzie',NULL,'Smith','1',NULL,'Suzie@gmail.com'),(16,'user16','Steven',NULL,'Smith','1',NULL,'Steven@gmail.com'),(17,'user17','Amanda',NULL,'Smith','1',NULL,'Amanda@gmail.com'),(18,'user18','J',NULL,'Smith','1',NULL,'J@gmail.com'),(19,'user19','Joe',NULL,'Smith','1',NULL,'Joe@gmail.com'),(20,'user20','King',NULL,'Smith','0',NULL,'King@gmail.com'),(21,'user21','edwin',NULL,'Smith','1',NULL,'edwin@gmail.com'),(22,'user22','Kathy',NULL,'Smith','0',NULL,'Kathy@gmail.com'),(23,'user23','Suman',NULL,'Smith','1',NULL,'Suman@gmail.com'),(24,'user24','Fawn',NULL,'Smith','0',NULL,'Fawn@gmail.com'),(25,'user25','Ashley',NULL,'Smith','1',NULL,'Ashley@gmail.com'),(26,'user26','Angela',NULL,'Smith','0',NULL,'Angela@gmail.com'),(27,'user27','Michelle',NULL,'Smith','1',NULL,'Michelle@gmail.com'),(28,'user28','Jenni',NULL,'Smith','1',NULL,'Jenni@gmail.com'),(29,'user29','Bryan',NULL,'Smith','0',NULL,'Bryan@gmail.com'),(30,'user30','Jason',NULL,'Smith','1',NULL,'Jason@gmail.com');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'delivery_weidong_db'
--

--
-- Dumping routines for database 'delivery_weidong_db'
--

--
-- Final view structure for view `late_delivery`
--

/*!50001 DROP TABLE IF EXISTS `late_delivery`*/;
/*!50001 DROP VIEW IF EXISTS `late_delivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `late_delivery` AS select `orders`.`orderid` AS `orderid`,`orders`.`placetime` AS `placetime`,`orders`.`finishtime` AS `finishtime`,addtime(`e`.`maxtime`,`orders`.`placetime`) AS `estimatetime`,timediff(`orders`.`finishtime`,addtime(`e`.`maxtime`,`orders`.`placetime`)) AS `diff` from (`orders` join `maxtime` `e` on((`e`.`orderid` = `orders`.`orderid`))) where ((`orders`.`paid` = 1) and (timediff(`orders`.`finishtime`,addtime(`e`.`maxtime`,`orders`.`placetime`)) > cast('00:05:00' as time))) order by timediff(`orders`.`finishtime`,addtime(`e`.`maxtime`,`orders`.`placetime`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maxtime`
--

/*!50001 DROP TABLE IF EXISTS `maxtime`*/;
/*!50001 DROP VIEW IF EXISTS `maxtime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maxtime` AS select `od`.`orderid` AS `orderid`,max(`m`.`preparetime`) AS `maxtime` from (`rest_menu` `m` join `order_detail` `od`) where (`od`.`foodid` = `m`.`foodid`) group by `od`.`orderid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menus`
--

/*!50001 DROP TABLE IF EXISTS `menus`*/;
/*!50001 DROP VIEW IF EXISTS `menus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menus` AS select `p`.`restname` AS `restname`,group_concat(concat(`m`.`foodname`,':','$',`m`.`foodprice`) separator ',') AS `menu` from (`rest_menu` `m` join `rest_profile` `p`) where (`p`.`restid` = `m`.`restid`) group by `m`.`restid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_history_5_2`
--

/*!50001 DROP TABLE IF EXISTS `order_history_5_2`*/;
/*!50001 DROP VIEW IF EXISTS `order_history_5_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_history_5_2` AS select `orders`.`orderid` AS `orderid`,`orders`.`userid` AS `userid`,`m`.`foodname` AS `foodname`,`m`.`foodprice` AS `foodprice`,`od`.`quantity` AS `quantity`,(`od`.`quantity` * `m`.`foodprice`) AS `subtotal` from ((`rest_menu` `m` join `order_detail` `od`) join `orders`) where ((`od`.`foodid` = `m`.`foodid`) and (`orders`.`orderid` = `od`.`orderid`) and (`orders`.`placedate` = '2015-5-2')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_total`
--

/*!50001 DROP TABLE IF EXISTS `order_total`*/;
/*!50001 DROP VIEW IF EXISTS `order_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_total` AS select `order_detail`.`orderid` AS `orderid`,sum((`rest_menu`.`foodprice` * `order_detail`.`quantity`)) AS `total` from (`rest_menu` join `order_detail`) where (`rest_menu`.`foodid` = `order_detail`.`foodid`) group by `order_detail`.`orderid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rec_user7`
--

/*!50001 DROP TABLE IF EXISTS `rec_user7`*/;
/*!50001 DROP VIEW IF EXISTS `rec_user7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rec_user7` AS select `r`.`restname` AS `restname` from ((`rest_profile` `r` join `user7r`) join `user7`) where ((`r`.`restid` = `user7r`.`restid`) and (`r`.`restid` <> `user7`.`restid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rest_reviews`
--

/*!50001 DROP TABLE IF EXISTS `rest_reviews`*/;
/*!50001 DROP VIEW IF EXISTS `rest_reviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rest_reviews` AS select `p`.`restname` AS `restname`,cast(avg(`r`.`review_star`) as decimal(5,1)) AS `review_star`,count(`r`.`orderid`) AS `review_count`,group_concat(`r`.`userid` separator ',') AS `customers` from ((`orders` join `review_order` `r`) join `rest_profile` `p`) where ((`orders`.`orderid` = `r`.`orderid`) and (`p`.`restid` = `orders`.`restid`)) group by `orders`.`restid` order by `review_star` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `undeliver_detail`
--

/*!50001 DROP TABLE IF EXISTS `undeliver_detail`*/;
/*!50001 DROP VIEW IF EXISTS `undeliver_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `undeliver_detail` AS select `deliver_detail`.`orderid` AS `orderid`,concat_ws(' ',`driver_profile`.`firstname`,`driver_profile`.`lastname`) AS `driver`,concat_ws(',',`address`.`detail`,`address`.`city`,`address`.`state`,`address`.`zip`) AS `deliver_address`,`orders`.`paid` AS `paid`,`order_total`.`total` AS `total` from ((((`deliver_detail` join `address`) join `driver_profile`) join `orders`) join `order_total`) where ((`deliver_detail`.`currentstatus` = 0) and (`deliver_detail`.`deliveraddress_id` = `address`.`address_id`) and (`driver_profile`.`driverid` = `deliver_detail`.`driverid`) and (`orders`.`orderid` = `deliver_detail`.`orderid`) and (`deliver_detail`.`orderid` = `order_total`.`orderid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user7`
--

/*!50001 DROP TABLE IF EXISTS `user7`*/;
/*!50001 DROP VIEW IF EXISTS `user7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user7` AS select `orders`.`restid` AS `restid` from `orders` where (`orders`.`userid` = 7) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user7r`
--

/*!50001 DROP TABLE IF EXISTS `user7r`*/;
/*!50001 DROP VIEW IF EXISTS `user7r`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user7r` AS select distinct `orders`.`restid` AS `restid` from (`orders` join `user7u`) where (`orders`.`userid` = `user7u`.`userid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user7u`
--

/*!50001 DROP TABLE IF EXISTS `user7u`*/;
/*!50001 DROP VIEW IF EXISTS `user7u`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user7u` AS select `orders`.`userid` AS `userid` from (`orders` join `user7`) where (`orders`.`restid` = `user7`.`restid`) */;
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

-- Dump completed on 2015-05-14 23:51:59
