-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 10:12 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportinggoodsemporiumdatabase`
--
CREATE DATABASE IF NOT EXISTS `sportinggoodsemporiumdatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sportinggoodsemporiumdatabase`;

GRANT SELECT, INSERT, DELETE, UPDATE ON sportinggoodsemporiumdatabase.* TO sportinggoodsemporium@localhost IDENTIFIED BY 'sportinggoodsemporiumpass';

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `accountNumber` char(8) NOT NULL,
  `productID` char(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `accountNumber` char(8) NOT NULL,
  `email` varchar(128) NOT NULL,
  `Fname` varchar(128) DEFAULT NULL,
  `Lname` varchar(128) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phoneNumber` varchar(128) DEFAULT NULL,
  `dateOpened` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`accountNumber`, `email`, `Fname`, `Lname`, `password`, `address`, `phoneNumber`, `dateOpened`) VALUES
('16908224', 'test@test.com', 'test', 'test', '$2y$10$h3SDCgB5Gs9h8eREDm4Ca.y9iY9JZOaDR3q0kxE.uARE1VtSSEvPy', '123 test Road Test NJ 12345', '999-999-9999', '2022-11-20');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` char(8) NOT NULL,
  `email` varchar(128) NOT NULL,
  `Fname` varchar(128) DEFAULT NULL,
  `Lname` varchar(128) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phoneNumber` varchar(128) DEFAULT NULL,
  `salary` double NOT NULL,
  `startDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `email`, `Fname`, `Lname`, `password`, `address`, `phoneNumber`, `salary`, `startDate`) VALUES
('12345678', 'admin@SGE.com', 'FirstName', 'LastName', '$2y$10$h3SDCgB5Gs9h8eREDm4Ca.y9iY9JZOaDR3q0kxE.uARE1VtSSEvPy', '123 admin road', '123-456-7890', 500000, '2022-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(6) NOT NULL,
  `accountNumber` char(8) NOT NULL,
  `orderNumber` char(6) NOT NULL,
  `productID` char(6) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `shippingAddress` varchar(128) DEFAULT NULL,
  `billingAddress` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` char(6) NOT NULL,
  `name` varchar(256) NOT NULL,
  `category` varchar(256) NOT NULL,
  `price` double NOT NULL,
  `manufacturer` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `productID` (`productID`),
  ADD KEY `accountNumber` (`accountNumber`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`accountNumber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phoneNumber` (`phoneNumber`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `email` (`email`,`phoneNumber`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountNumber` (`accountNumber`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
