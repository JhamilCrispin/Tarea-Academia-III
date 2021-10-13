-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: pnp
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

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
-- Table structure for table `ciudadano`
--

DROP TABLE IF EXISTS `ciudadano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudadano` (
  `DNI` int(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `procedencia` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `fk_RVALIDACION` FOREIGN KEY (`DNI`) REFERENCES `policia` (`ingresoCivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadano`
--

LOCK TABLES `ciudadano` WRITE;
/*!40000 ALTER TABLE `ciudadano` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudadano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esalud`
--

DROP TABLE IF EXISTS `esalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esalud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` int(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `estadoSalud` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esalud`
--

LOCK TABLES `esalud` WRITE;
/*!40000 ALTER TABLE `esalud` DISABLE KEYS */;
/*!40000 ALTER TABLE `esalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policia`
--

DROP TABLE IF EXISTS `policia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policia` (
  `idPol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `DNI` int(8) NOT NULL,
  `CIP` int(8) NOT NULL,
  `ingresoCivil` int(11) DEFAULT NULL,
  `salidaCivil` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idPol`),
  UNIQUE KEY `DNI` (`DNI`),
  UNIQUE KEY `CIP` (`CIP`),
  UNIQUE KEY `ingresoCivil` (`ingresoCivil`),
  KEY `fk_Salida` (`salidaCivil`),
  CONSTRAINT `fk_REGISTRO` FOREIGN KEY (`ingresoCivil`) REFERENCES `registrarcivil` (`id_ingreso`),
  CONSTRAINT `fk_Salida` FOREIGN KEY (`salidaCivil`) REFERENCES `salidacivil` (`codigo_ingreso`),
  CONSTRAINT `fk_salud` FOREIGN KEY (`ingresoCivil`) REFERENCES `esalud` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policia`
--

LOCK TABLES `policia` WRITE;
/*!40000 ALTER TABLE `policia` DISABLE KEYS */;
/*!40000 ALTER TABLE `policia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrarcivil`
--

DROP TABLE IF EXISTS `registrarcivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrarcivil` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_civil` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `DNI` int(8) NOT NULL,
  `codigo_ingreso` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_ingreso`),
  UNIQUE KEY `DNI` (`DNI`),
  CONSTRAINT `fk_estado1` FOREIGN KEY (`id_ingreso`) REFERENCES `esalud` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrarcivil`
--

LOCK TABLES `registrarcivil` WRITE;
/*!40000 ALTER TABLE `registrarcivil` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrarcivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reniec`
--

DROP TABLE IF EXISTS `reniec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reniec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` int(8) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cerificar` FOREIGN KEY (`id`) REFERENCES `policia` (`ingresoCivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reniec`
--

LOCK TABLES `reniec` WRITE;
/*!40000 ALTER TABLE `reniec` DISABLE KEYS */;
/*!40000 ALTER TABLE `reniec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidacivil`
--

DROP TABLE IF EXISTS `salidacivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidacivil` (
  `codigo_ingreso` varchar(10) NOT NULL,
  `id_salida` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `codigo_salida` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo_ingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidacivil`
--

LOCK TABLES `salidacivil` WRITE;
/*!40000 ALTER TABLE `salidacivil` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidacivil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-12 23:17:48
