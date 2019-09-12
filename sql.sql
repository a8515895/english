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
  `student` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exercise` */

insert  into `exercise`(`id`,`name`,`count`,`student`,`created_at`,`updated_at`,`active`) values (11,'test',10,1,'2019-09-11 11:24:31','2019-09-11 11:24:31',1),(12,'test 2',15,1,'2019-09-11 11:24:54','2019-09-11 11:24:54',1),(13,'test',16,1,'2019-09-11 11:25:17','2019-09-11 11:25:17',1),(14,'haha',4,1,'2019-09-11 14:21:43','2019-09-11 14:21:43',1);

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

insert  into `exercise_detail`(`id`,`vocabulary_id`,`class`,`created_at`,`updated_at`) values (11,8,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,12,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,13,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,17,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,20,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,24,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,27,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,33,'pharse','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,37,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(11,39,'vocabulary','2019-09-11 11:24:31','2019-09-11 11:24:31'),(12,2,'vocabulary','2019-09-11 11:24:54','2019-09-11 11:24:54'),(12,3,'vocabulary','2019-09-11 11:24:54','2019-09-11 11:24:54'),(12,5,'vocabulary','2019-09-11 11:24:54','2019-09-11 11:24:54'),(12,7,'vocabulary','2019-09-11 11:24:54','2019-09-11 11:24:54'),(12,8,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,17,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,18,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,20,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,23,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,29,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,32,'pharse','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,33,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,36,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,37,'pharse','2019-09-11 11:24:55','2019-09-11 11:24:55'),(12,41,'vocabulary','2019-09-11 11:24:55','2019-09-11 11:24:55'),(13,2,'vocabulary','2019-09-11 11:25:17','2019-09-11 11:25:17'),(13,4,'vocabulary','2019-09-11 11:25:17','2019-09-11 11:25:17'),(13,5,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,11,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,12,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,14,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,21,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,23,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,24,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,25,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,28,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,30,'pharse','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,34,'pharse','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,39,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,40,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(13,41,'vocabulary','2019-09-11 11:25:18','2019-09-11 11:25:18'),(14,9,'vocabulary','2019-09-11 14:21:43','2019-09-11 14:21:43'),(14,11,'vocabulary','2019-09-11 14:21:43','2019-09-11 14:21:43'),(14,12,'vocabulary','2019-09-11 14:21:43','2019-09-11 14:21:43'),(14,13,'vocabulary','2019-09-11 14:21:43','2019-09-11 14:21:43');

/*Table structure for table `pharse` */

DROP TABLE IF EXISTS `pharse`;

CREATE TABLE `pharse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pharse` */

insert  into `pharse`(`id`,`e_name`,`v_name`,`created_at`,`updated_at`) values (29,'a dead-end job','công việc cuối cùng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(30,'a heavy workload','nhiều việc phải làm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(31,'a high-powered job','việc quan trọng','2019-09-09 14:14:28','2019-09-09 14:14:28'),(32,'manual work','công việc tay chân','2019-09-09 14:14:28','2019-09-09 14:14:28'),(33,'maternity leave','nghĩ thai sản','2019-09-09 14:14:28','2019-09-09 14:14:28'),(34,'a nine-to-five job','một công việc bình thường','2019-09-09 14:14:28','2019-09-09 14:14:28'),(35,'consists of','bao gồm','2019-09-09 14:14:28','2019-09-09 14:14:28'),(36,'one of the perks of the job','một trong những đặc quyền công việc','2019-09-09 14:14:28','2019-09-09 14:14:28'),(37,'holiday entitlements','quyền lợi ngày lễ','2019-09-09 14:14:28','2019-09-09 14:14:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vocabulary` */

insert  into `vocabulary`(`id`,`e_name`,`v_name`,`spell`,`type`,`category`,`note`,`created_at`,`updated_at`) values (1,'abandon','bỏ cho người khác giữ, giao phó','/əˈbandən/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(2,'abandon','bỏ,bỏ phế','/əˈbandən/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(3,'abstract','trừu tượng','/ˈӕbstrӕkt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(4,'abstract','trừu tượng','/ˈӕbstrӕkt/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(5,'academy','học viện','/əˈkӕdəmi/','n',3,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(6,'access','đường vào, tiếp cận, truy cập','/ˈӕkses/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(7,'accommodate','đáp ứng, cung cấp chỗ ở','/əˈkomədeit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(8,'accompany','đi cùng, hòa âm, hợp tấu','/əˈkampəni/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(9,'accumulate','thu gom','/əˈkjuːmjuleit/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(10,'accurate','đúng đắn, chính xác','/ӕˈkjurət/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(11,'achieve','đạt được','/əˈtʃiːv/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(12,'acknowledge','công nhận, chào đón','/əkˈnolidʒ/','v',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(13,'employee','người làm công','/ɔm\'plɔiei/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(14,'employer','người chủ, người sử dung lao động','/im\'plɔiə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(15,'employment','việc làm','/im\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(16,'unemployment','thất nghiệp, sự thất nghiệp','/\'ʌnim\'plɔimənt/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(17,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','/kəˈmjuːt/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(18,'occupation','công việc, nghề nghiệp, thời hạn cư trú','/,ɔkju\'peiʃn/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(19,'career','nghề nghiệp, sự nghiệp','/kə\'riə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(20,'profession','nghề nghiệp','/profession/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(21,'salary','tiền lương','/ˈsӕləri/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(22,'wages','tiến hành','/weidʒ/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(23,'wages','tiền lương','/weidʒ/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(24,'sector','khu vực','/ˈsektə/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(25,'retire','nghỉ hưu, rút lui','/riˈtaiə/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(26,'flexitime','thời gian làm việc linh hoạt','/fleksitaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(27,'resign','từ chức','/rəˈzain/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(28,'fire','bắn, sa thải','/\'faie/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(29,'fire','lửa','/\'faie/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(30,'sack','sa thải, cách chức','/sӕk/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(31,'sack','bao tải','/sӕk/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(32,'dismiss','sa thải, bác bỏ, từ chối','/disˈmis/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(33,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','/\'veikənsi/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(34,'overtime','giờ làm thêm','/ˈəuvətaim/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(35,'shift','đổi chỗ, di chuyển','/ʃift/','v',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(36,'shift','sự thay đổi, sự luân phiên','/ʃift/','n',5,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(37,'maternity','thai sản','/məˈtəːnəti/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(38,'ward','phòng, khu, khu vực','/wɔ:d/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(39,'legal','thuộc pháp luật','/ˈliːɡəl/','adj',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(40,'legally',' hợp pháp, đúng pháp luật','/ˈliːɡəli/','adv',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44'),(41,'entitlement','quyền lợi',' /ɪnˈtaɪ.təl.mənt/','n',0,NULL,'2019-09-09 14:13:44','2019-09-09 14:13:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
