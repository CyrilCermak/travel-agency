# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: fadb
# Generation Time: 2017-08-09 00:22:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accommodation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accommodation`;

CREATE TABLE `accommodation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;

INSERT INTO `accommodation` (`id`, `description`, `imagePath`, `location`, `name`, `capacity`)
VALUES
	(1,'A nice new hotel with free internet access','neco','Heidelberg','Hotelo',15),
	(2,'montparnasse.concorde-hotels.com',NULL,'Paris','Concorde Montparnasse',12),
	(3,'soin-esthetique-du-corps.com',NULL,'Paris','Four Seasons',5),
	(4,'www.l-hotel.com',NULL,'Paris','L\'Hôtel',8),
	(5,'www.sanctuaryhousehotel.co.uk',NULL,'London','Sanctuary House Hotel',20),
	(6,'www.cityinn.com',NULL,'London','City Inn Hotel Westminster',3),
	(7,'www.brownshotel.com',NULL,'London','Brown\'s Hotel',15),
	(8,NULL,NULL,'Prague','Ambassador',8),
	(9,NULL,NULL,'Prague','Grand Hotel Praha',50),
	(10,NULL,NULL,'Prague','Corinthia Towers',10);

/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contract
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `holiday_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE20F75326B532249` (`holiday_id`),
  KEY `FKE20F7532F0BD3F4B` (`customer_id`),
  CONSTRAINT `FKE20F75326B532249` FOREIGN KEY (`holiday_id`) REFERENCES `holiday` (`id`),
  CONSTRAINT `FKE20F7532F0BD3F4B` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;

INSERT INTO `contract` (`id`, `number`, `customer_id`, `holiday_id`)
VALUES
	(1,654,1,1),
	(2,655,2,2),
	(3,656,3,3),
	(4,657,4,3),
	(5,658,3,6),
	(6,659,1,3),
	(7,660,3,2),
	(8,661,4,2),
	(9,662,2,2),
	(10,663,4,2),
	(11,664,4,2),
	(12,665,4,1),
	(13,666,1,2),
	(14,667,1,2),
	(15,668,2,2),
	(16,669,4,8),
	(17,670,5,8),
	(18,671,1,9),
	(19,672,4,8),
	(20,673,3,8),
	(21,674,4,8),
	(22,675,3,8),
	(23,676,3,10),
	(24,676,8,1),
	(25,677,9,1),
	(26,678,8,1),
	(27,679,10,1),
	(28,680,8,2),
	(29,681,2,3),
	(30,682,1,1),
	(31,683,1,3),
	(32,684,1,3),
	(33,685,1,3),
	(34,686,1,2),
	(35,687,11,3),
	(36,688,11,1),
	(37,689,12,1),
	(38,690,13,1),
	(39,691,14,1),
	(40,692,8,1),
	(41,693,9,3),
	(42,694,9,10),
	(43,695,15,3),
	(44,696,16,1),
	(45,697,14,1),
	(46,698,1,1),
	(47,699,2,1),
	(48,700,12,3),
	(49,701,12,3),
	(50,702,1,10),
	(51,703,1,1),
	(52,704,3,1),
	(53,705,3,1),
	(54,706,9,3),
	(55,707,16,3),
	(56,708,3,1),
	(57,709,3,2),
	(58,710,3,1),
	(59,711,17,2),
	(60,712,18,8);

/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table creditcard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `creditcard`;

CREATE TABLE `creditcard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `validity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;

INSERT INTO `creditcard` (`id`, `number`, `ownerName`, `validity`)
VALUES
	(1,'4210-3903-2933-1929','MARTIN JELEN','03/09'),
	(2,'4567-5654-8797-2133','TOMAS BAUER','04/10'),
	(3,'5455-4567-7982-3132','ONDREJ KUCERA','12/08'),
	(4,'1111-1111-1111-1111','XX	 XX','1/2016'),
	(5,'1234-1234-1234-1234','s s','1/2016'),
	(8,'1234123412331343','CC CC','1111'),
	(9,'1232123212321232','aaa aaa','1212'),
	(10,'1234123412341234','1234 1234','12v1'),
	(11,'1234123412341234','Aaa Aaa','1212'),
	(12,'1234123412341234','aaa 1234','1212'),
	(13,'1234123412341234','1234 1234','1212'),
	(14,'1234123412341234','1234 1234','1212'),
	(15,'1234123412341234','1234 1234','1212'),
	(16,'1234123412341234','1234 1234','v112'),
	(17,'1231123112311231','Cyril Cermak','1212'),
	(18,'1231123112311231','Cyril Test','1212');

/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `card_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27FBE3FE93CDC464` (`card_id`),
  CONSTRAINT `FK27FBE3FE93CDC464` FOREIGN KEY (`card_id`) REFERENCES `creditcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `firstName`, `surname`, `card_id`)
