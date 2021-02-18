-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adress` (
  `idAdress` int(11) NOT NULL AUTO_INCREMENT,
  `road` varchar(45) NOT NULL,
  `number` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `door` int(11) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `postalCode` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `supplier_NIF` varchar(45) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAdress`),
  UNIQUE KEY `idAdress_UNIQUE` (`idAdress`),
  KEY `fk_Adress_Supplier_idx` (`supplier_NIF`),
  KEY `fk_Adress_Client1_idx` (`client_id`),
  CONSTRAINT `fk_Adress_Client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_Adress_Supplier` FOREIGN KEY (`supplier_NIF`) REFERENCES `supplier` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Calle Asd',1,2,3,'Barcelona','08399','Spain','123455223ss',NULL),(3,'Calle asdawd',1,2,3,'Barcelona','08399','Spain','1233s455223ss',NULL),(4,'Calle Terasdwad',1,2,3,'Barcelona','08399','Spain','12323aasd455223ss',NULL),(5,'Calle Palmeras',1,2,3,'Barcelona','08399','Spain',NULL,1),(6,'Calle Ruedas',1,2,3,'Barcelona','08399','Spain',NULL,2),(7,'Calle vilares',1,2,3,'Barcelona','08399','Spain',NULL,3);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `registerDate` date NOT NULL,
  `recomendedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Xavier',111111111,'xavambro@gmail.com','2021-02-17',NULL),(2,'Juan',222222222,'juanambro@gmail.com','2021-02-17',NULL),(3,'Jorge',333333333,'jorgeambro@gmail.com','2021-02-17','xavambro@gmail.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Xavi'),(2,'Jordi');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `calibration` varchar(45) NOT NULL,
  `frameType` varchar(45) NOT NULL,
  `frameColor` varchar(45) NOT NULL,
  `glassColor` varchar(45) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `supplier_NIF` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Glasses_Client1_idx` (`client_id`),
  KEY `fk_Glasses_Employee1_idx` (`employee_id`),
  KEY `fk_Glasses_Supplier1_idx` (`supplier_NIF`),
  CONSTRAINT `fk_Glasses_Client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_Glasses_Employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_Glasses_Supplier1` FOREIGN KEY (`supplier_NIF`) REFERENCES `supplier` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,'Opticalia','5','flexible','black','transparent',100.00,1,1,'123455223ss'),(2,'Raven','5','flexible','black','transparent',80.00,2,1,'1233s455223ss'),(3,'Oakley','5','flexible','black','transparent',80.00,3,2,'12323aasd455223ss');
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `NIF` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('12323aasd455223ss','Muchas gafas','666-566-666','123678212331-233'),('1233s455223ss','Gafotas','666-466-666','123456212331-233'),('123455223ss','Suepr gafas','666-666-666','12300012331-233');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-17 19:18:41
