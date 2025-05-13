-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 06:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3gx_experiment`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory_branch`
--

CREATE TABLE `inventory_branch` (
  `Bra_No` varchar(10) DEFAULT '',
  `Item_No` varchar(11) DEFAULT '',
  `Bra_Qty` double(9,0) DEFAULT 0,
  `Bra_Qty_Asset` double DEFAULT 0,
  `Cost` double DEFAULT 0,
  `Price` double DEFAULT 0,
  `LastDate_Update` datetime DEFAULT NULL,
  `ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inventory_branch`
--

INSERT INTO `inventory_branch` (`Bra_No`, `Item_No`, `Bra_Qty`, `Bra_Qty_Asset`, `Cost`, `Price`, `LastDate_Update`, `ID`) VALUES
('GX-000', '00001', 15, 0, 20, 30, '2023-01-15 10:00:00', 1509549),
('GX-003', '00001', 20, 0, 20, 30, '2023-01-16 11:00:00', 1509550),
('GX-004', '00001', 25, 0, 20, 30, '2023-01-17 12:00:00', 1509551),
('GX-016', '00001', 10, 0, 20, 30, '2023-01-18 13:00:00', 1509552),
('GX-019', '00001', 10, 0, 20, 30, '2023-01-19 14:00:00', 1509553),
('GX-000', '00002', 0, 0, 170, 250, '2023-02-10 09:00:00', 1509554),
('GX-003', '00002', 2, 0, 170, 250, '2023-02-11 10:00:00', 1509555),
('GX-004', '00002', 1, 0, 170, 250, '2023-02-12 11:00:00', 1509556),
('GX-016', '00002', 0, 0, 170, 250, '2023-02-13 12:00:00', 1509557),
('GX-019', '00002', 0, 0, 170, 250, '2023-02-14 13:00:00', 1509558),
('GX-000', '00006', 30, 0, 0, 1, '2023-03-05 08:00:00', 1509559),
('GX-003', '00006', 40, 0, 0, 1, '2023-03-06 09:00:00', 1509560),
('GX-004', '00006', 25, 0, 0, 1, '2023-03-07 10:00:00', 1509561),
('GX-016', '00006', 20, 0, 0, 1, '2023-03-08 11:00:00', 1509562),
('GX-019', '00006', 15, 0, 0, 1, '2023-03-09 12:00:00', 1509563),
('GX-000', '0001', 10, 0, 1666, 4950, '2023-04-20 14:00:00', 1509564),
('GX-003', '0001', 15, 0, 1666, 4950, '2023-04-21 15:00:00', 1509565),
('GX-004', '0001', 20, 0, 1666, 4950, '2023-04-22 16:00:00', 1509566),
('GX-016', '0001', 25, 0, 1666, 4950, '2023-04-23 17:00:00', 1509567),
('GX-019', '0001', 52, 0, 1666, 4950, '2023-04-24 18:00:00', 1509568),
('GX-000', '00022', 5, 0, 22, 40, '2023-05-10 10:30:00', 1509569),
('GX-003', '00022', 8, 0, 22, 40, '2023-05-11 11:30:00', 1509570),
('GX-004', '00022', 7, 0, 22, 40, '2023-05-12 12:30:00', 1509571),
('GX-016', '00022', 5, 0, 22, 40, '2023-05-13 13:30:00', 1509572),
('GX-019', '00022', 5, 0, 22, 40, '2023-05-14 14:30:00', 1509573),
('GX-000', '0003', 1, 0, 1300, 1980, '2023-06-15 09:15:00', 1509574),
('GX-003', '0003', 2, 0, 1300, 1980, '2023-06-16 10:15:00', 1509575),
('GX-004', '0003', 1, 0, 1300, 1980, '2023-06-17 11:15:00', 1509576),
('GX-016', '0003', 0, 0, 1300, 1980, '2023-06-18 12:15:00', 1509577),
('GX-019', '0003', 1, 0, 1300, 1980, '2023-06-19 13:15:00', 1509578),
('GX-000', '0005', 0, 0, 4200, 5200, '2023-07-01 14:45:00', 1509579),
('GX-003', '0005', 1, 0, 4200, 5200, '2023-07-02 15:45:00', 1509580),
('GX-004', '0005', 0, 0, 4200, 5200, '2023-07-03 16:45:00', 1509581),
('GX-016', '0005', 0, 0, 4200, 5200, '2023-07-04 17:45:00', 1509582),
('GX-019', '0005', 1, 0, 4200, 5200, '2023-07-05 18:45:00', 1509583);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory_branch`
--
ALTER TABLE `inventory_branch`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `indx_bra` (`Bra_No`),
  ADD KEY `indx_item` (`Item_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory_branch`
--
ALTER TABLE `inventory_branch`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1509584;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
