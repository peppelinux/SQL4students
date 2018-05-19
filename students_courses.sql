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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `esame_sostenuto` */

insert  into `esame_sostenuto`(`id_esame_sostenuto`,`corso_id`,`studente_id`,`voto`,`data`) values 
(1,1,1,27,'2018-05-16 14:50:53'),
(3,5,5,12,'2018-05-14 14:51:05'),
(4,5,1,11,'2018-05-30 14:51:25'),
(5,3,5,23,'2018-05-28 14:51:44'),
(6,2,1,30,'2018-05-08 14:51:54'),
(7,2,2,28,'2018-05-14 14:52:08'),
(8,4,3,29,'2018-05-11 14:52:22'),
(9,4,1,18,'2018-05-27 14:52:31'),
(10,3,3,9,'2018-05-15 14:52:48'),
(11,4,4,26,'2018-05-08 14:52:59'),
(12,2,5,24,'2018-05-17 14:53:29'),
(13,3,1,21,'2018-05-02 14:53:41'),
(14,4,1,16,'2018-05-14 16:23:06'),
(15,4,1,17,'2018-05-24 16:23:02');

/*Table structure for table `studente` */

DROP TABLE IF EXISTS `studente`;

CREATE TABLE `studente` (
  `id_studente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `matricola` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_studente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `studente` */

insert  into `studente`(`id_studente`,`nome`,`cognome`,`matricola`) values 
(1,'giuseppe','de marco',17403),
(2,'lorenzo','de marco',149252),
(3,'clark','kent',123456),
(4,'bruce','waine',654321),
(5,'peter','parker',2345),
(6,'claude','debussy',7834),
(7,'','enoch',NULL),
(8,'giuseppe','de marco',89452);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
