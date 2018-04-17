CREATE DATABASE gridappsd;

CREATE USER 'gridappsd'@'localhost' IDENTIFIED BY 'gridappsd1234';
GRANT ALL PRIVILEGES ON gridappsd.* TO 'gridappsd'@'localhost';
USE gridappsd;


-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: gridappsd
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `process_id` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_message` TEXT NOT NULL,
  `log_level` varchar(20) NOT NULL,
  `process_status` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='This table contain log messages and status from variaous processes in gridappsd platform.';
