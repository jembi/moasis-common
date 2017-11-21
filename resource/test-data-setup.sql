-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: localhost    Database: resource_map_development
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `layer_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `data` longblob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (2,1,2,NULL,NULL,NULL,'xÚcá¨fóTâÌKÌMe³bs\rñTâòJÍMÊd³f\0XÒs','2017-11-20 13:13:20','2017-11-20 13:13:20','collection','created'),(3,1,2,1,NULL,NULL,'xÚcá¨f÷TâÌKÌMe³bs\rñTâÍÉON,ÉÌÏc³f\0r¹Ó2SsRŠAœh¶jNO%öÌ\'“\r¨-;3/¢Œ³8³$ÊLÎO2¹²Rs“2Al r./\0ÉÈì','2017-11-20 13:14:08','2017-11-20 13:14:08','layer','created'),(12,1,2,NULL,NULL,NULL,'xÚcá¨fóTâÌKÌMe³bs\rñTâòJÍMÊd³f\0XÒs','2017-11-20 14:04:01','2017-11-20 14:04:01','collection','imported'),(13,1,2,NULL,NULL,2,'xÚcá¨æğTâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²9rK@¬R+~§Ìt—ÔäÌÜÄC+=3W#’¼t°k6~°„‘±©«!\0¢Ö','2017-11-20 14:04:01','2017-11-20 14:04:01','site','created'),(14,1,2,NULL,NULL,NULL,'xÚcá¨fóTâÌKÌMe³bs\rñTâòJÍMÊd³f\0XÒs','2017-11-20 14:04:31','2017-11-20 14:04:31','collection','imported'),(15,1,2,NULL,NULL,3,'xÚcá¨æğTâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²9rK@¬R+~§Ìt—ÔäÌÜÄC+=3W#’¼t°k6~°„‘±©«!\0¢Ö','2017-11-20 14:04:31','2017-11-20 14:04:31','site','created'),(16,1,2,NULL,NULL,4,'xÚcá¨æğTâÌKÌMe³bs\rñTâòJÍMÊd³f\0²9rK@¬R+~§Ìt—ÔäÌÜÄQC+]=c3#cSW#º¼t°:k6 ¬¡…‰©……‘¥«\0rÆ','2017-11-20 14:04:31','2017-11-20 14:04:31','site','created'),(17,1,2,NULL,NULL,5,'xÚcá¨æğTâÌKÌMe³bs\rñTğÉ/JÍKOM)O,a³f\0Špä@X¥VüN™é.©É™¹‰9Â†VzFÆ¦æÆF®† Uyé`UÖl\"`9cSss33W#\0,òı','2017-11-20 14:04:31','2017-11-20 14:04:31','site','created'),(18,1,2,NULL,NULL,6,'xÚcá¨æğTâÌKÌMe³bs\rñTâ\r.IÍÉÉL-f³f\0r9rK@¬R+~§Ìt—ÔäÌÜÄc3+]=ccKcScSSccS3cW#ò¼t°rk6i \"=C3K#s3#c3W#\0Uÿ','2017-11-20 14:05:29','2017-11-20 14:05:29','site','created'),(19,1,2,NULL,NULL,3,'xÚcá¨fóTâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0Yg‹','2017-11-20 14:11:03','2017-11-20 14:11:03','site','deleted'),(21,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\r.IÍÉÉL-f³f\0ry’3óÒ!¼j6˜R \'šİ¨“ß7¿*17)³°,\0$1·','2017-11-20 14:29:35','2017-11-20 14:29:35','site','changed'),(22,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9yé@¶[4{©¿SfºKjrfnbˆ¡…•¡……™¥‘…«Q©5›ˆ±BÈØÕ¤7±ª×šM¨C×@ÏØØÒØÔØÔ¬E¨(f\0¾\r&','2017-11-20 14:29:57','2017-11-20 14:29:57','site','changed'),(23,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9yé@¶[4{©¿SfºKjrfnbˆ¡…•¡……™¥‘±«Q©5›ˆ±PÈ.Ò›X2¨×šM(­Ôbliljljêjä \0\00è\"X','2017-11-20 14:30:15','2017-11-20 14:30:15','site','changed'),(24,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9yé@¶[4{©¿SfºKjrfnbˆ¡…•©……™¥‘±«Q©5›ˆ±PÈ.Ò›X2¨×šM(­k ghliljljêjä \0\01Œ\"Z','2017-11-20 14:30:22','2017-11-20 14:30:22','site','changed'),(25,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9‰%@¶[4{©¿SfºKjrfnb¨¡…•®¡±¥±©±©©«Q©5›¨±XÌ&Ò—2	¨ÛšM(o glaaf`idìjä \0\0OÄ\"†','2017-11-20 14:30:30','2017-11-20 14:30:30','site','changed'),(26,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9yé@¶[4{©¿SfºKjrfnbˆ¡…•±……™¥‘±«Q©5›ˆ±HÈ&Ò›X2¨×šM(­k ghailjljêjä \0\00Ä\"Z','2017-11-20 14:30:35','2017-11-20 14:30:35','site','changed'),(27,1,2,NULL,NULL,6,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ÷Í¯JÌMÊ,,Me³f\0\nğ$g$æ¥§ƒx Å9yé@¶[4{©¿SfºKjrfnbˆ¡…•±©…™¥‘±«Q©5›ˆ±HÈ&Ò›X2¨×šM(­k ghailjljêjä \0\0/ß\"V','2017-11-20 14:30:52','2017-11-20 14:30:52','site','changed'),(28,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ<:œ¼t Û-š½ÔŠß)3İ%59371‡ßĞÂÊ@ÏÈØÔÕ°ÔšMÀØÈ3q@ZK Z€R`…&f®F@® P¥.Œ\0 5','2017-11-20 14:32:12','2017-11-20 14:32:12','site','changed'),(29,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ<:œÄ Û-š½ÔŠß)3İ%59371GĞĞÂJ×@ÏÄÂÂÌÕ¨ÔšMÀØÂ7s5iÊK\0Ô‘2Ğ3626u5r\0\0¢Á±','2017-11-20 14:32:20','2017-11-20 14:32:20','site','changed'),(30,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ<:œÄ Û-š½ÔŠß)3İ%59371GÀĞÂJ×@ÏÄÂÌÕ°ÔšMÀØÄ5qAzòÒAúz RzÆFÆ¦®F\0ƒŞu','2017-11-20 14:32:29','2017-11-20 14:32:29','site','changed'),(31,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ<:œÄ Û-š½ÔŠß)3İ%59371GÀĞÂJ×@ÏÈÂÌÕ°ÔšÏÈÌu5éÈKéê°f06³2Ğ3626u5r\0\0H#','2017-11-20 14:32:35','2017-11-20 14:32:35','site','changed'),(32,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ<:œ¼t Û-š½ÔŠß)3İ%59371GÀĞÂÊ@ÏØÈØÔÕ¨ÔšMÀØÄ5\0qAzK@úz¬ÙøŒÌ­t\rôŒ\\\r\0H','2017-11-20 14:32:42','2017-11-20 14:32:42','site','changed'),(33,1,2,NULL,NULL,2,'xÚcá¨f÷TâÌKÌMe³bs\rñTâ\nH,Ê,f³f\0²y’3óÒSÁ¼j6˜: \'šİ¨;¨<1/%$\0\0|­','2017-11-20 14:32:55','2017-11-20 14:32:55','site','changed');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nuntium_channel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `basic_setup` tinyint(1) DEFAULT NULL,
  `advanced_setup` tinyint(1) DEFAULT NULL,
  `national_setup` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `min_lat` decimal(10,6) DEFAULT NULL,
  `min_lng` decimal(10,6) DEFAULT NULL,
  `max_lat` decimal(10,6) DEFAULT NULL,
  `max_lng` decimal(10,6) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quota` int(11) DEFAULT '0',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymous_name_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  `anonymous_location_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (2,'Jembi','here','2017-11-20 13:13:20','2017-11-20 14:32:42',-15.852502,26.659876,-34.062305,18.458829,2.357302,34.860923,'medicalstore',0,NULL,'none','none');
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_histories`
--

DROP TABLE IF EXISTS `field_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `layer_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `config` longblob,
  `ord` int(11) DEFAULT NULL,
  `valid_since` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_field_histories_on_field_id` (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_histories`
--

LOCK TABLES `field_histories` WRITE;
/*!40000 ALTER TABLE `field_histories` DISABLE KEYS */;
INSERT INTO `field_histories` VALUES (1,2,1,'Jembi','jembi','site','2017-11-20 13:14:08','2017-11-20 13:14:08',NULL,1,'2017-11-20 13:14:08',NULL,1,NULL,0);
/*!40000 ALTER TABLE `field_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `layer_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `config` longblob,
  `ord` int(11) DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_fields_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_fields_on_layer_id` (`layer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,2,1,'Jembi','jembi','site','2017-11-20 13:14:08','2017-11-20 13:14:08',NULL,1,NULL);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_jobs`
--

DROP TABLE IF EXISTS `import_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `exception` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_jobs`
--

LOCK TABLES `import_jobs` WRITE;
/*!40000 ALTER TABLE `import_jobs` DISABLE KEYS */;
INSERT INTO `import_jobs` VALUES (1,'finished','Jembi_sites (1).csv','2017-11-20 14:03:15','2017-11-20 14:03:05','2017-11-20 14:03:15',1,4,NULL),(2,'finished','Jembi_sites.csv','2017-11-20 14:04:01','2017-11-20 14:03:51','2017-11-20 14:04:01',1,2,NULL),(3,'finished','cvb_sites.csv','2017-11-20 14:04:31','2017-11-20 14:04:25','2017-11-20 14:04:31',1,2,NULL);
/*!40000 ALTER TABLE `import_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instedd_telemetry_counters`
--

DROP TABLE IF EXISTS `instedd_telemetry_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instedd_telemetry_counters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `bucket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_attributes` text COLLATE utf8_unicode_ci,
  `count` int(11) DEFAULT '0',
  `key_attributes_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instedd_telemetry_counters_unique_fields` (`bucket`,`key_attributes_hash`,`period_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instedd_telemetry_counters`
--

LOCK TABLES `instedd_telemetry_counters` WRITE;
/*!40000 ALTER TABLE `instedd_telemetry_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `instedd_telemetry_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instedd_telemetry_periods`
--

DROP TABLE IF EXISTS `instedd_telemetry_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instedd_telemetry_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginning` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `stats_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lock_owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instedd_telemetry_periods`
--

LOCK TABLES `instedd_telemetry_periods` WRITE;
/*!40000 ALTER TABLE `instedd_telemetry_periods` DISABLE KEYS */;
INSERT INTO `instedd_telemetry_periods` VALUES (1,'2017-11-20 09:17:12','2017-11-27 09:17:12',NULL,'2017-11-20 09:17:12','2017-11-20 09:17:12',NULL,NULL);
/*!40000 ALTER TABLE `instedd_telemetry_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instedd_telemetry_set_occurrences`
--

DROP TABLE IF EXISTS `instedd_telemetry_set_occurrences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instedd_telemetry_set_occurrences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `bucket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_attributes` text COLLATE utf8_unicode_ci,
  `element` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_attributes_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instedd_telemetry_set_occurrences_unique_fields` (`bucket`,`key_attributes_hash`,`element`,`period_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instedd_telemetry_set_occurrences`
--

LOCK TABLES `instedd_telemetry_set_occurrences` WRITE;
/*!40000 ALTER TABLE `instedd_telemetry_set_occurrences` DISABLE KEYS */;
/*!40000 ALTER TABLE `instedd_telemetry_set_occurrences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instedd_telemetry_settings`
--

DROP TABLE IF EXISTS `instedd_telemetry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instedd_telemetry_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_instedd_telemetry_settings_on_key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instedd_telemetry_settings`
--

LOCK TABLES `instedd_telemetry_settings` WRITE;
/*!40000 ALTER TABLE `instedd_telemetry_settings` DISABLE KEYS */;
INSERT INTO `instedd_telemetry_settings` VALUES (1,'installation_id','c029cd2e-870c-4c72-991a-1a5a07214cca'),(2,'dismissed','true');
/*!40000 ALTER TABLE `instedd_telemetry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instedd_telemetry_timespans`
--

DROP TABLE IF EXISTS `instedd_telemetry_timespans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instedd_telemetry_timespans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bucket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_attributes` text COLLATE utf8_unicode_ci,
  `since` datetime DEFAULT NULL,
  `until` datetime DEFAULT NULL,
  `key_attributes_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instedd_telemetry_timespans_unique_fields` (`bucket`,`key_attributes_hash`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instedd_telemetry_timespans`
--

LOCK TABLES `instedd_telemetry_timespans` WRITE;
/*!40000 ALTER TABLE `instedd_telemetry_timespans` DISABLE KEYS */;
INSERT INTO `instedd_telemetry_timespans` VALUES (1,'account_lifespan','{\"account_id\":1}','2017-11-20 13:02:07','2017-11-20 14:32:55','b90328b0d37424b73929b6e84961ddc6548475a1f667650f0fcbc4d2f255620d'),(2,'collection_lifespan','{\"collection_id\":1}','2017-11-20 13:11:16','2017-11-20 13:13:00','2f072bab4eddb1952f7ff9538259a13bd6028bcab5a05357f8dc8be33db767b0'),(3,'collection_lifespan','{\"collection_id\":2}','2017-11-20 13:13:20','2017-11-20 14:32:55','39225921b34571fb6aef88716e9054a82362371f2c99aed8ddbd63e4c96e5ef6'),(4,'collection_lifespan','{\"collection_id\":3}','2017-11-20 13:27:29','2017-11-20 14:28:54','c797d5a87c6d1f30de8bc7e039ec8c91f558037a77fbf1b26e6cbbe43e5eda6c'),(5,'collection_lifespan','{\"collection_id\":4}','2017-11-20 13:52:54','2017-11-20 14:29:00','d93f86907fef6477b19fb52c74c7458f0656e2b7d528ae414a4f08e00e9e6ec7'),(6,'collection_lifespan','{\"collection_id\":5}','2017-11-20 14:16:29','2017-11-20 14:29:06','afdf9001d724454900aff5a60c700ab36c096b13960a932bc78083a9b5c02b00');
/*!40000 ALTER TABLE `instedd_telemetry_timespans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer_histories`
--

DROP TABLE IF EXISTS `layer_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layer_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ord` int(11) DEFAULT NULL,
  `valid_since` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `layer_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `anonymous_user_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `index_layer_histories_on_layer_id` (`layer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer_histories`
--

LOCK TABLES `layer_histories` WRITE;
/*!40000 ALTER TABLE `layer_histories` DISABLE KEYS */;
INSERT INTO `layer_histories` VALUES (1,2,'location',NULL,'2017-11-20 13:14:08','2017-11-20 13:14:08',1,'2017-11-20 13:14:08',NULL,1,0,'none');
/*!40000 ALTER TABLE `layer_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer_memberships`
--

DROP TABLE IF EXISTS `layer_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layer_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_id` int(11) DEFAULT NULL,
  `read` tinyint(1) DEFAULT '0',
  `write` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `membership_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_layer_memberships_on_membership_id` (`membership_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer_memberships`
--

LOCK TABLES `layer_memberships` WRITE;
/*!40000 ALTER TABLE `layer_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `layer_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layers`
--

DROP TABLE IF EXISTS `layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ord` int(11) DEFAULT NULL,
  `anonymous_user_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `index_layers_on_collection_id` (`collection_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layers`
--

LOCK TABLES `layers` WRITE;
/*!40000 ALTER TABLE `layers` DISABLE KEYS */;
INSERT INTO `layers` VALUES (1,2,'location','2017-11-20 13:14:08','2017-11-20 13:14:08',1,'none');
/*!40000 ALTER TABLE `layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_permissions`
--

DROP TABLE IF EXISTS `location_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'read',
  `membership_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_location_permissions_on_membership_id` (`membership_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_permissions`
--

LOCK TABLES `location_permissions` WRITE;
/*!40000 ALTER TABLE `location_permissions` DISABLE KEYS */;
INSERT INTO `location_permissions` VALUES (1,'read',1,'2017-11-20 13:11:17','2017-11-20 13:11:17'),(2,'read',2,'2017-11-20 13:13:20','2017-11-20 13:13:20'),(3,'read',3,'2017-11-20 13:27:29','2017-11-20 13:27:29'),(4,'read',4,'2017-11-20 13:52:54','2017-11-20 13:52:54'),(5,'read',5,'2017-11-20 14:16:29','2017-11-20 14:16:29');
/*!40000 ALTER TABLE `location_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_memberships_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_memberships_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (2,1,2,'2017-11-20 13:13:20','2017-11-20 13:13:20',1);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carrier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reply` text COLLATE utf8_unicode_ci,
  `collection_id` int(11) DEFAULT NULL,
  `is_send` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_permissions`
--

DROP TABLE IF EXISTS `name_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'read',
  `membership_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name_permissions_on_membership_id` (`membership_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_permissions`
--

LOCK TABLES `name_permissions` WRITE;
/*!40000 ALTER TABLE `name_permissions` DISABLE KEYS */;
INSERT INTO `name_permissions` VALUES (1,'read',1,'2017-11-20 13:11:16','2017-11-20 13:11:16'),(2,'read',2,'2017-11-20 13:13:20','2017-11-20 13:13:20'),(3,'read',3,'2017-11-20 13:27:29','2017-11-20 13:27:29'),(4,'read',4,'2017-11-20 13:52:54','2017-11-20 13:52:54'),(5,'read',5,'2017-11-20 14:16:29','2017-11-20 14:16:29');
/*!40000 ALTER TABLE `name_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefixes`
--

DROP TABLE IF EXISTS `prefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefixes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefixes`
--

LOCK TABLES `prefixes` WRITE;
/*!40000 ALTER TABLE `prefixes` DISABLE KEYS */;
INSERT INTO `prefixes` VALUES (1,'AA','2017-11-20 14:03:15','2017-11-20 14:03:15'),(2,'AB','2017-11-20 14:04:01','2017-11-20 14:04:01');
/*!40000 ALTER TABLE `prefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reminder_message` text COLLATE utf8_unicode_ci,
  `repeat_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_all_site` tinyint(1) DEFAULT NULL,
  `schedule` text COLLATE utf8_unicode_ci,
  `next_run` datetime DEFAULT NULL,
  `sites` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reminders_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_reminders_on_repeat_id` (`repeat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeats`
--

DROP TABLE IF EXISTS `repeats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rule` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeats`
--

LOCK TABLES `repeats` WRITE;
/*!40000 ALTER TABLE `repeats` DISABLE KEYS */;
INSERT INTO `repeats` VALUES (6,'Everyday',1,'2017-11-20 12:38:30','2017-11-20 12:38:30','--- !ruby/object:IceCube::DailyRule\nvalidations:\n  :interval:\n  - !ruby/object:IceCube::Validations::DailyInterval::Validation\n    interval: 1\n  :base_hour:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :hour\n  :base_min:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :min\n  :base_sec:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :sec\n'),(7,'Monday to Friday',2,'2017-11-20 12:38:30','2017-11-20 12:38:30','--- !ruby/object:IceCube::WeeklyRule\nvalidations:\n  :interval:\n  - !ruby/object:IceCube::Validations::WeeklyInterval::Validation\n    interval: 1\n    week_start: :sunday\n  :base_hour:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :hour\n  :base_min:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :min\n  :base_sec:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :sec\n  :day:\n  - !ruby/object:IceCube::Validations::Day::Validation\n    day: 1\n  - !ruby/object:IceCube::Validations::Day::Validation\n    day: 2\n  - !ruby/object:IceCube::Validations::Day::Validation\n    day: 3\n  - !ruby/object:IceCube::Validations::Day::Validation\n    day: 4\n  - !ruby/object:IceCube::Validations::Day::Validation\n    day: 5\n'),(8,'Every Week',3,'2017-11-20 12:38:30','2017-11-20 12:38:30','--- !ruby/object:IceCube::WeeklyRule\nvalidations:\n  :interval:\n  - !ruby/object:IceCube::Validations::WeeklyInterval::Validation\n    interval: 1\n    week_start: :sunday\n  :base_wday:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :wday\n  :base_hour:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :hour\n  :base_min:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :min\n  :base_sec:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :sec\n'),(9,'Every 2 Weeks',4,'2017-11-20 12:38:30','2017-11-20 12:38:30','--- !ruby/object:IceCube::WeeklyRule\nvalidations:\n  :interval:\n  - !ruby/object:IceCube::Validations::WeeklyInterval::Validation\n    interval: 2\n    week_start: :sunday\n  :base_wday:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :wday\n  :base_hour:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :hour\n  :base_min:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :min\n  :base_sec:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :sec\n'),(10,'Every Month',5,'2017-11-20 12:38:30','2017-11-20 12:38:30','--- !ruby/object:IceCube::MonthlyRule\nvalidations:\n  :interval:\n  - !ruby/object:IceCube::Validations::MonthlyInterval::Validation\n    interval: 1\n  :base_day:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :day\n  :base_hour:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :hour\n  :base_min:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :min\n  :base_sec:\n  - !ruby/object:IceCube::Validations::ScheduleLock::Validation\n    type: :sec\n');
/*!40000 ALTER TABLE `repeats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120125162330'),('20120125181901'),('20120125183558'),('20120125194100'),('20120125204144'),('20120126205102'),('20120131152339'),('20120131152719'),('20120202195659'),('20120207132119'),('20120210144152'),('20120210174258'),('20120211171748'),('20120212033347'),('20120215190023'),('20120307160128'),('20120309192406'),('20120322043253'),('20120410071942'),('20120424041147'),('20120424043339'),('20120424054945'),('20120424055231'),('20120425054316'),('20120504052500'),('20120507093946'),('20120517021054'),('20120517032624'),('20120517081525'),('20120517083646'),('20120517085356'),('20120521084835'),('20120524063255'),('20120524063529'),('20120525062851'),('20120531045615'),('20120604024623'),('20120604095629'),('20120604100103'),('20120605081614'),('20120608054058'),('20120608061905'),('20120612031038'),('20120612032820'),('20120615051700'),('20120618085213'),('20120620030244'),('20120621040333'),('20120622153523'),('20120622153849'),('20120629073122'),('20120710043920'),('20120718071738'),('20120718071920'),('20120718071945'),('20120725073303'),('20120726080424'),('20120731175746'),('20120731200609'),('20120807093244'),('20120817031659'),('20120817032623'),('20120820032454'),('20120823071346'),('20120824041906'),('20120903042024'),('20120903081751'),('20120905091707'),('20120906034432'),('20120926041100'),('20121001035611'),('20121001044637'),('20121005075705'),('20121011081126'),('20121119072439'),('20121212090738'),('20130103090003'),('20130104040258'),('20130108071310'),('20130111023737'),('20130111030501'),('20130111035843'),('20130130022624'),('20130206200434'),('20130206203853'),('20130206203928'),('20130206204525'),('20130206204606'),('20130206210407'),('20130219082927'),('20130220030926'),('20130322195220'),('20130422152123'),('20130503155612'),('20130509204107'),('20130510183328'),('20130613135705'),('20130613193204'),('20130614182031'),('20130705160249'),('20130705161045'),('20130705165537'),('20130705170420'),('20130719192839'),('20130719193038'),('20130809172235'),('20130809172426'),('20130809172528'),('20130813202521'),('20130815160915'),('20130815172252'),('20130815172456'),('20130918195849'),('20130923203608'),('20130926155736'),('20130930143831'),('20131003184219'),('20131003192147'),('20131017141620'),('20131018162412'),('20131025010257'),('20131120154821'),('20131206170547'),('20140213190224'),('20140217193052'),('20140221145314'),('20140227174235'),('20140227175410'),('20140310174041'),('20140312201916'),('20140702202651'),('20150603193356'),('20151021190214'),('20151021190215'),('20151021190216'),('20151021190217'),('20151021190218'),('20151021190219'),('20151113151601'),('20160202171553'),('20160311182551');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_channels`
--

DROP TABLE IF EXISTS `share_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_channels`
--

LOCK TABLES `share_channels` WRITE;
/*!40000 ALTER TABLE `share_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_histories`
--

DROP TABLE IF EXISTS `site_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `location_mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'automatic',
  `id_with_prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_since` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_site_histories_on_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_histories`
--

LOCK TABLES `site_histories` WRITE;
/*!40000 ALTER TABLE `site_histories` DISABLE KEYS */;
INSERT INTO `site_histories` VALUES (2,2,'Paris',48.860000,2.350000,'2017-11-20 14:04:01','2017-11-20 14:32:12','{}','automatic','AB1','2017-11-20 14:04:01','2017-11-20 14:32:12',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',1,1),(3,2,'Paris',48.860000,2.350000,'2017-11-20 14:04:31','2017-11-20 14:11:03','{}','automatic','AB2','2017-11-20 14:04:31','2017-11-20 14:11:03',3,'42bbf4f6-2db1-496b-a814-d72a07352477',1,1),(4,2,'Jembi',-34.062305,18.458829,'2017-11-20 14:04:31','2017-11-20 14:11:36','{}','automatic','AB3','2017-11-20 14:04:31','2017-11-20 14:11:36',4,'44d936ac-489c-4d29-9ea8-76ae6f45d02e',1,1),(5,2,'Lorengedwat',2.357302,34.577664,'2017-11-20 14:04:31','2017-11-20 14:04:31','{}','automatic','AB4','2017-11-20 14:04:31',NULL,5,'624f54e4-707e-45c8-a4ef-48643005442e',1,1),(6,2,'Stellies',-33.935355,18.860928,'2017-11-20 14:05:29','2017-11-20 14:29:28','{}','automatic','AB5','2017-11-20 14:05:29','2017-11-20 14:29:28',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',1,1),(7,2,'Jembi',-34.062305,18.458829,'2017-11-20 14:11:36','2017-11-20 14:11:36','{}','automatic','AB3','2017-11-20 14:11:36',NULL,4,'44d936ac-489c-4d29-9ea8-76ae6f45d02e',2,1),(8,2,'Stellies',-33.935355,18.860928,'2017-11-20 14:29:28','2017-11-20 14:29:35','{}','automatic','AB5','2017-11-20 14:29:28','2017-11-20 14:29:35',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',2,1),(9,2,'Mozambique',-33.935355,18.860928,'2017-11-20 14:29:35','2017-11-20 14:29:57','{}','automatic','AB5','2017-11-20 14:29:35','2017-11-20 14:29:57',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',3,1),(10,2,'Mozambique',-13.935355,18.860923,'2017-11-20 14:29:57','2017-11-20 14:30:15','{}','automatic','AB5','2017-11-20 14:29:57','2017-11-20 14:30:15',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',4,1),(11,2,'Mozambique',-13.935355,58.860923,'2017-11-20 14:30:15','2017-11-20 14:30:22','{}','automatic','AB5','2017-11-20 14:30:15','2017-11-20 14:30:22',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',5,1),(12,2,'Mozambique',-13.935355,38.860923,'2017-11-20 14:30:22','2017-11-20 14:30:30','{}','automatic','AB5','2017-11-20 14:30:22','2017-11-20 14:30:30',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',6,1),(13,2,'Mozambique',-18.935355,38.860923,'2017-11-20 14:30:30','2017-11-20 14:30:35','{}','automatic','AB5','2017-11-20 14:30:30','2017-11-20 14:30:35',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',7,1),(14,2,'Mozambique',-18.935355,35.860923,'2017-11-20 14:30:35','2017-11-20 14:30:52','{}','automatic','AB5','2017-11-20 14:30:35','2017-11-20 14:30:52',6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',8,1),(15,2,'Mozambique',-18.935355,34.860923,'2017-11-20 14:30:52','2017-11-20 14:30:52','{}','automatic','AB5','2017-11-20 14:30:52',NULL,6,'adbabf4a-03b0-4a12-8c9f-f0195936f657',9,1),(16,2,'Paris',-48.860000,32.350000,'2017-11-20 14:32:12','2017-11-20 14:32:20','{}','automatic','AB1','2017-11-20 14:32:12','2017-11-20 14:32:20',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',2,1),(17,2,'Paris',-4.860000,32.350000,'2017-11-20 14:32:20','2017-11-20 14:32:29','{}','automatic','AB1','2017-11-20 14:32:20','2017-11-20 14:32:29',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',3,1),(18,2,'Paris',-2.860000,32.350000,'2017-11-20 14:32:29','2017-11-20 14:32:35','{}','automatic','AB1','2017-11-20 14:32:29','2017-11-20 14:32:35',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',4,1),(19,2,'Paris',-2.000000,32.350000,'2017-11-20 14:32:35','2017-11-20 14:32:42','{}','automatic','AB1','2017-11-20 14:32:35','2017-11-20 14:32:42',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',5,1),(20,2,'Paris',-2.000000,30.350000,'2017-11-20 14:32:42','2017-11-20 14:32:55','{}','automatic','AB1','2017-11-20 14:32:42','2017-11-20 14:32:55',2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',6,1),(21,2,'Rwanda',-2.000000,30.350000,'2017-11-20 14:32:55','2017-11-20 14:32:55','{}','automatic','AB1','2017-11-20 14:32:55',NULL,2,'73cf0c3a-a2bf-4132-a0c3-7425d37b137b',7,1);
/*!40000 ALTER TABLE `site_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_reminders`
--

DROP TABLE IF EXISTS `site_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminder_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_site_reminders_on_reminder_id` (`reminder_id`) USING BTREE,
  KEY `index_site_reminders_on_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_reminders`
--

LOCK TABLES `site_reminders` WRITE;
/*!40000 ALTER TABLE `site_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `location_mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'automatic',
  `id_with_prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sites_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_sites_on_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,2,'Rwanda',-2.000000,30.350000,'2017-11-20 14:04:01','2017-11-20 14:32:55','{}','automatic','AB1','73cf0c3a-a2bf-4132-a0c3-7425d37b137b',7,NULL),(3,2,'Paris',48.860000,2.350000,'2017-11-20 14:04:31','2017-11-20 14:04:31','{}','automatic','AB2','42bbf4f6-2db1-496b-a814-d72a07352477',1,'2017-11-20 14:11:03'),(4,2,'Jembi',-34.062305,18.458829,'2017-11-20 14:04:31','2017-11-20 14:11:36','{}','automatic','AB3','44d936ac-489c-4d29-9ea8-76ae6f45d02e',2,NULL),(5,2,'Lorengedwat',2.357302,34.577664,'2017-11-20 14:04:31','2017-11-20 14:04:31','{}','automatic','AB4','624f54e4-707e-45c8-a4ef-48643005442e',1,NULL),(6,2,'Mozambique',-18.935355,34.860923,'2017-11-20 14:05:29','2017-11-20 14:30:52','{}','automatic','AB5','adbabf4a-03b0-4a12-8c9f-f0195936f657',9,NULL);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites_permissions`
--

DROP TABLE IF EXISTS `sites_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `all_sites` tinyint(1) DEFAULT '1',
  `some_sites` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites_permissions`
--

LOCK TABLES `sites_permissions` WRITE;
/*!40000 ALTER TABLE `sites_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshots`
--

LOCK TABLES `snapshots` WRITE;
/*!40000 ALTER TABLE `snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thresholds`
--

DROP TABLE IF EXISTS `thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditions` text COLLATE utf8_unicode_ci,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_all_site` tinyint(1) DEFAULT NULL,
  `sites` text COLLATE utf8_unicode_ci,
  `is_all_condition` tinyint(1) DEFAULT NULL,
  `is_notify` tinyint(1) DEFAULT NULL,
  `phone_notification` text COLLATE utf8_unicode_ci,
  `email_notification` text COLLATE utf8_unicode_ci,
  `message_notification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thresholds`
--

LOCK TABLES `thresholds` WRITE;
/*!40000 ALTER TABLE `thresholds` DISABLE KEYS */;
/*!40000 ALTER TABLE `thresholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_snapshots`
--

DROP TABLE IF EXISTS `user_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_snapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_snapshots`
--

LOCK TABLES `user_snapshots` WRITE;
/*!40000 ALTER TABLE `user_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_super_user` tinyint(1) DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_count` int(11) DEFAULT '0',
  `layer_count` int(11) DEFAULT '0',
  `site_count` int(11) DEFAULT '0',
  `gateway_count` int(11) DEFAULT '0',
  `success_outcome` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'noob@noob.com','$2a$04$bLSCh4fV38F/PXHJh2aove/VAohBNxi3lea3GhdRDwMi3ukXp/4Nq',NULL,NULL,NULL,3,'2017-11-20 13:08:32','2017-11-20 13:08:32','172.25.0.1','172.25.0.1','2017-11-20 13:02:07','2017-11-20 14:16:29',NULL,NULL,'2017-11-20 13:08:19',NULL,NULL,NULL,NULL,5,1,1,0,0);
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

-- Dump completed on 2017-11-20 14:41:14