VALUES
	(1,'Martin','Jelen',1),
	(2,'Tomáš','Bauer',2),
	(3,'Ondřej','Kučera',3),
	(4,'XX	','XX',4),
	(5,'s','s',5),
	(8,'CC','CC',8),
	(9,'aaa','aaa',9),
	(10,'1234','1234',10),
	(11,'Aaa','Aaa',11),
	(12,'aaa','1234',12),
	(13,'1234','1234',13),
	(14,'1234','1234',14),
	(15,'1234','1234',15),
	(16,'1234','1234',16),
	(17,'Cyril','Cermak',17),
	(18,'Cyril','Test',18);

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hibernate_sequence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table holiday
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ends` date DEFAULT NULL,
  `fixed` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `starts` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;

INSERT INTO `holiday` (`id`, `ends`, `fixed`, `name`, `price`, `starts`)
VALUES
	(1,'2016-10-06',00000000,'10 days of Prague',390,'2016-09-15'),
	(2,'2016-06-17',10000000,'5 days of London',210,'2016-05-27'),
	(3,'2016-10-12',00000000,'14 days of Europe',750,'2016-09-23'),
	(6,'2016-06-20',00000000,'Custom',0,'2016-05-24'),
	(8,'2016-05-05',10000000,'xXX',0,'2016-04-11'),
	(9,'2016-11-30',00000000,'sss',0,'2016-11-09'),
	(10,'2016-02-22',00000000,'Andrea Trip',0,'2016-02-08');

/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table holiday_service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday_service`;

