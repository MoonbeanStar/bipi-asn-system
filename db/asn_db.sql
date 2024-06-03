-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 02:01 AM
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
-- Database: `asn_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$CTU1sjZZJyYllTGxuS869Oko8HnQ1nXk2vRkpZNHweV812MC613zq', 'benjamin', 'galang', 'benjie id (2).jpg', '2021-02-09'),
(4, 'benjie', '$2y$10$uyw5Qw.LLBjHY4GIEfS9G.tT73EhVeOcSDI24UtSZpHKxwkioiRja', 'benjie', 'benjie', 'viber_image_2021-03-26_10-41-41.jpg', '2021-09-01'),
(5, 'arieza', '$2y$10$eN4rL/GvWDyzGC9WyBIBCekDYS8vhGWhuYrYq8bWaIvjHzaluzcrC', 'Arieza', 'Belonio', 'index.jpg', '2021-09-15'),
(6, 'arieza', '$2y$10$zISObGTXlkq3DA7oG1p.vuS5ATbq1dYX7Fb6L.v/5OZP/2VGx/zda', '', '', 'viber_image_2021-03-26_10-41-41.jpg', '2021-09-06'),
(7, 'arieza', '$2y$10$N7zeUam1iq8jCNP0EiRK1OAxQxOs.q2k9DG0iFGNT54Nvr7dQtgxK', '', '', 'ARIEZA BELONIO.jpg', '2021-09-15'),
(8, 'arieza', '$2y$10$7petWBOGYFfpijgxGEl/ce9t/VPzzjIi.uTeZzxOIQd.vnII/X.X.', 'Arieza', 'Belonio', 'ARIEZA BELONIO.jpg', '2021-09-15'),
(9, 'arieza', '$2y$10$7XlowU5qpxia73KH/3cGPuJsjK.FrZXipXO/8tdG5s2n5WUj/.YjS', 'Arieza', 'Belonio', 'viber_image_2021-03-26_10-41-41.jpg', '2021-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'raw material'),
(2, 'finished goods'),
(3, 'foods');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `depname` text NOT NULL,
  `code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `depname`, `code`) VALUES
