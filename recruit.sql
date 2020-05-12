-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `recruit`;
CREATE DATABASE `recruit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recruit`;

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `appID` int NOT NULL AUTO_INCREMENT,
  `jobpostID` int NOT NULL,
  `appLink` varchar(255) NOT NULL,
  PRIMARY KEY (`appID`),
  UNIQUE KEY `appLink` (`appLink`),
  KEY `application_fk0` (`jobpostID`),
  CONSTRAINT `application_fk0` FOREIGN KEY (`jobpostID`) REFERENCES `jobPost` (`jpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `depID` int NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(255) NOT NULL,
  PRIMARY KEY (`depID`),
  UNIQUE KEY `departmentname` (`departmentname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `department` (`depID`, `departmentname`) VALUES
(1,	'Accounting'),
(2,	'Information Technology');

DROP TABLE IF EXISTS `emp_roles`;
CREATE TABLE `emp_roles` (
  `empID` int NOT NULL,
  `roleID` int NOT NULL,
  KEY `emp_roles_fk0` (`empID`),
  KEY `emp_roles_fk1` (`roleID`),
  CONSTRAINT `emp_roles_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  CONSTRAINT `emp_roles_fk1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `workphone` varchar(1000) NOT NULL,
  PRIMARY KEY (`empID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hiringmanager`;
CREATE TABLE `hiringmanager` (
  `hiringmanagerID` int NOT NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `depID` int NOT NULL,
  PRIMARY KEY (`hiringmanagerID`),
  KEY `hiringmanager_fk0` (`empID`),
  KEY `hiringmanager_fk1` (`depID`),
  CONSTRAINT `hiringmanager_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  CONSTRAINT `hiringmanager_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `jobPost`;
CREATE TABLE `jobPost` (
  `jpID` int NOT NULL AUTO_INCREMENT,
  `depID` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `reqLink` varchar(255) NOT NULL,
  PRIMARY KEY (`jpID`),
  UNIQUE KEY `reqLink` (`reqLink`),
  KEY `jobPost_fk0` (`depID`),
  CONSTRAINT `jobPost_fk0` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `recruitmentOfficer`;
CREATE TABLE `recruitmentOfficer` (
  `recruitmentoffID` int NOT NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `depID` int NOT NULL,
  PRIMARY KEY (`recruitmentoffID`,`empID`),
  KEY `recruitmentOfficer_fk0` (`empID`),
  KEY `recruitmentOfficer_fk1` (`depID`),
  CONSTRAINT `recruitmentOfficer_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  CONSTRAINT `recruitmentOfficer_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2020-05-12 19:42:40
