# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: easytrade
# Generation Time: 2557-02-27 16:47:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table et_account_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_coupon`;

CREATE TABLE `an_account_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `image_coupon` text NOT NULL,
  `name_coupon` text NOT NULL,
  `discount` varchar(11) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `start_date` int(20) NOT NULL,
  `end_date` int(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_coupon` WRITE;
/*!40000 ALTER TABLE `an_account_coupon` DISABLE KEYS */;

INSERT INTO `an_account_coupon` (`id`, `account_id`, `image_coupon`, `name_coupon`, `discount`, `detail`, `start_date`, `end_date`, `status`)
VALUES
  (1,2,'mid-099c5437c55c7e6918724b958a6e1793.png','ชื่อโปรโมชั้น','30','รายละเอียด',39286800,2566800,1),
  (3,2,'mid-41db1d0632e6f98fe6c87f1c4ef83f46.png','ชื่อโปรโมชั้น','30','detail',1391187600,1393520400,1);

/*!40000 ALTER TABLE `an_account_coupon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_fields`;

CREATE TABLE `an_account_fields` (
  `account_id` int(11) NOT NULL COMMENT 'refer to accounts.account_id',
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_account_image_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_image_product`;

CREATE TABLE `an_account_image_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `image_product` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_image_product` WRITE;
/*!40000 ALTER TABLE `an_account_image_product` DISABLE KEYS */;

INSERT INTO `an_account_image_product` (`id`, `account_id`, `image_product`)
VALUES
  (7,2,'mid-d59750ce3458390c870de41bdd067672.png'),
  (8,2,'mid-06f2272ce2613a3c10a8f864e70fc52f.png');

/*!40000 ALTER TABLE `an_account_image_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_image_shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_image_shop`;

CREATE TABLE `an_account_image_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_image_shop` WRITE;
/*!40000 ALTER TABLE `an_account_image_shop` DISABLE KEYS */;

INSERT INTO `an_account_image_shop` (`id`, `account_id`, `image`)
VALUES
  (13,2,'mid-4e36ea11321b23073c31398112e3c3f7.png'),
  (14,2,'mid-6b57da4a90c1e7439121a0d52c495d82.png'),
  (15,2,''),
  (16,2,'');

/*!40000 ALTER TABLE `an_account_image_shop` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level`;

CREATE TABLE `an_account_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `level_group_id` (`level_group_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_level` WRITE;
/*!40000 ALTER TABLE `an_account_level` DISABLE KEYS */;

INSERT INTO `an_account_level` (`level_id`, `level_group_id`, `account_id`)
VALUES
  (1,4,0),
  (2,1,1),
  (5,3,6),
  (6,3,7),
  (7,3,8),
  (8,3,9),
  (9,3,10),
  (10,3,11),
  (11,3,12),
  (13,3,14),
  (14,3,15),
  (15,1,16);

/*!40000 ALTER TABLE `an_account_level` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_level_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level_group`;

CREATE TABLE `an_account_level_group` (
  `level_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `level_description` text,
  `level_priority` int(5) NOT NULL DEFAULT '1' COMMENT 'lower is more higher priority',
  PRIMARY KEY (`level_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_level_group` WRITE;
/*!40000 ALTER TABLE `an_account_level_group` DISABLE KEYS */;

INSERT INTO `an_account_level_group` (`level_group_id`, `level_name`, `level_description`, `level_priority`)
VALUES
  (1,'Super administrator','Site owner.',1),
  (2,'Administrator',NULL,2),
  (3,'Member','For registered user.',999),
  (4,'Guest','For non register user.',1000);

/*!40000 ALTER TABLE `an_account_level_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_level_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level_permission`;

CREATE TABLE `an_account_level_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `permission_page` varchar(255) NOT NULL,
  `permission_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `level_group_id` (`level_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_account_logins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_logins`;

CREATE TABLE `an_account_logins` (
  `account_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `login_ua` varchar(255) DEFAULT NULL,
  `login_os` varchar(255) DEFAULT NULL,
  `login_browser` varchar(255) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_time_gmt` datetime DEFAULT NULL,
  `login_attempt` int(1) NOT NULL DEFAULT '0' COMMENT '0=fail, 1=success',
  `login_attempt_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_login_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_logins` WRITE;
/*!40000 ALTER TABLE `an_account_logins` DISABLE KEYS */;