(1, 'SALES DEPT', 'SALE'),
(2, 'MIS DEPT', 'MIS'),
(3, 'ACCOUNTING', 'ACC'),
(4, 'GUARD', 'GUR'),
(5, 'MIS HEAD', 'MISH'),
(6, 'PURCHASING DEPT', 'PUR'),
(7, 'PRODUCTION DEPT', 'PRO'),
(8, 'HRD DEPT', 'HRD'),
(9, 'ISO DEPT', 'ISO'),
(10, 'MPC DEPT', 'MPC'),
(11, 'AUDIT DEPT', 'AUD'),
(12, 'MARKETING DEPT', 'MAR'),
(13, 'ARTIST DEPT', 'ARTIST'),
(14, 'SERVICES DEPT', 'SER'),
(15, 'GUARD DEPT', 'GUARD');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `photo`, `department_id`, `created_on`) VALUES
(1, 'ayeh', 'Arieza', 'Belonio', '20210910053929index.jpg', 2, '2021-09-10'),
(2, 'scamero', 'Sharon', 'Camero', '', 6, '2021-09-10'),
(3, 'cferrer', 'Carolyn', 'Ferrer', '', 6, '2021-09-10'),
(5, 'navarro', 'Maribel', 'Navarro', '', 3, '2021-09-10'),
(6, 'finance', 'Marites', 'Pilatis', '', 3, '2021-09-10'),
(7, 'maverick', 'Teresa', 'Lizada', '', 3, '2021-09-10'),
(8, 'pcacc009', 'Rizza', 'Guerrero', '', 3, '2021-09-10'),
(9, 'pcacc010', 'Alma', 'Yu', '', 3, '2021-09-10'),
(10, 'nchua', 'Noel', 'Chua', '', 3, '2021-09-10'),
(11, 'joyce', 'Joyce', 'Lato', '', 5, '2021-09-10'),
(12, 'rockel', 'Rockel', 'Romero', '', 1, '2021-09-10'),
(13, 'jeanlouise', 'Jean Leido', 'Leido', '', 7, '2021-09-10'),
(14, 'abermiso', 'Anabelle', 'Bermiso', '', 3, '2021-09-10'),
(15, 'Aljecera', 'Patrick', 'Aljecera ', '', 1, '2021-09-10'),
(16, 'ruado', 'Noli', 'Ruado', '', 3, '2021-09-10'),
(17, 'borbon', 'Beverly', 'Borbon', '', 1, '2021-09-10'),
(18, 'dating', 'Carissa', 'Dating', '', 1, '2021-09-10'),
(19, 'ronquillo', 'Danjie May', 'Ronquillo', '', 8, '2021-09-10'),
(20, 'casil', 'Belinda', 'Casil', '', 8, '2021-09-10'),
(21, 'mongoso', 'Marco', 'Mongoso', '', 10, '2021-09-10'),
(22, 'oliveros', 'Lorelie Oliveros', 'Oliveros', '', 10, '2021-09-10'),
(23, 'marjorie', 'Marjorie', 'Franco', '', 3, '2021-09-10'),
(24, '123456', 'Romeo', 'Bandola', '', 7, '2021-09-10'),
(25, 'alusuegro', 'Alyssa Lusuegro', 'Lusuegro', '', 11, '2021-09-10'),
(26, 'mvic', 'Victorio', 'Milanes', '', 9, '2021-09-10'),
(27, 'narvaez', 'Renelyn', 'Narvaez', '', 10, '2021-09-10'),
(28, 'tdexter', 'Dexter', 'Tan', '', 7, '2021-09-10'),
(29, 'jrperalta', 'John Ray', 'Peralta', '', 9, '2021-09-10'),
(30, 'jbalanon', 'Joseph Bryan', 'Balanon', '', 11, '2021-09-10'),
(31, 'catacutanm', 'Marilou', 'Catacutan', '', 7, '2021-09-10'),
(32, 'regaladom', 'Mary Jane', 'Regalado', '', 7, '2021-09-10'),
(33, 'snoopy', 'Snooky', 'Alejo', '', 7, '2021-09-10'),
(34, 'amaracha', 'Angenel', 'Maracha', '', 8, '2021-09-10'),
(35, 'dcalibara', 'Deisy', 'Calibara', '', 2, '2021-09-10'),
(36, 'hernandez', 'Lei', 'Hernandez', '', 7, '2021-09-10'),
(37, '123', 'Aldrin', 'Leon', '', 2, '2021-09-10'),
(38, '271989', 'Ramonit', 'Torcita', '', 2, '2021-09-10'),
(39, 'gbautista', 'Giselle', 'Bautista', '', 13, '2021-09-10'),
(40, 'A123456', 'Angelique', 'Gonzalez', '', 12, '2021-09-10'),
(41, 'burlington', 'Jo Anthony', 'Prondo', '', 13, '2021-09-10'),
(42, 'jgallego', 'Jovy', 'Gallego', '', 10, '2021-09-10'),
(43, 'jp', 'Relly', 'Subebe', '', 10, '2021-09-10'),
(44, 'parungao', 'Annalissa', 'Parungao', '', 1, '2021-09-10'),
(45, 'pcsal005', 'Marny', 'Magtuloy', '', 1, '2021-09-10'),
(46, 'servan', 'Marivic', 'Servan', '', 7, '2021-09-10'),
(47, '1234567', 'Joan', 'Dimapilis', '', 8, '2021-09-10'),
(48, 'purpose', 'Teresa', 'Allera', '', 8, '2021-09-10'),
(49, 'benless2013', 'Benjie', 'Galang', '', 2, '2021-09-10'),
(51, 'kayetan', 'Kaye', 'Tan', '', 12, '2021-09-10'),
(52, 'abantang', 'Ally', 'Bantang', '', 3, '2021-09-10'),
(53, 'pcout003', 'Anjenette', 'Ang', '', 3, '2021-09-10'),
(54, 'jibanez', 'Jeremy', 'Ibanez', '', 14, '2021-09-10'),
(55, 'tzablan', 'Tess', 'Zablan', '', 7, '2021-09-10'),
(56, 'bespiritu', 'Romeo', 'Espiritu', '', 7, '2021-09-10'),
(57, 'alugtu', 'Anna', 'Lugtu', '', 1, '2021-09-10'),
(58, 'epatulot', 'Edcel', 'Patulot', '', 1, '2021-09-10'),
(59, 'gdumanggas', 'Gerry', 'Dumanggas', '', 1, '2021-09-10'),
(60, 'ranoso', 'Renson', 'Anoso', '', 1, '2021-09-10'),
(61, 'salayog', 'Marissa', 'Salayog', '', 1, '2021-09-10'),
(63, 'mlosaria', 'Maria Donna', 'Losaria', '', 1, '2021-09-10'),
(64, 'guard', 'Guard', 'Guard', '', 4, '2021-09-10'),
(65, '919792', 'lance', 'galang', 'Jeremy.jpg', 1, '2022-01-21'),
(66, 'faf', 'afa', 'fafa', '', 3, '2023-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `uom1Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `uom1Name`) VALUES
(1, 'box'),
(2, 'pails'),
(3, 'drum');

-- --------------------------------------------------------

--
-- Table structure for table `quantity`
--

CREATE TABLE `quantity` (
  `id` int(11) NOT NULL,
  `qtyname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quantity`
--

INSERT INTO `quantity` (`id`, `qtyname`) VALUES
(1, 'kg'),
(2, 'pairs'),
(3, 'packs'),
(4, 'pieces'),
(5, 'yarn');

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_history`
--

CREATE TABLE `scheduled_history` (
  `id` int(11) NOT NULL,
  `asn_no` varchar(50) NOT NULL,
  `supplier_id` int(50) NOT NULL,
  `delDate` date NOT NULL,
  `delTime` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `drPhoto` varchar(200) NOT NULL,
  `status` int(20) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduled_history`
--

INSERT INTO `scheduled_history` (`id`, `asn_no`, `supplier_id`, `delDate`, `delTime`, `category`, `type`, `drPhoto`, `status`, `remarks`) VALUES
(2, 'ASN93463', 1, '2024-05-09', '8AM', '0', '0', '3.jpg', 2, ''),
(4, 'ASN16196', 2, '2024-05-17', '8AM', '0', '0', '3.jpg', 3, ''),
(7, 'ASN19033', 2, '2024-05-21', '8AM', '0', '0', '', 0, ''),
(9, 'ASN19644', 2, '2024-05-22', '8AM', '0', '0', 'IMG_1780.JPG', 0, ''),
(11, 'ASN80057', 1, '2024-05-21', '1PM', '0', '0', 'IMG_1772.JPG', 1, ''),
(13, 'ASN80285', 1, '2024-05-21', '1PM', '0', '0', 'Screenshot 2022-04-28 110016.png', 1, ''),
(14, 'ASN73169', 1, '2024-05-21', '3PM', '0', '0', 'dri+.PNG', 3, ''),
(15, 'ASN14324', 1, '2024-05-22', '6AM', '0', '0', 'Capture5.PNG', 1, ''),
(19, 'ANS55322', 1, '2024-05-27', '8AM', 'finished goods', 'socks', 'Screenshot 2022-12-09 100306.png', 6, ''),
(23, 'ANS86832', 2, '2024-05-27', '1PM', 'raw material', 'yarn', 'viber_image_2022-09-05_14-45-55-093.jpg', 3, ''),
(24, 'ASN33159', 2, '2024-05-28', '10AM', 'raw material', 'yarn', 'SALES PERFORMANCE.png', 6, ''),
(25, 'ASN27217', 2, '2024-05-21', '10AM', 'raw material', 'yarn', 'IMG_1772.JPG', 6, 'afewfwwe'),
(26, 'ASN73678', 1, '2024-05-29', '1PM', 'raw material', 'chemical', 'Malcom+Oliveira+Nike+Air+Max+photoshoot+full+body.jpg', 6, ''),
(27, 'ASN86715', 1, '2024-05-29', '1PM', 'raw material', 'yarn', 'color-bauhaus-geometric-seamless-pattern-colorful-design-prints-abstract-geometry-background-repeated-modern-swiss-style-repeating-208490164.jpg', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_data`
--

CREATE TABLE `schedule_data` (
  `id` int(11) NOT NULL,
  `asn_no` varchar(100) NOT NULL,
  `supplier_id` int(50) NOT NULL,
  `delDate` date NOT NULL,
  `delTime` varchar(100) NOT NULL,
  `category` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `drPhoto` varchar(200) NOT NULL,
  `totalDel` int(11) NOT NULL,
  `uom1` varchar(255) NOT NULL,
  `totalQty` int(11) NOT NULL,
  `uom2` varchar(255) NOT NULL,
  `vehicleModel` varchar(255) DEFAULT NULL,
  `plateNo` varchar(255) DEFAULT NULL,
  `driverName` varchar(255) DEFAULT NULL,
  `helperName` varchar(255) DEFAULT NULL,
  `date_guard` date NOT NULL,
  `date_head` date NOT NULL,
  `status` int(11) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_data`
--

INSERT INTO `schedule_data` (`id`, `asn_no`, `supplier_id`, `delDate`, `delTime`, `category`, `type`, `drPhoto`, `totalDel`, `uom1`, `totalQty`, `uom2`, `vehicleModel`, `plateNo`, `driverName`, `helperName`, `date_guard`, `date_head`, `status`, `remarks`, `created_at`) VALUES
(17, 'ANS75255', 1, '2024-05-28', '8AM', 'raw material', 'chemical', 'Screenshot 2022-04-28 105629.png', 12, 'box', 4, 'packs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '2024-05-27', '2024-05-27', 3, '', '2024-05-27 04:01:14'),
(19, 'ASN63665', 2, '2024-05-29', '1PM', 'raw material', 'chemical', 'Capture2.JPG', 2, 'box', 3, 'pairs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '2024-05-29', 2, '', '2024-05-29 03:00:45'),
(20, 'ASN88838', 1, '2024-05-29', '1PM', 'finished goods', 'socks', '6b5801b9a53436153ec027675d1445a4.jpg', 1, 'drum', 3, 'pairs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '2024-05-29', 2, '', '2024-05-29 03:02:57'),
(23, 'ASN37293', 2, '2024-05-29', '1PM', 'finished goods', 'socks', 'Screenshot 2022-04-28 103529.png', 1, 'drum', 4, 'pairs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '0000-00-00', 1, '', '2024-05-30 02:23:07'),
(24, 'ASN54034', 2, '2024-05-31', '10:00AM', 'raw material', 'chemical', 'Screenshot 2022-04-28 103639.png', 4, 'box', 2, 'packs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '2024-05-31', 2, '', '2024-05-31 00:57:13'),
(25, 'ASN94316', 2, '2024-05-31', '10:00AM', 'finished goods', 'socks', 'set-baby-boy-seamless-patterns-vector-illustration-set-baby-boy-seamless-patterns-124065932.jpg', 7, 'drum', 4, 'packs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '0000-00-00', 1, '', '2024-05-31 01:24:44'),
(26, 'ASN95972', 1, '2024-05-31', '03:00PM', 'finished goods', 'socks', 'viber_image_2022-09-05_14-45-55-093.jpg', 4, 'pails', 8, 'packs', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '2024-05-31', 2, '', '2024-05-31 02:57:56'),
(27, 'ASN94457', 2, '2024-05-31', '1:00PM', 'finished goods', 'socks', 'Screenshot 2022-12-09 100306.png', 1, 'box', 2, 'kg', 'Pick up truck', '123ABC', 'Mark ', 'Ryan', '0000-00-00', '0000-00-00', 1, '', '2024-05-31 07:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_id`, `firstname`, `lastname`, `created_on`) VALUES
(1, 'bipi1967', 'burlington', 'philippines', '2024-04-29'),
(2, '123456', 'stephanie', 'baludda', '2024-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `catid` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `catid`, `name`) VALUES
(1, 1, 'yarn'),
(2, 2, 'socks'),
(3, 1, 'chemical');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `employee_id_2` (`employee_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduled_history`
--
ALTER TABLE `scheduled_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_data`
--
ALTER TABLE `schedule_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supllier_id` (`supplier_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quantity`
--
ALTER TABLE `quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `scheduled_history`
--
ALTER TABLE `scheduled_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `schedule_data`
--
ALTER TABLE `schedule_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
