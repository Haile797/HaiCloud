-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 04:11 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoptoy_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Cat_ID` varchar(10) NOT NULL,
  `Cat_Name` varchar(30) NOT NULL,
  `Cat_Des` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Cat_ID`, `Cat_Name`, `Cat_Des`) VALUES
('2', 'cat', 'yes'),
('3', 'Wooden toys', 'ToysProduct'),
('4', 'Model toys', 'ToysProduct');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `CustName` varchar(30) NOT NULL,
  `gender` int(11) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `CusDate` int(11) NOT NULL,
  `CusMonth` int(11) NOT NULL,
  `CusYear` int(11) NOT NULL,
  `SSN` varchar(10) DEFAULT NULL,
  `ActiveCode` varchar(100) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Username`, `Password`, `CustName`, `gender`, `Address`, `telephone`, `email`, `CusDate`, `CusMonth`, `CusYear`, `SSN`, `ActiveCode`, `state`) VALUES
('abc', '25f9e794323b453885f5181f1b624d0b', 'la nhut', 0, 'ggg', '113', 'nhut114@gmail.com', 20, 10, 2008, '', '', 0),
('bcd', 'e10adc3949ba59abbe56e057f20f883e', 'la nhut minh', 1, 'Can Tho', '0396707375', 'nhut1111@gmail.com', 18, 10, 2009, '', '', 0),
('laminhnhut', 'e10adc3949ba59abbe56e057f20f883e', 'La Nhut', 0, 'ggg', '111313144', 'laminhnhut1311@gmail.com', 20, 10, 2004, '', '', 0),
('laminhnhut1311', 'e10adc3949ba59abbe56e057f20f883e', 'la minh nhut', 0, 'Dong Thap', '0396707375', 'nhut2002@gmail.com', 13, 11, 2002, '', '', 0),
('nhut', 'fcea920f7412b5da7be0cf42b8c93759', 'La Minh Nhut', 0, 'Dong Thap', '0396707375', 'laminhnhut158@gmail.com', 16, 10, 1979, '', '', 1),
('nhut123', 'e10adc3949ba59abbe56e057f20f883e', 'la nhut', 0, 'ggg', '113', 'nhut@gmail.com', 17, 11, 1987, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(6) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Delivery_loca` varchar(200) NOT NULL,
  `Payment` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(10) NOT NULL,
  `Product_Name` varchar(30) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `oldPrice` decimal(12,2) NOT NULL,
  `SmallDesc` varchar(1000) NOT NULL,
  `DetailDesc` text NOT NULL,
  `ProDate` datetime NOT NULL,
  `Pro_qty` int(11) NOT NULL,
  `Pro_image` varchar(200) NOT NULL,
  `Cat_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Price`, `oldPrice`, `SmallDesc`, `DetailDesc`, `ProDate`, `Pro_qty`, `Pro_image`, `Cat_ID`) VALUES
('1', 'toy', 11111, '0.00', 'good', '', '2023-05-04 10:53:13', 22, 'images(14).jpg', '3'),
('13', 'yotrt', 11111, '0.00', 'good', '', '2023-05-22 12:50:26', 12, 'images(5).jpg', '3'),
('14', 'nno', 11111, '0.00', 'good', '', '2023-05-22 12:50:49', 1212, 'images(9).jpg', '3'),
('2', 'luffy', 11111, '0.00', 'good', '', '2023-05-20 19:04:36', 22222, 'images(5).jpg', '3'),
('4', 'animal toys', 573000, '0.00', '3', '', '2022-10-19 03:58:39', 54, 'images(16).jpg', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`Username`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `category` (`Cat_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
