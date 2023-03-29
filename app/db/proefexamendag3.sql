-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 29 mrt 2023 om 08:05
-- Serverversie: 5.7.36
-- PHP-versie: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proefexamendag3`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `baan`
--

DROP TABLE IF EXISTS `baan`;
CREATE TABLE IF NOT EXISTS `baan` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Nummer` int(1) DEFAULT NULL,
  `HeeftHek` bit(1) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Opmerking` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) DEFAULT NULL,
  `DatumGewijzigd` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `baan`
--

INSERT INTO `baan` (`Id`, `Nummer`, `HeeftHek`, `IsActive`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, b'0', NULL, NULL, NULL, NULL),
(2, 2, b'0', NULL, NULL, NULL, NULL),
(3, 3, b'0', NULL, NULL, NULL, NULL),
(4, 4, b'0', NULL, NULL, NULL, NULL),
(5, 5, b'0', NULL, NULL, NULL, NULL),
(6, 6, b'0', NULL, NULL, NULL, NULL),
(7, 7, b'1', NULL, NULL, NULL, NULL),
(8, 8, b'1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `persoon`
--

DROP TABLE IF EXISTS `persoon`;
CREATE TABLE IF NOT EXISTS `persoon` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `TypePersoonId` int(6) DEFAULT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `TussenVoegsel` varchar(30) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `Roepnaam` varchar(50) DEFAULT NULL,
  `IsVolwassen` bit(1) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Opmerking` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) DEFAULT NULL,
  `DatumGewijzigd` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `persoon`
--

INSERT INTO `persoon` (`Id`, `TypePersoonId`, `Voornaam`, `TussenVoegsel`, `Achternaam`, `Roepnaam`, `IsVolwassen`, `IsActive`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 'Mazin', NULL, 'Jamil', 'Mazin', b'1', NULL, NULL, NULL, NULL),
(2, 1, 'Arjan', 'De', 'Ruijter', 'Arjan', b'1', NULL, NULL, NULL, NULL),
(3, 1, 'Hans', NULL, 'Odijk', 'Hans', b'1', NULL, NULL, NULL, NULL),
(4, 1, 'Dennis', 'Van', 'Wakeren', 'Dennis', b'1', NULL, NULL, NULL, NULL),
(5, 2, 'Wilco', 'Van de', 'Grift', 'Wilco', b'1', NULL, NULL, NULL, NULL),
(6, 3, 'Tom', NULL, 'Sanders', 'Tom', b'0', NULL, NULL, NULL, NULL),
(7, 3, 'Andrew', NULL, 'Sanders', 'Andrew', b'0', NULL, NULL, NULL, NULL),
(8, 3, 'Julian', NULL, 'Kaldenheuvel', 'Julian', b'1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reservering`
--

DROP TABLE IF EXISTS `reservering`;
CREATE TABLE IF NOT EXISTS `reservering` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `PersoonId` int(6) DEFAULT NULL,
  `OpeningstijdId` int(6) DEFAULT NULL,
  `TariefId` int(6) DEFAULT NULL,
  `BaanId` int(6) DEFAULT NULL,
  `PakketOptieId` int(6) DEFAULT NULL,
  `ReserveringsStatusId` int(6) DEFAULT NULL,
  `ReserveringsNummer` bigint(13) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `AantalUren` int(2) DEFAULT NULL,
  `BeginTijd` time DEFAULT NULL,
  `EindTijd` time DEFAULT NULL,
  `AantalVolwassenen` int(1) DEFAULT NULL,
  `AantalKinderen` int(1) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Opmerking` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) DEFAULT NULL,
  `DatumGewijzigd` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PersoonId` (`PersoonId`),
  KEY `BaanId` (`BaanId`),
  KEY `ReserveringsStatusId` (`ReserveringsStatusId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `reservering`
--

INSERT INTO `reservering` (`Id`, `PersoonId`, `OpeningstijdId`, `TariefId`, `BaanId`, `PakketOptieId`, `ReserveringsStatusId`, `ReserveringsNummer`, `Datum`, `AantalUren`, `BeginTijd`, `EindTijd`, `AantalVolwassenen`, `AantalKinderen`, `IsActive`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 2, 1, 8, 1, 1, 2022122000001, '2022-12-20', 1, '15:00:00', '16:00:00', 4, 2, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 8, 1, 1, 2022122000002, '2022-12-20', 1, '17:00:00', '18:00:00', 4, NULL, NULL, NULL, NULL, NULL),
(3, 3, 7, 2, 3, 1, 1, 2022122000003, '2022-12-24', 2, '16:00:00', '18:00:00', 4, NULL, NULL, NULL, NULL, NULL),
(4, 1, 2, 1, 6, NULL, 1, 2022122000004, '2022-12-27', 2, '17:00:00', '19:00:00', 2, NULL, NULL, NULL, NULL, NULL),
(5, 4, 3, 1, 4, 4, 1, 2022122000005, '2022-12-28', 1, '14:00:00', '15:00:00', 3, NULL, NULL, NULL, NULL, NULL),
(6, 5, 10, 3, 5, 4, 1, 2022122000006, '2022-12-28', 2, '19:00:00', '21:00:00', 2, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reserveringsstatus`
--

DROP TABLE IF EXISTS `reserveringsstatus`;
CREATE TABLE IF NOT EXISTS `reserveringsstatus` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(60) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Opmerking` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) DEFAULT NULL,
  `DatumGewijzigd` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `reserveringsstatus`
--

INSERT INTO `reserveringsstatus` (`Id`, `Naam`, `IsActive`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Bevestigd', NULL, NULL, NULL, NULL),
(2, 'Geannuleerd', NULL, NULL, NULL, NULL),
(3, 'Inbehandeling', NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
