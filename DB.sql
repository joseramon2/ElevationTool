-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.15-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para blues
CREATE DATABASE IF NOT EXISTS `blues` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blues`;

-- Volcando estructura para tabla blues.engineeronduty
CREATE TABLE IF NOT EXISTS `engineeronduty` (
  `ID` int(11) NOT NULL,
  `Company` varchar(3) NOT NULL,
  `IDR` int(11) NOT NULL,
  `NW` bit(1) DEFAULT b'0',
  `Email` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla blues.registry
CREATE TABLE IF NOT EXISTS `registry` (
  `ID` int(11) NOT NULL,
  `Elevations` int(11) NOT NULL DEFAULT 0,
  `MIs` int(11) NOT NULL DEFAULT 0,
  `Registry` datetime NOT NULL,
  `IDR` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKRegistry` (`IDR`),
  CONSTRAINT `FKRegistry` FOREIGN KEY (`IDR`) REFERENCES `engineeronduty` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
