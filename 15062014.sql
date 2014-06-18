-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: localhost    Database: sms_reminder
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `reminds`
--

DROP TABLE IF EXISTS `reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `send_datetime` datetime DEFAULT NULL,
  `status` enum('sent','unsent') DEFAULT 'unsent',
  `message` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reminds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminds`
--

LOCK TABLES `reminds` WRITE;
/*!40000 ALTER TABLE `reminds` DISABLE KEYS */;
INSERT INTO `reminds` VALUES (9,7,'3809600112399','2014-06-15 14:00:00','sent','Rock'),(10,7,'3809600112399','2014-06-15 15:00:00','unsent','Rock'),(11,7,'3809600112399','2014-06-15 17:00:00','unsent','Rock'),(12,7,'3809600112399','2014-06-15 22:00:00','unsent','Rock'),(13,7,'3809600112399','2014-06-15 11:00:00','sent','Rock'),(14,7,'3809600112399','2014-06-04 11:00:00','sent','Rock'),(15,7,'3809600112399','2014-06-05 13:00:00','sent','Rock'),(16,7,'3809600112399','2014-06-12 19:00:00','sent','Rock'),(17,7,'3809600112399','2014-06-12 22:00:00','sent','Rock'),(18,7,'3809600112399','2014-06-14 23:00:00','sent','Rock'),(53,7,'3809600112399','2014-06-15 14:00:00','sent','Rock'),(54,7,'3809600112399','2014-06-15 11:00:00','sent','Rock'),(55,7,'3809600112399','2014-06-15 13:00:00','sent','Rock'),(56,7,'3809600112399','2014-06-15 19:00:00','unsent','Rock'),(57,7,'3809600112399','2014-06-15 22:00:00','unsent','Rock'),(58,7,'3809600112399','2014-06-15 23:00:00','unsent','Rock'),(59,7,'3809600112399','2014-06-15 23:00:00','unsent','thr eo ld'),(60,7,'3809600112399','2014-06-15 14:00:00','sent','thr eo ld'),(61,7,'3809600112399','2014-06-15 14:00:00','sent','123'),(62,7,'3809600112399','2014-06-15 19:00:00','unsent','123'),(64,7,'3809600112399','2014-06-30 23:00:00','unsent','123'),(65,7,'3809600112399','2014-06-15 22:00:00','unsent','123'),(66,7,'3809600112399','2014-06-15 22:00:00','unsent','123'),(68,7,'3809600112399','2014-02-28 17:00:00','sent','123'),(69,7,'0636071305','2014-06-15 14:38:00','sent','never'),(72,7,'0636071305','2014-06-15 14:38:00','sent','dey'),(73,7,'0636071305','2014-06-15 14:38:00','sent','week'),(74,7,'0636071305','2014-06-15 14:38:00','sent','month'),(75,7,'0636071305','2014-06-15 14:38:00','sent','year');
/*!40000 ALTER TABLE `reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeats`
--

DROP TABLE IF EXISTS `repeats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `daytime` time DEFAULT NULL,
  `day_week` int(11) DEFAULT NULL,
  `day_month` int(11) DEFAULT NULL,
  `day_year` int(11) DEFAULT NULL,
  `month_year` int(11) DEFAULT NULL,
  `year_year` int(11) DEFAULT NULL,
  `remind_type` enum('day','week','month','year') DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `repeats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeats`
--

LOCK TABLES `repeats` WRITE;
/*!40000 ALTER TABLE `repeats` DISABLE KEYS */;
INSERT INTO `repeats` VALUES (2,7,'3809600112399','19:00:00',5,15,227,8,2013,'year','123','0000-00-00 00:00:00'),(3,7,'3809600112399','22:00:00',7,15,166,6,2013,'year','123','2014-06-15 22:00:00'),(4,7,'3809600112399','22:00:00',7,15,166,6,2013,'year','123','2014-06-15 22:00:00'),(5,7,'3809600112399','19:00:00',7,31,366,12,2016,'year','123','0000-00-00 00:00:00'),(6,7,'3809600112399','17:00:00',2,29,60,2,2016,'year','123','2014-02-28 17:00:00'),(7,7,'0636071305','14:38:00',1,15,166,6,2014,'day','dey','2014-06-15 14:38:00'),(8,7,'0636071305','14:38:00',1,15,166,6,2014,'week','week','2014-06-15 14:38:00'),(9,7,'0636071305','14:38:00',1,15,166,6,2014,'month','month','2014-06-15 14:38:00'),(10,7,'0636071305','14:38:00',1,15,166,6,2014,'year','year','2014-06-15 14:38:00');
/*!40000 ALTER TABLE `repeats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_registration`
--

DROP TABLE IF EXISTS `temporary_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `daytime` datetime DEFAULT NULL,
  `guid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `guid` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_registration`
--

LOCK TABLES `temporary_registration` WRITE;
/*!40000 ALTER TABLE `temporary_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `privileges` enum('user','admin') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'TheHorse','662609908ab8e0f372d83dea3511370b','horsebox@ukr.net','0968784525','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-15 15:05:03
