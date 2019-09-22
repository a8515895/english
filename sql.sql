/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.18-MariaDB : Database - english
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`english` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `english`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spell` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `parent` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`id`,`e_name`,`v_name`,`spell`,`active`,`parent`,`created_at`,`updated_at`) values (0,'Other','KHÁC',NULL,1,0,'2019-09-09 14:16:23','2019-09-09 14:16:23'),(1,'FOOD AND BEVERAGE','ĐỒ ĂN VÀ ĐỒ UỐNG',NULL,1,0,'2019-09-09 14:16:23','2019-09-09 14:16:23'),(2,'Daily life','CUỘC SỐNG HÀNG NGÀY',NULL,1,0,'2019-09-09 14:16:23','2019-09-09 14:16:23'),(3,'Education','GIÁO DỤC',NULL,1,0,'2019-09-09 14:16:23','2019-09-09 14:16:23'),(5,'Work And Job','CÔNG VIẸC6',NULL,1,0,'2019-09-09 14:16:23','2019-09-09 14:16:23');

/*Table structure for table `excercise_detail` */

DROP TABLE IF EXISTS `excercise_detail`;

CREATE TABLE `excercise_detail` (
  `id` int(11) DEFAULT NULL,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `excercise_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `excercise_detail` */

/*Table structure for table `exercise` */

DROP TABLE IF EXISTS `exercise`;

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `lession` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exercise` */

insert  into `exercise`(`id`,`name`,`count`,`lession`,`student`,`created_at`,`updated_at`,`active`) values (30,'Bài tập số 0 cho bài học BH 001',10,11,1,'2019-09-18 19:47:59','2019-09-18 19:47:59',1),(31,'Bài tập số 0 cho bài học Bài ??c vnexpress 1',23,16,1,'2019-09-22 15:59:34','2019-09-22 15:59:34',1);

/*Table structure for table `exercise_detail` */

DROP TABLE IF EXISTS `exercise_detail`;

CREATE TABLE `exercise_detail` (
  `id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) DEFAULT NULL,
  `class` enum('vocabulary','pharse') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  KEY `exercise_detail_ibfk_1` (`id`),
  CONSTRAINT `exercise_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `exercise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exercise_detail` */

insert  into `exercise_detail`(`id`,`vocabulary_id`,`class`,`created_at`,`updated_at`) values (30,4,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,2,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,9,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,7,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,10,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,6,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,3,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,5,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,8,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(30,1,'vocabulary','2019-09-18 19:47:59','2019-09-18 19:47:59'),(31,79,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,95,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,89,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,78,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,80,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,77,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,86,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,76,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,96,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,85,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,81,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,82,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,94,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,88,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,75,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,92,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,83,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,90,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,93,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,84,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,50,'pharse','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,87,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34'),(31,91,'vocabulary','2019-09-22 15:59:34','2019-09-22 15:59:34');

/*Table structure for table `lession` */

DROP TABLE IF EXISTS `lession`;

CREATE TABLE `lession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  CONSTRAINT `lession_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `lession` */

insert  into `lession`(`id`,`name`,`count`,`student`,`created_at`,`updated_at`) values (8,'BH 1',4,1,'2019-09-13 16:00:46','2019-09-13 16:00:46'),(11,'BH 001',10,1,'2019-09-16 22:17:28','2019-09-16 22:17:28'),(12,'BH 002',10,1,'2019-09-16 22:18:03','2019-09-16 22:18:03'),(13,'BH 003',11,1,'2019-09-16 22:18:40','2019-09-16 22:18:40'),(14,'BH 004',10,1,'2019-09-16 22:18:55','2019-09-16 22:18:55'),(15,'Bài ??c vnexpress 1',22,NULL,'2019-09-22 15:52:43','2019-09-22 15:52:43'),(16,'Bài ??c vnexpress 1',23,1,'2019-09-22 15:57:57','2019-09-22 15:57:57');

/*Table structure for table `lession_detail` */

DROP TABLE IF EXISTS `lession_detail`;

CREATE TABLE `lession_detail` (
  `id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) DEFAULT NULL,
  `class` enum('vocabulary','pharse') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  KEY `id` (`id`),
  CONSTRAINT `lession_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lession_detail` */

