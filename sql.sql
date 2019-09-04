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
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `active` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exercise` */

/*Table structure for table `pharse` */

DROP TABLE IF EXISTS `pharse`;

CREATE TABLE `pharse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pharse` */

insert  into `pharse`(`id`,`e_name`,`v_name`) values (29,'a dead-end job','công việc cuối cùng'),(30,'a heavy workload','nhiều việc phải làm'),(31,'a high-powered job','việc quan trọng'),(32,'manual work','công việc tay chân'),(33,'maternity leave','nghĩ thai sản'),(34,'a nine-to-five job','một công việc bình thường'),(35,'consists of','bao gồm'),(36,'one of the perks of the job','một trong những đặc quyền công việc'),(37,'holiday entitlements','quyền lợi ngày lễ');

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `vocabulary` */

insert  into `vocabulary`(`id`,`e_name`,`v_name`,`spell`,`type`,`category`,`note`) values (1,'abandon','bỏ cho người khác giữ, giao phó','/əˈbandən/','n',0,NULL),(3,'abstract','trừu tượng','/ˈӕbstrӕkt/','n',0,NULL),(5,'academy','học viện','/əˈkӕdəmi/','n',3,NULL),(6,'access','đường vào, tiếp cận, truy cập','/ˈӕkses/','n',0,NULL),(14,'employer','người chủ, người sử dung lao động','/im\'plɔiə/','n',5,NULL),(15,'employment','việc làm','/im\'plɔimənt/','n',5,NULL),(16,'unemployment','thất nghiệp, sự thất nghiệp','/\'ʌnim\'plɔimənt/','n',5,NULL),(17,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','/kəˈmjuːt/','v',5,NULL),(18,'occupation','công việc, nghề nghiệp, thời hạn cư trú','/,ɔkju\'peiʃn/','n',5,NULL),(19,'career','nghề nghiệp, sự nghiệp','/kə\'riə/','n',5,NULL),(20,'profession','nghề nghiệp','/profession/','n',5,NULL),(21,'salary','tiền lương','/ˈsӕləri/','n',5,NULL),(22,'wages','tiến hành','/weidʒ/','v',5,NULL),(30,'sack','sa thải, cách chức','/sӕk/','v',5,NULL),(32,'dismiss','sa thải, bác bỏ, từ chối','/disˈmis/','v',5,NULL),(33,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','/\'veikənsi/','n',5,NULL),(34,'overtime','giờ làm thêm','/ˈəuvətaim/','n',5,NULL),(35,'shift','đổi chỗ, di chuyển','/ʃift/','v',5,NULL),(38,'usage','thói quen, cách dùng, cách sử dụng','/\'ju:zid /','1',0,NULL),(39,'opportunities','cơ hội','/opəˈtjuːnəti/','1',5,NULL),(79,'accommodate','đáp ứng, cung cấp chỗ ở','v','/əˈkomədeit/',0,NULL),(80,'accompany','đi cùng, hòa âm, hợp tấu','v','/əˈkampəni/',0,NULL),(81,'accumulate','thu gom','v','/əˈkjuːmjuleit/',0,NULL),(95,'sector','khu vực','n','/ˈsektə/',5,NULL),(96,'retire','nghỉ hưu, rút lui','v','/riˈtaiə/',5,NULL),(97,'flexitime','thời gian làm việc linh hoạt','n','/fleksitaim/',5,NULL),(110,'abandon','bỏ cho người khác giữ, giao phó','n','/əˈbandən/',0,NULL),(111,'abstract','trừu tượng','n','/ˈӕbstrӕkt/',0,NULL),(112,'academy','học viện','n','/əˈkӕdəmi/',3,NULL),(113,'access','đường vào, tiếp cận, truy cập','n','/ˈӕkses/',0,NULL),(114,'accurate','đúng đắn, chính xác','adj','/ӕˈkjurət/',0,NULL),(115,'achieve','đạt được','v','/əˈtʃiːv/',0,NULL),(116,'acknowledge','công nhận, chào đón','v','/əkˈnolidʒ/',0,NULL),(117,'employee','người làm công','n','/ɔm\'plɔiei/',5,NULL),(118,'employer','người chủ, người sử dung lao động','n','/im\'plɔiə/',5,NULL),(119,'employment','việc làm','n','/im\'plɔimənt/',5,NULL),(120,'unemployment','thất nghiệp, sự thất nghiệp','n','/\'ʌnim\'plɔimənt/',5,NULL),(121,'commute','giảm án, thay thế, thay đổi, đi lại thường xuyên giữa 2 nơi','v','/kəˈmjuːt/',5,NULL),(122,'occupation','công việc, nghề nghiệp, thời hạn cư trú','n','/,ɔkju\'peiʃn/',5,NULL),(123,'career','nghề nghiệp, sự nghiệp','n','/kə\'riə/',5,NULL),(124,'profession','nghề nghiệp','n','/profession/',5,NULL),(125,'salary','tiền lương','n','/ˈsӕləri/',5,NULL),(126,'wages','tiến hành','v','/weidʒ/',5,NULL),(127,'resign','từ chức','v','/rəˈzain/',5,NULL),(128,'fire','bắn, sa thải','v','/\'faie/',5,NULL),(129,'sack','sa thải, cách chức','v','/sӕk/',5,NULL),(130,'dismiss','sa thải, bác bỏ, từ chối','v','/disˈmis/',5,NULL),(131,'vacancy','chỗ khuyết, chỗ trống, tình trạng trống rỗng','n','/\'veikənsi/',5,NULL),(132,'overtime','giờ làm thêm','n','/ˈəuvətaim/',5,NULL),(133,'shift','đổi chỗ, di chuyển','v','/ʃift/',5,NULL),(134,'maternity','thai sản','n','/məˈtəːnəti/',0,NULL),(135,'ward','phòng, khu, khu vực','n','/wɔ:d/',0,NULL),(136,'legal','thuộc pháp luật','adj','/ˈliːɡəl/',0,NULL),(137,'legally',' hợp pháp, đúng pháp luật','adv','/ˈliːɡəli/',0,NULL),(138,'entitlement','quyền lợi','n',' /ɪnˈtaɪ.təl.mənt/',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
