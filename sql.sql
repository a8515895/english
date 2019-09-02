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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`id`,`e_name`,`v_name`,`spell`,`active`,`parent`) values (0,'Other','KHÁC',NULL,1,0),(1,'FOOD AND BEVERAGE','ĐỒ ĂN VÀ ĐỒ UỐNG',NULL,1,0),(2,'Daily life','CUỘC SỐNG HÀNG NGÀY',NULL,1,0),(3,'Education','GIÁO DỤC',NULL,1,0),(5,'Work And Job','CÔNG VIẸC6',NULL,1,0);

/*Table structure for table `exercise` */

DROP TABLE IF EXISTS `exercise`;

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `exercise` */

/*Table structure for table `pharse` */

DROP TABLE IF EXISTS `pharse`;

CREATE TABLE `pharse` (
  `id` int(11) DEFAULT NULL,
  `e-name` varchar(255) DEFAULT NULL,
  `v-name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pharse` */

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
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `vocabulary_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vocabulary` */

insert  into `vocabulary`(`id`,`e_name`,`v_name`,`spell`,`type`,`category`,`note`) values (1,'abandon','bỏ cho người khác giữ, giao phó','/əˈbandən/','n',0,NULL),(2,'abandon','bỏ,bỏ phế','/əˈbandən/','v',0,NULL),(3,'abstract','trừu tượng','/ˈӕbstrӕkt/','n',0,NULL),(4,'abstract','trừu tượng','/ˈӕbstrӕkt/','adj',0,NULL),(5,'academy','học viện','/əˈkӕdəmi/','n',3,NULL),(6,'access','đường vào, tiếp cận, truy cập','/ˈӕkses/','n',0,NULL),(7,'accommodate','đáp ứng, cung cấp chỗ ở','/əˈkomədeit/','v',0,NULL),(8,'accompany','đi cùng, hòa âm, hợp tấu','/əˈkampəni/','v',0,NULL),(9,'accumulate','thu gom','/əˈkjuːmjuleit/','v',0,NULL),(10,'accurate','đúng đắn, chính xác','/ӕˈkjurət/','adj',0,NULL),(11,'achieve','đạt được','/əˈtʃiːv/','v',0,NULL),(12,'acknowledge','công nhận, chào đón','/əkˈnolidʒ/','v',0,NULL),(13,'employee','người làm công','/ɔm\'plɔiei/','n',5,NULL),(14,'employer','người chủ, người sử dung lao động','/im\'plɔiə/','n',5,NULL),(15,'employment','việc làm','/im\'plɔimənt/','n',5,NULL),(16,'unemployment','thất nghiệp, sự thất nghiệp','/\'ʌnim\'plɔimənt/','n',5,NULL),(17,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','/kəˈmjuːt/','v',5,NULL),(18,'occupation','công việc, nghề nghiệp, thời hạn cư trú','/,ɔkju\'peiʃn/','n',5,NULL),(19,'career','nghề nghiệp, sự nghiệp','/kə\'riə/','n',5,NULL),(20,'profession','nghề nghiệp','/profession/','n',5,NULL),(21,'salary','tiền lương','/ˈsӕləri/','n',5,NULL),(22,'wages','tiến hành','/weidʒ/','v',5,NULL),(23,'wages','tiền lương','/weidʒ/','n',5,NULL),(24,'sector','khu vực','/ˈsektə/','n',5,NULL),(25,'retire','nghỉ hưu, rút lui','/riˈtaiə/','v',5,NULL),(26,'flexitime','thời gian làm việc linh hoạt','/fleksitaim/','n',5,NULL),(27,'resign','từ chức','/rəˈzain/','v',5,NULL),(28,'fire','bắn, sa thải','/\'faie/','v',5,NULL),(29,'fire','lửa','/\'faie/','n',5,NULL),(30,'sack','sa thải, cách chức','/sӕk/','v',5,NULL),(31,'sack','bao tải','/sӕk/','n',5,NULL),(32,'dismiss','sa thải, bác bỏ, từ chối','/disˈmis/','v',5,NULL),(33,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','/\'veikənsi/','n',5,NULL),(34,'overtime','giờ làm thêm','/ˈəuvətaim/','n',5,NULL),(35,'shift','đổi chỗ, di chuyển','/ʃift/','v',5,NULL),(36,'shift','sự thay đổi, sự luân phiên','/ʃift/','n',5,NULL),(38,'usage','thói quen, cách dùng, cách sử dụng','/\'ju:zid /','1',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
