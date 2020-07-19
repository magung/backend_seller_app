-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 19, 2020 at 06:16 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seller_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Smartphone'),
(2, 'Accessories'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, 'Black'),
(2, 'White'),
(3, 'Blue'),
(4, 'Red'),
(5, 'Green'),
(6, 'Purple'),
(7, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`) VALUES
(1, 'Customer'),
(2, 'Branch Store'),
(3, 'Online Store');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_name`) VALUES
(1, 'Cash'),
(2, 'Debit'),
(3, 'Credit'),
(4, 'Transfer Bank');

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE `period` (
  `period_id` int(11) NOT NULL,
  `period_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `period`
--

INSERT INTO `period` (`period_id`, `period_name`) VALUES
(1, '-'),
(2, '10 Tahun'),
(3, '9 Tahun'),
(4, '8 Tahun'),
(5, '7 Tahun'),
(6, '6 Tahun'),
(7, '5 Tahun'),
(8, '4 Tahun'),
(9, '3 Tahun'),
(10, '1 Tahun'),
(11, '18 Bulan'),
(12, '18 Bulan'),
(13, '15 Bulan'),
(14, '1 Bulan'),
(15, '2x24 Jam'),
(16, '7 Hari');

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL,
  `privilege` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`privilege_id`, `privilege`, `created_date`, `updated_date`) VALUES
(1, 'Owner', '2020-04-25 22:08:09', '2020-04-25 23:17:31'),
(2, 'Main User', '2020-04-25 22:08:09', '2020-07-11 21:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `spesification` varchar(255) NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `color_id` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category_id`, `price`, `spesification`, `warranty_id`, `color_id`, `picture`, `notes`, `created_date`, `updated_date`, `store_id`, `period_id`) VALUES
(9, 'edit testing', 1, 100000, 'tes', 1, '1', '2020-07-12 05:46:38 - Screen Shot 2020-07-10 at 11.14.43.png', 'tes', '2020-07-11 23:50:16', '2020-07-12 05:46:38', 1, 1),
(10, 'edit testing', 1, 100000, 'tes', 1, '1,2', '2020-07-12 05:46:54 - Screen Shot 2020-07-10 at 11.14.43.png', 'tes', '2020-07-12 00:04:58', '2020-07-12 05:46:54', 1, 1),
(11, 'edit testing', 1, 100000, 'tes', 1, '1,2', '2020-07-12 05:55:26 - Screen Shot 2020-07-10 at 11.14.43.png', 'tes', '2020-07-12 05:46:21', '2020-07-12 05:55:26', 1, 1),
(12, 'testing', 1, 100000, 'tes', 1, '1,2', '2020-07-12 05:46:27 - Screen Shot 2020-07-10 at 15.45.20.png', 'tes', '2020-07-12 05:46:27', NULL, 1, NULL),
(13, 'testing', 1, 100000, 'tes', 1, '1,2', '2020-07-12 05:54:05 - Screen Shot 2020-07-10 at 15.45.20.png', 'tes', '2020-07-12 05:54:05', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `created_date`, `updated_date`) VALUES
(1, 'Techno Cellular', '2020-06-14 17:10:25', NULL),
(2, 'Techno Cellular 2', '2020-06-14 17:10:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `price`, `product_id`, `created_date`, `payment_id`, `customer_id`, `notes`, `picture`, `updated_date`, `store_id`) VALUES
(6, 200000, '9,10', '2020-07-12 05:33:57', 1, 1, 'testing', NULL, NULL, 1),
(7, 200000, '9', '2020-07-12 05:38:30', 1, 1, 'testing update', NULL, '2020-07-12 05:41:57', 2),
(8, 200000, '9', '2020-07-12 06:22:44', 1, 1, 'testing', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `privilege_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `created_date`, `updated_date`, `picture`, `privilege_id`) VALUES
(1, 'victoria cell', 'victoria@email.com', 'ab1cb712f2dca756105160805501f4d6d8657d93d40b16eee4ecb5fd048d26eb', '2020-04-25 22:14:44', '2020-04-25 22:53:20', NULL, 1),
(2, 'comshop', 'comshop@email.com', '7e8e11da6510250dc902c3bdafe5021490d63861029d0819703aa765a753ecb3', '2020-04-25 22:42:56', NULL, NULL, 2),
(4, 'victoria', 'victoria@gmail.com', 'ab1cb712f2dca756105160805501f4d6d8657d93d40b16eee4ecb5fd048d26eb', '2020-05-09 13:25:17', NULL, NULL, 2),
(5, 'victoria1', 'victoria1@gmail.com', '393794fcb23242b5011cf5db13d2997e693dfcc3d6ce546fb2dc410f3da844bd', '2020-06-27 20:55:11', NULL, NULL, 2),
(6, 'Yuda Ble', 'victoria@gmll.com', 'ab1cb712f2dca756105160805501f4d6d8657d93d40b16eee4ecb5fd048d26eb', '2020-06-27 21:17:47', NULL, NULL, 1),
(7, 'Yuda Ble', 'victoria@store.com', 'ab1cb712f2dca756105160805501f4d6d8657d93d40b16eee4ecb5fd048d26eb', '2020-06-27 21:20:35', NULL, NULL, 1),
(8, 'Ahmad', 'lyfewithcode@gmail.com', 'ab1cb712f2dca756105160805501f4d6d8657d93d40b16eee4ecb5fd048d26eb', '2020-07-04 16:23:09', NULL, NULL, 1),
(9, 'test', 'test@gmail.com', 'cf80cd8aed482d5d1527d7dc72fceff84e6326592848447d2dc0b0e87dfc9a90', '2020-07-11 16:05:57', NULL, NULL, 1),
(10, 'Maulana Ahmad', 'ahmad123@gmail.com', 'cf80cd8aed482d5d1527d7dc72fceff84e6326592848447d2dc0b0e87dfc9a90', '2020-07-11 16:16:12', NULL, NULL, 2),
(11, 'agung', 'agung@gmail.com', '7bd65a0ca26e50420b8c263c2624f98231f821e8734d1f6812352b69f7a87280', '2020-07-11 21:19:29', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warranty`
--

CREATE TABLE `warranty` (
  `warranty_id` int(11) NOT NULL,
  `warranty_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warranty`
--

INSERT INTO `warranty` (`warranty_id`, `warranty_name`) VALUES
(1, '-'),
(2, 'Garansi International'),
(3, 'Garansi Resmi'),
(4, 'Garansi Distributor'),
(5, 'Garansi Toko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`period_id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warranty`
--
ALTER TABLE `warranty`
  ADD PRIMARY KEY (`warranty_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `warranty`
--
ALTER TABLE `warranty`
  MODIFY `warranty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
