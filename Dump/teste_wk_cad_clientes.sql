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
-- Table structure for table `cad_clientes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `clientes_idx1` (`codigo`) USING BTREE,
  KEY `clientes_idx2` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_clientes`
--

LOCK TABLES `cad_clientes` WRITE;
/*!40000 ALTER TABLE `cad_clientes` DISABLE KEYS */;
INSERT INTO `cad_clientes` VALUES (1,'Cliente A','Rio Branco','AC'),(2,'Cliente B','Maceió','AL'),(3,'Cliente C','Macapá','AP'),(4,'Cliente D','Manaus','AM'),(5,'Cliente E','Salvador','BA'),(6,'Cliente F','Fortaleza','CE'),(7,'Cliente G','Brasília','DF'),(8,'Cliente H','Vitória','ES'),(9,'Cliente I','Goiânia','GO'),(10,'Cliente J','São Luís','MA'),(11,'Cliente K','Cuiabá','MT'),(12,'Cliente L','Campo Grande','MS'),(13,'Cliente M','Belo Horizonte','MG'),(14,'Cliente N','Belém','PA'),(15,'Cliente O','João Pessoa','PB'),(16,'Cliente P','Curitiba','PR'),(17,'Cliente Q','Recife','PE'),(18,'Cliente R','Teresina','PI'),(19,'Cliente S','Rio de Janeiro','RJ'),(20,'Cliente T','Natal','RN'),(21,'Cliente U','Porto Alegre','RS'),(22,'Cliente V','Porto Velho','RO'),(23,'Cliente W','Boa Vista','RR'),(24,'Cliente X','Florianópolis','SC'),(25,'Cliente Y','São Paulo','SP'),(26,'Cliente Z','Aracaju','SE');
/*!40000 ALTER TABLE `cad_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05  9:53:50
