-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2018 at 12:58 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `Invoices`
--

CREATE TABLE `Invoices` (
  `id` int(11) NOT NULL,
  `invoice` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `buyerId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Invoices`
--

INSERT INTO `Invoices` (`id`, `invoice`, `total`, `paid`, `buyerId`, `createdAt`, `updatedAt`) VALUES
(1, 'INV-1541807597703', '83000', '83000', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'INV-1541807619651', '13000000', '13000000', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'INV-1541807631591', '1200000', '0', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'INV-1542066893794', '61000', '61000', 1, '2018-11-12 23:54:53', '2018-11-12 23:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `photoUrl` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id`, `nama`, `harga`, `stock`, `userId`, `photoUrl`) VALUES
(1, 'Apple Iphone X', '13000000', 20, 1, 'https://mpf.azureedge.net/products-testing/efbb6583-04e6-4912-8878-ec5b4d86aa96/f3db1d1d-6bb7-43f7-bb7f-fe7abcad85c8'),
(2, 'Minyak goreng tropical slim', '20000', 23, 1, 'https://id-live-01.slatic.net/original/935dfe1d56aae5d50bf9fb008a9891f0.jpg'),
(3, 'Nokia 3110c', '1200000', 65, 1, 'https://cdn2.gsmarena.com/vv/pics/nokia/nokia-3110cl-00.jpg'),
(4, 'Indomie Goreng Box Isi 40pcs', '24000', 12, 2, 'https://mpf.azureedge.net/products-testing/5c8d1212-52d1-4921-bd0c-59e0f12297de/9be75f33-8a2f-43f1-88e9-d46a6187bbf9'),
(5, 'Kecap Manis Bango 400ml', '13000', 20, 2, 'https://mpf.azureedge.net/products-testing/c290bf58-4332-4c87-b8bc-707f4e74d12c/4fc6257a-0b19-4e4b-914a-bcf22d901d0e'),
(6, 'Mukena Bali', '35000', 5, 3, 'https://mpf.azureedge.net/products-testing/153716aa-272a-4783-a343-6cd11f4e2728/d70e2f39-c8a5-401e-a0f1-3f5030099dea');

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `item` int(5) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Transactions`
--

INSERT INTO `Transactions` (`id`, `productId`, `item`, `invoiceId`, `processed`) VALUES
(1, 4, 2, 1, 1),
(2, 6, 1, 1, 1),
(3, 1, 1, 2, 0),
(4, 3, 1, 3, 0),
(13, 6, 1, 9, 0),
(14, 5, 2, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photoUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `nama`, `email`, `password`, `photoUrl`, `balance`) VALUES
(1, 'User 1', 'user1@email.com', 'MTJxd2Fzeng=', 'https://s3.amazonaws.com/uifaces/faces/twitter/eitarafa/128.jpg', '9000'),
(2, 'User 2', 'user2@email.com', 'MTJxd2Fzeng=', 'https://s3.amazonaws.com/uifaces/faces/twitter/lowie/128.jpg', '0'),
(3, 'User 3', 'user3@email.com', 'MTJxd2Fzeng=', 'https://s3.amazonaws.com/uifaces/faces/twitter/josecarlospsh/128.jpg', '0'),
(11, 'User 4', 'user4@email.com', 'MTJxd2Fzeng=', 'https://s3.amazonaws.com/uifaces/faces/twitter/rez___a/128.jpg', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`buyerId`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`userId`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_trans` (`productId`),
  ADD KEY `inv_id` (`invoiceId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Invoices`
--
ALTER TABLE `Invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD CONSTRAINT `userId` FOREIGN KEY (`buyerId`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `fk_product_trans` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`),
  ADD CONSTRAINT `inv_id` FOREIGN KEY (`invoiceId`) REFERENCES `Invoices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
