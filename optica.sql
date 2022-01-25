CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `optica`;
-- MySQL dump 10.13  Distrib 5.7.34, for osx11.0 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idclient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adreça` varchar(100) DEFAULT NULL,
  `telefon` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `data_registre` datetime NOT NULL,
  `idrecomenat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleats` (
  `idempleat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `adreça` varchar(100) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`idempleat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `idfactura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `ulleres_idulleres` int(11) NOT NULL,
  `clients_idclient` int(10) unsigned NOT NULL,
  `empleats_idempleat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `fk_facturas_ulleres1_idx` (`ulleres_idulleres`),
  KEY `fk_facturas_clients1_idx` (`clients_idclient`),
  KEY `fk_facturas_empleats1_idx` (`empleats_idempleat`),
  CONSTRAINT `fk_facturas_clients1` FOREIGN KEY (`clients_idclient`) REFERENCES `clients` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_empleats1` FOREIGN KEY (`empleats_idempleat`) REFERENCES `empleats` (`idempleat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_ulleres1` FOREIGN KEY (`ulleres_idulleres`) REFERENCES `ulleres` (`idulleres`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `idmarca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `proveidors_idproveidors` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmarca`),
  KEY `fk_marcas_proveidors_idx` (`proveidors_idproveidors`),
  CONSTRAINT `fk_marcas_proveidors` FOREIGN KEY (`proveidors_idproveidors`) REFERENCES `proveidors` (`idproveidors`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor_subministra`
--

DROP TABLE IF EXISTS `proveidor_subministra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveidor_subministra` (
  `fecha_hora` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `proveidors_idproveidors` int(10) unsigned NOT NULL,
  `ulleres_idulleres` int(11) NOT NULL,
  `factura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`factura`),
  UNIQUE KEY `factura_UNIQUE` (`factura`),
  KEY `fk_proveidor_subministra_ulleres1_idx` (`ulleres_idulleres`),
  KEY `fk_proveidor_subministra_proveidors1` (`proveidors_idproveidors`),
  CONSTRAINT `fk_proveidor_subministra_proveidors1` FOREIGN KEY (`proveidors_idproveidors`) REFERENCES `proveidors` (`idproveidors`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveidor_subministra_ulleres1` FOREIGN KEY (`ulleres_idulleres`) REFERENCES `ulleres` (`idulleres`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor_subministra`
--

LOCK TABLES `proveidor_subministra` WRITE;
/*!40000 ALTER TABLE `proveidor_subministra` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveidor_subministra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveidors` (
  `idproveidors` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `carrer` varchar(45) DEFAULT NULL,
  `numero` int(200) DEFAULT NULL,
  `pis` int(200) DEFAULT NULL,
  `porta` int(200) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `codipostal` varchar(20) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveidors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidors`
--

LOCK TABLES `proveidors` WRITE;
/*!40000 ALTER TABLE `proveidors` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ulleres` (
  `idulleres` int(11) NOT NULL AUTO_INCREMENT,
  `graduacio_esquerre` int(100) NOT NULL,
  `graduacio_dreta` int(100) NOT NULL,
  `tipus_montura` enum('flotant','pasta','metalica') NOT NULL,
  `color` varchar(45) NOT NULL,
  `preu` int(11) NOT NULL,
  `marcas_idmarca` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idulleres`),
  KEY `fk_ulleres_marcas1_idx` (`marcas_idmarca`),
  CONSTRAINT `fk_ulleres_marcas1` FOREIGN KEY (`marcas_idmarca`) REFERENCES `marcas` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 12:46:39

INSERT INTO proveidors(idproveidors,nom,carrer,numero,pis,porta,ciutat,codipostal,pais,telefon,fax,nif)
VALUES (1,'Luna','Passeig roca', 17, 2, 2, 'Barcelona', 08205, 'España','937215656','937212127','4673827E'),
       (2,'Glass','Dos rius', 19,3,1,'Barcelona', 08206, 'España', '928767687','928767687','27827827F');

INSERT INTO marcas(nom,proveidors_idproveidors)
VALUES ('Oakley',1),
       ('RayBan',2);

INSERT INTO ulleres(idulleres,graduacio_esquerre,graduacio_dreta,tipus_montura,color,preu,marcas_idmarca)
VALUES (1,2,2,'pasta','negre',150,1),
       (2,3,4,'metalica','gris',120,1),
       (3,2,3,'flotant','marro',110,2);

INSERT INTO proveidor_subministra(fecha_hora,cantidad,proveidors_idproveidors,ulleres_idulleres)
VALUES ('2021-12-13 10:38:00',200,1,1),
	   ('2021-12-13 12:00:00',200,2,3);

INSERT INTO clients(nom,adreça,telefon,mail,data_registre)
VALUES ('Rafa Llonch', 'Picañol 37', '606089675','rafa_sbd@hotmail.com','2021-12-13 10:38:00'); 

INSERT INTO empleats(idempleat,nom,adreça,telefon,mail)
VALUES (1,'Miquel','Balmes 22','937276565','miquel@gmail.com');

INSERT INTO facturas(fecha,cantidad,precio,ulleres_idulleres,clients_idclient,empleats_idempleat)
VALUES ('2021-12-13 10:38:00', 2, 240,1,1,1),
	   ('2021-12-13 10:40:00', 3, 240,2,1,1); 
       
-- Llista el total de factures d'un client en un període determinat 
SELECT * FROM facturas WHERE clients_idclient=1 AND fecha BETWEEN '2021-01-01' AND '2022-01-01';

-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT idulleres,graduacio_esquerre,graduacio_dreta,tipus_montura,color,preu FROM ulleres INNER JOIN facturas ON facturas.ulleres_idulleres = ulleres.idulleres WHERE empleats_idempleat=1;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT idproveidors,nom,carrer,numero,pis,porta,ciutat,codipostal,pais,telefon,fax,nif FROM proveidors INNER JOIN proveidor_subministra ON proveidor_subministra.proveidors_idproveidors = proveidors.idproveidors;
