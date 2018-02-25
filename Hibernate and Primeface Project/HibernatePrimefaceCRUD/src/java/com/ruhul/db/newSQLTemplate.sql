/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  J2EE-33
 * Created: Jan 28, 2018
 */

CREATE DATABASE `hibernetprimefacecrud` /*!40100 DEFAULT CHARACTER SET latin1 */;


DROP TABLE IF EXISTS `hibernetprimefacecrud`.`user`;
CREATE TABLE  `hibernetprimefacecrud`.`user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;