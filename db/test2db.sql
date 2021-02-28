-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2020 at 10:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test2db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(11, 'cat_1', 0),
(12, 'cat_2', 0),
(17, 'cat_1_1', 11),
(18, 'cat_1_2', 11),
(19, 'cat_1_3', 11),
(20, 'cat_2_1', 12);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `image_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image_uri`, `category_id`) VALUES
(46, 'prod_1', 'http://www.img.com', 17),
(47, 'prod_2', 'http://www.img.com', 18),
(48, 'prod_3', 'http://www.img.com', 19),
(49, 'prod_4', 'http://www.img.com', 20),
(50, 'prod_5', 'http://www.img.com', 18),
(51, 'prod_6', 'http://www.img.com', 17),
(52, 'prod_7', 'http://www.img.com', 17),
(53, 'prod_8', 'http://www.img.com', 18),
(54, 'prod_9', 'http://www.img.com', 18),
(55, 'prod_10', 'http://www.img.com', 18),
(56, 'prod_11', 'http://www.img.com', 19),
(57, 'prod_12', 'http://www.img.com', 19),
(58, 'prod_13', 'http://www.img.com', 20);

-- --------------------------------------------------------

--
-- Table structure for table `product_provider`
--

CREATE TABLE `product_provider` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_provider`
--

INSERT INTO `product_provider` (`id`, `product_id`, `provider_id`, `price`, `featured`, `available`) VALUES
(1, 50, 6, 54, 0, 1),
(2, 51, 6, 512, 0, 1),
(3, 52, 6, 5145, 1, 1),
(4, 53, 6, 854, 0, 1),
(5, 54, 7, 487, 1, 1),
(6, 55, 7, 154, 0, 1),
(7, 56, 7, 558, 1, 1),
(8, 56, 8, 844, 1, 1),
(9, 55, 8, 9589, 0, 1),
(10, 50, 8, 548, 1, 1),
(11, 49, 8, 444, 0, 1),
(12, 48, 8, 884, 1, 1),
(13, 48, 9, 221, 0, 1),
(14, 56, 9, 844, 1, 1),
(15, 57, 9, 299, 1, 1),
(16, 53, 9, 8484, 0, 1),
(17, 51, 10, 515, 1, 1),
(18, 52, 10, 985, 0, 1),
(19, 53, 10, 2211, 0, 1),
(20, 54, 10, 655, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`) VALUES
(6, 'prov_1'),
(7, 'prov_2'),
(8, 'prov_3'),
(9, 'prov_5'),
(10, 'prov_6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_provider`
--
ALTER TABLE `product_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `product_provider`
--
ALTER TABLE `product_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
