/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.6-MariaDB : Database - english
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`english` /*!40100 DEFAULT CHARACTER SET latin1 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exercise` */

insert  into `exercise`(`id`,`name`,`count`,`lession`,`student`,`created_at`,`updated_at`,`active`) values (15,'Bài 1',22,NULL,1,'2019-09-13 11:36:07','2019-09-13 11:36:07',1),(16,'bài 1.1',9,NULL,1,'2019-09-13 14:02:33','2019-09-13 14:02:33',1);

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

insert  into `exercise_detail`(`id`,`vocabulary_id`,`class`,`created_at`,`updated_at`) values (15,42,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,43,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,44,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,45,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,46,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,47,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,48,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,49,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,50,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,51,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,52,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,53,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,54,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,55,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,56,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,57,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,58,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,59,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,60,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,61,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,62,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(15,63,'vocabulary','2019-09-13 11:36:07','2019-09-13 11:36:07'),(16,47,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,48,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,49,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,53,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,56,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,57,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,60,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,61,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33'),(16,63,'vocabulary','2019-09-13 14:02:33','2019-09-13 14:02:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `lession` */

insert  into `lession`(`id`,`name`,`count`,`student`,`created_at`,`updated_at`) values (8,'BH 1',10,1,'2019-09-13 16:00:46','2019-09-13 16:00:46');

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

insert  into `lession_detail`(`id`,`vocabulary_id`,`class`,`created_at`,`updated_at`) values (8,43,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,47,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,48,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,49,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,53,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,56,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,57,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,60,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,61,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46'),(8,63,'vocabulary','2019-09-13 16:00:46','2019-09-13 16:00:46');

/*Table structure for table `pharse` */

DROP TABLE IF EXISTS `pharse`;

CREATE TABLE `pharse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pharse` */

insert  into `pharse`(`id`,`e_name`,`v_name`,`created_at`,`updated_at`) values (29,'a dead-end job','công việc cuối cùng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(30,'a heavy workload','nhiều việc phải làm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(31,'a high-powered job','việc quan trọng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(32,'manual work','công việc tay chân','2019-09-09 14:14:28','2019-09-09 14:14:28'),(33,'maternity leave','nghĩ thai sản','2019-09-09 14:14:28','2019-09-09 14:14:28'),(34,'a nine-to-five job','một công việc bình thường','2019-09-09 14:14:28','2019-09-09 14:14:28'),(35,'consists of','bao gồm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(36,'one of the perks of the job','một trong những đặc quyền công việc','2019-09-09 14:14:28','2019-09-09 14:14:28'),(37,'holiday entitlements','quyền lợi ngày lễ','2019-09-09 14:14:28','2019-09-09 14:14:28'),(38,'bachelor\'s degree','trình độ cử nhân, bằng cử nhân','2019-09-13 10:21:11','2019-09-13 10:21:11'),(39,'distance learning','học từ xa, học online','2019-09-13 10:25:48','2019-09-13 10:25:48'),(40,'eager beaver','người chăm học','2019-09-13 10:26:27','2019-09-13 10:26:27'),(41,'face-to-face classes','học gia sư, học 1 kèm 1','2019-09-13 10:27:59','2019-09-13 10:27:59'),(42,'individual tuition','dạy học cá nhân, hoặc trong 1 nhóm nhỏ','2019-09-13 10:33:07','2019-09-13 10:33:07'),(43,'not the sharpest tool in the shed','không thông minh (cách nói tránh)','2019-09-13 10:36:34','2019-09-13 10:36:34'),(44,'schoolboy error','phạm lỗi ngu ngốc','2019-09-13 10:39:38','2019-09-13 10:39:38'),(45,'subject specialist','chuyên nghành, môn học chuyên nghành','2019-09-13 10:40:30','2019-09-13 10:40:30'),(46,'to fall behind with studies','học chậm và bị tụt lại so với người khác','2019-09-13 10:42:18','2019-09-13 10:42:18'),(47,'to goof around','dành thời gian làm những việc không quan trọng, vô bổ','2019-09-13 10:43:33','2019-09-13 10:43:33'),(48,'to pass with flying colours','hoàn thành với kết quả dễ dàng với kết quả xuất sắc','2019-09-13 10:45:09','2019-09-13 10:45:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vocabulary` */

insert  into `vocabulary`(`id`,`e_name`,`v_name`,`spell`,`type`,`category`,`note`,`created_at`,`updated_at`) values (1,'abandon','bỏ cho người khác giữ, giao phó','/əˈbandən/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(2,'abandon','bỏ,bỏ phế','/əˈbandən/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(3,'abstract','trừu tượng','/ˈӕbstrӕkt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(4,'abstract','trừu tượng','/ˈӕbstrӕkt/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(5,'academy','học viện','/əˈkӕdəmi/','n',3,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(6,'access','đường vào, tiếp cận, truy cập','/ˈӕkses/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(7,'accommodate','đáp ứng, cung cấp chỗ ở','/əˈkomədeit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(8,'accompany','đi cùng, hòa âm, hợp tấu','/əˈkampəni/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(9,'accumulate','thu gom','/əˈkjuːmjuleit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(10,'accurate','đúng đắn, chính xác','/ӕˈkjurət/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(11,'achieve','đạt được','/əˈtʃiːv/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(12,'acknowledge','công nhận, chào đón','/əkˈnolidʒ/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(13,'employee','người làm công','/ɔm\'plɔiei/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(14,'employer','người chủ, người sử dung lao động','/im\'plɔiə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(15,'employment','việc làm','/im\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(16,'unemployment','thất nghiệp, sự thất nghiệp','/\'ʌnim\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(17,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','/kəˈmjuːt/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(18,'occupation','công việc, nghề nghiệp, thời hạn cư trú','/,ɔkju\'peiʃn/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(19,'career','nghề nghiệp, sự nghiệp','/kə\'riə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(20,'profession','nghề nghiệp','/profession/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(21,'salary','tiền lương','/ˈsӕləri/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(22,'wages','tiến hành','/weidʒ/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(23,'wages','tiền lương','/weidʒ/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(24,'sector','khu vực','/ˈsektə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(25,'retire','nghỉ hưu, rút lui','/riˈtaiə/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(26,'flexitime','thời gian làm việc linh hoạt','/fleksitaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(27,'resign','từ chức','/rəˈzain/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(28,'fire','bắn, sa thải','/\'faie/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(29,'fire','lửa','/\'faie/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(30,'sack','sa thải, cách chức','/sӕk/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(31,'sack','bao tải','/sӕk/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(32,'dismiss','sa thải, bác bỏ, từ chối','/disˈmis/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(33,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','/\'veikənsi/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(34,'overtime','giờ làm thêm','/ˈəuvətaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(35,'shift','đổi chỗ, di chuyển','/ʃift/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(36,'shift','sự thay đổi, sự luân phiên','/ʃift/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(37,'maternity','thai sản','/məˈtəːnəti/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(38,'ward','phòng, khu, khu vực','/wɔ:d/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(39,'legal','thuộc pháp luật','/ˈliːɡəl/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(40,'legally',' hợp pháp, đúng pháp luật','/ˈliːɡəli/','adv',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(41,'entitlement','quyền lợi','/ɪnˈtaɪ.təl.mənt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(42,'graduate','tốt nghiệp','/\'grædjut/','n',3,NULL,'2019-09-13 10:03:45','2019-09-13 10:03:45'),(43,'curriculum','chương trình giáo dục, bộ giáo dục','/kə\'rikjuləm/','n',3,NULL,'2019-09-13 10:05:20','2019-09-13 10:05:20'),(44,'qualification','trình độ chuyên môn, khả năng','/,kwɔlifi\'keiʃn/','n',3,NULL,'2019-09-13 10:06:46','2019-09-13 10:06:46'),(45,'coursework','khóa học, đồ án môn học','/ˈkɔːs.wɜːk/','n',3,NULL,'2019-09-13 10:08:27','2019-09-13 10:08:27'),(46,'co-educational','dạy cả trai và gái','adjective','adj',3,NULL,'2019-09-13 10:10:00','2019-09-13 10:10:00'),(47,'literacy','trình độ học vấn, sự biết đọc biết viết','/\'litərəsi/','n',3,NULL,'2019-09-13 10:11:46','2019-09-13 10:11:46'),(48,'illiterate','mù chữ, thất học','/iˈlitərət/','adj',3,NULL,'2019-09-13 10:13:57','2019-09-13 10:13:57'),(49,'concentrate','tập trung','/ˈkonsəntreit/','v',3,NULL,'2019-09-13 10:17:57','2019-09-13 10:17:57'),(50,'concern','mối quan ngại, lo lắng','/kənˈsərn/','n',0,NULL,'2019-09-13 10:18:56','2019-09-13 10:18:56'),(51,'bachelor','cữ nhân','/ˈbӕtʃələ/','n',3,NULL,'2019-09-13 10:20:13','2019-09-13 10:20:13'),(52,'bookworm','mọt sách, người thích đọc sách','/\'bukwə:m/','n',3,NULL,'2019-09-13 10:22:40','2019-09-13 10:22:40'),(53,'individual','cá nhân','/indiˈvidjuəl/','adj',0,NULL,'2019-09-13 10:29:02','2019-09-13 10:29:02'),(54,'tuition','học phí','/tju:\'iʃn/','n',3,NULL,'2019-09-13 10:30:31','2019-09-13 10:30:31'),(55,'internship','thực tập','/ˈɪn.tɜːn.ʃɪp/','n',0,NULL,'2019-09-13 10:34:09','2019-09-13 10:34:09'),(56,'inquisitive','tò mò','/in\'kwizitiv/','n',0,NULL,'2019-09-13 10:54:29','2019-09-13 10:54:29'),(57,'discipline','kỷ luật, phạm quy','/\'disiplin/','n',0,NULL,'2019-09-13 10:55:22','2019-09-13 10:55:22'),(58,'behaviour','hành vi, thái độ','/bɪˈheɪ.vjɚ/','n',0,NULL,'2019-09-13 10:56:19','2019-09-13 10:56:19'),(59,'peer','sự bằng, sự ngang nhau, người cùng địa vị','/piə/','n',0,NULL,'2019-09-13 10:58:44','2019-09-13 10:58:44'),(60,'remedial','mang tính khắc phục, mang tính điều trị','/ri\'mi:djəl/','v',0,NULL,'2019-09-13 11:00:07','2019-09-13 11:00:07'),(61,'evaluate','đánh giá','/i\'væljueit/','adj',3,NULL,'2019-09-13 11:00:56','2019-09-13 11:00:56'),(62,'analyse','phân tích','/\'ænəlaiz/','adj',3,NULL,'2019-09-13 11:01:36','2019-09-13 11:01:36'),(63,'procrastinating','chần chừ, hoãn lại','/prəˈkræs.tɪ.neɪt/','adj',0,NULL,'2019-09-13 11:07:31','2019-09-13 11:07:31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
