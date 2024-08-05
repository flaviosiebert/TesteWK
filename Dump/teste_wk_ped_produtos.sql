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
-- Table structure for table `ped_produtos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ped_produtos` (
  `id_autoinc` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `codigo_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_unitario` decimal(12,2) DEFAULT NULL,
  `valor_total` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_autoinc`),
  KEY `ped_produtos_fk1` (`numero_pedido`),
  CONSTRAINT `ped_produtos_fk1` FOREIGN KEY (`numero_pedido`) REFERENCES `ped_dados_gerais` (`numero_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ped_produtos`
--

LOCK TABLES `ped_produtos` WRITE;
/*!40000 ALTER TABLE `ped_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ped_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05  9:53:53
