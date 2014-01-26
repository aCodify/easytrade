# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: easytrade
# Generation Time: 2557-01-26 12:20:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table et_account_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_fields`;

CREATE TABLE `an_account_fields` (
  `account_id` int(11) NOT NULL COMMENT 'refer to accounts.account_id',
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  (3,3,2),
  (4,3,3),
  (5,3,4);

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
  (2,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 03:39:02','2014-01-26 08:39:02',1,'Success'),
  (3,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 04:01:19','2014-01-26 09:01:19',1,'Success'),
  (4,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 04:01:49','2014-01-26 09:01:49',1,'Success'),
  (5,3,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 04:38:48','2014-01-26 09:38:48',1,'Success');

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
  (1,1,1,1386696395,1386671195,'8e41ee39ea77347ecacddb3722ccf9ae'),
  (2,2,1,1390726909,1390701709,'3115e71825b18dcb7e199857c2c7a712'),
  (3,3,1,1390729128,1390703928,'e4127ca3e29fe705072a1b4bdeb0914e');

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
  `code_map` text,
  `count_view` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_accounts` WRITE;
/*!40000 ALTER TABLE `an_accounts` DISABLE KEYS */;

INSERT INTO `an_accounts` (`account_id`, `account_username`, `account_email`, `account_salt`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_timezone`, `account_language`, `account_create`, `account_create_gmt`, `account_last_login`, `account_last_login_gmt`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`, `name`, `last_name`, `address`, `province`, `postcode`, `name_shop`, `detail_shop`, `code_map`, `count_view`, `phone`, `type`)
VALUES
  (0,'Guest','none@localhost',NULL,NULL,'Guest',NULL,NULL,NULL,'UP7',NULL,'2012-04-03 19:25:44','2012-04-03 12:25:44',NULL,NULL,NULL,0,'You can\'t login with this account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1,'admin','i@me.com',NULL,'$2a$12$6pWs39x446rE69.CpoEdRuz51aU0nQUEDSou0k25gLOgBLNoerD96',NULL,NULL,NULL,NULL,'UP7',NULL,'2011-04-20 19:20:04','2011-04-20 12:20:04','2013-12-11 00:26:35','2013-12-10 17:26:35','e2135bb4faf4fb999e3bbebe86ed1cdf',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  (2,'root','iar@me.com',NULL,'$2a$12$wbs1rk2K5HbxiFCQoO5gpuYdUZuzwQnEn8gRzPS3/cb3HnYOUQrlm',NULL,NULL,'',NULL,'UP7',NULL,'2014-01-26 14:43:49','2014-01-26 07:43:49','2014-01-26 16:01:49','2014-01-26 09:01:49',NULL,1,NULL,NULL,NULL,'0UUHpa','jirayu','kanda','21/1',102,109273,'ชื่อร้าน','ข้อมูลร้าน',NULL,NULL,NULL,1),
  (3,'root1','i2@me.com',NULL,'$2a$12$2VGqCPTl4Zxg1ebz/MohTuIXwTDunyv4/CJTK7cgBsdxXfa0ra/MC',NULL,NULL,'mid-1d82cfa44aa6c6a711abdcce6dade654.png',NULL,'UP7',NULL,'2014-01-26 14:49:51','2014-01-26 07:49:51','2014-01-26 16:38:48','2014-01-26 09:38:48',NULL,1,NULL,NULL,NULL,'eQ7Lur','jirayuedie','kanda','21/1',101,109273,'ชื่อร้าน','ข้อมูลร้าน','<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/?ie=UTF8&amp;ll=13.776922,100.318952&amp;spn=0.014026,0.022724&amp;t=h&amp;z=16&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/?ie=UTF8&amp;ll=13.776922,100.318952&amp;spn=0.014026,0.022724&amp;t=h&amp;z=16&amp;source=embed\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>',NULL,NULL,1),
  (4,'root2','ioa@me.com',NULL,'$2a$12$ea7i8Qrth0GhRCzqlFOTL.zxpRCCSrjaZ334DmrpKpsAVjRuLC1nu',NULL,NULL,'mid-a5185e65afd7e32d1dc52139a05cf9d0.png',NULL,'UP7',NULL,'2014-01-26 16:18:12','2014-01-26 09:18:12',NULL,NULL,NULL,1,NULL,NULL,NULL,'tuGZfg','name','last_name','21/1',102,10250,'เทพ shop','ข้อมูลร้าน',NULL,NULL,NULL,1);

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
  ('8923de1d33cf2c5dae5d25b3b8d5e6a4','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0',1390731080,'a:1:{s:21:\"flash:old:form_status\";a:2:{s:11:\"form_status\";s:7:\"success\";s:19:\"form_status_message\";s:58:\"บันทึกเรียบร้อยแล้ว.\";}}');

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
  ('duplicate_login','0',1,'allow log in more than 1 place, session? set to 1/0 to allow/disallow.'),
  ('allow_avatar','1',1,'set to 1 if use avatar or set to 0 if not use it.'),
  ('avatar_size','200',1,'set file size in Kilobyte.'),
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
  (1,'Easytrade','easytrade.dev',1,1386696353,1386671153,1386696379,1386671179);

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
  (2,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:13:\"easytrade.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:103:\"http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1481:\"an_csrf_cookie=6e3a64b6cd38412f785a7e5ddcf087c2; an_user_lang=th; csrf_cookie=8bbb77104e3b5f146ccbebfa0dc2c035; agni_install_verify=pass; agni_install_step2=pass; agni_install_step3=pass; ujD_HpMjl_cookie=fed804cf47f3a11a0c26222271189426; ujD_user_lang=th; PHPSESSID=7a1f1d5b2e033df7cf2a176546ba8f3f; ujD_ci_session=I%2FU1u%2FACWcSZTEnU7e1c3glDZZAftMIMgnw%2FOq%2FdIKDVmyqM4R%2BCS%2FhpzvR5mSjZ35Xu6KdiZBuyD9VV4HQteDpwvT%2FUnKj2YXF2V2vi4RAf3neIfqh5VJD%2FVXmC2HF8vAjRbIgmB93mqbhvNC4%2FMmxq4ZSz00aD61YDhr%2F3YGogC1irV4gxJIzpTqaRxcKzAbt2ZHzbU6qlwJYacbjty6fcQ13KzvmaYJEMxeFq7i7v%2B8D67cWY3W7VaHCDGYqjvt9R5QL%2B99rl9QiF1rnm251nFZGaSgTkVLYhNJHONLK0PUrqewo6FhXiQLEx3%2Bv7flhae8Kk69bNrF7dtsBSiJ5PTTEc%2FH4BzewYT2Pro0hALqlNBwMQkgZ94W8Kg7yZ; ujD_member_account=6pmCSTrPmjIxO8GhhdOViJCGY0k5d2DdPy3mv9xlJNrg5YLXSCGTkWvNILeG7LeMknoDmVGlMvdeqwbtZllx6Dgn1%2FW36%2BxJN1SJDCATJLyEIwPQ9vmNxME%2B9111QgqPD8HKhp99EybZGPzPdoN8vG6u6XC65TrB1WNQUKjJM%2FBshvvaDq4OXuT%2FaGca4%2BqJ%2Fg40VUef4F%2Bb1SY9QQhFla41rH%2Bnd%2FMsr24Q9rUMcG1oiMCp%2BM84DVLa10k7NC%2FLqypSWpnNaBT%2FNf9IKA8HPgp2AoGXDH7J3q8kbErJrYTPB60575J05thBebxbI7AsLc7bxhIuXDl9cQxZDfZpBw%3D%3D; ujD_admin_account=gpVDF90OxcgPVpM2M7rc8UE4wR%2FglvEplNssG%2F5iZ6NxN%2F50nhY2DEmgFw%2BCn7NZP0zDH1GEK%2FEXzDCHXn%2FXo39L59V%2FcBYGkSvHg6%2BTQ2L8rDFk54K7ep6B%2Bd4XfOaeL7bnjMSM%2Fsjdb%2Fg5aNtkzpUvTTQT%2F9iELfuIInHnFfYqyEyWreAkZL1C1V6%2BLh73n2SKhiaDQjzBQdKp3c%2F5oi1JDlx%2BE8yp05%2FK8DYmkRn4bDMQIXpQHjRTPm%2Bc3pIzYflwGfU29XZOse9yK1HnmlG0OnEilHZpicR%2FVi7zDNc%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:13:\"easytrade.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:35:\"/Applications/MAMP/htdocs/easytrade\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:45:\"/Applications/MAMP/htdocs/easytrade/index.php\";s:11:\"REMOTE_PORT\";s:5:\"50429\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1386696395.9449999332427978515625;s:12:\"REQUEST_TIME\";i:1386696395;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://easytrade.dev/index.php/site-admin','http://easytrade.dev/index.php/site-admin/login?rdr=http%3A%2F%2Feasytrade.dev%2Findex.php%2Fsite-admin','127.0.0.1',1386696396);

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
