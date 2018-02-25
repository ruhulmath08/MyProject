-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.58


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema struts_hiber_loginreg
--

CREATE DATABASE IF NOT EXISTS struts_hiber_loginreg;
USE struts_hiber_loginreg;

--
-- Definition of table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` (`id`,`username`,`password`,`email`) VALUES 
 (7,'shamim','1234','shamim@gmail.com'),
 (8,'shamim','1234','shamim@gmail.com'),
 (9,'urmi','1234','urmi@gmail.com'),
 (10,'ruhul','1234','ruhul@gmail.com'),
 (11,'ruhul','1234','ruhul@gmail.com'),
 (12,'ruhul','1234','ruhul@gmail.com'),
 (13,'ruhul','1234','ruhul@gmail.com'),
 (14,'shamim','1234','shamim@gmail.com');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
