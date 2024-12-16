-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 11:15 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbrurun`
--

-- --------------------------------------------------------

--
-- Table structure for table `gen`
--

CREATE TABLE `gen` (
  `id` int(11) NOT NULL,
  `gen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen`
--

INSERT INTO `gen` (`id`, `gen`) VALUES
(1, '18-29 ปี'),
(2, '30-39 ปี'),
(3, '40-49 ปี'),
(4, ' 50-59 ปี'),
(5, '60-69 ปี'),
(6, '70 ปีขึ้นไป'),
(7, 'ไม่เกิน 15 ปี'),
(8, '16-29 ปี');

-- --------------------------------------------------------

--
-- Table structure for table `order_shirt`
--

CREATE TABLE `order_shirt` (
  `id` int(11) NOT NULL,
  `shirt_id` varchar(25) NOT NULL,
  `code` varchar(255) NOT NULL,
  `uid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `run`
--

CREATE TABLE `run` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `km` varchar(255) NOT NULL,
  `price` varchar(20) NOT NULL,
  `perm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `run`
--

INSERT INTO `run` (`id`, `type`, `km`, `price`, `perm`) VALUES
(1, 'MARATHON', '42 KM', '1150', 'n'),
(2, 'HALF MARATHON', '21 KM', '950', 'n'),
(3, 'MINI MARATHON ', '10 KM', '750', 'n'),
(4, 'FUNRUN ', '5 KM', '650', 'n'),
(5, 'วิ่ง VIP', 'บาท มีการแข่งขัน สามารถเลือกสมัครและแข่งขันได้ทุกประเภท', '2000', 'vip'),
(6, 'ร่วมทำบุญ', '(ราคารวมค่าจัดส่งแล้ว)', '690', 'ืืn'),
(7, 'ชุดร่วมทำบุญ VIP', '(ราคารวมค่าจัดส่งแล้ว)', '2000', 'vip'),
(8, 'เสื้อที่ระลึก', '(สามารถเลือกได้ทุกสี) จัดส่งฟรี', '400', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `shirt`
--

CREATE TABLE `shirt` (
  `id` int(11) NOT NULL,
  `shirt` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shirt`
--

INSERT INTO `shirt` (`id`, `shirt`, `price`) VALUES
(1, 'S', '250'),
(2, 'M', '250'),
(3, 'L', '250'),
(4, 'XL', '250'),
(6, 'ที่ระลึก', '400');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `pricecheck` varchar(20) NOT NULL,
  `price` varchar(255) NOT NULL DEFAULT '0',
  `gen` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `shirt` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `status`, `type`, `pricecheck`, `price`, `gen`, `gender`, `shirt`) VALUES
(1, 'asd', '$2y$10$MQSfAJrr28wmNVh0uZKf/uo8v9AaY405YHZ6f5iAWWP0TY8V.nqe6', 'asd', '0', 'FUNRUN ', '650', '0', '18-29 ปี', 'man', '0'),
(2, '123', '$2y$10$j7KzXlyxGi6MS6Um2EX31.xVBdDeXQLwRmr9WeFXQCA01e8sJJOVy', '123', '1', 'วิ่ง VIP', '2000', '0', '40-49 ปี', 'woman', '0'),
(3, 'admin', '$2y$10$blFSnk2EDDQxnm5Bwave0urmmoEZGV7emchn2cITzaPiWAxGtYG6G', 'ชื่อและนามสกุล ทดสอบ', '1', 'วิ่ง VIP', '2000', '19500', 'ไม่เกิน 15 ปี', 'man', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gen`
--
ALTER TABLE `gen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shirt`
--
ALTER TABLE `order_shirt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `run`
--
ALTER TABLE `run`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shirt`
--
ALTER TABLE `shirt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gen`
--
ALTER TABLE `gen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_shirt`
--
ALTER TABLE `order_shirt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `run`
--
ALTER TABLE `run`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shirt`
--
ALTER TABLE `shirt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