INSERT INTO `an_account_logins` (`account_login_id`, `account_id`, `site_id`, `login_ua`, `login_os`, `login_browser`, `login_ip`, `login_time`, `login_time_gmt`, `login_attempt`, `login_attempt_text`)
VALUES
  (1,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0','Apple','Firefox 25.0','127.0.0.1','2013-12-11 12:26:35','2013-12-10 17:26:35',1,'Success'),
  (2,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.98.171.137','2014-01-23 11:38:30','2014-01-23 16:38:30',1,'Success'),
  (3,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','58.10.143.3','2014-01-26 04:06:27','2014-01-26 09:06:27',1,'Success'),
  (7,3,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','58.10.143.3','2014-01-26 04:39:19','2014-01-26 09:39:19',1,'Success'),
  (8,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','58.10.143.3','2014-01-26 04:46:55','2014-01-26 09:46:55',1,'Success'),
  (9,2,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','58.10.143.3','2014-01-26 05:18:58','2014-01-26 10:18:58',1,'Success'),
  (10,2,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','58.10.143.3','2014-01-26 06:23:40','2014-01-26 11:23:40',1,'Success'),
  (11,6,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','58.10.143.3','2014-01-26 06:39:01','2014-01-26 11:39:01',1,'Success'),
  (12,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','58.10.143.3','2014-01-26 07:05:17','2014-01-26 12:05:17',1,'Success'),
  (13,6,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','58.10.143.3','2014-01-26 07:14:45','2014-01-26 12:14:45',1,'Success'),
  (14,8,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-26 07:36:51','2014-01-26 12:36:51',1,'Success'),
  (15,9,1,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.76 Safari/537.36','Windows','Chrome 32.0.1700.76','171.101.99.96','2014-01-26 07:43:20','2014-01-26 12:43:20',1,'Success'),
  (16,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-26 10:57:19','2014-01-26 15:57:19',1,'Success'),
  (17,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-26 10:58:07','2014-01-26 15:58:07',1,'Success'),
  (18,1,1,'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/11B554a','iPhone','iPhone unknown','171.101.99.96','2014-01-26 11:00:18','2014-01-26 16:00:18',1,'Success'),
  (19,1,1,'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/11B554a','iPhone','iPhone unknown','171.101.99.96','2014-01-26 11:00:44','2014-01-26 16:00:44',1,'Success'),
  (20,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-26 11:01:24','2014-01-26 16:01:24',1,'Success'),
  (21,8,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 08:42:14','2014-01-27 01:42:14',0,'Wrong username or password'),
  (23,8,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 08:43:02','2014-01-27 01:43:02',0,'Wrong username or password'),
  (26,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 08:52:27','2014-01-27 01:52:27',1,'Success'),
  (27,12,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 09:07:53','2014-01-27 02:07:53',1,'Success'),
  (28,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 09:32:59','2014-01-27 02:32:59',1,'Success'),
  (29,12,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:19:34','2014-01-27 03:19:34',0,'Wrong username or password'),
  (30,12,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:20:05','2014-01-27 03:20:05',0,'Wrong username or password'),
  (31,12,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:23:06','2014-01-27 03:23:06',0,'Wrong username or password'),
  (32,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:23:34','2014-01-27 03:23:34',1,'Success'),
  (35,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:40:58','2014-01-27 03:40:58',1,'Success'),
  (36,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:50:05','2014-01-27 03:50:05',1,'Success'),
  (37,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:51:27','2014-01-27 03:51:27',1,'Success'),
  (38,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 10:53:23','2014-01-27 03:53:23',1,'Success'),
  (42,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:56:32','2014-01-27 03:56:32',1,'Success'),
  (43,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:56:41','2014-01-27 03:56:41',1,'Success'),
  (44,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:57:04','2014-01-27 03:57:04',1,'Success'),
  (45,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 10:57:34','2014-01-27 03:57:34',1,'Success'),
  (46,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:57:37','2014-01-27 03:57:37',1,'Success'),
  (47,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:58:08','2014-01-27 03:58:08',1,'Success'),
  (49,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:58:22','2014-01-27 03:58:22',1,'Success'),
  (50,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:58:36','2014-01-27 03:58:36',1,'Success'),
  (52,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 10:59:33','2014-01-27 03:59:33',1,'Success'),
  (53,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 10:59:57','2014-01-27 03:59:57',1,'Success'),
  (54,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:00:08','2014-01-27 04:00:08',1,'Success'),
  (55,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:00:13','2014-01-27 04:00:13',1,'Success'),
  (57,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:01:42','2014-01-27 04:01:42',1,'Success'),
  (58,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:02:26','2014-01-27 04:02:26',1,'Success'),
  (59,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:02:56','2014-01-27 04:02:56',0,'Wrong username or password'),
  (60,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:04:09','2014-01-27 04:04:09',0,'Wrong username or password'),
  (61,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:04:20','2014-01-27 04:04:20',1,'Success'),
  (62,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:04:27','2014-01-27 04:04:27',1,'Success'),
  (63,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:04:37','2014-01-27 04:04:37',1,'Success'),
  (64,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:08:36','2014-01-27 04:08:36',1,'Success'),
  (65,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:09:26','2014-01-27 04:09:26',1,'Success'),
  (66,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:09:42','2014-01-27 04:09:42',1,'Success'),
  (67,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:10:11','2014-01-27 04:10:11',0,'Wrong username or password'),
  (68,14,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:23:29','2014-01-27 04:23:29',1,'Success'),
  (69,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:24:02','2014-01-27 04:24:02',1,'Success'),
  (70,14,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:25:23','2014-01-27 04:25:23',1,'Success'),
  (71,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 11:27:38','2014-01-27 04:27:38',1,'Success'),
  (72,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:35:47','2014-01-27 04:35:47',1,'Success'),
  (73,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','110.77.211.127','2014-01-27 11:42:05','2014-01-27 04:42:05',1,'Success'),
  (74,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 12:01:31','2014-01-27 05:01:31',0,'Wrong username or password'),
  (75,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 12:02:42','2014-01-27 05:02:42',0,'Wrong username or password'),
  (76,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 12:02:54','2014-01-27 05:02:54',1,'Success'),
  (77,14,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 12:03:40','2014-01-27 05:03:40',1,'Success'),
  (78,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 01:05:29','2014-01-27 06:05:29',0,'Wrong username or password'),
  (79,15,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.89','2014-01-27 01:05:35','2014-01-27 06:05:35',1,'Success'),
  (80,1,1,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0','Windows','Firefox 26.0','171.5.250.171','2014-01-27 11:01:11','2014-01-27 16:01:11',1,'Success'),
  (81,15,1,'Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53','iPad','iPad 7.0','27.55.150.49','2014-01-28 09:21:45','2014-01-28 02:21:45',1,'Success'),
  (82,16,1,'Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53','iPad','iPad 7.0','27.55.150.49','2014-01-28 10:23:38','2014-01-28 03:23:38',1,'Success'),
  (83,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','111.84.211.24','2014-02-08 04:14:21','2014-02-08 09:14:21',1,'Success'),
  (84,15,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','111.84.211.24','2014-02-08 04:22:13','2014-02-08 09:22:13',0,'Wrong username or password'),
  (85,15,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','111.84.211.24','2014-02-08 04:22:20','2014-02-08 09:22:20',1,'Success'),
  (86,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 12:31:00','2014-02-21 17:31:00',0,'Wrong username or password'),
  (87,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 12:31:16','2014-02-21 17:31:16',1,'Success'),
  (88,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 01:06:04','2014-02-21 18:06:04',1,'Success'),
  (89,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:18:17','2014-02-22 02:18:17',1,'Success'),
  (90,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:19:56','2014-02-22 02:19:56',1,'Success'),
  (91,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:21:17','2014-02-22 02:21:17',1,'Success'),
  (92,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:24:46','2014-02-22 02:24:46',1,'Success'),
  (93,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:26:17','2014-02-22 02:26:17',1,'Success'),
  (94,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:27:07','2014-02-22 02:27:07',1,'Success'),
  (95,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 09:28:28','2014-02-22 02:28:28',1,'Success'),
  (96,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-22 01:20:32','2014-02-22 06:20:32',1,'Success'),
  (97,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-26 09:39:13','2014-02-26 14:39:13',1,'Success'),
  (98,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-02-27 09:36:51','2014-02-27 14:36:51',1,'Success');

/*!40000 ALTER TABLE `an_account_logins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_account_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_sites`;

CREATE TABLE `an_account_sites` (
  `account_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT 'refer to accounts.account_id',
  `site_id` int(11) DEFAULT NULL COMMENT 'refer to sites.site_id',
  `account_last_login` bigint(20) DEFAULT NULL,
  `account_last_login_gmt` bigint(20) DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled.',
  PRIMARY KEY (`account_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_sites` WRITE;
/*!40000 ALTER TABLE `an_account_sites` DISABLE KEYS */;

INSERT INTO `an_account_sites` (`account_site_id`, `account_id`, `site_id`, `account_last_login`, `account_last_login_gmt`, `account_online_code`)
VALUES
  (1,1,1,1393005964,1392980764,'092fdf0fae6862e5d6431d833a9872b6'),
  (2,2,1,1393511811,1393486611,'1edc4cab4326b72bdbf9f4bef9fd9fb4'),
  (5,3,1,1390729159,1390703959,'bcf3a8f83b4a47d6eefac2c2ed82f870'),
  (6,6,1,1390738484,1390713284,'77205cc6ff42975e8eebad460eaac84c'),
  (7,8,1,1390739811,1390714611,'d09f4c9713de9b38c3048eb6f69a9046'),
  (8,9,1,1390740200,1390715000,'603b9c74792693f41cbe12bb80b57e69'),
  (9,12,1,1390788473,1390763273,'ae3c4f3069c0c00937660dbb014fa7b3'),
  (11,14,1,1390799020,1390773820,'7217b4aeb0c79cc8aa964111d8145101'),
  (12,15,1,1391851340,1391826140,'9cf423c4db7f535138684863cc262438'),
  (13,16,1,1390879418,1390854218,'505cd6aad1fc0bdb05adfd298ad4102a');

/*!40000 ALTER TABLE `an_account_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_accounts`;

CREATE TABLE `an_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_username` varchar(255) DEFAULT NULL,
  `account_email` varchar(255) DEFAULT NULL,
  `account_salt` varchar(255) DEFAULT NULL COMMENT 'store salt for use when hashing password',
  `account_password` tinytext,
  `account_fullname` varchar(255) DEFAULT NULL,
  `account_birthdate` date DEFAULT NULL,
  `account_avatar` varchar(255) DEFAULT NULL,
  `account_signature` text,
  `account_timezone` varchar(10) NOT NULL DEFAULT 'UP7',
  `account_language` varchar(10) DEFAULT NULL,
  `account_create` datetime DEFAULT NULL COMMENT 'local time',
  `account_create_gmt` datetime DEFAULT NULL COMMENT 'gmt0, utc0',
  `account_last_login` datetime DEFAULT NULL,
  `account_last_login_gmt` datetime DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled. deprecated',
  `account_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `account_status_text` varchar(255) DEFAULT NULL,
  `account_new_email` varchar(255) DEFAULT NULL,
  `account_new_password` varchar(255) DEFAULT NULL,
  `account_confirm_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` text,
  `province` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `name_shop` varchar(255) DEFAULT NULL,
  `detail_shop` text,
  `code_map` text NOT NULL,
  `count_view` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_accounts` WRITE;
/*!40000 ALTER TABLE `an_accounts` DISABLE KEYS */;

INSERT INTO `an_accounts` (`account_id`, `account_username`, `account_email`, `account_salt`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_timezone`, `account_language`, `account_create`, `account_create_gmt`, `account_last_login`, `account_last_login_gmt`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`, `name`, `last_name`, `address`, `province`, `postcode`, `name_shop`, `detail_shop`, `code_map`, `count_view`, `phone`, `type`)
VALUES
  (0,'Guest','none@localhost',NULL,NULL,'Guest',NULL,NULL,NULL,'UP7',NULL,'2012-04-03 19:25:44','2012-04-03 12:25:44',NULL,NULL,NULL,0,'You can\'t login with this account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,'',0),
  (1,'admin','i@me.com',NULL,'$2a$12$6pWs39x446rE69.CpoEdRuz51aU0nQUEDSou0k25gLOgBLNoerD96',NULL,NULL,NULL,NULL,'UP7',NULL,'2011-04-20 19:20:04','2011-04-20 12:20:04','2014-02-22 01:06:04','2014-02-21 18:06:04','e2135bb4faf4fb999e3bbebe86ed1cdf',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,'',1),
  (2,'root','iar@me.com',NULL,'$2a$12$HW2OhDj9C0uFkxH5IIdaPOiKcm.RY0cGjPo4tGR4LKMDNveLg1lxa',NULL,NULL,'mid-a8e3749b70739d1e0ce5af331b6378d9.jpg',NULL,'UP7',NULL,'2014-01-26 14:43:49','2014-01-26 07:43:49','2014-02-27 21:36:51','2014-02-27 14:36:51',NULL,1,NULL,NULL,NULL,'0UUHpa','jirayu','kanda','21/1',102,109273,'ชื่อร้าน','ข้อมูลร้าน','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/?ie=UTF8&ll=13.912532,100.558419&spn=0.018495,0.038581&t=h&z=15&output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/?ie=UTF8&ll=13.912532,100.558419&spn=0.018495,0.038581&t=h&z=15&source=embed\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',20,'',1),
  (3,'root1','i2@me.com',NULL,'$2a$12$2VGqCPTl4Zxg1ebz/MohTuIXwTDunyv4/CJTK7cgBsdxXfa0ra/MC',NULL,NULL,'mid-93aab22baab2f77ae212a449a5d58e0f.png',NULL,'UP7',NULL,'2014-01-26 14:49:51','2014-01-26 07:49:51','2014-01-26 16:39:19','2014-01-26 09:39:19',NULL,1,NULL,NULL,NULL,'eQ7Lur','jirayu','kanda','21/1',102,109273,'ชื่อร้าน','ข้อมูลร้าน','',1,'',1),
  (6,'root3','i3@me.com',NULL,'$2a$12$O9aQCNrJOPMuyVzjq6HCBeQ3YZmmwVE.GbJe8ibpcxTmBqNufZ2ie',NULL,NULL,'mid-e0649b6657a659c2f2d4c6221946a13b.jpg',NULL,'UP7',NULL,'2014-01-26 18:35:00','2014-01-26 11:35:00','2014-01-26 19:14:44','2014-01-26 12:14:44',NULL,1,NULL,NULL,NULL,'qe12FE','jirayu.k','kanda','21/1',103,10250,'เทพ shop สุดๆ','ข้อมูลร้าน','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/?ie=UTF8&ll=13.912532,100.558419&spn=0.018495,0.038581&t=h&z=15&output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/?ie=UTF8&ll=13.912532,100.558419&spn=0.018495,0.038581&t=h&z=15&source=embed\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',5,'0888888888',2),
  (7,'root4','i22@me.com',NULL,'$2a$12$vbObegOD7jzgcwHZ29zecuA5Z5hML2n1bj7cGNfXihYToVQxw9E9i',NULL,NULL,'mid-d3d71975601c2e63599166ad3c92d1d1.jpg',NULL,'UP7',NULL,'2014-01-26 19:01:59','2014-01-26 12:01:59',NULL,NULL,NULL,1,NULL,NULL,NULL,'fBt3ex','jirayu.k','kanda','21/1',102,109273,'เทพ shop โคตรๆ','ข้อมูลร้าน','',2,'0888888888',3),
  (8,'PM003','supakit.kook03@gmail.com',NULL,'$2a$12$6pWs39x446rE69.CpoEdRuz51aU0nQUEDSou0k25gLOgBLNoerD96',NULL,NULL,'mid-b3ad913dc836c2f6d2791117def87a99.jpg',NULL,'UP7',NULL,'2014-01-26 19:36:39','2014-01-26 12:36:39','2014-01-26 19:36:51','2014-01-26 12:36:51',NULL,1,NULL,NULL,NULL,'uEjaR9','admin','PM','8/888 หมู่ 8 ถนนเพชรเกษม ต.ท่าตลาด อ.สามพราน',101,73110,'ฮอยอัน','ศูนย์รวมสินค้าเพื่อสุขภาพ','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/maps?saddr=%E0%B8%AA%E0%B8%B2%E0%B8%A1%E0%B8%9E%E0%B8%A3%E0%B8%B2%E0%B8%99&amp;daddr=%E0%B8%87%E0%B8%B2%E0%B8%99%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3%E0%B8%81%E0%B8%B3%E0%B9%81%E0%B8%9E%E0%B8%87%E0%B9%81%E0%B8%AA%E0%B8%99&amp;geocode=Ff9p0QAdDoH5BSkDMmmOQeriMDGAfAxFN5IBAw%3BFdtc0wAd34n-BSFwMQs9swABDylXKwEG3pziMDFwMQs9swABDw&amp;sll=13.851867,100.567519&amp;sspn=0.018521,0.033023&amp;hl=th&amp;ie=UTF8&amp;t=m&amp;ll=13.799961,100.392868&amp;spn=0.153963,0.356854&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/maps?saddr=%E0%B8%AA%E0%B8%B2%E0%B8%A1%E0%B8%9E%E0%B8%A3%E0%B8%B2%E0%B8%99&amp;daddr=%E0%B8%87%E0%B8%B2%E0%B8%99%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3%E0%B8%81%E0%B8%B3%E0%B9%81%E0%B8%9E%E0%B8%87%E0%B9%81%E0%B8%AA%E0%B8%99&amp;geocode=Ff9p0QAdDoH5BSkDMmmOQeriMDGAfAxFN5IBAw%3BFdtc0wAd34n-BSFwMQs9swABDylXKwEG3pziMDFwMQs9swABDw&amp;sll=13.851867,100.567519&amp;sspn=0.018521,0.033023&amp;hl=th&amp;ie=UTF8&amp;t=m&amp;ll=13.799961,100.392868&amp;spn=0.153963,0.356854&amp;source=embed\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',8,'088-8888888',2),
  (9,'test','test@hotmail.com',NULL,'$2a$12$L.hmXsRsyee52Rff5LMy7esYlhJfemFqwbWyDcMkjc1SoBlkNLjXu',NULL,NULL,'mid-4643db0687c0789ea330afeddf1a3f5c.jpg',NULL,'UP7',NULL,'2014-01-26 19:42:47','2014-01-26 12:42:47','2014-01-26 19:43:20','2014-01-26 12:43:20',NULL,1,NULL,NULL,NULL,'6MMG3H','มานะ','มามี','555 เขต ห้า',102,10800,'เฮงฮวด','test','https://maps.google.co.th/',7,'0812345678',3),
  (10,'root6','i223@me.com',NULL,'$2a$12$HoNUkvSsmwaZAWzu6vSMuuBEVlgjiu5nZtaxyeoHng3L7pDvLYMI2',NULL,NULL,'mid-044823f945a89fea19b044dd484a8eb2.png',NULL,'UP7',NULL,'2014-01-26 22:04:16','2014-01-26 15:04:16',NULL,NULL,NULL,1,NULL,NULL,NULL,'tvjcX6','jirayu.k','last_name','21/1',102,10250,'ชื่อร้าน','ข้อมูลร้าน','',0,'0888888888',2),
  (11,'PM004','charoen@hotmail.com',NULL,'$2a$12$6pWs39x446rE69.CpoEdRuz51aU0nQUEDSou0k25gLOgBLNoerD96',NULL,NULL,'mid-da0a5d59b7faada4fd5425beeec6d094.jpg',NULL,'UP7',NULL,'2014-01-26 22:04:55','2014-01-26 15:04:55',NULL,NULL,NULL,1,NULL,NULL,NULL,'fUdt9k','เจริญโลหะกิจ','ประกอบการ','8/888 หมู่ 8 ถนนเพชรเกษม ต.ท่าตลาด อ.สามพราน',118,73110,'เจริญโลหะกิจ','จำหน่ายอุปกรณ์ก่อสร้างทุกชนิดราคาถูก','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/maps?f=d&amp;source=s_d&amp;saddr=&amp;daddr=%E0%B8%AA%E0%B8%A7%E0%B8%99%E0%B8%AA%E0%B8%B2%E0%B8%A1%E0%B8%9E%E0%B8%A3%E0%B8%B2%E0%B8%99,+%E0%B8%88%E0%B8%B1%E0%B8%87%E0%B8%AB%E0%B8%A7%E0%B8%B1%E0%B8%94+%E0%B8%99%E0%B8%84%E0%B8%A3%E0%B8%9B%E0%B8%90%E0%B8%A1&amp;hl=th&amp;geocode=CdM5jeOyFTKSFdqP0QAdEJn5BSnhMdJow-riMDFUe8u_-RxTQQ&amp;sll=14.216464,100.763855&amp;sspn=1.994082,3.348083&amp;mra=mift&amp;ie=UTF8&amp;t=m&amp;ll=14.216464,100.763855&amp;spn=1.994082,3.348083&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/maps?f=d&amp;source=embed&amp;saddr=&amp;daddr=%E0%B8%AA%E0%B8%A7%E0%B8%99%E0%B8%AA%E0%B8%B2%E0%B8%A1%E0%B8%9E%E0%B8%A3%E0%B8%B2%E0%B8%99,+%E0%B8%88%E0%B8%B1%E0%B8%87%E0%B8%AB%E0%B8%A7%E0%B8%B1%E0%B8%94+%E0%B8%99%E0%B8%84%E0%B8%A3%E0%B8%9B%E0%B8%90%E0%B8%A1&amp;hl=th&amp;geocode=CdM5jeOyFTKSFdqP0QAdEJn5BSnhMdJow-riMDFUe8u_-RxTQQ&amp;sll=14.216464,100.763855&amp;sspn=1.994082,3.348083&amp;mra=mift&amp;ie=UTF8&amp;t=m&amp;ll=14.216464,100.763855&amp;spn=1.994082,3.348083\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',1,'081-158-5896',1),
  (12,'bansouy','bansouy@hotmail.com',NULL,'$2a$12$nMYlup0gmsJiAiCrjcLIV.ah8Qs6gJR2sEQ54VD7NwQHpv1oQKI2y',NULL,NULL,'mid-967057ee6298bb26e52a3473b909cfc8.png',NULL,'UP7',NULL,'2014-01-27 09:07:20','2014-01-27 02:07:20','2014-01-27 09:07:53','2014-01-27 02:07:53',NULL,1,NULL,NULL,NULL,'40JHKa','อานนท์','ฝั่งธน','8/888 หมู่ 8 ถนนเพชรเกษม ต.ท่าตลาด อ.สามพราน',102,10210,'ร้านบ้านสวย','ศูนย์รวมเฟอร์นิเจอร์นำเข้าหลากหลายชนิด','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/maps?f=q&amp;source=s_q&amp;hl=th&amp;geocode=&amp;q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&amp;aq=&amp;sll=13.038936,101.490104&amp;sspn=31.675817,53.569336&amp;ie=UTF8&amp;hq=&amp;hnear=&amp;ll=13.746815,100.53503&amp;spn=0.006295,0.006295&amp;t=m&amp;iwloc=A&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/maps?f=q&amp;source=embed&amp;hl=th&amp;geocode=&amp;q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&amp;aq=&amp;sll=13.038936,101.490104&amp;sspn=31.675817,53.569336&amp;ie=UTF8&amp;hq=&amp;hnear=&amp;ll=13.746815,100.53503&amp;spn=0.006295,0.006295&amp;t=m&amp;iwloc=A\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',3,'089-696-6996',2),
  (14,'pm002','pm02@hotmail.com',NULL,'$2a$12$ptrLi6SSBPHP7motitqqcuhAMa2IIK04ix39.OAhxIhfQuepH342.',NULL,NULL,'mid-c6a595c6e214b78e5702b0f08205477f.jpg',NULL,'UP7',NULL,'2014-01-27 10:51:00','2014-01-27 03:51:00','2014-01-27 12:03:40','2014-01-27 05:03:40',NULL,1,NULL,NULL,NULL,'w1wLFB','แสงชัย','การไฟฟ้า','8/888 หมู่ 8 ถนนเพชรเกษม ต.ท่าตลาด อ.สามพราน',102,10210,'SANGCHAI','จำหน่ายอุปกรณ์ไฟฟ้า','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/maps?f=q&source=s_q&hl=th&geocode=&q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&aq=&sll=13.038936,101.490104&sspn=31.675817,53.569336&ie=UTF8&hq=&hnear=&ll=13.746815,100.53503&spn=0.006295,0.006295&t=m&iwloc=A&output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/maps?f=q&source=embed&hl=th&geocode=&q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&aq=&sll=13.038936,101.490104&sspn=31.675817,53.569336&ie=UTF8&hq=&hnear=&ll=13.746815,100.53503&spn=0.006295,0.006295&t=m&iwloc=A\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',2,'089-696-6996',3),
  (15,'pm001','pm01@hotmail.com',NULL,'$2a$12$6pWs39x446rE69.CpoEdRuz51aU0nQUEDSou0k25gLOgBLNoerD96',NULL,NULL,'mid-920f6a5b6155fdf87b583eb2ae954d88.jpg',NULL,'UP7',NULL,'2014-01-27 11:08:26','2014-01-27 04:08:26','2014-02-08 16:22:20','2014-02-08 09:22:20',NULL,1,NULL,NULL,NULL,'YL43FH','โคมไฟ','อินเตอร์','8/888 หมู่ 8 ถนนเพชรเกษม ต.ท่าตลาด อ.สามพราน',101,10210,'โคมไฟอินเตอร์','จำหน่ายโคมไฟนำเข้า','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/maps?f=q&source=s_q&hl=th&geocode=&q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&aq=&sll=13.038936,101.490104&sspn=31.675817,53.569336&ie=UTF8&hq=&hnear=&ll=13.746815,100.53503&spn=0.006295,0.006295&t=m&iwloc=A&output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/maps?f=q&source=embed&hl=th&geocode=&q=%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%AD%E0%B8%99&aq=&sll=13.038936,101.490104&sspn=31.675817,53.569336&ie=UTF8&hq=&hnear=&ll=13.746815,100.53503&spn=0.006295,0.006295&t=m&iwloc=A\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',0,'089-696-6996',2),
  (16,'kook','kook@hotmail.com',NULL,'$2a$12$5HiNSp1Y9JD6ljocKK5Sdu/WwweGi.V.VoWeUwNCiDN/vv0jipaNC','supakit jampasri','1988-08-27',NULL,NULL,'UP7',NULL,'2014-01-27 23:02:27','2014-01-27 16:02:27','2014-01-28 10:23:38','2014-01-28 03:23:38',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,'',0);

/*!40000 ALTER TABLE `an_accounts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_blocks`;

CREATE TABLE `an_blocks` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `block_name` varchar(255) DEFAULT NULL,
  `block_file` varchar(255) DEFAULT NULL,
  `block_values` text,
  `block_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `block_except_uri` text,
  `block_only_uri` text,
  PRIMARY KEY (`block_id`),
  KEY `theme_system_name` (`theme_system_name`),
  KEY `area_name` (`area_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_ci_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_ci_sessions`;

CREATE TABLE `an_ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(50) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_ci_sessions` WRITE;
/*!40000 ALTER TABLE `an_ci_sessions` DISABLE KEYS */;

INSERT INTO `an_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`)
VALUES
  ('fecdf975e392f4ddead01d42eb91780b','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0',1393519427,'a:1:{s:9:\"user_data\";s:0:\"\";}');

/*!40000 ALTER TABLE `an_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_comment_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_comment_fields`;

CREATE TABLE `an_comment_fields` (
  `comment_id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_comments`;

CREATE TABLE `an_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'comment author''s name',
  `subject` varchar(255) DEFAULT NULL,
  `comment_body_value` longtext,
  `email` varchar(255) DEFAULT NULL COMMENT 'comment author''s email',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'comment author''s homepage',
  `comment_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=not publish, 1=published',
  `comment_spam_status` varchar(100) NOT NULL DEFAULT 'normal' COMMENT 'comment spam status (normal, spam, ham, what ever)',
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `comment_add` bigint(20) DEFAULT NULL,
  `comment_add_gmt` bigint(20) DEFAULT NULL,
  `comment_update` bigint(20) DEFAULT NULL,
  `comment_update_gmt` bigint(20) DEFAULT NULL,
  `thread` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `account_id` (`account_id`),
  KEY `post_id` (`post_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_config`;

CREATE TABLE `an_config` (
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `config_core` int(1) DEFAULT '0' COMMENT '0=no, 1=yes. if config core then please do not delete from db.',
  `config_description` text,
  KEY `config_name` (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_config` WRITE;
/*!40000 ALTER TABLE `an_config` DISABLE KEYS */;

INSERT INTO `an_config` (`config_name`, `config_value`, `config_core`, `config_description`)
VALUES
  ('site_name','Easytrade',1,'website name'),
  ('page_title_separator',' &rsaquo; ',1,'page title separator. eg. site name | page'),
  ('site_timezone','UP7',1,'website default timezone'),
  ('duplicate_login','1',1,'allow log in more than 1 place, session? set to 1/0 to allow/disallow.'),
  ('allow_avatar','1',1,'set to 1 if use avatar or set to 0 if not use it.'),
  ('avatar_size','10000',1,'set file size in Kilobyte.'),
  ('avatar_allowed_types','gif|jpg|png',1,'avatar allowe file types (see reference from codeigniter)\r\neg. gif|jpg|png'),
  ('avatar_path','public/upload/avatar/',1,'path to directory for upload avatar'),
  ('member_allow_register','1',1,'allow users to register'),
  ('member_register_notify_admin','0',1,'send email to notify admin when new member register?'),
  ('member_verification','1',1,'member verification method.\r\n1 = verify by email\r\n2 = wait for admin verify'),
  ('member_admin_verify_emails','i@me.com',1,'emails of administrators to notice them when new member registration'),
  ('mail_protocol','mail',1,'The mail sending protocol.\r\nmail, sendmail, smtp'),
  ('mail_mailpath','/usr/sbin/sendmail',1,'The server path to Sendmail.'),
  ('mail_smtp_host','localhost',1,'SMTP Server Address.'),
  ('mail_smtp_user','i@me.com',1,'SMTP Username.'),
  ('mail_smtp_pass','',1,'SMTP Password.'),
  ('mail_smtp_port','25',1,'SMTP Port.'),
  ('mail_sender_email','i@me.com',1,'Email for \'sender\''),
  ('content_show_title','1',1,'show h1 content title'),
  ('content_show_time','1',1,'show content time. (publish, update, ...)'),
  ('content_show_author','1',1,'show content author.'),
  ('content_items_perpage','10',1,'number of posts per page.'),
  ('comment_allow',NULL,1,'allow site-wide new comment?\r\n0=no, 1=yes, null=up to each post\'s setting'),
  ('comment_show_notallow','0',1,'list old comments even if comment setting change to not allow new comment?\r\n0=not show, 1=show\r\nif 0 the system will not show comments when setting to not allow new comment.'),
  ('comment_perpage','40',1,'number of comments per page'),
  ('comment_new_notify_admin','1',1,'notify admin when new comment?\r\n0=no, 1=yes(require moderation only), 2=yes(all)'),
  ('comment_admin_notify_emails','i@me.com',1,'emails of administrators to notify when new comment or moderation required ?'),
  ('media_allowed_types','7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip',1,'media upload allowed file types.\r\nthese types must specified mime-type in config/mimes.php'),
  ('agni_version','1.4',1,'current Agni CMS version. use for compare with auto update.'),
  ('angi_auto_update','1',1,'enable auto update. recommended setting to \'true\' (1 = true, 0 = false) for use auto update, but if you want manual update (core hacking or custom modification through core files) set to false.'),
  ('agni_auto_update_url','http://agnicms.org/modules/updateservice/update.xml',1,'url of auto update.'),
  ('agni_system_cron','1',1,'agni system cron. set to true (1) if you want to run cron from system or set to false (0) if you already have real cron job call to http://yourdomain.tld/path-installed/cron .'),
  ('ftp_host','',1,'FTP host name. ftp is very useful in update/download files from remote host to current host.'),
  ('ftp_username','',1,'FTP username'),
  ('ftp_password','',1,'FTP password'),
  ('ftp_port','21',1,'FTP port. usually is 21'),
  ('ftp_passive','true',1,'FTP passive mode'),
  ('ftp_basepath','/public_html/',1,'FTP base path. store path to public html (web root)');

/*!40000 ALTER TABLE `an_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_data_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_data_account`;

CREATE TABLE `an_data_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `store_address` text NOT NULL,
  `province` varchar(255) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `name_shop` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_data_account` WRITE;
/*!40000 ALTER TABLE `an_data_account` DISABLE KEYS */;

INSERT INTO `an_data_account` (`id`, `name`, `surname`, `store_address`, `province`, `postal_code`, `category`, `username`, `email`, `image`, `password`, `name_shop`)
VALUES
  (7,'jirayu','','','','','0','','','','','');

/*!40000 ALTER TABLE `an_data_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_files`;

CREATE TABLE `an_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `folder` text COMMENT 'contain path to folder that store this file.',
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_client_name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_ext` varchar(50) DEFAULT NULL,
  `file_size` int(11) NOT NULL DEFAULT '0',
  `media_name` varchar(255) DEFAULT NULL COMMENT 'name this file for use in frontend.',
  `media_description` text,
  `media_keywords` varchar(255) DEFAULT NULL,
  `file_add` bigint(20) DEFAULT NULL,
  `file_add_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_frontpage_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_frontpage_category`;

CREATE TABLE `an_frontpage_category` (
  `tid` int(11) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_menu_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_menu_groups`;

CREATE TABLE `an_menu_groups` (
  `mg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(255) DEFAULT NULL,
  `mg_description` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_menu_items`;

CREATE TABLE `an_menu_items` (
  `mi_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `mg_id` int(11) DEFAULT NULL COMMENT 'menu group id',
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `mi_type` varchar(255) DEFAULT NULL COMMENT 'refer to post_type, tax_type, link, custom_link',
  `type_id` int(11) DEFAULT NULL,
  `link_url` text,
  `link_text` varchar(255) DEFAULT NULL,
  `custom_link` text COMMENT 'when normal link field doesn''t fullfill your need',
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mi_id`),
  KEY `mg_id` (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_module_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_module_sites`;

CREATE TABLE `an_module_sites` (
  `module_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `module_enable` int(1) NOT NULL DEFAULT '0',
  `module_install` int(1) NOT NULL DEFAULT '0' COMMENT 'use when the module want to install db, script or anything.',
  PRIMARY KEY (`module_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_module_sites` WRITE;
/*!40000 ALTER TABLE `an_module_sites` DISABLE KEYS */;

INSERT INTO `an_module_sites` (`module_site_id`, `module_id`, `site_id`, `module_enable`, `module_install`)
VALUES
  (1,1,1,1,0);

/*!40000 ALTER TABLE `an_module_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_modules`;

CREATE TABLE `an_modules` (
  `module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_system_name` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `module_version` varchar(30) DEFAULT NULL,
  `module_description` text,
  `module_author` varchar(255) DEFAULT NULL,
  `module_author_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_system_name` (`module_system_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_modules` WRITE;
/*!40000 ALTER TABLE `an_modules` DISABLE KEYS */;

INSERT INTO `an_modules` (`module_id`, `module_system_name`, `module_name`, `module_url`, `module_version`, `module_description`, `module_author`, `module_author_url`)
VALUES
  (1,'core','Agni core module.','http://www.agnicms.org',NULL,'Agni cms core module.','vee w.','http://okvee.net');

/*!40000 ALTER TABLE `an_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_post_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_post_fields`;

CREATE TABLE `an_post_fields` (
  `post_id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store each field of posts';



# Dump of table et_post_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_post_revision`;

CREATE TABLE `an_post_revision` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `header_value` text,
  `body_value` longtext,
  `body_summary` text,
  `log` text COMMENT 'explain that what was changed',
  `revision_date` bigint(20) DEFAULT NULL,
  `revision_date_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_posts`;

CREATE TABLE `an_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `post_type` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `post_uri` tinytext,
  `post_uri_encoded` text,
  `post_feature_image` int(11) DEFAULT NULL COMMENT 'refer to file id',
  `post_comment` int(1) NOT NULL DEFAULT '0' COMMENT 'allow comment? 0=no, 1=yes',
  `post_status` int(1) NOT NULL DEFAULT '1' COMMENT 'published? 0=no, 1=yes',
  `post_add` bigint(20) DEFAULT NULL,
  `post_add_gmt` bigint(20) DEFAULT NULL,
  `post_update` bigint(20) DEFAULT NULL,
  `post_update_gmt` bigint(20) DEFAULT NULL,
  `post_publish_date` bigint(20) DEFAULT NULL,
  `post_publish_date_gmt` bigint(20) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content_settings` text COMMENT 'store serialize array of settings',
  `comment_count` int(9) NOT NULL DEFAULT '0',
  `view_count` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='for content-type article, pages, static content.';



# Dump of table et_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_province`;

CREATE TABLE `an_province` (
  `id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name_province` text COLLATE utf8_unicode_ci,
  `name_province_en` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `an_province` WRITE;
/*!40000 ALTER TABLE `an_province` DISABLE KEYS */;

INSERT INTO `an_province` (`id`, `name_province`, `name_province_en`)
VALUES
  ('101','กระบี่','Krabi'),
  ('102','กรุงเทพมหานคร','Bangkok'),
  ('103','กาญจนบุรี','Kanchanaburi'),
  ('104','กาฬสินธุ์','Kalasin'),
  ('105','กำแพงเพชร','Kamphaeng Phet'),
  ('106','ขอนแก่น','Khon Kaen'),
  ('107','จันทบุรี','Chanthaburi'),
  ('108','ฉะเชิงเทรา','Chachoengsao'),
  ('109','ชลบุรี','Chon Buri'),
  ('110','ชัยนาท','Chai Nat'),
  ('111','ชัยภูมิ','Chaiyaphum'),
  ('112','ชุมพร','Chumphon'),
  ('113','ตรัง','Trang'),
  ('114','ตราด','Trat'),
  ('115','ตาก','Tak'),
  ('116','นครนายก','Nakhon Nayok'),
  ('117','นครปฐม','Nakhon Pathom'),
  ('118','นครพนม','Nakhon Phanom'),
  ('119','นครราชสีมา','Nakhon Ratchasima'),
  ('120','นครศรีธรรมราช','Nakhon Si Thammarat'),
  ('121','นครสวรรค์','Nakhon Sawan'),
  ('122','นนทบุรี','Nonthaburi'),
  ('123','นราธิวาส','Narathiwat'),
  ('124','น่าน','Nan'),
  ('125','บุรีรัมย์','Buri Ram'),
  ('126','ปทุมธานี','Pathum Thani'),
  ('127','ประจวบคีรีขันธ์','Prachuap Khiri Khan'),
  ('128','ปราจีนบุรี','Prachin Buri'),
  ('129','ปัตตานี','Pattani'),
  ('130','พระนครศรีอยุธยา','Phra Nakhon Si Ayutthaya'),
  ('131','พะเยา','Phayao'),
  ('132','พังงา','Phangnga'),
  ('133','พัทลุง','Phatthalung'),
  ('134','พิจิตร','Phichit'),
  ('135','พิษณุโลก','Phitsanulok'),
  ('136','ภูเก็ต','Phuket'),
  ('137','มหาสารคาม','Maha Sarakham'),
  ('138','มุกดาหาร','Mukdaharn'),
  ('139','ยะลา','Yala'),
  ('140','ยโสธร','Yasothon'),
  ('141','ระนอง','Ranong'),
  ('142','ระยอง','Rayong'),
  ('143','ราชบุรี','Ratchaburi'),
  ('144','ร้อยเอ็ด','Roi-ed'),
  ('145','ลพบุรี','Lop Buri'),
  ('146','ลำปาง','Lampang'),
  ('147','ลำพูน','Lampoon'),
  ('148','ศรีสะเกษ','Srisaket\n'),
  ('149','สกลนคร','Sakhon Nakhon'),
  ('150','สงขลา','Songkhla'),
  ('151','สตูล','Sathon'),
  ('152','สมุทรปราการ','Samut Prakan'),
  ('153','สมุทรสงคราม','Samut Songkhram'),
  ('154','สมุทรสาคร','Samut Sakhon'),
  ('155','สระบุรี','Sara Buri'),
  ('156','สระแก้ว','Sa Kaeo'),
  ('157','สิงห์บุรี','Sing Buri'),
  ('158','สุพรรณบุรี','Suphan Buri'),
  ('159','สุราษฎร์ธานี','Surat Thani'),
  ('160','สุรินทร์','Surin'),
  ('161','สุโขทัย','Sukhothai'),
  ('162','หนองคาย','Nong Khai'),
  ('163','หนองบัวลำภู','Nong Bua Lamphu'),
  ('164','อำนาจเจริญ','Amnat Charoen'),
  ('165','อุดรธานี','Udon Thani'),
  ('166','อุตรดิตถ์','Uttaradit'),
  ('167','อุทัยธานี','Uthai Thani'),
  ('168','อุบลราชธานี','Ubon Ratchathani'),
  ('169','อ่างทอง','Ang Thong'),
  ('170','เชียงราย','Chiang Rai'),
  ('171','เชียงใหม่','Chiang Mai'),
  ('172','เพชรบุรี','Phetchaburi'),
  ('173','เพชรบูรณ์','Phetchabun'),
  ('174','เลย','Loei'),
  ('175','แพร่','Prae'),
  ('176','แม่ฮ่องสอน','Mae Hong Son');

/*!40000 ALTER TABLE `an_province` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_queue`;

CREATE TABLE `an_queue` (
  `queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(255) DEFAULT NULL,
  `queue_data` longtext,
  `queue_create` bigint(20) DEFAULT NULL,
  `queue_update` bigint(20) DEFAULT NULL,
  `queue_expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store ''to do'' job queue.';



# Dump of table et_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_sites`;

CREATE TABLE `an_sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_domain` varchar(255) DEFAULT NULL COMMENT 'ex. domain.com, sub.domain.com with out http://',
  `site_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `site_create` bigint(20) DEFAULT NULL,
  `site_create_gmt` bigint(20) DEFAULT NULL,
  `site_update` bigint(20) DEFAULT NULL,
  `site_update_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_sites` WRITE;
/*!40000 ALTER TABLE `an_sites` DISABLE KEYS */;

INSERT INTO `an_sites` (`site_id`, `site_name`, `site_domain`, `site_status`, `site_create`, `site_create_gmt`, `site_update`, `site_update_gmt`)
VALUES
  (1,'Easytrade','easytrade.dev',1,1386696353,1386671153,1390795068,1390769868);

/*!40000 ALTER TABLE `an_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_syslog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_syslog`;

CREATE TABLE `an_syslog` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'system log id',
  `account_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `sl_type` varchar(100) DEFAULT NULL COMMENT 'log type. example system, user action',
  `sl_message` text,
  `sl_variables` longtext,
  `sl_url` tinytext COMMENT 'url of event.',
  `sl_referer` tinytext COMMENT 'url referer of event',
  `sl_ipaddress` varchar(50) DEFAULT NULL,
  `sl_datetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contain system log.';

LOCK TABLES `an_syslog` WRITE;
/*!40000 ALTER TABLE `an_syslog` DISABLE KEYS */;

INSERT INTO `an_syslog` (`sl_id`, `account_id`, `site_id`, `sl_type`, `sl_message`, `sl_variables`, `sl_url`, `sl_referer`, `sl_ipaddress`, `sl_datetime`)
VALUES
  (1,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:103:\"http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1481:\"an_csrf_cookie=6e3a64b6cd38412f785a7e5ddcf087c2; an_user_lang=th; csrf_cookie=8bbb77104e3b5f146ccbebfa0dc2c035; agni_install_verify=pass; agni_install_step2=pass; agni_install_step3=pass; ujD_HpMjl_cookie=fed804cf47f3a11a0c26222271189426; ujD_user_lang=th; PHPSESSID=7a1f1d5b2e033df7cf2a176546ba8f3f; ujD_ci_session=I%2FU1u%2FACWcSZTEnU7e1c3glDZZAftMIMgnw%2FOq%2FdIKDVmyqM4R%2BCS%2FhpzvR5mSjZ35Xu6KdiZBuyD9VV4HQteDpwvT%2FUnKj2YXF2V2vi4RAf3neIfqh5VJD%2FVXmC2HF8vAjRbIgmB93mqbhvNC4%2FMmxq4ZSz00aD61YDhr%2F3YGogC1irV4gxJIzpTqaRxcKzAbt2ZHzbU6qlwJYacbjty6fcQ13KzvmaYJEMxeFq7i7v%2B8D67cWY3W7VaHCDGYqjvt9R5QL%2B99rl9QiF1rnm251nFZGaSgTkVLYhNJHONLK0PUrqewo6FhXiQLEx3%2Bv7flhae8Kk69bNrF7dtsBSiJ5PTTEc%2FH4BzewYT2Pro0hALqlNBwMQkgZ94W8Kg7yZ; ujD_member_account=6pmCSTrPmjIxO8GhhdOViJCGY0k5d2DdPy3mv9xlJNrg5YLXSCGTkWvNILeG7LeMknoDmVGlMvdeqwbtZllx6Dgn1%2FW36%2BxJN1SJDCATJLyEIwPQ9vmNxME%2B9111QgqPD8HKhp99EybZGPzPdoN8vG6u6XC65TrB1WNQUKjJM%2FBshvvaDq4OXuT%2FaGca4%2BqJ%2Fg40VUef4F%2Bb1SY9QQhFla41rH%2Bnd%2FMsr24Q9rUMcG1oiMCp%2BM84DVLa10k7NC%2FLqypSWpnNaBT%2FNf9IKA8HPgp2AoGXDH7J3q8kbErJrYTPB60575J05thBebxbI7AsLc7bxhIuXDl9cQxZDfZpBw%3D%3D; ujD_admin_account=gpVDF90OxcgPVpM2M7rc8UE4wR%2FglvEplNssG%2F5iZ6NxN%2F50nhY2DEmgFw%2BCn7NZP0zDH1GEK%2FEXzDCHXn%2FXo39L59V%2FcBYGkSvHg6%2BTQ2L8rDFk54K7ep6B%2Bd4XfOaeL7bnjMSM%2Fsjdb%2Fg5aNtkzpUvTTQT%2F9iELfuIInHnFfYqyEyWreAkZL1C1V6%2BLh73n2SKhiaDQjzBQdKp3c%2F5oi1JDlx%2BE8yp05%2FK8DYmkRn4bDMQIXpQHjRTPm%2Bc3pIzYflwGfU29XZOse9yK1HnmlG0OnEilHZpicR%2FVi7zDNc%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"50429\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1386696395.9449999332427978515625;s:12:\"REQUEST_TIME\";i:1386696395;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://easytrade.dev/index.php/site-admin','http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin','127.0.0.1',1386696396),
  (2,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:103:\"http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1481:\"an_csrf_cookie=6e3a64b6cd38412f785a7e5ddcf087c2; an_user_lang=th; csrf_cookie=8bbb77104e3b5f146ccbebfa0dc2c035; agni_install_verify=pass; agni_install_step2=pass; agni_install_step3=pass; ujD_HpMjl_cookie=fed804cf47f3a11a0c26222271189426; ujD_user_lang=th; PHPSESSID=7a1f1d5b2e033df7cf2a176546ba8f3f; ujD_ci_session=I%2FU1u%2FACWcSZTEnU7e1c3glDZZAftMIMgnw%2FOq%2FdIKDVmyqM4R%2BCS%2FhpzvR5mSjZ35Xu6KdiZBuyD9VV4HQteDpwvT%2FUnKj2YXF2V2vi4RAf3neIfqh5VJD%2FVXmC2HF8vAjRbIgmB93mqbhvNC4%2FMmxq4ZSz00aD61YDhr%2F3YGogC1irV4gxJIzpTqaRxcKzAbt2ZHzbU6qlwJYacbjty6fcQ13KzvmaYJEMxeFq7i7v%2B8D67cWY3W7VaHCDGYqjvt9R5QL%2B99rl9QiF1rnm251nFZGaSgTkVLYhNJHONLK0PUrqewo6FhXiQLEx3%2Bv7flhae8Kk69bNrF7dtsBSiJ5PTTEc%2FH4BzewYT2Pro0hALqlNBwMQkgZ94W8Kg7yZ; ujD_member_account=6pmCSTrPmjIxO8GhhdOViJCGY0k5d2DdPy3mv9xlJNrg5YLXSCGTkWvNILeG7LeMknoDmVGlMvdeqwbtZllx6Dgn1%2FW36%2BxJN1SJDCATJLyEIwPQ9vmNxME%2B9111QgqPD8HKhp99EybZGPzPdoN8vG6u6XC65TrB1WNQUKjJM%2FBshvvaDq4OXuT%2FaGca4%2BqJ%2Fg40VUef4F%2Bb1SY9QQhFla41rH%2Bnd%2FMsr24Q9rUMcG1oiMCp%2BM84DVLa10k7NC%2FLqypSWpnNaBT%2FNf9IKA8HPgp2AoGXDH7J3q8kbErJrYTPB60575J05thBebxbI7AsLc7bxhIuXDl9cQxZDfZpBw%3D%3D; ujD_admin_account=gpVDF90OxcgPVpM2M7rc8UE4wR%2FglvEplNssG%2F5iZ6NxN%2F50nhY2DEmgFw%2BCn7NZP0zDH1GEK%2FEXzDCHXn%2FXo39L59V%2FcBYGkSvHg6%2BTQ2L8rDFk54K7ep6B%2Bd4XfOaeL7bnjMSM%2Fsjdb%2Fg5aNtkzpUvTTQT%2F9iELfuIInHnFfYqyEyWreAkZL1C1V6%2BLh73n2SKhiaDQjzBQdKp3c%2F5oi1JDlx%2BE8yp05%2FK8DYmkRn4bDMQIXpQHjRTPm%2Bc3pIzYflwGfU29XZOse9yK1HnmlG0OnEilHZpicR%2FVi7zDNc%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"50429\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1386696395.9449999332427978515625;s:12:\"REQUEST_TIME\";i:1386696395;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://easytrade.dev/index.php/site-admin','http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin','127.0.0.1',1386696396),
  (3,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuFFhj0vCvcAAEmjX@cAAAAF\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1343:\"__utma=101002065.1543137600.1369590710.1372264876.1372269965.12; _ga=GA1.2.1543137600.1369590710; ujD_HpMjl_cookie=e51fee8f44258563b1da234a2cb0fb77; ujD_user_lang=th; PHPSESSID=5fretmseff805h4edbnrn3qoe2; ujD_ci_session=NJeirwha1xZHsuxc67sZI8H5FQPBU1nRBoP2TO70zL7oLNJPxVr2WfPzbkSB%2Fz%2FkDpX8DUK1qT8GdSv4tKux3vzuoMfBckEGg9v36tuE0EFJs%2Fk55QAhejWeiBxKVSwJfp0TAwHmKV2ilg4Tme7Z6Q5WRsvNOI5cHqjH4BzFeoJhVgBZcZs5Bl5u1bgKJ0UYIS8J2mi2UW%2F3Pm7jL8rGHaBMdvvpx5%2BoLl3fB7gTrzvUC8kl%2FzyKsyvVsgTMM4Nmm5AeTyquN2mO4LL%2BmdMFl4tDBkih5e7MKNWJwNC2HqQOPlx5K3sO6MXGSe5rsBt0QiiaLXWWHSUoc6%2BMlXSvGv%2FjFIyRbr4hGdW4sQIEa%2FFQ47ka1HEHjlvSAxcaejcJ; ujD_member_account=Cjb0dvS7HktJiRjdG9RG6pfqWF3GeZBJytNttDCAX8wCtaVx88k%2Botj5GI7WU70Z7MFN9hwPm%2B6rJ69CGxPYN%2FQpZ8IroRJexmVkPGKMu4ju7AyhRpR0QFYsUcikA16I4uJjT3PeP%2FzlVJeCLtgZgR6RYWikV1XIrqRDYcxE4pW1uF9HdiiGvvjJ3tLMaolepQ7rCQaw4YTAiXhfVZhum40WgK9jUA9cNZwfrxhFodv1OzYpiV20kNmY2Wh2C7Uq%2FuSJjGeZqvvEBdqhGnGUM6nx2W86kBIRuJ83Ch4TywgBonm%2Bpa1Ow%2Bdxr0ylQYSbAzduefGLAaNbhwue4cN2sQ%3D%3D; ujD_admin_account=LdByF%2FifU7bk%2BPvyvtZAQMWaX0E9zh9yPwZGWqDXH06BKS1C46Rx1ayxEmP980ss59eiHGREHcdfu7PLTsEJI4QqIotKL06M6VPLHg89AoYOJWEC4S8zlBbxuqHu%2FoKV34s7ZonOCbj2GKsF2BlimZaiqy7j5kXjoXbCcsG7tKambVrN3vVpEcJUTa5kq9xkpZ9l81nc6PS4zy3d5GS6CG%2BbrZCa9aTs23O6EKfC%2Bn3FFtADLzP1FJJcGNoh38t9WxNeEehTQoywiClsLA%2BPjWWESZfyXmDxh%2BDIByzb0WA%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"171.98.171.137\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52084\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390495110;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.98.171.137',1390495110),
  (4,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuFFhj0vCvcAAEmjX@cAAAAF\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1343:\"__utma=101002065.1543137600.1369590710.1372264876.1372269965.12; _ga=GA1.2.1543137600.1369590710; ujD_HpMjl_cookie=e51fee8f44258563b1da234a2cb0fb77; ujD_user_lang=th; PHPSESSID=5fretmseff805h4edbnrn3qoe2; ujD_ci_session=NJeirwha1xZHsuxc67sZI8H5FQPBU1nRBoP2TO70zL7oLNJPxVr2WfPzbkSB%2Fz%2FkDpX8DUK1qT8GdSv4tKux3vzuoMfBckEGg9v36tuE0EFJs%2Fk55QAhejWeiBxKVSwJfp0TAwHmKV2ilg4Tme7Z6Q5WRsvNOI5cHqjH4BzFeoJhVgBZcZs5Bl5u1bgKJ0UYIS8J2mi2UW%2F3Pm7jL8rGHaBMdvvpx5%2BoLl3fB7gTrzvUC8kl%2FzyKsyvVsgTMM4Nmm5AeTyquN2mO4LL%2BmdMFl4tDBkih5e7MKNWJwNC2HqQOPlx5K3sO6MXGSe5rsBt0QiiaLXWWHSUoc6%2BMlXSvGv%2FjFIyRbr4hGdW4sQIEa%2FFQ47ka1HEHjlvSAxcaejcJ; ujD_member_account=Cjb0dvS7HktJiRjdG9RG6pfqWF3GeZBJytNttDCAX8wCtaVx88k%2Botj5GI7WU70Z7MFN9hwPm%2B6rJ69CGxPYN%2FQpZ8IroRJexmVkPGKMu4ju7AyhRpR0QFYsUcikA16I4uJjT3PeP%2FzlVJeCLtgZgR6RYWikV1XIrqRDYcxE4pW1uF9HdiiGvvjJ3tLMaolepQ7rCQaw4YTAiXhfVZhum40WgK9jUA9cNZwfrxhFodv1OzYpiV20kNmY2Wh2C7Uq%2FuSJjGeZqvvEBdqhGnGUM6nx2W86kBIRuJ83Ch4TywgBonm%2Bpa1Ow%2Bdxr0ylQYSbAzduefGLAaNbhwue4cN2sQ%3D%3D; ujD_admin_account=LdByF%2FifU7bk%2BPvyvtZAQMWaX0E9zh9yPwZGWqDXH06BKS1C46Rx1ayxEmP980ss59eiHGREHcdfu7PLTsEJI4QqIotKL06M6VPLHg89AoYOJWEC4S8zlBbxuqHu%2FoKV34s7ZonOCbj2GKsF2BlimZaiqy7j5kXjoXbCcsG7tKambVrN3vVpEcJUTa5kq9xkpZ9l81nc6PS4zy3d5GS6CG%2BbrZCa9aTs23O6EKfC%2Bn3FFtADLzP1FJJcGNoh38t9WxNeEehTQoywiClsLA%2BPjWWESZfyXmDxh%2BDIByzb0WA%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"171.98.171.137\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52084\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390495110;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.98.171.137',1390495111),
  (5,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuT5-T0vCvcAACJTj9AAAABS\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1355:\"__utma=101002065.1543137600.1369590710.1372264876.1372269965.12; _ga=GA1.2.1543137600.1369590710; ujD_HpMjl_cookie=3715e80c4b4594c24dfb55b0a3922cd8; ujD_user_lang=th; PHPSESSID=8100aafv6u2h39p10kv0032j77; ujD_ci_session=ADxEOyA%2B6eZwVf6x3pvBMOgLt4Kv18zE2d06YPDwB%2F2bQ8IIvTeuErNerfRmOVyqlqed%2Fhe%2BHwVTpbUGiULe7nlF2KJXjCeGkhKjKrq1V99KWMdZspMFvaumvm6b4FjFxUKIGB%2B%2FqBT7bg52bzrf11MxfPlPnIZr%2FWfM19ndqFcIjvHzGSIfSNprUs2%2FDrnEtg7k18qZbnoVRtIPn%2Fd1pCaNDNmge3ZHVZsSfsP1rY0mMIEc1pvwl4bmN6dnNi1hrZ7aHsBWnHRMgIgff1dBu8J2psbS5OOSXvZQLUYRO2WY7Eeu4aXH7plEWLdFiJJezyoep3944eeMYyIg1QM4Pv%2Fq4ohyp6UxTrB5ubPtd0L6fJILlYLDOrIA56LqezEY; ujD_member_account=9%2BOWH2LiFaqOTn9JltCx8u1t6Dh30NS%2BooZ4wf4tGhAqS4sHD%2BdcZ2RbnQIx8e5XQSRCitV3VBw4gfLWp8l9v7lsQqtEryP7D2a04vj%2BMFGuBYiLp6KACfvXpSV5vIZeCbhvbM40Lkc6BDkpoNspZ5x8t2JgLVyzU%2BTvUvmRxz8%2BzGeIbCtjkYtjwoaOCxdKkmVsrVz8p3BlkRObhKzd9xg%2FnzNzug2hUbJ1CbbROk3ifKVBFK0f2f6Ac4byKLCG5wHUa%2Fs%2FPfmaJ6IQzK5c2hitcGykvu1fiWskgeOlEmO%2BhMoMS3U2T%2BFGo8BEqkuag5m34bLU6afwnFl%2Be1SNjQ%3D%3D; ujD_admin_account=fc8wCQqxpB%2BKIm45o4IguPZ%2BbGzKWbkkGki0wAqSe6zzg%2FtDpsswfAgMtgNXiuCndFcNNM%2B4wNkqLtSGMbcqIHxYi%2FVd0z4etDpX0xv6xmphCBk%2Bg7D5y2xMdDc06OWJVj9C7nEQj6FKU2AJg0xS37s0f67HzprkHtebOcIzWnHFqdT1roBDm5vuWOZ2rMnZ2cQHRybVbfXilCHAvrfhp6xXylZwCAhuO6WpG8bkP4581%2FaY%2BdKYStHIYQK6tvUMpXW5SSZmHP5UeHnfvKItp1UqdqytIQ6pagQQbTSMnmQ%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:11:\"58.10.143.3\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"55577\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390737917;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','58.10.143.3',1390737917),
  (6,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuT5-T0vCvcAACJTj9AAAABS\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1355:\"__utma=101002065.1543137600.1369590710.1372264876.1372269965.12; _ga=GA1.2.1543137600.1369590710; ujD_HpMjl_cookie=3715e80c4b4594c24dfb55b0a3922cd8; ujD_user_lang=th; PHPSESSID=8100aafv6u2h39p10kv0032j77; ujD_ci_session=ADxEOyA%2B6eZwVf6x3pvBMOgLt4Kv18zE2d06YPDwB%2F2bQ8IIvTeuErNerfRmOVyqlqed%2Fhe%2BHwVTpbUGiULe7nlF2KJXjCeGkhKjKrq1V99KWMdZspMFvaumvm6b4FjFxUKIGB%2B%2FqBT7bg52bzrf11MxfPlPnIZr%2FWfM19ndqFcIjvHzGSIfSNprUs2%2FDrnEtg7k18qZbnoVRtIPn%2Fd1pCaNDNmge3ZHVZsSfsP1rY0mMIEc1pvwl4bmN6dnNi1hrZ7aHsBWnHRMgIgff1dBu8J2psbS5OOSXvZQLUYRO2WY7Eeu4aXH7plEWLdFiJJezyoep3944eeMYyIg1QM4Pv%2Fq4ohyp6UxTrB5ubPtd0L6fJILlYLDOrIA56LqezEY; ujD_member_account=9%2BOWH2LiFaqOTn9JltCx8u1t6Dh30NS%2BooZ4wf4tGhAqS4sHD%2BdcZ2RbnQIx8e5XQSRCitV3VBw4gfLWp8l9v7lsQqtEryP7D2a04vj%2BMFGuBYiLp6KACfvXpSV5vIZeCbhvbM40Lkc6BDkpoNspZ5x8t2JgLVyzU%2BTvUvmRxz8%2BzGeIbCtjkYtjwoaOCxdKkmVsrVz8p3BlkRObhKzd9xg%2FnzNzug2hUbJ1CbbROk3ifKVBFK0f2f6Ac4byKLCG5wHUa%2Fs%2FPfmaJ6IQzK5c2hitcGykvu1fiWskgeOlEmO%2BhMoMS3U2T%2BFGo8BEqkuag5m34bLU6afwnFl%2Be1SNjQ%3D%3D; ujD_admin_account=fc8wCQqxpB%2BKIm45o4IguPZ%2BbGzKWbkkGki0wAqSe6zzg%2FtDpsswfAgMtgNXiuCndFcNNM%2B4wNkqLtSGMbcqIHxYi%2FVd0z4etDpX0xv6xmphCBk%2Bg7D5y2xMdDc06OWJVj9C7nEQj6FKU2AJg0xS37s0f67HzprkHtebOcIzWnHFqdT1roBDm5vuWOZ2rMnZ2cQHRybVbfXilCHAvrfhp6xXylZwCAhuO6WpG8bkP4581%2FaY%2BdKYStHIYQK6tvUMpXW5SSZmHP5UeHnfvKItp1UqdqytIQ6pagQQbTSMnmQ%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:11:\"58.10.143.3\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"55577\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390737917;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','58.10.143.3',1390737917),
  (7,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuUwjz0vCvcAAC1IPrUAAABM\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1239:\"ujD_HpMjl_cookie=958a51356a13e810c09c62e453d68639; ujD_user_lang=th; PHPSESSID=gb926a0rbvbnv58pntl07mcj90; ujD_ci_session=9NsV8pYxLjsQTRPAyX6ZZXlc0mtU0rkczwc7R57eZTmhyowOrUkATohscc6UHN56Fo9FDhUtxTs6sTkEraPVws0krVPd92QlYugzCJEkey7A9lSUouOsBd%2BpL63VBB8cAp9Ttm2ceR0EETxRdM2AAVSwGTCAWdTNuHAU8tDZ1ODzyTK3reAp2GR0MVfDMiMXDjDL7QewI9X8N99Y1Yo6uZKeP1SyutBCQlqR1RahoxRYHRWainDUfJZP5uJoEcFtHQ7xNcvJQBcYpCi1FS5GaYd61z%2FexQCqdqqbhX5J7e%2FGzF4hfD9TxHhJh4q%2B6ZnWiGIJpRzmmgJChjmpm7AB0D4N1y5ffUSytWh9YHZsR58JDvWLI%2F1SFj9YM00zLuN5; ujD_member_account=TJRrHTbNG1%2Bin4PTeQgU8IwtyJ4Y56kTwVkZE4q5kWejKt18dDiliRFm7txm2YouEOTKzyNJcPYcKCdm0bHRc%2FNqku1DL8bZCvpgZLJMZdbjCqxjbLtfC8JB8XSok8r9q9VXwvzspR%2FkY2vkWNU20rSIz6U5Au%2FM3yks0oK5YpP%2F1xzCjn9Hx3xJMiJPVFcXuP4OkopqsLpdL4d2NdMqKG1z2zIPpx9Fwi7IZpzT93E09wYVJWJl5Gad%2BQJTIyREK%2BYIxEkDbHII24My48RP2H5Hr7DbQteQlGROUVHYQCRIcZyqkQjHI56rxKpv1OPkrz8pRHgqvo4O2oBlVDJHeg%3D%3D; ujD_admin_account=X6OV9ThdW1ZeyG23gPGJ3u0v3KS%2F0xy3NktH48zm46Mmw4wzaOq2Wh%2FSvlk4KbQyCfoTsIeo7O8DdT7hZ%2FnRtVq6Wpwl%2Fvki%2FLkjZgPLWJMBzWGTub5zo7SuJmZJq3SNZHY22hvqucw4%2BSHGL0PPAtebNSjC7QlypB%2BIRe9teF08rpHFujmLpt6GocisQWfZG0Skie2OSLxCxh5LOpsKTXcgoGDSei5pf%2Fu0pRCZ2ezfJJHs4vUjt%2F74FFLZpXr2IJrkLHu6WRqngZOgt98d0Rt2qULlxx7LopCJeSvjY1k%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"171.5.250.89\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"24082\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390751887;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.89',1390751887),
  (8,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuUwjz0vCvcAAC1IPrUAAABM\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1239:\"ujD_HpMjl_cookie=958a51356a13e810c09c62e453d68639; ujD_user_lang=th; PHPSESSID=gb926a0rbvbnv58pntl07mcj90; ujD_ci_session=9NsV8pYxLjsQTRPAyX6ZZXlc0mtU0rkczwc7R57eZTmhyowOrUkATohscc6UHN56Fo9FDhUtxTs6sTkEraPVws0krVPd92QlYugzCJEkey7A9lSUouOsBd%2BpL63VBB8cAp9Ttm2ceR0EETxRdM2AAVSwGTCAWdTNuHAU8tDZ1ODzyTK3reAp2GR0MVfDMiMXDjDL7QewI9X8N99Y1Yo6uZKeP1SyutBCQlqR1RahoxRYHRWainDUfJZP5uJoEcFtHQ7xNcvJQBcYpCi1FS5GaYd61z%2FexQCqdqqbhX5J7e%2FGzF4hfD9TxHhJh4q%2B6ZnWiGIJpRzmmgJChjmpm7AB0D4N1y5ffUSytWh9YHZsR58JDvWLI%2F1SFj9YM00zLuN5; ujD_member_account=TJRrHTbNG1%2Bin4PTeQgU8IwtyJ4Y56kTwVkZE4q5kWejKt18dDiliRFm7txm2YouEOTKzyNJcPYcKCdm0bHRc%2FNqku1DL8bZCvpgZLJMZdbjCqxjbLtfC8JB8XSok8r9q9VXwvzspR%2FkY2vkWNU20rSIz6U5Au%2FM3yks0oK5YpP%2F1xzCjn9Hx3xJMiJPVFcXuP4OkopqsLpdL4d2NdMqKG1z2zIPpx9Fwi7IZpzT93E09wYVJWJl5Gad%2BQJTIyREK%2BYIxEkDbHII24My48RP2H5Hr7DbQteQlGROUVHYQCRIcZyqkQjHI56rxKpv1OPkrz8pRHgqvo4O2oBlVDJHeg%3D%3D; ujD_admin_account=X6OV9ThdW1ZeyG23gPGJ3u0v3KS%2F0xy3NktH48zm46Mmw4wzaOq2Wh%2FSvlk4KbQyCfoTsIeo7O8DdT7hZ%2FnRtVq6Wpwl%2Fvki%2FLkjZgPLWJMBzWGTub5zo7SuJmZJq3SNZHY22hvqucw4%2BSHGL0PPAtebNSjC7QlypB%2BIRe9teF08rpHFujmLpt6GocisQWfZG0Skie2OSLxCxh5LOpsKTXcgoGDSei5pf%2Fu0pRCZ2ezfJJHs4vUjt%2F74FFLZpXr2IJrkLHu6WRqngZOgt98d0Rt2qULlxx7LopCJeSvjY1k%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"171.5.250.89\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"24082\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390751887;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.89',1390751887),
  (9,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuW72z0vCvcAAERM07kAAAAg\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1275:\"PHPSESSID=gb926a0rbvbnv58pntl07mcj90; ujD_HpMjl_cookie=88a9f191f0cbd950abf88774e3ebb957; ujD_user_lang=th; ujD_ci_session=FJDJrtmNGkdzJ0%2BRqTSI6lCrdoR%2BT80lnjZrDFeTr553qRrQmP96gkyCY6aSWOaXRBlk1wZEL8VcACv2%2FtUZ8V%2FaRsnmV%2FIjnxjMY392ropKhyBeT9VFZHz%2BgbPsuS0rb5fmMPqiksTvxUmjfFKikBiCBnczV4yp74B8NROne0LVn28XaLh0HFMkPEvwsFdRwyoUQVgWauisoBQvLI1LeFU%2FG38XfCZlUvFbcgpS%2BvbVBphlIhMCRff4BW9%2F2kjODmLvNZO004BywSiC%2B17dVoS4VQ0s2zzolbiLxBCBqbVBM8s%2BCcAUgDkALjnsOZU%2BLFLSueJ%2BZzs38x6Lrm0a968Fd6HdDi4hkO%2BC9%2BFXQP6bpRn5ad8xFKagcl7MbN9z; ujD_member_account=F%2BYdNt9caFPSrkxw%2BlomDm1uq5PrqskKnEiSj%2BfStxhLtjvNUFXMUutKcpmYETsEk5oNxsqlvyD9sqhQc9MGs%2Fw3%2B0l5pkeH0HqgpUBBFMjlK5voyIl2wtMGCxwdyrEVBKJdOT1rHnZAoaUWYKla7JAXJM0NOSz3hIoQDTe%2BLS7nB9vbi%2ByZgrAXiPORBNPo3%2BVBDqtXd%2F5MA%2BEIVDEua7XmwrllslSSmVqxeVarUWfaa1fhqplKUQeZbCdfEROCnkvasPJMkBWjzY7UXG13i6ZOm35PxhqjFEbrWDEcveEkLn0jXkWanzYUJ7FjuYZl3bI9p%2F3zZydL6GBoDE7%2FdA%3D%3D; ujD_admin_account=BsBNbtzKgdklhtYswoxGspwZ8PTl3H7lKDSAgvybIdCb6CQeVI4DzBXpG%2BaMaGEiLhvcGNrOSfF5xtz%2FTXsl%2Bf5MSuT0oHqXsVTAiUL3dh0gW%2FaA2EQFWkwQDuiVtc1PqGS%2FRa0D9WIieYGhPaYPByTrq1VTO6cvKzoMBKnSL6JuuSd2Jn3%2F7bGPlz8m4x2hfszokXsCtCOHqI8M3p%2B3UOI2Z45giyT%2FtIoQhkB1MmuJxKLX7l%2FPDT4X7W6kqBmWdrdFcCSUw2V07%2Fbq7AWY6quRUOCEbf%2BP%2BJ2C3d0Fq6I%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"171.5.250.89\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"18027\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390787547;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.89',1390787548),
  (10,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuW72z0vCvcAAERM07kAAAAg\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1275:\"PHPSESSID=gb926a0rbvbnv58pntl07mcj90; ujD_HpMjl_cookie=88a9f191f0cbd950abf88774e3ebb957; ujD_user_lang=th; ujD_ci_session=FJDJrtmNGkdzJ0%2BRqTSI6lCrdoR%2BT80lnjZrDFeTr553qRrQmP96gkyCY6aSWOaXRBlk1wZEL8VcACv2%2FtUZ8V%2FaRsnmV%2FIjnxjMY392ropKhyBeT9VFZHz%2BgbPsuS0rb5fmMPqiksTvxUmjfFKikBiCBnczV4yp74B8NROne0LVn28XaLh0HFMkPEvwsFdRwyoUQVgWauisoBQvLI1LeFU%2FG38XfCZlUvFbcgpS%2BvbVBphlIhMCRff4BW9%2F2kjODmLvNZO004BywSiC%2B17dVoS4VQ0s2zzolbiLxBCBqbVBM8s%2BCcAUgDkALjnsOZU%2BLFLSueJ%2BZzs38x6Lrm0a968Fd6HdDi4hkO%2BC9%2BFXQP6bpRn5ad8xFKagcl7MbN9z; ujD_member_account=F%2BYdNt9caFPSrkxw%2BlomDm1uq5PrqskKnEiSj%2BfStxhLtjvNUFXMUutKcpmYETsEk5oNxsqlvyD9sqhQc9MGs%2Fw3%2B0l5pkeH0HqgpUBBFMjlK5voyIl2wtMGCxwdyrEVBKJdOT1rHnZAoaUWYKla7JAXJM0NOSz3hIoQDTe%2BLS7nB9vbi%2ByZgrAXiPORBNPo3%2BVBDqtXd%2F5MA%2BEIVDEua7XmwrllslSSmVqxeVarUWfaa1fhqplKUQeZbCdfEROCnkvasPJMkBWjzY7UXG13i6ZOm35PxhqjFEbrWDEcveEkLn0jXkWanzYUJ7FjuYZl3bI9p%2F3zZydL6GBoDE7%2FdA%3D%3D; ujD_admin_account=BsBNbtzKgdklhtYswoxGspwZ8PTl3H7lKDSAgvybIdCb6CQeVI4DzBXpG%2BaMaGEiLhvcGNrOSfF5xtz%2FTXsl%2Bf5MSuT0oHqXsVTAiUL3dh0gW%2FaA2EQFWkwQDuiVtc1PqGS%2FRa0D9WIieYGhPaYPByTrq1VTO6cvKzoMBKnSL6JuuSd2Jn3%2F7bGPlz8m4x2hfszokXsCtCOHqI8M3p%2B3UOI2Z45giyT%2FtIoQhkB1MmuJxKLX7l%2FPDT4X7W6kqBmWdrdFcCSUw2V07%2Fbq7AWY6quRUOCEbf%2BP%2BJ2C3d0Fq6I%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"171.5.250.89\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"18027\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390787547;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.89',1390787548),
  (11,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuXYMz0vCvcAAF6BcRkAAABq\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1433:\"__utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=XtX8E9KAoublSt2AsAc7KYOHb6P8iht1Dbtu83aEAYPBmI3qEh9Fru2xCBN3guKeVf6F2IqEMEZ5MMSSi6fDRi%2B%2FzuPPa0aG0TNwpsOBe6B7FNkbx2w5BTl6uzBY02%2BA3DlPPBPciVfE%2FE9enbHdICVEepWRtG%2F0UwOOV%2FNXMOED65WTTVf7tK3zI55ttmYWz266Yrt8nva8g8CRGMOVbtC3czaUq%2BEImOfEs0qWCDupKy4%2BeoSWOt7IUqpbROCy%2B29AWqWwAZGpfAgpeLk0iBAdHJS%2BmOfYhQO5gjmEUmUW%2B7vHiZtWkLMVGDs8wwgu5sIAP2qoas1h6YF%2B8wCbXIsZl3zh23lUSRWmE3wekKUw9kWBeb1tbpueL4Ec35vu; ujD_member_account=zLc94ds5sew0uU5Ukv6LfEhJ6qcs%2FXqw4JoOtOsR0iIo90F5EV9mH4r%2F2agkyTnXX0yvMP5XkQKTD5aBon6%2BsprFygqyFtKClTNRyXP0CZY5fqYBvIaT6bBeOISBAXxiv5%2F%2F5uirpcunMBg8gpdNbNA5XC0S6ab%2Bap9P%2FejQo2IN%2Fljr9ADNVR6hUkI7nx1ftFTlzStilAhDN2OIQRYftXh42z740jMXISpr6b6cxwDFCS6yYZe%2BVsC2VCm2ZiCMGView8Fatqht53XY58VTghqLadWTj45p%2FpQItHCONZT4A%2B1nTwUE99qMTJf6MoOx9hgW4stYrh%2BV9X1f3XBo4Q%3D%3D; ujD_admin_account=NbEBYhivVmsNfx16WMeSY0HBPiuzT3efWdmKDlxTMQtzpkycfEfDYxbvTk92T7oPNAlivcQD2fecBzFGBvIxIIW2FCtDhp8gQ55n3%2Fk2kmX8Alpt2VwUsJV4lYSKSYOpImhzYDng1u94lvoZlzundX2j0XgRAJcITJlrwuAH0Det4hBXiEddTDw6NcffGGJfDkWROyB%2FuGUdIQgc%2B8mBdRXkPP6izWc2%2BPRw5T4BDEYSns%2FWrm%2BfKtQTIRx7w8dUDyVj5q%2BejczepDnCOCxILoCkIJJqdFRi5tQAdNz6Wbw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52229\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390794803;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','110.77.211.127',1390794804),
  (12,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:31:{s:9:\"UNIQUE_ID\";s:24:\"UuXYMz0vCvcAAF6BcRkAAABq\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1433:\"__utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=XtX8E9KAoublSt2AsAc7KYOHb6P8iht1Dbtu83aEAYPBmI3qEh9Fru2xCBN3guKeVf6F2IqEMEZ5MMSSi6fDRi%2B%2FzuPPa0aG0TNwpsOBe6B7FNkbx2w5BTl6uzBY02%2BA3DlPPBPciVfE%2FE9enbHdICVEepWRtG%2F0UwOOV%2FNXMOED65WTTVf7tK3zI55ttmYWz266Yrt8nva8g8CRGMOVbtC3czaUq%2BEImOfEs0qWCDupKy4%2BeoSWOt7IUqpbROCy%2B29AWqWwAZGpfAgpeLk0iBAdHJS%2BmOfYhQO5gjmEUmUW%2B7vHiZtWkLMVGDs8wwgu5sIAP2qoas1h6YF%2B8wCbXIsZl3zh23lUSRWmE3wekKUw9kWBeb1tbpueL4Ec35vu; ujD_member_account=zLc94ds5sew0uU5Ukv6LfEhJ6qcs%2FXqw4JoOtOsR0iIo90F5EV9mH4r%2F2agkyTnXX0yvMP5XkQKTD5aBon6%2BsprFygqyFtKClTNRyXP0CZY5fqYBvIaT6bBeOISBAXxiv5%2F%2F5uirpcunMBg8gpdNbNA5XC0S6ab%2Bap9P%2FejQo2IN%2Fljr9ADNVR6hUkI7nx1ftFTlzStilAhDN2OIQRYftXh42z740jMXISpr6b6cxwDFCS6yYZe%2BVsC2VCm2ZiCMGView8Fatqht53XY58VTghqLadWTj45p%2FpQItHCONZT4A%2B1nTwUE99qMTJf6MoOx9hgW4stYrh%2BV9X1f3XBo4Q%3D%3D; ujD_admin_account=NbEBYhivVmsNfx16WMeSY0HBPiuzT3efWdmKDlxTMQtzpkycfEfDYxbvTk92T7oPNAlivcQD2fecBzFGBvIxIIW2FCtDhp8gQ55n3%2Fk2kmX8Alpt2VwUsJV4lYSKSYOpImhzYDng1u94lvoZlzundX2j0XgRAJcITJlrwuAH0Det4hBXiEddTDw6NcffGGJfDkWROyB%2FuGUdIQgc%2B8mBdRXkPP6izWc2%2BPRw5T4BDEYSns%2FWrm%2BfKtQTIRx7w8dUDyVj5q%2BejczepDnCOCxILoCkIJJqdFRi5tQAdNz6Wbw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52229\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390794803;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','110.77.211.127',1390794804),
  (13,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"UNIQUE_ID\";s:24:\"UuXYTj0vCvcAAF5NPRgAAAAw\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:63:\"http://easytrade.abstractcodify.com/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1446:\"ui-tabs-1=1; __utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=XtX8E9KAoublSt2AsAc7KYOHb6P8iht1Dbtu83aEAYPBmI3qEh9Fru2xCBN3guKeVf6F2IqEMEZ5MMSSi6fDRi%2B%2FzuPPa0aG0TNwpsOBe6B7FNkbx2w5BTl6uzBY02%2BA3DlPPBPciVfE%2FE9enbHdICVEepWRtG%2F0UwOOV%2FNXMOED65WTTVf7tK3zI55ttmYWz266Yrt8nva8g8CRGMOVbtC3czaUq%2BEImOfEs0qWCDupKy4%2BeoSWOt7IUqpbROCy%2B29AWqWwAZGpfAgpeLk0iBAdHJS%2BmOfYhQO5gjmEUmUW%2B7vHiZtWkLMVGDs8wwgu5sIAP2qoas1h6YF%2B8wCbXIsZl3zh23lUSRWmE3wekKUw9kWBeb1tbpueL4Ec35vu; ujD_member_account=zLc94ds5sew0uU5Ukv6LfEhJ6qcs%2FXqw4JoOtOsR0iIo90F5EV9mH4r%2F2agkyTnXX0yvMP5XkQKTD5aBon6%2BsprFygqyFtKClTNRyXP0CZY5fqYBvIaT6bBeOISBAXxiv5%2F%2F5uirpcunMBg8gpdNbNA5XC0S6ab%2Bap9P%2FejQo2IN%2Fljr9ADNVR6hUkI7nx1ftFTlzStilAhDN2OIQRYftXh42z740jMXISpr6b6cxwDFCS6yYZe%2BVsC2VCm2ZiCMGView8Fatqht53XY58VTghqLadWTj45p%2FpQItHCONZT4A%2B1nTwUE99qMTJf6MoOx9hgW4stYrh%2BV9X1f3XBo4Q%3D%3D; ujD_admin_account=NbEBYhivVmsNfx16WMeSY0HBPiuzT3efWdmKDlxTMQtzpkycfEfDYxbvTk92T7oPNAlivcQD2fecBzFGBvIxIIW2FCtDhp8gQ55n3%2Fk2kmX8Alpt2VwUsJV4lYSKSYOpImhzYDng1u94lvoZlzundX2j0XgRAJcITJlrwuAH0Det4hBXiEddTDw6NcffGGJfDkWROyB%2FuGUdIQgc%2B8mBdRXkPP6izWc2%2BPRw5T4BDEYSns%2FWrm%2BfKtQTIRx7w8dUDyVj5q%2BejczepDnCOCxILoCkIJJqdFRi5tQAdNz6Wbw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1237\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52242\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:12:\"REQUEST_TIME\";i:1390794830;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:36:{s:9:\"site_name\";s:9:\"Easytrade\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:5:\"10000\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin/config','http://easytrade.abstractcodify.com/index.php/site-admin/config','110.77.211.127',1390794830),
  (14,1,1,'multisite','Update site','a:5:{s:16:\"server_variables\";a:33:{s:9:\"UNIQUE_ID\";s:24:\"UuXYTj0vCvcAAF5NPRgAAAAw\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:63:\"http://easytrade.abstractcodify.com/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1446:\"ui-tabs-1=1; __utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=XtX8E9KAoublSt2AsAc7KYOHb6P8iht1Dbtu83aEAYPBmI3qEh9Fru2xCBN3guKeVf6F2IqEMEZ5MMSSi6fDRi%2B%2FzuPPa0aG0TNwpsOBe6B7FNkbx2w5BTl6uzBY02%2BA3DlPPBPciVfE%2FE9enbHdICVEepWRtG%2F0UwOOV%2FNXMOED65WTTVf7tK3zI55ttmYWz266Yrt8nva8g8CRGMOVbtC3czaUq%2BEImOfEs0qWCDupKy4%2BeoSWOt7IUqpbROCy%2B29AWqWwAZGpfAgpeLk0iBAdHJS%2BmOfYhQO5gjmEUmUW%2B7vHiZtWkLMVGDs8wwgu5sIAP2qoas1h6YF%2B8wCbXIsZl3zh23lUSRWmE3wekKUw9kWBeb1tbpueL4Ec35vu; ujD_member_account=zLc94ds5sew0uU5Ukv6LfEhJ6qcs%2FXqw4JoOtOsR0iIo90F5EV9mH4r%2F2agkyTnXX0yvMP5XkQKTD5aBon6%2BsprFygqyFtKClTNRyXP0CZY5fqYBvIaT6bBeOISBAXxiv5%2F%2F5uirpcunMBg8gpdNbNA5XC0S6ab%2Bap9P%2FejQo2IN%2Fljr9ADNVR6hUkI7nx1ftFTlzStilAhDN2OIQRYftXh42z740jMXISpr6b6cxwDFCS6yYZe%2BVsC2VCm2ZiCMGView8Fatqht53XY58VTghqLadWTj45p%2FpQItHCONZT4A%2B1nTwUE99qMTJf6MoOx9hgW4stYrh%2BV9X1f3XBo4Q%3D%3D; ujD_admin_account=NbEBYhivVmsNfx16WMeSY0HBPiuzT3efWdmKDlxTMQtzpkycfEfDYxbvTk92T7oPNAlivcQD2fecBzFGBvIxIIW2FCtDhp8gQ55n3%2Fk2kmX8Alpt2VwUsJV4lYSKSYOpImhzYDng1u94lvoZlzundX2j0XgRAJcITJlrwuAH0Det4hBXiEddTDw6NcffGGJfDkWROyB%2FuGUdIQgc%2B8mBdRXkPP6izWc2%2BPRw5T4BDEYSns%2FWrm%2BfKtQTIRx7w8dUDyVj5q%2BejczepDnCOCxILoCkIJJqdFRi5tQAdNz6Wbw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1237\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52242\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:12:\"REQUEST_TIME\";i:1390794830;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:36:{s:9:\"site_name\";s:9:\"Easytrade\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:5:\"10000\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin/config','http://easytrade.abstractcodify.com/index.php/site-admin/config','110.77.211.127',1390794830),
  (15,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"UNIQUE_ID\";s:24:\"UuXZOz0vCvcAAGTDs9wAAAAK\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:63:\"http://easytrade.abstractcodify.com/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1452:\"ui-tabs-1=1; __utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=VM937XaroYrzKyvI5haY%2Bw0EwyK2QzBqcjYhYhrOMKCBf%2FfB2l7OP0bZhbqTz8209FXFeSF1o6pFkJcQ%2BqAPjYW%2BNJ%2Btl9xla7BgQEidhXkqKDHJImB0V4CmRDuTeRhFZQV0NuAJsfKjcBfLqU9K%2BstrIcqWkRDzyCCDZ7PuQWNgOpOQUZdM1HLHOX6VFviWv%2BdRZ7c1cVGA3j8Gz7JlNJZGow3R3BSRdIf2c7MR7Rh0OPu2s51IDW%2Fcnfvhckuo3%2F55IJT7eWUj8lk3%2B4BRKLY%2Bnjp%2BlwnOuXygGOa8mVkpjt4%2Fw0Xk1lGyt6R1aO1oWebZ0FXETM0KmSnsxXADy0QfYVQ4D4t27jkc6ivLDds1r50NYmJEnrnwNIfmq15p; ujD_member_account=A2YP%2F7mPFMCfxfIKU8zDGI%2BgUTTRS12JXnSL28y9Fzth72G3IBWDbdmk78c0kQJmmB7%2BJFRFlom%2FT6eXP%2FO42uWqVAmBPMmQsxji0HU4eIl%2BixTkI6H%2B5JHMImUl1aUKbs2xgwM4%2FsXiMDIFaUvDNxnRZenDg%2Fd5X4ZKJ1AUICcyhv84Xqvp%2BBDUIHKWJ9%2FNgvB%2BdNUDtf59KRqSth8mGeDty%2BV6kXvWmBUPWHfwsqboi4Ho85GrUHPsxBx2bCOG44I8AA0Y2uPfZCRaMyc7RNpxqVPNgtBq8vlcyzHR6tzlTum%2F1cXbYv3F4IpuFHK9PfmgH2oJKtWLwctUpOijNw%3D%3D; ujD_admin_account=fUR%2FknV9sqn%2BhfiY85cLSE9t6Z4XpIN1CZd85ZxtjSPt82jOJWLcTmYSkNzNLxMCAd45QEwr8Za01%2Bi4MGrvlPsCC4PihN5qF0BrBfgvtLVolwfQxy7%2BqtWucDkbz1r1CVu%2BUTUgBFtuDvoFktJ2nAHrdMhX37%2FqGrDl0RN7r8nL5bR3Hts0tGyTSn1IzC2lbc9hxEFZUC2sRWGW8czObqcCSiXYYNFRrqbY6buA4Rel1AirvEgeDjiIJRxmVKVfu9l4q7lfeVfNqnVdh%2F6ZLljyWaYBgyRzMjqYMofHOtM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1255\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52476\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:12:\"REQUEST_TIME\";i:1390795067;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:37:{s:9:\"site_name\";s:9:\"Easytrade\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:15:\"duplicate_login\";s:1:\"1\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:5:\"10000\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin/config','http://easytrade.abstractcodify.com/index.php/site-admin/config','110.77.211.127',1390795068),
  (16,1,1,'multisite','Update site','a:5:{s:16:\"server_variables\";a:33:{s:9:\"UNIQUE_ID\";s:24:\"UuXZOz0vCvcAAGTDs9wAAAAK\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:63:\"http://easytrade.abstractcodify.com/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1452:\"ui-tabs-1=1; __utma=101002065.338815837.1381303634.1381303634.1381303634.1; __utmz=101002065.1381303634.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.338815837.1381303634; ujD_HpMjl_cookie=7a67331a651969df752c84ea3ca4cc57; ujD_user_lang=th; PHPSESSID=v4er8pq8td27k5lorkalgfihq4; ujD_ci_session=VM937XaroYrzKyvI5haY%2Bw0EwyK2QzBqcjYhYhrOMKCBf%2FfB2l7OP0bZhbqTz8209FXFeSF1o6pFkJcQ%2BqAPjYW%2BNJ%2Btl9xla7BgQEidhXkqKDHJImB0V4CmRDuTeRhFZQV0NuAJsfKjcBfLqU9K%2BstrIcqWkRDzyCCDZ7PuQWNgOpOQUZdM1HLHOX6VFviWv%2BdRZ7c1cVGA3j8Gz7JlNJZGow3R3BSRdIf2c7MR7Rh0OPu2s51IDW%2Fcnfvhckuo3%2F55IJT7eWUj8lk3%2B4BRKLY%2Bnjp%2BlwnOuXygGOa8mVkpjt4%2Fw0Xk1lGyt6R1aO1oWebZ0FXETM0KmSnsxXADy0QfYVQ4D4t27jkc6ivLDds1r50NYmJEnrnwNIfmq15p; ujD_member_account=A2YP%2F7mPFMCfxfIKU8zDGI%2BgUTTRS12JXnSL28y9Fzth72G3IBWDbdmk78c0kQJmmB7%2BJFRFlom%2FT6eXP%2FO42uWqVAmBPMmQsxji0HU4eIl%2BixTkI6H%2B5JHMImUl1aUKbs2xgwM4%2FsXiMDIFaUvDNxnRZenDg%2Fd5X4ZKJ1AUICcyhv84Xqvp%2BBDUIHKWJ9%2FNgvB%2BdNUDtf59KRqSth8mGeDty%2BV6kXvWmBUPWHfwsqboi4Ho85GrUHPsxBx2bCOG44I8AA0Y2uPfZCRaMyc7RNpxqVPNgtBq8vlcyzHR6tzlTum%2F1cXbYv3F4IpuFHK9PfmgH2oJKtWLwctUpOijNw%3D%3D; ujD_admin_account=fUR%2FknV9sqn%2BhfiY85cLSE9t6Z4XpIN1CZd85ZxtjSPt82jOJWLcTmYSkNzNLxMCAd45QEwr8Za01%2Bi4MGrvlPsCC4PihN5qF0BrBfgvtLVolwfQxy7%2BqtWucDkbz1r1CVu%2BUTUgBFtuDvoFktJ2nAHrdMhX37%2FqGrDl0RN7r8nL5bR3Hts0tGyTSn1IzC2lbc9hxEFZUC2sRWGW8czObqcCSiXYYNFRrqbY6buA4Rel1AirvEgeDjiIJRxmVKVfu9l4q7lfeVfNqnVdh%2F6ZLljyWaYBgyRzMjqYMofHOtM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1255\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:14:\"110.77.211.127\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52476\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:12:\"REQUEST_TIME\";i:1390795067;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:37:{s:9:\"site_name\";s:9:\"Easytrade\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:15:\"duplicate_login\";s:1:\"1\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:5:\"10000\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin/config','http://easytrade.abstractcodify.com/index.php/site-admin/config','110.77.211.127',1390795068),
  (17,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuaCxz0vCvcAAATBf7gAAACM\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1255:\"PHPSESSID=ac82pln17c2nlbnapeh8c60vu0; ujD_member_account=33jOHfR1ps3alY0EMrUdMdOnlAt9WAYVgmePjtJTDvlfsRjNz0Pyj9FyTgJ4v0UkdBmciFWikN95n%2FuCK72U7i3jZeFXK8zOB9U9ow942jDJ6qVI2ZcA%2Br9oijSlLXVh7fo4vjHXlblUv%2FTs3ZloIMNz%2FxBPLD3bnMH2rarP5lg%2F4V3dMB6eulydno4jGATuXhUvlt9HgR0X0MuIHY637H9NRyGmngJoHa3mhL9HVyQkqbwvfi%2BwdpuYbhmRZBuL9wfn9ltVoLcLJ0UuURoVV7ufkyn1%2FJaeJCPFyjjTkGt3geYG9cSCGzZz%2FtRIWexCWFL2CT0mF7tPIIvFzkoqXg%3D%3D; ujD_HpMjl_cookie=9542cfb601e71acf7a852c0317f538a9; ujD_user_lang=th; ujD_ci_session=c%2FC9NvDaeNYUs7HIbgzvslbIe2vWUoC3777vIxfWG3QzbA3q3byhyMNSLjkadbKaf4jhh750JirqcdJl9uXGblRo%2Bo%2BoovW0MBjhPKfC4r%2FRrBg5aDtmp7Ye9L6x1%2FuMgbEDFBT3VvR6DZKeQCJaXdnrAhu9pA0iB9U0vjwdvJRgPV601TbvwGbGF5ymetRrWjgDhCNyv0NcQt969mknM0wLkbpMp6ihzDlR8ghGMA%2B%2F3fYlpG3vlhCUdhwBmhNe2EF8bbUARMuyLGI6OTzSbNXCgCFPpCU%2B4AC2vuXjSIE5faDx%2Bdr7vSmuwRoJA5JVZvPC%2FodTFJfvaSycRScUt%2FEVswxJFWnthVEReF0Xa77vuj4rRXkaj3HXCVOV4CW6; ujD_admin_account=UXXzsMnfEt8l%2Fp2yMmyMjUUF1XpsiRryQyJQkgNONdngo4OlyoKC%2B%2FG0HkLr0En073ngsRTA0y5m%2F43Fn1%2FcQIaMFUEg8POuclDGVCSjg6KHfgk1Rfct1ElLlT%2FXFHCmJbuM%2FxNTWCu%2FAa5Et4D50cJDprDLVIJid6TxrTtLotQpDEWsqnjugySaDCeHXE%2BmM15PW2zftM6kW20S3habE9Q8MVz6LBG5sMGpRLt28pCoctLTXROvOjU3r%2BgVyJbt2II9Sx1OVNqyjqqYOzkSkohKntddlY5XOZ4AaWtuwhc%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:13:\"171.5.250.171\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"55765\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390838471;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.171',1390838471),
  (18,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"UuaCxz0vCvcAAATBf7gAAACM\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:15:\"HTTP_USER_AGENT\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:14:\"en-gb,en;q=0.5\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1255:\"PHPSESSID=ac82pln17c2nlbnapeh8c60vu0; ujD_member_account=33jOHfR1ps3alY0EMrUdMdOnlAt9WAYVgmePjtJTDvlfsRjNz0Pyj9FyTgJ4v0UkdBmciFWikN95n%2FuCK72U7i3jZeFXK8zOB9U9ow942jDJ6qVI2ZcA%2Br9oijSlLXVh7fo4vjHXlblUv%2FTs3ZloIMNz%2FxBPLD3bnMH2rarP5lg%2F4V3dMB6eulydno4jGATuXhUvlt9HgR0X0MuIHY637H9NRyGmngJoHa3mhL9HVyQkqbwvfi%2BwdpuYbhmRZBuL9wfn9ltVoLcLJ0UuURoVV7ufkyn1%2FJaeJCPFyjjTkGt3geYG9cSCGzZz%2FtRIWexCWFL2CT0mF7tPIIvFzkoqXg%3D%3D; ujD_HpMjl_cookie=9542cfb601e71acf7a852c0317f538a9; ujD_user_lang=th; ujD_ci_session=c%2FC9NvDaeNYUs7HIbgzvslbIe2vWUoC3777vIxfWG3QzbA3q3byhyMNSLjkadbKaf4jhh750JirqcdJl9uXGblRo%2Bo%2BoovW0MBjhPKfC4r%2FRrBg5aDtmp7Ye9L6x1%2FuMgbEDFBT3VvR6DZKeQCJaXdnrAhu9pA0iB9U0vjwdvJRgPV601TbvwGbGF5ymetRrWjgDhCNyv0NcQt969mknM0wLkbpMp6ihzDlR8ghGMA%2B%2F3fYlpG3vlhCUdhwBmhNe2EF8bbUARMuyLGI6OTzSbNXCgCFPpCU%2B4AC2vuXjSIE5faDx%2Bdr7vSmuwRoJA5JVZvPC%2FodTFJfvaSycRScUt%2FEVswxJFWnthVEReF0Xa77vuj4rRXkaj3HXCVOV4CW6; ujD_admin_account=UXXzsMnfEt8l%2Fp2yMmyMjUUF1XpsiRryQyJQkgNONdngo4OlyoKC%2B%2FG0HkLr0En073ngsRTA0y5m%2F43Fn1%2FcQIaMFUEg8POuclDGVCSjg6KHfgk1Rfct1ElLlT%2FXFHCmJbuM%2FxNTWCu%2FAa5Et4D50cJDprDLVIJid6TxrTtLotQpDEWsqnjugySaDCeHXE%2BmM15PW2zftM6kW20S3habE9Q8MVz6LBG5sMGpRLt28pCoctLTXROvOjU3r%2BgVyJbt2II9Sx1OVNqyjqqYOzkSkohKntddlY5XOZ4AaWtuwhc%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:13:\"171.5.250.171\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"55765\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390838471;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:72:\"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','171.5.250.171',1390838471),
  (19,16,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"Uuciuj0vCvcAADqxswMAAAAK\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:11:\"HTTP_COOKIE\";s:1347:\"PHPSESSID=javshenab9qpf842kr15qbe741; ujD_admin_account=IwHhuPicpFOgWxwnuxRj53qZGWOwgYdbmDn2pqPJsqM5Zg6sJ020JLKmvuGmTb2NpA%2BN5y4jh4ILKU%2FXvrNEHF%2FNp7q7S8KdFOPYCJZu%2FpK1kbCnlqWnlOYF%2FytOUopaXsyrhkdKz7cXBI0D%2FMeWBA%2Fc4oV7%2FxwCir3dellzHFAYQFtUn1nkd4EbXubsYoCoxnvnpclnAikID75LvSqJWN1KL0wuDx2SyrrG0vFPAl4NvcDc46EQZ5Rx26B0s5CmH9lsKgpmrExYJSp26lNp82llXlTkdqy5OtzPv4RqrnE%3D; ujD_ci_session=Z5WM0Zbd5PAUraoj38UXfn1x8Dw7ZbidCXJEUyT1MM1xl1wdDzsnBQ7e3UIvwHgWkfNUH5ChryPFrz5RAhg9%2BpfpqG5tuM8LkT6fhdmxkgWw%2BkmWfXi8N8fPZX3VO74QVRv1V1M3nHw8wrUSdIt%2FKBbmpNbPCiU87%2BDWA3Ls1KIDnIosIQVBp3z0XodyPMK%2Bmi4SQKQLpduC8AoeGzNk2EWn04ZheptulnzG1LKEoZp%2FMhyjqJxBBBMpy6lchAA%2BJGGq7jWBN0ufhVmMP1NwXsQffugrct3zo06lUxUBdVd6foFsGzKK3CvaJN9CiEL4SmTALxZ2ufkfmn1JRXFUgbXmOJq6MvsIfS7axYe%2BJui%2FdvF0BHgiUpJG78MTWlUfqkSJ%2BhpWGEKemRA2lgq8fXvEye%2F6%2F8Rvn6FxTYyNeBo%3D; ujD_HpMjl_cookie=76b5d14eb2942d913235b09e450d84bc; ujD_member_account=PKpE2jeqm9GvbCkzpfkzfiHyEuYfrspW%2BZElYvCfZJpUPZ4YJSgNNkO7j8XuG1mhOerC6R0tOVq8JS%2BS5kAT7orlE%2Bt23PwiFvg%2B2tIs9tRPNUNfPmPLu0l6ZjNw3tZnJQyRGPuIP3zuUr1v9CeWoUc7WAGBykfKd8gQGe8n1bL9loBH3sUU%2BbueKksEe53Arr%2BiL97JfYsxbi66xZYoyZfLfw3iin9GBGqjQBjE9JBeOXjhi4iGjKoHW7WyPKOlMI3L6KznTAWVDiOidMgmLvqzQu%2F%2FZcStrbRE%2FRgt%2FjsgAdGfz0FPFus2UQo6UcctuPXUpy%2BVAHBoRL%2F4ZmHx7nGa4TKpZSPp%2Fjczy3X3qiRCW%2Bw7ZrS2iVX6MqSXpjGq; ujD_user_lang=th\";s:15:\"HTTP_USER_AGENT\";s:129:\"Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:5:\"en-us\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"27.55.150.49\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"59072\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390879418;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:129:\"Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','27.55.150.49',1390879419),
  (20,16,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:30:{s:9:\"UNIQUE_ID\";s:24:\"Uuciuj0vCvcAADqxswMAAAAK\";s:9:\"HTTP_HOST\";s:28:\"easytrade.abstractcodify.com\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:11:\"HTTP_COOKIE\";s:1347:\"PHPSESSID=javshenab9qpf842kr15qbe741; ujD_admin_account=IwHhuPicpFOgWxwnuxRj53qZGWOwgYdbmDn2pqPJsqM5Zg6sJ020JLKmvuGmTb2NpA%2BN5y4jh4ILKU%2FXvrNEHF%2FNp7q7S8KdFOPYCJZu%2FpK1kbCnlqWnlOYF%2FytOUopaXsyrhkdKz7cXBI0D%2FMeWBA%2Fc4oV7%2FxwCir3dellzHFAYQFtUn1nkd4EbXubsYoCoxnvnpclnAikID75LvSqJWN1KL0wuDx2SyrrG0vFPAl4NvcDc46EQZ5Rx26B0s5CmH9lsKgpmrExYJSp26lNp82llXlTkdqy5OtzPv4RqrnE%3D; ujD_ci_session=Z5WM0Zbd5PAUraoj38UXfn1x8Dw7ZbidCXJEUyT1MM1xl1wdDzsnBQ7e3UIvwHgWkfNUH5ChryPFrz5RAhg9%2BpfpqG5tuM8LkT6fhdmxkgWw%2BkmWfXi8N8fPZX3VO74QVRv1V1M3nHw8wrUSdIt%2FKBbmpNbPCiU87%2BDWA3Ls1KIDnIosIQVBp3z0XodyPMK%2Bmi4SQKQLpduC8AoeGzNk2EWn04ZheptulnzG1LKEoZp%2FMhyjqJxBBBMpy6lchAA%2BJGGq7jWBN0ufhVmMP1NwXsQffugrct3zo06lUxUBdVd6foFsGzKK3CvaJN9CiEL4SmTALxZ2ufkfmn1JRXFUgbXmOJq6MvsIfS7axYe%2BJui%2FdvF0BHgiUpJG78MTWlUfqkSJ%2BhpWGEKemRA2lgq8fXvEye%2F6%2F8Rvn6FxTYyNeBo%3D; ujD_HpMjl_cookie=76b5d14eb2942d913235b09e450d84bc; ujD_member_account=PKpE2jeqm9GvbCkzpfkzfiHyEuYfrspW%2BZElYvCfZJpUPZ4YJSgNNkO7j8XuG1mhOerC6R0tOVq8JS%2BS5kAT7orlE%2Bt23PwiFvg%2B2tIs9tRPNUNfPmPLu0l6ZjNw3tZnJQyRGPuIP3zuUr1v9CeWoUc7WAGBykfKd8gQGe8n1bL9loBH3sUU%2BbueKksEe53Arr%2BiL97JfYsxbi66xZYoyZfLfw3iin9GBGqjQBjE9JBeOXjhi4iGjKoHW7WyPKOlMI3L6KznTAWVDiOidMgmLvqzQu%2F%2FZcStrbRE%2FRgt%2FjsgAdGfz0FPFus2UQo6UcctuPXUpy%2BVAHBoRL%2F4ZmHx7nGa4TKpZSPp%2Fjczy3X3qiRCW%2Bw7ZrS2iVX6MqSXpjGq; ujD_user_lang=th\";s:15:\"HTTP_USER_AGENT\";s:129:\"Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:5:\"en-us\";s:12:\"HTTP_REFERER\";s:133:\"http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:4:\"PATH\";s:28:\"/usr/local/bin:/usr/bin:/bin\";s:16:\"SERVER_SIGNATURE\";s:80:\"<address>Apache/2.2.23 Server at easytrade.abstractcodify.com Port 80</address>\n\";s:15:\"SERVER_SOFTWARE\";s:13:\"Apache/2.2.23\";s:11:\"SERVER_NAME\";s:28:\"easytrade.abstractcodify.com\";s:11:\"SERVER_ADDR\";s:12:\"61.47.10.247\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:12:\"27.55.150.49\";s:13:\"DOCUMENT_ROOT\";s:61:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade\";s:12:\"SERVER_ADMIN\";s:28:\"webmaster@abstractcodify.com\";s:15:\"SCRIPT_FILENAME\";s:71:\"/home/c2oh2o/domains/abstractcodify.com/public_html/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"59072\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1390879418;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:129:\"Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53\";}','http://easytrade.abstractcodify.com/index.php/site-admin','http://easytrade.abstractcodify.com/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.abstractcodify.com%2Findex.php%2Fsite-admin','27.55.150.49',1390879419),
  (21,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:103:\"http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1263:\"ujD_HpMjl_cookie=ed8e2e622f70a045645684a88e6fa1be; ujD_user_lang=th; PHPSESSID=f1233a1c31463fbbac0f8645f83c1466; ujD_ci_session=S3hhXo7jL7DEJyk%2Fg5dmsV1CLZv8WSt5QwNnvPIY7CZsTOb8cl%2FOe7BNJ7oNDJaovEBYcRET8rT7hTnhLYxQGfoHD0LnYp6UM0P%2F2MlaUldTraxkdvC5jtOkAAWd5pAei0Q6wWJheo2iddpjmkGyKTk%2F75aa5u1dLvAnOe27osC%2BXjdE2FE3r%2B1cEmNps8ArA5qIpn%2FNqB6DFPoGdS%2FNWi3GE54o14G3kk5R895%2BpgQJXCirHZDgusvGMYOPKi1rMYF6pXPGpF1QMMHKighwW%2Fh5ipC2Gcx%2FNHP54UqDTrwLkKPsbhq3XI46KIbsTp3p%2FccO4prpIag8jwXMrlmAXc6PClS5hTvU86q065m18qlLAJmXbp6hodMf3GtaMlZr; ujD_member_account=zDDqZMzKDWxbt3atSH8YmqZL7pZD6j%2FYgAkzr7XOoaCoIOCrfIwG6gR%2BYcVpF3Jx92jFBd3RBWy8oa53wNxtacJcPfyA84RH3KGKkAm%2By%2B9SkC71ywx9D90iAwLL5WK%2BTelh0Yxt7ejT1CD807SBdZi9%2Bxff7UHf5LUDk1jb7p1CuUr7pSC81TnLU0Gk%2BxSTGNETfcpVRl12Q0zh%2BHsYQPhKg4UzLQumQyHg0kE11k2hUHrd3GLuX1Rfynek8MSB31hXXchQjmh9YWHrFv3FKgiZIGcV4IiPsWrCTwgET99KyZcndk1WPJkuL2wrDIt1Fgu0DNe6UPUea2prWu8Ozw%3D%3D; ujD_admin_account=mmjeS88SkZ%2BBJ%2FZu26JejWYN2jKh6nme3u%2FCatMdaYc5Bkv8h2tebE0l%2BupbyZDLYFDA8%2BuoaOhtkP8rwfQU8mfsLkwkVJhkHsNSOmAvNDrtKsTeNTL3%2FRwg6JRFramYIqtaDM2NKNau64djtyg0VUjsZ9XW2EjPVncXF7w8Rx3ug3Ta8PEQ7KWCrOrZUyskvDYwVZDq2magoyfEvxbNqc9FK9tg5t%2Fub60PrvgNwBalccoZk5MDubQMX3vFe1YgQ%2FAfydysrDctDzkwzZv9qyrOrt9YA8MVhO%2BYm%2BdWAHw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52004\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1393005964.9189999103546142578125;s:12:\"REQUEST_TIME\";i:1393005964;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://easytrade.dev/index.php/site-admin','http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin','127.0.0.1',1393005965),
  (22,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:103:\"http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1263:\"ujD_HpMjl_cookie=ed8e2e622f70a045645684a88e6fa1be; ujD_user_lang=th; PHPSESSID=f1233a1c31463fbbac0f8645f83c1466; ujD_ci_session=S3hhXo7jL7DEJyk%2Fg5dmsV1CLZv8WSt5QwNnvPIY7CZsTOb8cl%2FOe7BNJ7oNDJaovEBYcRET8rT7hTnhLYxQGfoHD0LnYp6UM0P%2F2MlaUldTraxkdvC5jtOkAAWd5pAei0Q6wWJheo2iddpjmkGyKTk%2F75aa5u1dLvAnOe27osC%2BXjdE2FE3r%2B1cEmNps8ArA5qIpn%2FNqB6DFPoGdS%2FNWi3GE54o14G3kk5R895%2BpgQJXCirHZDgusvGMYOPKi1rMYF6pXPGpF1QMMHKighwW%2Fh5ipC2Gcx%2FNHP54UqDTrwLkKPsbhq3XI46KIbsTp3p%2FccO4prpIag8jwXMrlmAXc6PClS5hTvU86q065m18qlLAJmXbp6hodMf3GtaMlZr; ujD_member_account=zDDqZMzKDWxbt3atSH8YmqZL7pZD6j%2FYgAkzr7XOoaCoIOCrfIwG6gR%2BYcVpF3Jx92jFBd3RBWy8oa53wNxtacJcPfyA84RH3KGKkAm%2By%2B9SkC71ywx9D90iAwLL5WK%2BTelh0Yxt7ejT1CD807SBdZi9%2Bxff7UHf5LUDk1jb7p1CuUr7pSC81TnLU0Gk%2BxSTGNETfcpVRl12Q0zh%2BHsYQPhKg4UzLQumQyHg0kE11k2hUHrd3GLuX1Rfynek8MSB31hXXchQjmh9YWHrFv3FKgiZIGcV4IiPsWrCTwgET99KyZcndk1WPJkuL2wrDIt1Fgu0DNe6UPUea2prWu8Ozw%3D%3D; ujD_admin_account=mmjeS88SkZ%2BBJ%2FZu26JejWYN2jKh6nme3u%2FCatMdaYc5Bkv8h2tebE0l%2BupbyZDLYFDA8%2BuoaOhtkP8rwfQU8mfsLkwkVJhkHsNSOmAvNDrtKsTeNTL3%2FRwg6JRFramYIqtaDM2NKNau64djtyg0VUjsZ9XW2EjPVncXF7w8Rx3ug3Ta8PEQ7KWCrOrZUyskvDYwVZDq2magoyfEvxbNqc9FK9tg5t%2Fub60PrvgNwBalccoZk5MDubQMX3vFe1YgQ%2FAfydysrDctDzkwzZv9qyrOrt9YA8MVhO%2BYm%2BdWAHw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52004\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1393005964.9189999103546142578125;s:12:\"REQUEST_TIME\";i:1393005964;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://easytrade.dev/index.php/site-admin','http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin','127.0.0.1',1393005965),
  (23,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:34:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:65:\"http://easytrade.dev/index.php/site-admin/site-admin/index/banner\";s:11:\"HTTP_COOKIE\";s:769:\"PHPSESSID=f1233a1c31463fbbac0f8645f83c1466; ujD_member_account=zDDqZMzKDWxbt3atSH8YmqZL7pZD6j%2FYgAkzr7XOoaCoIOCrfIwG6gR%2BYcVpF3Jx92jFBd3RBWy8oa53wNxtacJcPfyA84RH3KGKkAm%2By%2B9SkC71ywx9D90iAwLL5WK%2BTelh0Yxt7ejT1CD807SBdZi9%2Bxff7UHf5LUDk1jb7p1CuUr7pSC81TnLU0Gk%2BxSTGNETfcpVRl12Q0zh%2BHsYQPhKg4UzLQumQyHg0kE11k2hUHrd3GLuX1Rfynek8MSB31hXXchQjmh9YWHrFv3FKgiZIGcV4IiPsWrCTwgET99KyZcndk1WPJkuL2wrDIt1Fgu0DNe6UPUea2prWu8Ozw%3D%3D; ujD_admin_account=mmjeS88SkZ%2BBJ%2FZu26JejWYN2jKh6nme3u%2FCatMdaYc5Bkv8h2tebE0l%2BupbyZDLYFDA8%2BuoaOhtkP8rwfQU8mfsLkwkVJhkHsNSOmAvNDrtKsTeNTL3%2FRwg6JRFramYIqtaDM2NKNau64djtyg0VUjsZ9XW2EjPVncXF7w8Rx3ug3Ta8PEQ7KWCrOrZUyskvDYwVZDq2magoyfEvxbNqc9FK9tg5t%2Fub60PrvgNwBalccoZk5MDubQMX3vFe1YgQ%2FAfydysrDctDzkwzZv9qyrOrt9YA8MVhO%2BYm%2BdWAHw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:18:\"HTTP_CACHE_CONTROL\";s:9:\"max-age=0\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52273\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:34:\"/index.php/site-admin/index/banner\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:24:\"/site-admin/index/banner\";s:15:\"PATH_TRANSLATED\";s:32:\"redirect:/index.php/index/banner\";s:8:\"PHP_SELF\";s:34:\"/index.php/site-admin/index/banner\";s:18:\"REQUEST_TIME_FLOAT\";d:1393035375.999000072479248046875;s:12:\"REQUEST_TIME\";i:1393035375;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://easytrade.dev/index.php/site-admin/index/banner','http://easytrade.dev/index.php/site-admin/site-admin/index/banner','127.0.0.1',1393035376),
  (24,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:34:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:65:\"http://easytrade.dev/index.php/site-admin/site-admin/index/banner\";s:11:\"HTTP_COOKIE\";s:769:\"PHPSESSID=f1233a1c31463fbbac0f8645f83c1466; ujD_member_account=zDDqZMzKDWxbt3atSH8YmqZL7pZD6j%2FYgAkzr7XOoaCoIOCrfIwG6gR%2BYcVpF3Jx92jFBd3RBWy8oa53wNxtacJcPfyA84RH3KGKkAm%2By%2B9SkC71ywx9D90iAwLL5WK%2BTelh0Yxt7ejT1CD807SBdZi9%2Bxff7UHf5LUDk1jb7p1CuUr7pSC81TnLU0Gk%2BxSTGNETfcpVRl12Q0zh%2BHsYQPhKg4UzLQumQyHg0kE11k2hUHrd3GLuX1Rfynek8MSB31hXXchQjmh9YWHrFv3FKgiZIGcV4IiPsWrCTwgET99KyZcndk1WPJkuL2wrDIt1Fgu0DNe6UPUea2prWu8Ozw%3D%3D; ujD_admin_account=mmjeS88SkZ%2BBJ%2FZu26JejWYN2jKh6nme3u%2FCatMdaYc5Bkv8h2tebE0l%2BupbyZDLYFDA8%2BuoaOhtkP8rwfQU8mfsLkwkVJhkHsNSOmAvNDrtKsTeNTL3%2FRwg6JRFramYIqtaDM2NKNau64djtyg0VUjsZ9XW2EjPVncXF7w8Rx3ug3Ta8PEQ7KWCrOrZUyskvDYwVZDq2magoyfEvxbNqc9FK9tg5t%2Fub60PrvgNwBalccoZk5MDubQMX3vFe1YgQ%2FAfydysrDctDzkwzZv9qyrOrt9YA8MVhO%2BYm%2BdWAHw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:18:\"HTTP_CACHE_CONTROL\";s:9:\"max-age=0\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"52273\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:34:\"/index.php/site-admin/index/banner\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:24:\"/site-admin/index/banner\";s:15:\"PATH_TRANSLATED\";s:32:\"redirect:/index.php/index/banner\";s:8:\"PHP_SELF\";s:34:\"/index.php/site-admin/index/banner\";s:18:\"REQUEST_TIME_FLOAT\";d:1393035375.999000072479248046875;s:12:\"REQUEST_TIME\";i:1393035375;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://easytrade.dev/index.php/site-admin/index/banner','http://easytrade.dev/index.php/site-admin/site-admin/index/banner','127.0.0.1',1393035376);

/*!40000 ALTER TABLE `an_syslog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_taxonomy_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_fields`;

CREATE TABLE `an_taxonomy_fields` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_taxonomy_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_index`;

CREATE TABLE `an_taxonomy_index` (
  `index_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'post id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'term id',
  `position` int(9) NOT NULL DEFAULT '1',
  `create` bigint(20) DEFAULT NULL COMMENT 'local date time',
  PRIMARY KEY (`index_id`),
  KEY `post_id` (`post_id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store id between taxonomy/posts';



# Dump of table et_taxonomy_term_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_term_data`;

CREATE TABLE `an_taxonomy_term_data` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) DEFAULT NULL,
  `t_type` varchar(255) DEFAULT NULL COMMENT 'type of taxonomy. eg. tag, category',
  `t_total` int(11) NOT NULL DEFAULT '0' COMMENT 'total posts relate to this.',
  `t_name` varchar(255) DEFAULT NULL,
  `t_description` longtext,
  `t_uri` tinytext,
  `t_uri_encoded` text,
  `t_uris` longtext COMMENT 'full path of uri, eg. animal/4legs/cat (no end slash and must uri encoded)',
  `t_position` int(9) NOT NULL DEFAULT '0' COMMENT 'for use as position order when some module need it.',
  `t_status` int(1) NOT NULL DEFAULT '1' COMMENT '0=not publish, 1=publish',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table et_theme_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_theme_sites`;

CREATE TABLE `an_theme_sites` (
  `theme_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `theme_enable` int(1) NOT NULL DEFAULT '0',
  `theme_default` int(1) NOT NULL DEFAULT '0',
  `theme_default_admin` int(11) NOT NULL DEFAULT '0',
  `theme_settings` text,
  PRIMARY KEY (`theme_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_theme_sites` WRITE;
/*!40000 ALTER TABLE `an_theme_sites` DISABLE KEYS */;

INSERT INTO `an_theme_sites` (`theme_site_id`, `theme_id`, `site_id`, `theme_enable`, `theme_default`, `theme_default_admin`, `theme_settings`)
VALUES
  (1,1,1,1,1,1,NULL);

/*!40000 ALTER TABLE `an_theme_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_themes`;

CREATE TABLE `an_themes` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_url` varchar(255) DEFAULT NULL,
  `theme_version` varchar(30) DEFAULT NULL,
  `theme_description` text,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_system_name` (`theme_system_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_themes` WRITE;
/*!40000 ALTER TABLE `an_themes` DISABLE KEYS */;

INSERT INTO `an_themes` (`theme_id`, `theme_system_name`, `theme_name`, `theme_url`, `theme_version`, `theme_description`)
VALUES
  (1,'system','System','http://www.agnicms.org','1.0','Agni system theme.');

/*!40000 ALTER TABLE `an_themes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_type_shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_type_shop`;

CREATE TABLE `an_type_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_shop` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_type_shop` WRITE;
/*!40000 ALTER TABLE `an_type_shop` DISABLE KEYS */;

INSERT INTO `an_type_shop` (`id`, `name_shop`)
VALUES
  (1,'อุปกรณ์ก่อสร้าง'),
  (2,'อุปกรณ์แต่งบ้าน'),
  (3,'อุปกรณ์ไฟฟ้า');

/*!40000 ALTER TABLE `an_type_shop` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table et_url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_url_alias`;

CREATE TABLE `an_url_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_type` varchar(255) DEFAULT NULL COMMENT 'content type eg. article, page, category, tag, ...etc...',
  `c_id` int(11) DEFAULT NULL COMMENT 'those content id',
  `uri` tinytext,
  `uri_encoded` text,
  `redirect_to` tinytext COMMENT 'for use in url redirect',
  `redirect_to_encoded` text,
  `redirect_code` int(5) DEFAULT NULL COMMENT '301 permanent, 302 temporarily',
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`alias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
