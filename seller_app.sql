-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Jul 2020 pada 16.09
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Smartphone'),
(2, 'Accessories');

-- --------------------------------------------------------

--
-- Struktur dari tabel `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `period_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`) VALUES
(1, 'customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_name`) VALUES
(1, 'cash');

-- --------------------------------------------------------

--
-- Struktur dari tabel `period`
--

CREATE TABLE `period` (
  `period_id` int(11) NOT NULL,
  `period_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `privilege`
--

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL,
  `privilege` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `privilege`
--

INSERT INTO `privilege` (`privilege_id`, `privilege`, `created_date`, `updated_date`) VALUES
(1, 'Owner', '2020-04-25 22:08:09', '2020-04-25 23:17:31'),
(2, 'Main User', '2020-04-25 22:08:09', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `spesification` varchar(255) NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category_id`, `price`, `spesification`, `warranty_id`, `color_id`, `picture`, `notes`, `created_date`, `updated_date`, `store_id`) VALUES
(1, 'SFSSF', 1, 1656, 'hxxxdgh', 1, 1, 'Test', 'test', '2020-06-14 17:14:25', '2020-06-20 19:17:05', 1),
(4, 'Oppo A31 Smartphone - White - 4/64GB', 1, 2699000, 'RAM 4GB, Internal Storage 64GB', 1, 1, NULL, 'Test Notes', '2020-07-04 13:54:06', NULL, 1),
(5, 'Samsung A11', 1, 2199000, 'RAM 4GB, Internal Storage 64GB', 1, 1, NULL, 'Test Notes', '2020-07-04 14:18:12', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `created_date`, `updated_date`) VALUES
(1, 'Techno Cellular', '2020-06-14 17:10:25', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
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
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `price`, `product_id`, `created_date`, `payment_id`, `customer_id`, `notes`, `picture`, `updated_date`, `store_id`) VALUES
(3, 100000, '[1, 2]', '2020-06-09 17:15:37', 1, 1, 'test', NULL, '2020-06-14 17:53:28', 1),
(4, 100000, '[1, 2]', '2020-06-09 17:15:37', 1, 1, 'test', NULL, '2020-06-14 17:53:28', 2),
(5, 340000, '[1, 2]', '2020-06-20 19:03:29', 1, 1, 'test', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
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
(10, 'Maulana Ahmad', 'ahmad123@gmail.com', 'cf80cd8aed482d5d1527d7dc72fceff84e6326592848447d2dc0b0e87dfc9a90', '2020-07-11 16:16:12', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `warranty`
--

CREATE TABLE `warranty` (
  `warranty_id` int(11) NOT NULL,
  `warranty_name` varchar(255) NOT NULL,
  `period_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indeks untuk tabel `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `warranty`
--
ALTER TABLE `warranty`
  ADD PRIMARY KEY (`warranty_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `privilege`
--
ALTER TABLE `privilege`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `warranty`
--
ALTER TABLE `warranty`
  MODIFY `warranty_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
