USE recruit;

DROP table if exists

CREATE TABLE `employee`
(
    `empID`      int(3000)     not null auto_increment,
    `firstname`  varchar(255)  NOT NULL,
    `lastname`   varchar(255)  NOT NULL,
    `middlename` varchar(255)  NOT NULL,
    `gender`     varchar(255)  NOT NULL,
    `dob`        DATE          NOT NULL,
    `email`      varchar(1000) NOT NULL UNIQUE,
    `username`   varchar(1000) NOT NULL UNIQUE,
    `password`   varchar(1000) NOT NULL,
    `workphone`  varchar(1000) NOT NULL,
    PRIMARY KEY (`empID`)
);

CREATE TABLE `emp_roles`
(
    `empID`  INT NOT NULL,
    `roleID` INT NOT NULL
);

CREATE TABLE `roles`
(
    `roleID` INT          NOT NULL AUTO_INCREMENT,
    `role`   varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (`roleID`)
);


ALTER TABLE `emp_roles`
    ADD CONSTRAINT `emp_roles_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);
ALTER TABLE `emp_roles`
    ADD CONSTRAINT `emp_roles_fk1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);


CREATE TABLE `department`
(
    `depID`          INT          NOT NULL AUTO_INCREMENT,
    `departmentname` varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (`depID`)
);

CREATE TABLE `hiringmanager`
(
    `hiringmanagerID` INT NOT NULL AUTO_INCREMENT,
    `empID`           INT NOT NULL,
    `depID`           INT NOT NULL,
    PRIMARY KEY (`hiringmanagerID`)
);

CREATE TABLE `recruitmentOfficer`
(
    `recruitmentoffID` INT NOT NULL AUTO_INCREMENT,
    `empID`            INT NOT NULL,
    `depID`            INT NOT NULL,
    PRIMARY KEY (`recruitmentoffID`, `empID`)
);

CREATE TABLE `jobPost`
(
    `jpID`    INT          NOT NULL AUTO_INCREMENT,
    `depID`   INT          NOT NULL,
    `title`   varchar(255) NOT NULL,
    `reqLink` varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (`jpID`)
);

CREATE TABLE `application`
(
    `appID`     INT          NOT NULL AUTO_INCREMENT,
    `jobpostID` INT          NOT NULL,
    `appLink`   varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (`appID`)
);


ALTER TABLE `hiringmanager`
    ADD CONSTRAINT `hiringmanager_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

ALTER TABLE `hiringmanager`
    ADD CONSTRAINT `hiringmanager_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);

ALTER TABLE `recruitmentOfficer`
    ADD CONSTRAINT `recruitmentOfficer_fk0` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`);

ALTER TABLE `recruitmentOfficer`
    ADD CONSTRAINT `recruitmentOfficer_fk1` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);

ALTER TABLE `jobPost`
    ADD CONSTRAINT `jobPost_fk0` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);

ALTER TABLE `application`
    ADD CONSTRAINT `application_fk0` FOREIGN KEY (`jobpostID`) REFERENCES `jobPost` (`jpID`);

