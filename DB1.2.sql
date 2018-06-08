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

-- Volcando estructura para tabla blues.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Passwd` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla blues.admins: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT IGNORE INTO `admins` (`ID`, `Passwd`, `Email`) VALUES
	(1, 'Blues', 'jose.martin@hpe.com'),
	(2, 'Blues', 'ariel-neftali.gomez-ramirez@hpe.com'),
	(3, 'Blues', 'cris.sg@hpe.com');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Volcando estructura para tabla blues.engineeronduty
CREATE TABLE IF NOT EXISTS `engineeronduty` (
  `ID` int(11) NOT NULL,
  `OnDutyFlag` int(11) NOT NULL DEFAULT 1,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `IDR` int(11) NOT NULL,
  `NW` int(11) DEFAULT 0,
  `Company` varchar(3) NOT NULL,
  `Elevation` int(11) NOT NULL DEFAULT 0,
  `MIs` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDR` (`IDR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla blues.engineeronduty: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `engineeronduty` DISABLE KEYS */;
INSERT IGNORE INTO `engineeronduty` (`ID`, `OnDutyFlag`, `Name`, `Email`, `IDR`, `NW`, `Company`, `Elevation`, `MIs`) VALUES
	(1, 1, 'Jose Ramon', 'jr@', 1, 0, 'HPI', 13, 11),
	(2, 1, 'jLuis', '@@@', 123, 0, 'HPE', 2, 4),
	(3, 1, ' Diana Perez', 'diana.let@hpe.com', 3, 0, 'HPI', 18, 7),
	(4, 1, 'El mister', 'murillo@hpe.com', 2, 0, 'HPE', 7, 1),
	(5, 0, 'Jose Luis', 'www@.com', 5, 0, 'HPI', 19, 9),
	(6, 1, 'El pollo', 'pollo@hpe.com', 6, 0, 'HPE', 7, 5),
	(15, 1, 'Chava Arellano', 'jo@h.com', 65, 0, 'HPI', 27, 6),
	(19, 1, 'DXC\r\n', 'jose@dxc.com', 19, 0, 'DXC', 0, 0),
	(20, 1, 'Julio Alvares', 'pepito@microfocus.com', 20, 0, 'MF', 0, 0);
/*!40000 ALTER TABLE `engineeronduty` ENABLE KEYS */;

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

-- Volcando datos para la tabla blues.registry: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `registry` DISABLE KEYS */;
INSERT IGNORE INTO `registry` (`ID`, `Elevations`, `MIs`, `Registry`, `IDR`) VALUES
	(1, 0, 0, '2018-06-05 12:02:32', 1);
/*!40000 ALTER TABLE `registry` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
