-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2018 at 02:10 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `CustID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `BookingDate` datetime NOT NULL,
  `PickDate` datetime NOT NULL,
  `DropDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CarID` (`CarID`),
  KEY `CustID` (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `Model` varchar(200) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Reg` int(11) NOT NULL,
  `Rent` int(11) NOT NULL,
  `Availability` varchar(200) NOT NULL,
  PRIMARY KEY (`Reg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`Model`, `Type`, `Reg`, `Rent`, `Availability`) VALUES
('Suzuki Mehran', 'Go', 34, 1000, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Name` varchar(200) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) NOT NULL,
  `Contact` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`Reg`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`CustID`) REFERENCES `customer` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