insert  into `lession_detail`(`id`,`vocabulary_id`,`class`,`created_at`,`updated_at`) values (8,49,'vocabulary','2019-09-15 21:11:50','2019-09-15 21:11:50'),(8,61,'vocabulary','2019-09-15 21:11:50','2019-09-15 21:11:50'),(8,63,'vocabulary','2019-09-15 21:11:50','2019-09-15 21:11:50'),(8,1,'vocabulary','2019-09-15 21:11:50','2019-09-15 21:11:50'),(11,1,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,2,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,3,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,4,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,5,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,6,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,7,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,8,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,9,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(11,10,'vocabulary','2019-09-16 22:17:28','2019-09-16 22:17:28'),(12,11,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,12,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,13,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,14,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,15,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,16,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,17,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,18,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,19,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(12,20,'vocabulary','2019-09-16 22:18:03','2019-09-16 22:18:03'),(13,21,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,22,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,23,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,24,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,25,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,26,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,27,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,28,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,29,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,30,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(13,31,'vocabulary','2019-09-16 22:18:40','2019-09-16 22:18:40'),(14,32,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,33,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,34,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,35,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,36,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,37,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,38,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,39,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,40,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(14,41,'vocabulary','2019-09-16 22:18:55','2019-09-16 22:18:55'),(15,75,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,76,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,77,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,78,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,79,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,80,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,81,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,82,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,83,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,84,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,85,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,86,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,87,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,88,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,89,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,90,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,91,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,92,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,93,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,94,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,95,'vocabulary','2019-09-22 15:52:43','2019-09-22 15:52:43'),(15,50,'pharse','2019-09-22 15:52:43','2019-09-22 15:52:43'),(16,75,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,76,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,77,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,78,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,79,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,80,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,81,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,82,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,83,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,84,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,85,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,86,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,87,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,88,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,89,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,90,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,91,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,92,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,93,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,94,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,95,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,96,'vocabulary','2019-09-22 15:57:57','2019-09-22 15:57:57'),(16,50,'pharse','2019-09-22 15:57:57','2019-09-22 15:57:57');

/*Table structure for table `pharse` */

DROP TABLE IF EXISTS `pharse`;

CREATE TABLE `pharse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pharse` */

insert  into `pharse`(`id`,`e_name`,`v_name`,`created_at`,`updated_at`) values (29,'a dead-end job','công việc cuối cùng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(30,'a heavy workload','nhiều việc phải làm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(31,'a high-powered job','việc quan trọng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(32,'manual work','công việc tay chân','2019-09-09 14:14:28','2019-09-09 14:14:28'),(33,'maternity leave','nghĩ thai sản','2019-09-09 14:14:28','2019-09-09 14:14:28'),(34,'a nine-to-five job','một công việc bình thường','2019-09-09 14:14:28','2019-09-09 14:14:28'),(35,'consists of','bao gồm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(36,'one of the perks of the job','một trong những đặc quyền công việc','2019-09-09 14:14:28','2019-09-09 14:14:28'),(37,'holiday entitlements','quyền lợi ngày lễ','2019-09-09 14:14:28','2019-09-09 14:14:28'),(38,'bachelor\'s degree','trình độ cử nhân, bằng cử nhân','2019-09-13 10:21:11','2019-09-13 10:21:11'),(39,'distance learning','học từ xa, học online','2019-09-13 10:25:48','2019-09-13 10:25:48'),(40,'eager beaver','người chăm học','2019-09-13 10:26:27','2019-09-13 10:26:27'),(41,'face-to-face classes','học gia sư, học 1 kèm 1','2019-09-13 10:27:59','2019-09-13 10:27:59'),(42,'individual tuition','dạy học cá nhân, hoặc trong 1 nhóm nhỏ','2019-09-13 10:33:07','2019-09-13 10:33:07'),(43,'not the sharpest tool in the shed','không thông minh (cách nói tránh)','2019-09-13 10:36:34','2019-09-13 10:36:34'),(44,'schoolboy error','phạm lỗi ngu ngốc','2019-09-13 10:39:38','2019-09-13 10:39:38'),(45,'subject specialist','chuyên nghành, môn học chuyên nghành','2019-09-13 10:40:30','2019-09-13 10:40:30'),(46,'to fall behind with studies','học chậm và bị tụt lại so với người khác','2019-09-13 10:42:18','2019-09-13 10:42:18'),(47,'to goof around','dành thời gian làm những việc không quan trọng, vô bổ','2019-09-13 10:43:33','2019-09-13 10:43:33'),(48,'to pass with flying colours','hoàn thành với kết quả dễ dàng với kết quả xuất sắc','2019-09-13 10:45:09','2019-09-13 10:45:09'),(49,'outpouring of outrage','tuôn ra sự phẫn nộ','2019-09-20 11:18:01','2019-09-20 11:18:01'),(50,'keep it that way','cứ giữ như thế','2019-09-22 10:34:06','2019-09-22 10:34:06');

/*Table structure for table `result_log` */

DROP TABLE IF EXISTS `result_log`;

CREATE TABLE `result_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `point` double DEFAULT NULL,
  `true` int(11) DEFAULT NULL,
  `false` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  KEY `exercise` (`exercise`),
  CONSTRAINT `result_log_ibfk_2` FOREIGN KEY (`student`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `result_log_ibfk_3` FOREIGN KEY (`exercise`) REFERENCES `exercise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `result_log` */

/*Table structure for table `result_log_detail` */

DROP TABLE IF EXISTS `result_log_detail`;

CREATE TABLE `result_log_detail` (
  `id` int(11) DEFAULT NULL,
  `vocabulary` int(11) DEFAULT NULL,
  `class` enum('vocabulary','pharse') DEFAULT NULL,
  `result` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  KEY `result_log_detail_ibfk_1` (`id`),
  CONSTRAINT `result_log_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `result_log` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result_log_detail` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`username`,`email`,`password`,`avatar`,`created_at`,`updated_at`) values (1,'admin','a8515895@gmail.com','123456','khoa.png','2019-09-11 09:52:08','2019-09-11 10:27:23');

/*Table structure for table `vocabulary` */

DROP TABLE IF EXISTS `vocabulary`;

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spell` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT 0,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `vocabulary_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vocabulary` */

insert  into `vocabulary`(`id`,`e_name`,`v_name`,`spell`,`type`,`category`,`note`,`created_at`,`updated_at`) values (1,'abandon','bỏ cho người khác giữ, giao phó','/əˈbandən/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(2,'abandon','bỏ,bỏ phế','/əˈbandən/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(3,'abstract','trừu tượng','/ˈӕbstrӕkt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(4,'abstract','trừu tượng','/ˈӕbstrӕkt/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(5,'academy','học viện','/əˈkӕdəmi/','n',3,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(6,'access','đường vào, tiếp cận, truy cập','/ˈӕkses/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(7,'accommodate','đáp ứng, cung cấp chỗ ở','/əˈkomədeit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(8,'accompany','đi cùng, hòa âm, hợp tấu','/əˈkampəni/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(9,'accumulate','thu gom','/əˈkjuːmjuleit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(10,'accurate','đúng đắn, chính xác','/ӕˈkjurət/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(11,'achieve','đạt được','/əˈtʃiːv/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(12,'acknowledge','công nhận, chào đón','/əkˈnolidʒ/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(13,'employee','người làm công','/ɔm\'plɔiei/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(14,'employer','người chủ, người sử dung lao động','/im\'plɔiə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(15,'employment','việc làm','/im\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(16,'unemployment','thất nghiệp, sự thất nghiệp','/\'ʌnim\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(17,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','/kəˈmjuːt/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(18,'occupation','công việc, nghề nghiệp, thời hạn cư trú','/,ɔkju\'peiʃn/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(19,'career','nghề nghiệp, sự nghiệp','/kə\'riə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(20,'profession','nghề nghiệp','/profession/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(21,'salary','tiền lương','/ˈsӕləri/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(22,'wages','tiến hành','/weidʒ/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(23,'wages','tiền lương','/weidʒ/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(24,'sector','khu vực','/ˈsektə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(25,'retire','nghỉ hưu, rút lui','/riˈtaiə/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(26,'flexitime','thời gian làm việc linh hoạt','/fleksitaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(27,'resign','từ chức','/rəˈzain/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(28,'fire','bắn, sa thải','/\'faie/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(29,'fire','lửa','/\'faie/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(30,'sack','sa thải, cách chức','/sӕk/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(31,'sack','bao tải','/sӕk/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(32,'dismiss','sa thải, bác bỏ, từ chối','/disˈmis/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(33,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','/\'veikənsi/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(34,'overtime','giờ làm thêm','/ˈəuvətaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(35,'shift','đổi chỗ, di chuyển','/ʃift/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(36,'shift','sự thay đổi, sự luân phiên','/ʃift/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(37,'maternity','thai sản','/məˈtəːnəti/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(38,'ward','phòng, khu, khu vực','/wɔ:d/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(39,'legal','thuộc pháp luật','/ˈliːɡəl/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(40,'legally',' hợp pháp, đúng pháp luật','/ˈliːɡəli/','adv',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(41,'entitlement','quyền lợi','/ɪnˈtaɪ.təl.mənt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(42,'graduate','tốt nghiệp','/\'grædjut/','n',3,NULL,'2019-09-13 10:03:45','2019-09-13 10:03:45'),(43,'curriculum','chương trình giáo dục, bộ giáo dục','/kə\'rikjuləm/','n',3,NULL,'2019-09-13 10:05:20','2019-09-13 10:05:20'),(44,'qualification','trình độ chuyên môn, khả năng','/,kwɔlifi\'keiʃn/','n',3,NULL,'2019-09-13 10:06:46','2019-09-13 10:06:46'),(45,'coursework','khóa học, đồ án môn học','/ˈkɔːs.wɜːk/','n',3,NULL,'2019-09-13 10:08:27','2019-09-13 10:08:27'),(46,'co-educational','dạy cả trai và gái','adjective','adj',3,NULL,'2019-09-13 10:10:00','2019-09-13 10:10:00'),(47,'literacy','trình độ học vấn, sự biết đọc biết viết','/\'litərəsi/','n',3,NULL,'2019-09-13 10:11:46','2019-09-13 10:11:46'),(48,'illiterate','mù chữ, thất học','/iˈlitərət/','adj',3,NULL,'2019-09-13 10:13:57','2019-09-13 10:13:57'),(49,'concentrate','tập trung','/ˈkonsəntreit/','v',3,NULL,'2019-09-13 10:17:57','2019-09-13 10:17:57'),(50,'concern','mối quan ngại, lo lắng','/kənˈsərn/','n',0,NULL,'2019-09-13 10:18:56','2019-09-13 10:18:56'),(51,'bachelor','cữ nhân','/ˈbӕtʃələ/','n',3,NULL,'2019-09-13 10:20:13','2019-09-13 10:20:13'),(52,'bookworm','mọt sách, người thích đọc sách','/\'bukwə:m/','n',3,NULL,'2019-09-13 10:22:40','2019-09-13 10:22:40'),(53,'individual','cá nhân','/indiˈvidjuəl/','adj',0,NULL,'2019-09-13 10:29:02','2019-09-13 10:29:02'),(54,'tuition','học phí','/tju:\'iʃn/','n',3,NULL,'2019-09-13 10:30:31','2019-09-13 10:30:31'),(55,'internship','thực tập','/ˈɪn.tɜːn.ʃɪp/','n',0,NULL,'2019-09-13 10:34:09','2019-09-13 10:34:09'),(56,'inquisitive','tò mò','/in\'kwizitiv/','n',0,NULL,'2019-09-13 10:54:29','2019-09-13 10:54:29'),(57,'discipline','kỷ luật, phạm quy','/\'disiplin/','n',0,NULL,'2019-09-13 10:55:22','2019-09-13 10:55:22'),(58,'behaviour','hành vi, thái độ','/bɪˈheɪ.vjɚ/','n',0,NULL,'2019-09-13 10:56:19','2019-09-13 10:56:19'),(59,'peer','sự bằng, sự ngang nhau, người cùng địa vị','/piə/','n',0,NULL,'2019-09-13 10:58:44','2019-09-13 10:58:44'),(60,'remedial','mang tính khắc phục, mang tính điều trị','/ri\'mi:djəl/','v',0,NULL,'2019-09-13 11:00:07','2019-09-13 11:00:07'),(61,'evaluate','đánh giá','/i\'væljueit/','adj',3,NULL,'2019-09-13 11:00:56','2019-09-13 11:00:56'),(62,'analyse','phân tích','/\'ænəlaiz/','adj',3,NULL,'2019-09-13 11:01:36','2019-09-13 11:01:36'),(63,'procrastinating','chần chừ, hoãn lại','/prəˈkræs.tɪ.neɪt/','adj',0,NULL,'2019-09-13 11:07:31','2019-09-13 11:07:31'),(64,'violence','sự dữ tợn, sự mãnh liệt, bạo lực','/\'vaiələns/','n',0,NULL,'2019-09-20 10:54:23','2019-09-20 10:54:23'),(65,'domestic','người nhà, người trong nhà','/də\'mestik/','n',0,NULL,'2019-09-20 10:58:58','2019-09-20 10:58:58'),(66,'major','lớn, lớn hơn, người có địa vị cao hơn','/\'meidʤə/','n',0,NULL,'2019-09-20 11:01:16','2019-09-20 11:01:16'),(67,'similar','giống nhau, tương tự nhau','/\'similə/','adj',0,NULL,'2019-09-20 11:03:42','2019-09-20 11:03:42'),(68,'within','ở trong, trong nhà','/wi\' in/','adv',0,NULL,'2019-09-20 11:06:46','2019-09-20 11:06:46'),(69,'outrage','sự xúc phạm, sự lăng mạ, sự sỉ nhục','/\'autreidʤ/','n',0,NULL,'2019-09-20 11:10:55','2019-09-20 11:10:55'),(70,'outpouring','sự tràn ra, sự dạt dào','/\'aut,pɔ:riɳ/','n',0,NULL,'2019-09-20 11:11:52','2019-09-20 11:11:52'),(71,'grossly','cực kỳ, hết sức, thô tục (theo hướng tiêu cực)','/\'grousli/','other',0,NULL,'2019-09-20 11:20:36','2019-09-20 11:20:36'),(72,'abusing','thói xấu, sự lạm dụng, sự bạo hành','/ə\'bju:s/','n',0,NULL,'2019-09-20 11:23:31','2019-09-20 11:23:31'),(73,'vested','được ban cho, được phong cho','/\'vestid/','adj',0,NULL,'2019-09-20 11:24:28','2019-09-20 11:24:28'),(74,'expense','chi phí, phí tổn','/iks\'pens/','n',0,NULL,'2019-09-20 11:27:56','2019-09-20 11:27:56'),(75,'annual','hằng năm','/\'ænjuəl/','adj',0,NULL,'2019-09-22 10:01:20','2019-09-22 10:01:20'),(76,'lawmaker','người lập pháp, người làm luật','/\'lɔ:,meikə/','n',0,NULL,'2019-09-22 10:04:50','2019-09-22 10:04:50'),(77,'oppose','phản đối','/ə\'pouz/','v',0,NULL,'2019-09-22 10:05:25','2019-09-22 10:05:25'),(78,'proposal','sự đề xuất, kiếm nghị','/proposal/','n',0,NULL,'2019-09-22 10:15:53','2019-09-22 10:15:53'),(79,'dictate','ra lệnh','/dik\'teit/','n',0,NULL,'2019-09-22 10:16:43','2019-09-22 10:16:43'),(80,'exceed','vượt quá, trội hơn, phóng đại','/ik\'si:d','v',0,NULL,'2019-09-22 10:17:44','2019-09-22 10:17:44'),(81,'committee','ủy ban','/kə\'miti/','n',0,NULL,'2019-09-22 10:18:16','2019-09-22 10:18:16'),(82,'drafting','soạn thảo, chọn lựa, thảo ra kế hoạch','/drɑːft/','v',0,NULL,'2019-09-22 10:20:19','2019-09-22 10:20:19'),(83,'amendments','sự sửa đổi và bổ sung','/ə\'mendmənt/','n',0,NULL,'2019-09-22 10:21:38','2019-09-22 10:21:38'),(84,'satisfy','làm thỏa mãn, làm vừa lòng','/\'sætisfai/','v',0,NULL,'2019-09-22 10:22:38','2019-09-22 10:22:38'),(85,'flexibility','tính mềm dẻo,tính thuyết phục','/flexibility/','n',0,NULL,'2019-09-22 10:24:01','2019-09-22 10:24:01'),(86,'versatility','tính linh hoạt','/,və:sə\'tiliti/','n',0,NULL,'2019-09-22 10:24:40','2019-09-22 10:24:40'),(87,'progressive','tiến bộ','/prəˈɡres.ɪv/','adj',0,NULL,'2019-09-22 10:25:43','2019-09-22 10:25:43'),(88,'chairman','chủ tịch','/ˈtʃeə.mən/','n',0,NULL,'2019-09-22 10:27:07','2019-09-22 10:27:07'),(89,'authorities','người có thẩm quyền, người có uy tính','/ɔ:\'θɔriti/','n',0,NULL,'2019-09-22 10:28:26','2019-09-22 10:28:26'),(90,'ensure','bảo đảm','/ɪnˈʃɔːr/','v',0,NULL,'2019-09-22 10:29:31','2019-09-22 10:29:31'),(91,'amusement','sự vui chơi, tiêu khiển','/əˈmjuːz.mənt/','n',0,NULL,'2019-09-22 10:31:22','2019-09-22 10:31:22'),(92,'encouraged','ủng hộ, khuyến khích,cổ vũ động viên','/ɪnˈkʌr.ɪdʒd/','adj',0,NULL,'2019-09-22 10:32:13','2019-09-22 10:32:13'),(93,'argue','tranh luận, tranh cãi','/\'ɑ:gju:/','v',0,NULL,'2019-09-22 10:37:06','2019-09-22 10:37:06'),(94,'chains','chuỗi ( sản phẩm), dây chuyền (làm việc)','/tʃein/','n',0,NULL,'2019-09-22 12:22:06','2019-09-22 12:22:06'),(95,'violate','xâm phạm, vi phạm','/ˈvaɪ.ə.leɪt/','v',0,NULL,'2019-09-22 12:24:27','2019-09-22 12:24:27'),(96,'actually','sự thật, quả thật, thật ra','/\'æktjuəli/','other',0,NULL,'2019-09-22 15:57:36','2019-09-22 15:57:36');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
