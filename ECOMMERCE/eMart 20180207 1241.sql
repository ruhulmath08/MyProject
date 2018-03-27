-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.20-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shop_online
--

CREATE DATABASE IF NOT EXISTS shop_online;
USE shop_online;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cat_id`,`cat_name`,`cat_desc`) VALUES 
 (7,'Smartphone','FlagShip Smartphone'),
 (8,'Laptop','Different Laptop'),
 (9,'Tablet','Tablete PC'),
 (10,'VR','Virtual reality'),
 (11,'VR','Virtual reality');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `delivery_cost`
--

DROP TABLE IF EXISTS `delivery_cost`;
CREATE TABLE `delivery_cost` (
  `delivery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(45) NOT NULL,
  `delivary_cost` double NOT NULL,
  PRIMARY KEY (`delivery_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_cost`
--

/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;


--
-- Definition of table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`,`first_name`,`last_name`,`email`,`uname`,`pass`,`regdate`) VALUES 
 (1,'Atiqur','Rahaman','atikrahman146@gmail.com','admin','1234','2008-02-07');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


--
-- Definition of table `pro_order`
--

DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `order_date` date NOT NULL,
  `order_qty` int(10) unsigned NOT NULL,
  `total_price` double NOT NULL,
  `order_status` varchar(45) NOT NULL DEFAULT '"N"',
  `delivery_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_pro_order_user_id` (`user_id`),
  KEY `FK_pro_order_del_id` (`delivery_id`),
  CONSTRAINT `FK_pro_order_del_id` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_cost` (`delivery_id`),
  CONSTRAINT `FK_pro_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order`
--

/*!40000 ALTER TABLE `pro_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order` ENABLE KEYS */;


--
-- Definition of table `pro_order_details`
--

DROP TABLE IF EXISTS `pro_order_details`;
CREATE TABLE `pro_order_details` (
  `order_details` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `pro_id` int(10) unsigned NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_details`),
  KEY `FK_pro_order_details_order_id` (`order_id`),
  KEY `FK_pro_order_details_pro_id` (`pro_id`),
  CONSTRAINT `FK_pro_order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `pro_order` (`order_id`),
  CONSTRAINT `FK_pro_order_details_pro_id` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order_details`
--

/*!40000 ALTER TABLE `pro_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order_details` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_cat_id` int(10) unsigned NOT NULL,
  `pro_name` varchar(45) NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  `pro_price` double NOT NULL,
  `pro_uri` varchar(45) NOT NULL,
  `pro_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_product_sub_cat_id` (`sub_cat_id`),
  CONSTRAINT `FK_product_sub_cat_id` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_category` (`sub_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pro_id`,`sub_cat_id`,`pro_name`,`pro_qty`,`pro_price`,`pro_uri`,`pro_desc`) VALUES 
 (16,7,'Galaxy S8',1,83000,'samsunggalaxys8.jpg','Flagship Smartphone from Samsung'),
 (17,8,'iPhone x',1,90000,'iphone 10.jpg','Flagship Smartphone from Apple'),
 (18,9,'Assend p9',1,80000,'huawei-ascend-p9-lite-dualsim-black.jpg','Flagship Smartphone from Huawei'),
 (19,10,'googlepixel2',1,67000,'googlepixel2.jpg','Flagship Smartphone from Google'),
 (21,11,'MacBook Air',1,2220000,'dellprecession.jpg','World Best Laptop'),
 (22,12,'HpSpecrta',1,124000,'hp-spectra.jpg','World Thin Laptop'),
 (23,12,'HP Eenvey13t',1,134000,'hpenvey13t.jpg','HP Hibrid Laptop'),
 (24,13,'Samsung Galaxy Tab S III',1,54000,'Samsung Galaxy Tab S III.jpg','Samsung Latest Tab'),
 (25,14,'iPad Pro-2',1,94000,'iPad Pro-2.jpg','iPod Pro-2 from Apple'),
 (26,11,'MackBook',1,150000,'applemacbook15.jpg','MacBook 2 from Apple'),
 (27,16,'Oculus FaceBook',1,1500,'Facebook-Oculus-VR.jpg','The Oculus Rift is a virtual reality headset developed and manufactured by Oculus VR, a division of Facebook Inc., released on March 28, 2016.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `reg_date` date NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_shop_user_role_id` (`role_id`),
  CONSTRAINT `FK_shop_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_user`
--

/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;


--
-- Definition of table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category` (
  `sub_cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL,
  `sub_cat_name` varchar(45) NOT NULL,
  `sub_cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`sub_cat_id`),
  KEY `FK_sub_category_cat_id` (`cat_id`),
  CONSTRAINT `FK_sub_category_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` (`sub_cat_id`,`cat_id`,`sub_cat_name`,`sub_cat_desc`) VALUES 
 (7,7,'Samsung','SmartPhone from Samsung'),
 (8,7,'Apple','iPhone from Apple'),
 (9,7,'Huawei','SmartPhone from Huawei'),
 (10,7,'GooglePixel','SmartPhone from Google'),
 (11,8,'MacBook','Laptop from Apple'),
 (12,8,'HP','Laptop from HP'),
 (13,9,'Android','Tablet of Android OS'),
 (14,9,'iPod','Tablet from Apple'),
 (15,9,'Windows','Tablet from Windows'),
 (16,10,'AR','Argumentative Reality');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
