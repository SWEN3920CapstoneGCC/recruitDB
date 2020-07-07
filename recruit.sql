-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 28, 2020 at 11:19 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `appID` int NOT NULL,
  `jobpostID` int NOT NULL,
  `appLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `depID` int NOT NULL,
  `departmentname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`depID`, `departmentname`) VALUES
(1, 'Accounting'),
(2, 'Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empID` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `workphone` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_roles`
--

CREATE TABLE `emp_roles` (
  `empID` int NOT NULL,
  `roleID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hiringmanager`
--

CREATE TABLE `hiringmanager` (
  `hiringmanagerID` int NOT NULL,
  `empID` int NOT NULL,
  `depID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobPost`
--

CREATE TABLE `jobPost` (
  `jpID` int NOT NULL,
  `depID` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `reqLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recruitmentOfficer`
--

CREATE TABLE `recruitmentOfficer` (
  `recruitmentoffID` int NOT NULL,
  `empID` int NOT NULL,
  `depID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` int NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`appID`),
  ADD UNIQUE KEY `appLink` (`appLink`),
  ADD KEY `application_fk0` (`jobpostID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depID`),
  ADD UNIQUE KEY `departmentname` (`departmentname`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `emp_roles`
--
ALTER TABLE `emp_roles`
  ADD KEY `emp_roles_fk0` (`empID`),
  ADD KEY `emp_roles_fk1` (`roleID`);

--
-- Indexes for table `hiringmanager`
--
ALTER TABLE `hiringmanager`
  ADD PRIMARY KEY (`hiringmanagerID`),
  ADD KEY `hiringmanager_fk0` (`empID`),
  ADD KEY `hiringmanager_fk1` (`depID`);

--
-- Indexes for table `jobPost`
--
ALTER TABLE `jobPost`
  ADD PRIMARY KEY (`jpID`),
  ADD UNIQUE KEY `reqLink` (`reqLink`),
  ADD KEY `jobPost_fk0` (`depID`);

--
-- Indexes for table `recruitmentOfficer`
--
ALTER TABLE `recruitmentOfficer`
  ADD PRIMARY KEY (`recruitmentoffID`,`empID`),
  ADD KEY `recruitmentOfficer_fk0` (`empID`),
  ADD KEY `recruitmentOfficer_fk1` (`depID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`),
  ADD UNIQUE KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `appID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `depID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hiringmanager`
--
ALTER TABLE `hiringmanager`
  MODIFY `hiringmanagerID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobPost`
--
ALTER TABLE `jobPost`
  MODIFY `jpID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitmentOfficer`
--
ALTER TABLE `recruitmentOfficer`
  MODIFY `recruitmentoffID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_fk0` FOREIGN KEY (`jobpostID`) REFERENCES `jobPost` (`jpID`);

--
-- Constraints for table `emp_roles`
--
ALTER TABLE `emp_roles`
  ADD CONSTRAINT `emp_roles_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `emp_roles_fk1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);

--
-- Constraints for table `hiringmanager`
--
ALTER TABLE `hiringmanager`
  ADD CONSTRAINT `hiringmanager_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `hiringmanager_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);

--
-- Constraints for table `jobPost`
--
ALTER TABLE `jobPost`
  ADD CONSTRAINT `jobPost_fk0` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);

--
-- Constraints for table `recruitmentOfficer`
--
ALTER TABLE `recruitmentOfficer`
  ADD CONSTRAINT `recruitmentOfficer_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `recruitmentOfficer_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
