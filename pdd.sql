-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2018 at 06:42 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdd`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `File_id` int(255) NOT NULL,
  `Filename` varchar(255) NOT NULL,
  `Login_id` int(255) NOT NULL,
  `User_id` int(200) NOT NULL,
  `Filetype` varchar(255) NOT NULL,
  `Filepath` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_file`
--

INSERT INTO `tbl_file` (`File_id`, `Filename`, `Login_id`, `User_id`, `Filetype`, `Filepath`, `Status`) VALUES
(1, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'RECIEVED'),
(4, 'CCMT-2015-Cutoff-NIT-Calicut_0.xlsx', 2, 1, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/CCMT-2015-Cutoff-NIT-Calicut_0.xlsx', 'RECIEVED'),
(6, 's4.xlsx', 2, 1, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/s4.xlsx', 'RECIEVED'),
(8, 's3.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/s3.xlsx', 'RECIEVED'),
(10, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'RECIEVED'),
(11, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'RECIEVED'),
(12, 'abc.xlsx', 2, 1, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'SEND'),
(14, 'abc.xlsx.xlsx', 2, 1, '.xlsx.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx.xlsx', 'SEND'),
(15, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'RECIEVED'),
(16, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'SEND'),
(17, 'abc.xlsx.xlsx', 2, 2, '.xlsx.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx.xlsx', 'SEND'),
(18, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'SEND'),
(19, 'abc.xlsx.xlsx', 2, 2, '.xlsx.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx.xlsx', 'SEND'),
(20, 'abc.xlsx', 2, 2, '.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx', 'SEND'),
(21, 'abc.xlsx.xlsx', 2, 2, '.xlsx.xlsx', 'C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/abc.xlsx.xlsx', 'SEND');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `Login_id` int(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Usertype` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`Login_id`, `Username`, `Password`, `Usertype`, `Status`) VALUES
(1, 'admin', 'admin', 'ADMIN', 'APPROVED'),
(2, 'joel@gmail.com', 'joel123', 'USER', 'APPROVED'),
(3, 'bini@gmail.com', 'bini123', 'USER', 'APPROVED');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register`
--

CREATE TABLE `tbl_register` (
  `User_id` int(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Login_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_register`
--

INSERT INTO `tbl_register` (`User_id`, `Fname`, `Lname`, `Email`, `Phone`, `Login_id`) VALUES
(1, 'joel', 'mathew', 'joel@gmail.com', '996756789012', 2),
(2, 'bini', 'm', 'bini@gmail.com', '1236547896', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`File_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`Login_id`);

--
-- Indexes for table `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `File_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `Login_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `User_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
