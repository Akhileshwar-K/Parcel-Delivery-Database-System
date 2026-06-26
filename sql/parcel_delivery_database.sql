-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2025 at 10:22 PM
-- Server version: 8.4.4
-- PHP Version: 8.4.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Parcel_Delivery_DB`
--
CREATE DATABASE IF NOT EXISTS `Parcel_Delivery_DB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Parcel_Delivery_DB`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Cid` int NOT NULL,
  `F_Name` varchar(50) NOT NULL,
  `L_Name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Cid`, `F_Name`, `L_Name`, `Address`) VALUES
(1, 'Jake', 'Spencer', '24/2,Green Tree road,Kallangur,Brisbane'),
(2, 'Ruby', 'Danson', '35/2,Penbrook street,Sydney'),
(3, 'Elsie', 'Kim', '71/3,Glenview,Perth'),
(4, 'Jamie', 'Kang', '42/2,Byron Bay,Sydney'),
(5, 'Emma', 'Stone', '65/4,Birch street,Adelaide');

-- --------------------------------------------------------

--
-- Table structure for table `Drives`
--

CREATE TABLE `Drives` (
  `Pid` int NOT NULL,
  `Reg_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Drives`
--

INSERT INTO `Drives` (`Pid`, `Reg_no`) VALUES
(1, '168AH4'),
(2, '1AAZ164'),
(3, '1IP4CZ'),
(5, 'C85610'),
(4, 'LES066');

-- --------------------------------------------------------

--
-- Table structure for table `MotorCycle`
--

CREATE TABLE `MotorCycle` (
  `Reg_no` varchar(50) NOT NULL,
  `Engine_Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `MotorCycle`
--

INSERT INTO `MotorCycle` (`Reg_no`, `Engine_Type`) VALUES
('523NL7', 'Electric'),
('C85610', 'Internal Combustion'),
('LES066', 'Electric'),
('PQB073', 'Internal Combustion'),
('YMU17G', 'Electric');

-- --------------------------------------------------------

--
-- Table structure for table `Parcel`
--

CREATE TABLE `Parcel` (
  `Id` int NOT NULL,
  `Cid` int NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL CHECK (Weight > 0),
  `Money` decimal(6,2) DEFAULT NULL CHECK (Money > 0),
  `Wid` int NOT NULL,
  `Pid` int NOT NULL
) ;

--
-- Dumping data for table `Parcel`
--

INSERT INTO `Parcel` (`Id`, `Cid`, `Status`, `Type`, `Weight`, `Money`, `Wid`, `Pid`) VALUES
(1, 1, 'In Transit', 'Standard', 2.50, 25.00, 1, 1),
(2, 1, 'Delivered', 'Express', 1.20, 40.00, 2, 2),
(3, 2, 'Picked Up', 'Standard', 3.00, 30.00, 1, 3),
(4, 2, 'In Transit', 'Fragile', 0.80, 15.00, 2, 4),
(5, 1, 'Delivered', 'Express', 4.00, 50.00, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Postman`
--

CREATE TABLE `Postman` (
  `Pid` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Postman`
--

INSERT INTO `Postman` (`Pid`, `Name`, `Contact`) VALUES
(1, 'Tommy Lee', '0411-111-111'),
(2, 'Jackie Chan', '0422-222-222'),
(3, 'Brad Pitt', '0433-333-333'),
(4, 'David Wiese', '0444-444-444'),
(5, 'Steve Smith', '0455-555-555');

-- --------------------------------------------------------

--
-- Table structure for table `Telephones`
--

CREATE TABLE `Telephones` (
  `Cid` int NOT NULL,
  `Telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Telephones`
--

INSERT INTO `Telephones` (`Cid`, `Telephone`) VALUES
(1, '0411-123-456'),
(2, '0411-654-321'),
(2, '0422-987-654'),
(3, '0433-456-789'),
(4, '0444-321-987');

-- --------------------------------------------------------

--
-- Table structure for table `Truck`
--

CREATE TABLE `Truck` (
  `Reg_no` varchar(50) NOT NULL,
  `Load_Capacity` decimal(10,2) DEFAULT NULL CHECK(Load_Capacity > 0),
  `Trailer_Type` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `Truck`
--

INSERT INTO `Truck` (`Reg_no`, `Load_Capacity`, `Trailer_Type`) VALUES
('168AH4', 5000.00, 'Flatbed'),
('1AAZ164', 7500.00, 'Drop Deck'),
('1IP4CZ', 4000.00, 'Box'),
('AC75WG', 7000.00, 'Flatbed'),
('S679APE', 6500.00, 'Box');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE `Vehicle` (
  `Reg_no` varchar(50) NOT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `Year` int NOT NULL CHECK(Year > 0)
) ;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`Reg_no`, `Manufacturer`, `Year`) VALUES
('168AH4', 'Toyota', 2022),
('1AAZ164', 'Ford', 2023),
('1IP4CZ', 'Honda', 2019),
('523NL7', 'Suzuki', 2021),
('AC75WG', 'Toyota', 2021),
('C85610', 'Yamaha', 2024),
('LES066', 'Honda', 2020),
('PQB073', 'Yamaha', 2016),
('S679APE', 'Suzuki', 2020),
('YMU17G', 'Honda', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `WareHouse`
--

CREATE TABLE `WareHouse` (
  `Wid` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `WareHouse`
--

INSERT INTO `WareHouse` (`Wid`, `Name`, `Address`) VALUES
(1, 'Brisbane Hub', '300,Peach street,Bowen Hills,Brisbane'),
(2, 'Adelaide Hub', '352,Depot lane,Adelaide'),
(3, 'Sydney Hub', '200,Industrial Road,Sydney'),
(4, 'Perth Hub', '402,Freight Road,Perth'),
(5, 'Melbourne Hub', '502,Logistics avenue,Melbourne');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Cid`);

--
-- Indexes for table `Drives`
--
ALTER TABLE `Drives`
  ADD PRIMARY KEY (`Pid`,`Reg_no`),
  ADD KEY `Reg_no` (`Reg_no`);

--
-- Indexes for table `MotorCycle`
--
ALTER TABLE `MotorCycle`
  ADD PRIMARY KEY (`Reg_no`);

--
-- Indexes for table `Parcel`
--
ALTER TABLE `Parcel`
  ADD PRIMARY KEY (`Id`,`Cid`),
  ADD KEY `Wid` (`Wid`),
  ADD KEY `Pid` (`Pid`),
  ADD KEY `Parcel_ibfk_1` (`Cid`);

--
-- Indexes for table `Postman`
--
ALTER TABLE `Postman`
  ADD PRIMARY KEY (`Pid`);

--
-- Indexes for table `Telephones`
--
ALTER TABLE `Telephones`
  ADD PRIMARY KEY (`Cid`,`Telephone`);

--
-- Indexes for table `Truck`
--
ALTER TABLE `Truck`
  ADD PRIMARY KEY (`Reg_no`);

--
-- Indexes for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD PRIMARY KEY (`Reg_no`);

--
-- Indexes for table `WareHouse`
--
ALTER TABLE `WareHouse`
  ADD PRIMARY KEY (`Wid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Drives`
--
ALTER TABLE `Drives`
  ADD CONSTRAINT `Drives_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `Postman` (`Pid`),
  ADD CONSTRAINT `Drives_ibfk_2` FOREIGN KEY (`Reg_no`) REFERENCES `Vehicle` (`Reg_no`);

--
-- Constraints for table `MotorCycle`
--
ALTER TABLE `MotorCycle`
  ADD CONSTRAINT `MotorCycle_ibfk_1` FOREIGN KEY (`Reg_no`) REFERENCES `Vehicle` (`Reg_no`);

--
-- Constraints for table `Parcel`
--
ALTER TABLE `Parcel`
  ADD CONSTRAINT `Parcel_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `Customer` (`Cid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `Parcel_ibfk_2` FOREIGN KEY (`Wid`) REFERENCES `WareHouse` (`Wid`),
  ADD CONSTRAINT `Parcel_ibfk_3` FOREIGN KEY (`Pid`) REFERENCES `Postman` (`Pid`);

--
-- Constraints for table `Telephones`
--
ALTER TABLE `Telephones`
  ADD CONSTRAINT `Telephones_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `Customer` (`Cid`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `Truck`
--
ALTER TABLE `Truck`
  ADD CONSTRAINT `Truck_ibfk_1` FOREIGN KEY (`Reg_no`) REFERENCES `Vehicle` (`Reg_no`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
