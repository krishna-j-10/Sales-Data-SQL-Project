CREATE DATABASE  IF NOT EXISTS `salesdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salesdata`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: salesdata
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(80) NOT NULL,
  `customer_name` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `grade` varchar(80) DEFAULT NULL,
  `salesman_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `salesman_id` (`salesman_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('3001','Brad Guzan','London',NULL,NULL),('3002','Nick Rimando','New York','100',5001),('3003','Jozy Altidor','Moncow','200',5007),('3004','Fabian Johns','Paris','300',5006),('3005','Graham Zusi','California','200',5002),('3007','Brad Davis','New York','200',5001),('3008','Julian Green','London','300',5002),('3009','Geoff Camero','Berlin','100',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_s`
--

DROP TABLE IF EXISTS `order_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_s` (
  `order_no` int NOT NULL,
  `purch_amt` decimal(10,2) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` varchar(80) DEFAULT NULL,
  `salesman_id` int DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `customer_id` (`customer_id`),
  KEY `salesman_id` (`salesman_id`),
  CONSTRAINT `order_s_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `order_s_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_s`
--

LOCK TABLES `order_s` WRITE;
/*!40000 ALTER TABLE `order_s` DISABLE KEYS */;
INSERT INTO `order_s` VALUES (70001,150.50,'2016-10-05','3005',5002),(70002,65.26,'2016-10-05','3002',5001),(70003,2480.40,'2016-10-10','3009',NULL),(70004,110.50,'2016-08-17','3009',NULL),(70005,2400.60,'2016-07-27','3007',5001),(70007,948.50,'2016-09-10','3005',5002),(70008,5760.00,'2016-09-10','3002',5001),(70009,270.65,'2016-09-10','3001',NULL),(70010,1983.43,'2016-10-10','3004',5006),(70011,75.29,'2016-08-17','3003',5007),(70012,250.45,'2016-06-27','3008',5002),(70013,30.46,'2014-05-27','3002',5001);
/*!40000 ALTER TABLE `order_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman` (
  `salesman_id` int NOT NULL,
  `s_name` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `commission` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES (5001,'James Hooq','New York',0.15),(5002,'Nail Knite','Paris',0.13),(5003,'Lauson Hen','Paris',0.12),(5005,'Pit Alex','London',0.11),(5006,'Mc Lyon',NULL,0.14),(5007,'Paul Adam','Rome',0.13);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 16:54:08