CREATE TABLE `holiday_service` (
  `Holiday_id` bigint(20) NOT NULL,
  `services_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Holiday_id`,`services_id`),
  KEY `FK2F920D8E6B532249` (`Holiday_id`),
  KEY `FK2F920D8E707B92E0` (`services_id`),
  CONSTRAINT `FK2F920D8E6B532249` FOREIGN KEY (`Holiday_id`) REFERENCES `holiday` (`id`),
  CONSTRAINT `FK2F920D8E707B92E0` FOREIGN KEY (`services_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `holiday_service` WRITE;
/*!40000 ALTER TABLE `holiday_service` DISABLE KEYS */;

INSERT INTO `holiday_service` (`Holiday_id`, `services_id`)
VALUES
	(1,6),
	(2,8),
	(2,9),
	(10,10);

/*!40000 ALTER TABLE `holiday_service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table holiday_transportation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday_transportation`;

CREATE TABLE `holiday_transportation` (
  `Holiday_id` bigint(20) NOT NULL,
  `transportation_id` bigint(20) NOT NULL,
  KEY `FKE61958736B532249` (`Holiday_id`),
  KEY `FKE61958731A10EBCB` (`transportation_id`),
  CONSTRAINT `FKE61958731A10EBCB` FOREIGN KEY (`transportation_id`) REFERENCES `transportation` (`id`),
  CONSTRAINT `FKE61958736B532249` FOREIGN KEY (`Holiday_id`) REFERENCES `holiday` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `holiday_transportation` WRITE;
/*!40000 ALTER TABLE `holiday_transportation` DISABLE KEYS */;

INSERT INTO `holiday_transportation` (`Holiday_id`, `transportation_id`)
VALUES
	(1,8),
	(3,1),
	(3,2),
	(3,3),
	(3,4),
	(6,33),
	(6,8),
	(2,5),
	(2,6),
	(9,51),
	(9,49),
	(8,53),
	(8,49),
	(8,49),
	(10,10),
	(10,20);

/*!40000 ALTER TABLE `holiday_transportation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD97C5E956562EC27` (`hotel_id`),
  CONSTRAINT `FKD97C5E956562EC27` FOREIGN KEY (`hotel_id`) REFERENCES `accommodation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

INSERT INTO `service` (`id`, `description`, `location`, `name`, `type`, `hotel_id`)
VALUES
	(1,'A nice, long massage','Heidelberg','Back massage',1,1),
	(2,'Express dry cleaning for business travellers available','Paris','Dry cleaning',2,2),
	(3,'Express dry cleaning for business travellers available','Paris','Dry cleaning',2,4),
	(4,'Express dry cleaning for business travellers available','London','Dry cleaning',2,5),
	(5,'Express dry cleaning for business travellers available','London','Dry cleaning',2,7),
	(6,'A one-day trip to Klatovy','Prague','Klatovy (1 day)',0,NULL),
	(7,'A two-day trip to the metropolis of the South Bohemia','Prague','České Budějovice (2 days)',0,NULL),
	(8,NULL,'London','Oxford (1 day)',0,NULL),
	(9,'Sightseeing around the City of London','London','City of London sightseeing',0,NULL),
	(10,'A one-day getaway to the amusement park','Paris','Eurodisney (1 day)',0,NULL),
	(11,'No shoes stolen. Guarranteed','London','Shoe cleaning',2,5);

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stay`;

CREATE TABLE `stay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dayFrom` date DEFAULT NULL,
  `dayTo` date DEFAULT NULL,
  `holiday_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK277A796B532249` (`holiday_id`),
  KEY `FK277A796562EC27` (`hotel_id`),
  CONSTRAINT `FK277A796562EC27` FOREIGN KEY (`hotel_id`) REFERENCES `accommodation` (`id`),
  CONSTRAINT `FK277A796B532249` FOREIGN KEY (`holiday_id`) REFERENCES `holiday` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;

INSERT INTO `stay` (`id`, `dayFrom`, `dayTo`, `holiday_id`, `hotel_id`)
VALUES
	(1,'2009-05-12','2009-05-21',1,8),
	(2,'2009-02-10','2009-02-14',2,5),
	(3,'2009-03-08','2009-03-13',3,4),
	(4,'2009-03-15','2009-03-19',3,9),
	(5,'2009-03-20','2009-03-21',3,6),
	(8,'2001-01-01','2001-01-01',6,10),
	(12,'2001-01-01','2001-01-01',9,8),
	(13,'2001-01-01','2001-01-01',8,10),
	(14,'2001-01-01','2001-01-01',10,3);

/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transportation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transportation`;

CREATE TABLE `transportation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrival` datetime DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `departure` datetime DEFAULT NULL,
  `loc_from` varchar(255) DEFAULT NULL,
  `occupied` int(11) NOT NULL,
  `loc_to` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;

INSERT INTO `transportation` (`id`, `arrival`, `capacity`, `departure`, `loc_from`, `occupied`, `loc_to`, `type`)
VALUES
	(1,'2009-03-08 09:15:00',20,'2009-03-07 18:00:00','Chicago',4,'Paris',0),
	(2,'2009-03-15 07:00:00',400,'2009-03-14 20:00:00','Paris',4,'Prague',2),
	(3,'2009-03-20 15:00:00',8,'2009-03-20 12:40:00','Prague',4,'London',0),
	(4,'2009-03-22 04:00:00',20,'2009-03-21 22:45:00','London',4,'Chicago',0),
	(5,'2009-02-10 10:00:00',15,'2009-02-10 00:30:00','Detroit',10,'London',0),
	(6,'2009-02-16 14:30:00',10,'2009-02-16 00:45:00','London',10,'Detroit',0),
	(7,'2009-05-12 07:15:00',12,'2009-05-11 20:00:00','Chicago',2,'Prague',0),
	(8,'2009-05-22 00:15:00',3,'2009-05-21 12:10:00','Prague',3,'Chicago',0),
	(9,'2009-03-11 09:15:00',15,'2009-03-10 18:00:00','Chicago',0,'Paris',0),
	(10,'2009-03-15 09:15:00',15,'2009-03-14 18:00:00','Chicago',1,'Paris',0),
	(11,'2009-03-18 09:15:00',15,'2009-03-17 18:00:00','Chicago',0,'Paris',0),
	(12,'2009-03-22 09:15:00',15,'2009-03-21 18:00:00','Chicago',0,'Paris',0),
	(13,'2009-03-25 09:15:00',15,'2009-03-24 18:00:00','Chicago',0,'Paris',0),
	(14,'2009-03-29 09:15:00',15,'2009-03-28 18:00:00','Chicago',0,'Paris',0),
	(15,'2009-04-01 09:15:00',15,'2009-03-31 18:00:00','Chicago',0,'Paris',0),
	(16,'2009-04-05 09:15:00',15,'2009-04-04 18:00:00','Chicago',0,'Paris',0),
	(17,'2009-03-16 00:15:00',20,'2009-03-15 12:10:00','Paris',0,'Chicago',0),
	(18,'2009-03-23 00:15:00',20,'2009-03-22 12:10:00','Paris',0,'Chicago',0),
	(19,'2009-03-30 00:15:00',20,'2009-03-29 12:10:00','Paris',0,'Chicago',0),
	(20,'2009-04-05 00:15:00',20,'2009-04-05 12:10:00','Paris',1,'Chicago',0),
	(21,'2009-04-13 00:15:00',20,'2009-04-12 12:10:00','Paris',0,'Chicago',0),
	(22,'2009-04-20 00:15:00',20,'2009-04-19 12:10:00','Paris',0,'Chicago',0),
	(23,'2009-04-27 00:15:00',20,'2009-04-26 12:10:00','Paris',0,'Chicago',0),
	(24,'2009-02-24 10:00:00',8,'2009-02-24 00:30:00','Detroit',0,'London',0),
	(25,'2009-03-10 10:00:00',8,'2009-03-10 00:30:00','Detroit',0,'London',0),
	(26,'2009-03-24 10:00:00',8,'2009-03-24 00:30:00','Detroit',0,'London',0),
	(27,'2009-04-07 10:00:00',8,'2009-04-07 00:30:00','Detroit',0,'London',0),
	(28,'2009-04-21 10:00:00',8,'2009-04-21 00:30:00','Detroit',0,'London',0),
	(29,'2009-03-02 14:30:00',12,'2009-03-02 00:45:00','London',0,'Detroit',0),
	(30,'2009-03-16 14:30:00',12,'2009-03-16 00:45:00','London',0,'Detroit',0),
	(31,'2009-03-30 14:30:00',12,'2009-03-30 00:45:00','London',0,'Detroit',0),
	(32,'2009-04-13 14:30:00',12,'2009-04-13 00:45:00','London',0,'Detroit',0),
	(33,'2009-03-10 10:00:00',20,'2009-03-09 22:30:00','Chicago',1,'Prague',0),
	(34,'2009-03-30 10:00:00',20,'2009-03-29 22:30:00','Chicago',0,'Prague',0),
	(35,'2009-04-19 10:00:00',20,'2009-04-18 22:30:00','Chicago',0,'Prague',0),
	(36,'2009-03-23 01:45:00',14,'2009-03-22 12:45:00','Prague',0,'Chicago',0),
	(37,'2009-04-25 01:45:00',14,'2009-04-24 12:45:00','Prague',0,'Chicago',0),
	(38,'2009-03-08 19:00:00',7,'2009-03-08 10:00:00','Paris',0,'Prague',1),
	(39,'2009-03-10 18:30:00',6,'2009-03-10 14:30:00','London',0,'Paris',2),
	(40,'2009-03-12 20:15:00',9,'2009-03-12 18:30:00','Prague',0,'London',0),
	(41,'2009-03-14 17:05:00',7,'2009-03-14 09:45:00','Prague',0,'Paris',1),
	(42,'2009-03-16 15:15:00',8,'2009-03-16 12:00:00','Paris',0,'London',2),
	(43,'2009-03-18 19:00:00',7,'2009-03-18 10:00:00','Paris',0,'Prague',1),
	(44,'2009-03-20 20:15:00',9,'2009-03-20 18:30:00','Prague',3,'London',0),
	(45,'2009-03-22 15:15:00',9,'2009-03-22 12:00:00','London',0,'Prague',0),
	(46,'2009-03-24 18:30:00',6,'2009-03-24 14:30:00','London',0,'Paris',2),
	(47,'2009-03-26 17:05:00',7,'2009-03-26 09:45:00','Prague',0,'Paris',1),
	(48,'2009-03-28 18:30:00',6,'2009-03-28 14:30:00','London',0,'Paris',2),
	(49,'2009-03-30 20:15:00',9,'2009-03-30 18:30:00','Prague',6,'London',0),
	(50,'2009-04-01 15:15:00',8,'2009-04-01 12:00:00','Paris',0,'London',2),
	(51,'2009-04-03 15:15:00',9,'2009-04-03 12:00:00','London',4,'Prague',0),
	(52,'2009-04-05 19:00:00',7,'2009-04-05 10:00:00','Paris',0,'Prague',1),
	(53,'2009-04-07 15:15:00',9,'2009-04-07 12:00:00','London',4,'Prague',0),
	(54,'2009-04-09 15:15:00',9,'2009-04-09 12:00:00','London',0,'Prague',0),
	(55,'2009-04-11 15:15:00',8,'2009-04-11 12:00:00','Paris',0,'London',2),
	(56,'2009-04-13 17:05:00',7,'2009-04-13 09:45:00','Prague',0,'Paris',1),
	(57,'2009-04-15 15:15:00',8,'2009-04-15 12:00:00','Paris',0,'London',2),
	(58,'2009-04-17 20:15:00',9,'2009-04-17 18:30:00','Prague',0,'London',0),
	(59,'2009-04-19 19:00:00',7,'2009-04-19 10:00:00','Paris',0,'Prague',1),
	(60,'2009-04-21 18:30:00',6,'2009-04-21 14:30:00','London',0,'Paris',2),
	(61,'2009-04-23 17:05:00',7,'2009-04-23 09:45:00','Prague',0,'Paris',1);

/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table traveller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateOfBirth` date DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `idNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `contract_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC314B49F95DF42CB` (`contract_id`),
  CONSTRAINT `FKC314B49F95DF42CB` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `traveller` WRITE;
/*!40000 ALTER TABLE `traveller` DISABLE KEYS */;

INSERT INTO `traveller` (`id`, `dateOfBirth`, `firstName`, `idNumber`, `surname`, `contract_id`)
VALUES
	(1,'1975-08-12','Michal','329310291','Bláha',1),
	(2,'1978-04-20','Marek','545487988','Tuhý',2),
	(3,'1998-05-10','Martin','545646544','Tuhý',2),
	(4,'1960-12-12','Marie','78219464','Hýlová',3),
	(5,'2001-01-01','X','11','x',4),
	(6,'2001-01-01','s','2','s',5),
	(7,'2001-01-01','s','1','s',6),
	(8,'2001-01-01','s','2','s',6),
	(9,'2001-01-01','s','1','s',7),
	(10,'2001-01-01','s','2','s',8),
	(11,'2001-01-01','s','1','s',9),
	(12,'2001-01-01','s','3','s',10),
	(13,'2001-01-01','s','1','s',11),
	(14,'2001-01-01','s','1','s',12),
	(15,'2001-01-01','s','1','s',13),
	(16,'2001-01-01','a','1','a',14),
	(17,'2001-01-01','w','1','v',15),
	(18,'2001-01-01','s','1','s',16),
	(19,'2001-01-01','s','1','s',17),
	(20,'2001-01-01','s','1','s',18),
	(21,'2001-01-01','s','1','s',19),
	(22,'2001-01-01','b','11','b',20),
	(23,'2001-01-01','C','1','c',20),
	(24,'2001-01-01','s','2','s',21),
	(25,'2001-01-01','Cyril','1','Cermak',22),
	(26,'2001-01-01','Andrea','1','Psotova',23),
	(27,NULL,'1234',NULL,'1234',NULL),
	(28,'2016-03-08','Test1',NULL,'tes1',NULL),
	(29,NULL,'Martin',NULL,'Jelen',46),
	(30,'2016-03-15','1234',NULL,'1234',47),
	(31,NULL,'Tomáš',NULL,'Bauer',47),
	(32,NULL,'aaa',NULL,'1234',48),
	(33,NULL,'aaa',NULL,'1234',49),
	(34,'2016-03-02','asd',NULL,'asd',49),
	(35,'2016-03-02','as',NULL,'asfasfafs',50),
	(36,NULL,'Martin',NULL,'Jelen',50),
	(37,NULL,'XX',NULL,'XX',51),
	(38,NULL,'Martin',NULL,'Jelen',51),
	(39,NULL,'SS',NULL,'SSss',52),
	(40,NULL,'Ondřej',NULL,'Kučera',52),
	(41,NULL,'Ondřej',NULL,'Kučera',53),
	(42,NULL,'xx',NULL,'xx',54),
	(43,NULL,'aaa',NULL,'aaa',54),
	(44,'2016-03-22','Aa',NULL,'aa',55),
	(45,'2016-03-22','Aa',NULL,'aa',55),
	(46,NULL,'Ondřej',NULL,'Kučera',56),
	(47,'2016-03-16','Cyril',NULL,'Cermak',57),
	(48,'2016-03-16','Cyril',NULL,'Cermak',58),
	(49,'2016-03-07','1231',NULL,'1231',59),
	(50,NULL,'Ters',NULL,'TTTT',60);

/*!40000 ALTER TABLE `traveller` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
