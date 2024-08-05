--
-- Current Database: `teste_wk`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `teste_wk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `teste_wk`;

-- MySQL dump 10.13  Distrib 5.7.30, for Win32 (AMD64)
--
-- Host: localhost    Database: teste_wk
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
-- Table structure for table `cad_produtos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_produtos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `preco_venda` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `produtos_idx1` (`codigo`),
  KEY `produtos_idx2` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_produtos`
--

LOCK TABLES `cad_produtos` WRITE;
/*!40000 ALTER TABLE `cad_produtos` DISABLE KEYS */;
INSERT INTO `cad_produtos` VALUES (1,'Produto 001',0.10),(2,'Produto 002',0.20),(3,'Produto 003',0.30),(4,'Produto 004',0.40),(5,'Produto 005',0.50),(6,'Produto 006',0.60),(7,'Produto 007',0.70),(8,'Produto 008',0.80),(9,'Produto 009',0.90),(10,'Produto 010',1.00),(11,'Produto 011',1.10),(12,'Produto 012',1.20),(13,'Produto 013',1.30),(14,'Produto 014',1.40),(15,'Produto 015',1.50),(16,'Produto 016',1.60),(17,'Produto 017',1.70),(18,'Produto 018',1.80),(19,'Produto 019',1.90),(20,'Produto 020',2.00),(21,'Produto 021',2.10),(22,'Produto 022',2.20),(23,'Produto 023',2.30),(24,'Produto 024',2.40),(25,'Produto 025',2.50),(26,'Produto 026',2.60),(27,'Produto 027',2.70),(28,'Produto 028',2.80),(29,'Produto 029',2.90),(30,'Produto 030',3.00),(31,'Produto 031',3.10),(32,'Produto 032',3.20),(33,'Produto 033',3.30),(34,'Produto 034',3.40),(35,'Produto 035',3.50),(36,'Produto 036',3.60),(37,'Produto 037',3.70),(38,'Produto 038',3.80),(39,'Produto 039',3.90),(40,'Produto 040',4.00);
/*!40000 ALTER TABLE `cad_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05  9:53:51
