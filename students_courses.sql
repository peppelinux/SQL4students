/*
SQLyog Community v12.5.1 (32 bit)
MySQL - 5.5.59-0+deb8u1 : Database - esercitazione_studenti
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`esercitazione_studenti` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `esercitazione_studenti`;

/*Table structure for table `corso` */

DROP TABLE IF EXISTS `corso`;

CREATE TABLE `corso` (
  `id_corso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `crediti` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_corso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `corso` */

insert  into `corso`(`id_corso`,`nome`,`crediti`) values 
(1,'matematica',10),
(2,'fisica',8),
(3,'informatica 1',15),
(4,'informatica 2',15),
(5,'basi dati',8);

/*Table structure for table `esame_sostenuto` */

DROP TABLE IF EXISTS `esame_sostenuto`;

CREATE TABLE `esame_sostenuto` (
  `id_esame_sostenuto` int(11) NOT NULL AUTO_INCREMENT,
  `corso_id` int(11) DEFAULT NULL,
  `studente_id` int(11) DEFAULT NULL,
  `voto` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id_esame_sostenuto`),
  KEY `fk_esame_sostenuto_corso_idx` (`corso_id`),
  KEY `fk_esame_sostenuto_studente1_idx` (`studente_id`),
  CONSTRAINT `fk_esame_sostenuto_corso` FOREIGN KEY (`corso_id`) REFERENCES `corso` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_esame_sostenuto_studente1` FOREIGN KEY (`studente_id`) REFERENCES `studente` (`id_studente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `esame_sostenuto` */

/*Table structure for table `studente` */

DROP TABLE IF EXISTS `studente`;

CREATE TABLE `studente` (
  `id_studente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `matricola` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_studente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `studente` */

insert  into `studente`(`id_studente`,`nome`,`cognome`,`matricola`) values 
(1,'giuseppe','de marco',17403),
(2,'lorenzo','de marco',149252),
(3,'clark','kent',123456),
(4,'bruce','waine',654321),
(5,'peter','parker',2345),
(6,'claude','debussy',7834),
(7,'','enoch',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
