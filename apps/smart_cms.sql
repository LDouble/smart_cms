-- MySQL dump 10.13  Distrib 8.0.13, for osx10.14 (x86_64)
--
-- Host: localhost    Database: smart_cms
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'个人用户'),(1,'企业组');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (6,1,16),(7,1,57),(8,1,58),(9,1,59),(10,1,60),(11,1,61),(12,1,62),(13,1,63),(1,1,64),(2,1,65),(3,1,66),(4,1,67),(5,1,68);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Bookmark',6,'add_bookmark'),(22,'Can change Bookmark',6,'change_bookmark'),(23,'Can delete Bookmark',6,'delete_bookmark'),(24,'Can view Bookmark',6,'view_bookmark'),(25,'Can add User Setting',7,'add_usersettings'),(26,'Can change User Setting',7,'change_usersettings'),(27,'Can delete User Setting',7,'delete_usersettings'),(28,'Can view User Setting',7,'view_usersettings'),(29,'Can add User Widget',8,'add_userwidget'),(30,'Can change User Widget',8,'change_userwidget'),(31,'Can delete User Widget',8,'delete_userwidget'),(32,'Can view User Widget',8,'view_userwidget'),(33,'Can add log entry',9,'add_log'),(34,'Can change log entry',9,'change_log'),(35,'Can delete log entry',9,'delete_log'),(36,'Can view log entry',9,'view_log'),(37,'Can add revision',10,'add_revision'),(38,'Can change revision',10,'change_revision'),(39,'Can delete revision',10,'delete_revision'),(40,'Can view revision',10,'view_revision'),(41,'Can add version',11,'add_version'),(42,'Can change version',11,'change_version'),(43,'Can delete version',11,'delete_version'),(44,'Can view version',11,'view_version'),(45,'Can add 轮播图',12,'add_banner'),(46,'Can change 轮播图',12,'change_banner'),(47,'Can delete 轮播图',12,'delete_banner'),(48,'Can view 轮播图',12,'view_banner'),(49,'Can add 邮箱验证码',13,'add_emailverifyrecord'),(50,'Can change 邮箱验证码',13,'change_emailverifyrecord'),(51,'Can delete 邮箱验证码',13,'delete_emailverifyrecord'),(52,'Can view 邮箱验证码',13,'view_emailverifyrecord'),(53,'Can add 用户信息',14,'add_userprofile'),(54,'Can change 用户信息',14,'change_userprofile'),(55,'Can delete 用户信息',14,'delete_userprofile'),(56,'Can view 用户信息',14,'view_userprofile'),(57,'Can add 家居类型',15,'add_furnituretype'),(58,'Can change 家居类型',15,'change_furnituretype'),(59,'Can delete 家居类型',15,'delete_furnituretype'),(60,'Can view 家居类型',15,'view_furnituretype'),(61,'Can add 设备类型',16,'add_devicetype'),(62,'Can change 设备类型',16,'change_devicetype'),(63,'Can delete 设备类型',16,'delete_devicetype'),(64,'Can view 设备类型',16,'view_devicetype'),(65,'Can add 设备明细',17,'add_device'),(66,'Can change 设备明细',17,'change_device'),(67,'Can delete 设备明细',17,'delete_device'),(68,'Can view 设备明细',17,'view_device'),(69,'Can add 配件使用记录',18,'add_deviceuse'),(70,'Can change 配件使用记录',18,'change_deviceuse'),(71,'Can delete 配件使用记录',18,'delete_deviceuse'),(72,'Can view 配件使用记录',18,'view_deviceuse'),(73,'Can add 订单地址',19,'add_orderadress'),(74,'Can change 订单地址',19,'change_orderadress'),(75,'Can delete 订单地址',19,'delete_orderadress'),(76,'Can view 订单地址',19,'view_orderadress'),(77,'Can add 订单列表',20,'add_order'),(78,'Can change 订单列表',20,'change_order'),(79,'Can delete 订单列表',20,'delete_order'),(80,'Can view 订单列表',20,'view_order'),(81,'Can add 物流类型',21,'add_logistictype'),(82,'Can change 物流类型',21,'change_logistictype'),(83,'Can delete 物流类型',21,'delete_logistictype'),(84,'Can view 物流类型',21,'view_logistictype'),(85,'Can add 物流列表',22,'add_logistic'),(86,'Can change 物流列表',22,'change_logistic'),(87,'Can delete 物流列表',22,'delete_logistic'),(88,'Can view 物流列表',22,'view_logistic'),(89,'Can add 设备使用情况',23,'add_usagelog'),(90,'Can change 设备使用情况',23,'change_usagelog'),(91,'Can delete 设备使用情况',23,'delete_usagelog'),(92,'Can view 设备使用情况',23,'view_usagelog'),(93,'Can add 设备日志',24,'add_devicelog'),(94,'Can change 设备日志',24,'change_devicelog'),(95,'Can delete 设备日志',24,'delete_devicelog'),(96,'Can view 设备日志',24,'view_devicelog'),(97,'Can add question',25,'add_question'),(98,'Can change question',25,'change_question'),(99,'Can delete question',25,'delete_question'),(100,'Can view question',25,'view_question'),(101,'Can add answer',26,'add_answer'),(102,'Can change answer',26,'change_answer'),(103,'Can delete answer',26,'delete_answer'),(104,'Can view answer',26,'view_answer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_answer`
--

DROP TABLE IF EXISTS `devices_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `device_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_answer_device_id_e29886f2_fk_devices_device_id` (`device_id`),
  KEY `devices_answer_question_id_11c6cbe6_fk_devices_question_id` (`question_id`),
  CONSTRAINT `devices_answer_device_id_e29886f2_fk_devices_device_id` FOREIGN KEY (`device_id`) REFERENCES `devices_device` (`id`),
  CONSTRAINT `devices_answer_question_id_11c6cbe6_fk_devices_question_id` FOREIGN KEY (`question_id`) REFERENCES `devices_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_answer`
--

LOCK TABLES `devices_answer` WRITE;
/*!40000 ALTER TABLE `devices_answer` DISABLE KEYS */;
INSERT INTO `devices_answer` VALUES (1,'打','2019-04-27 04:08:47.540719',5,1),(2,'不打','2019-04-30 08:13:01.081976',4,1),(3,'30m²','2019-04-30 08:13:39.447065',1,2),(4,'60','2019-04-30 08:14:25.444830',6,2),(5,'有','2019-04-30 08:14:54.469747',5,3),(6,'没有','2019-04-30 08:15:37.577070',5,3);
/*!40000 ALTER TABLE `devices_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_device`
--

DROP TABLE IF EXISTS `devices_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) NOT NULL,
  `num` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `params` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_device_type_id_16e2b1c2_fk_devices_devicetype_id` (`type_id`),
  CONSTRAINT `devices_device_type_id_16e2b1c2_fk_devices_devicetype_id` FOREIGN KEY (`type_id`) REFERENCES `devices_devicetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_device`
--

LOCK TABLES `devices_device` WRITE;
/*!40000 ALTER TABLE `devices_device` DISABLE KEYS */;
INSERT INTO `devices_device` VALUES (1,'显示器32英寸',99,1,'2019-04-16 02:18:00.000000','2019-05-11 07:39:37.934020','32英寸'),(2,'滚筒60l',555,2,'2019-04-16 02:25:00.000000','2019-04-16 02:30:08.386618','60l'),(3,'CPU 2.2GHZ',10,4,'2019-04-22 10:58:00.000000','2019-04-23 00:44:54.892340','2.2GHZ'),(4,'4G',99,3,'2019-04-23 00:46:00.000000','2019-04-23 07:39:30.140194','4G'),(5,'8g',100,3,'2019-04-23 01:29:00.000000','2019-04-23 01:55:46.817601','8G'),(6,'显示器 55',1,1,'2019-04-28 08:27:00.000000','2019-04-30 08:14:22.582700','55英寸');
/*!40000 ALTER TABLE `devices_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_devicetype`
--

DROP TABLE IF EXISTS `devices_devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `furnituretype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_devicetype_furnituretype_id_88c1dd56_fk_devices_f` (`furnituretype_id`),
  CONSTRAINT `devices_devicetype_furnituretype_id_88c1dd56_fk_devices_f` FOREIGN KEY (`furnituretype_id`) REFERENCES `devices_furnituretype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_devicetype`
--

LOCK TABLES `devices_devicetype` WRITE;
/*!40000 ALTER TABLE `devices_devicetype` DISABLE KEYS */;
INSERT INTO `devices_devicetype` VALUES (1,'显示器','2019-04-15 12:03:00.000000','2019-04-15 12:06:22.998746',1),(2,'滚筒','2019-04-16 02:25:00.000000','2019-04-16 02:29:28.167720',2),(3,'内存','2019-04-22 10:34:00.000000','2019-04-22 10:47:00.735936',1),(4,'CPU','2019-04-22 10:34:00.000000','2019-04-22 10:47:12.632389',1);
/*!40000 ALTER TABLE `devices_devicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_deviceuse`
--

DROP TABLE IF EXISTS `devices_deviceuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_deviceuse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `create_date` date NOT NULL,
  `num` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_deviceuse_device_id_2bc8e95b_fk_devices_device_id` (`device_id`),
  KEY `devices_deviceuse_user_id_d2e62765_fk_users_userprofile_id` (`user_id`),
  KEY `devices_deviceuse_order_id_594af746_fk_orders_order_id` (`order_id`),
  CONSTRAINT `devices_deviceuse_device_id_2bc8e95b_fk_devices_device_id` FOREIGN KEY (`device_id`) REFERENCES `devices_device` (`id`),
  CONSTRAINT `devices_deviceuse_order_id_594af746_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `devices_deviceuse_user_id_d2e62765_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_deviceuse`
--

LOCK TABLES `devices_deviceuse` WRITE;
/*!40000 ALTER TABLE `devices_deviceuse` DISABLE KEYS */;
INSERT INTO `devices_deviceuse` VALUES (13,'2019-04-23 07:29:00.000000','2019-04-23',1,1,3,1),(14,'2019-04-23 07:31:00.000000','2019-04-23',1,4,3,1),(15,'2019-04-23 07:59:48.333598','2019-04-23',1,1,6,1),(16,'2019-04-23 07:59:48.333598','2019-04-23',1,5,6,1),(17,'2019-04-23 07:59:48.333598','2019-04-23',1,3,6,1),(18,'2019-05-01 12:28:50.697421','2019-05-01',1,1,NULL,1),(19,'2019-05-01 12:28:50.697421','2019-05-01',1,3,NULL,1),(20,'2019-05-01 12:28:50.697421','2019-05-01',1,5,NULL,1),(21,'2019-05-01 12:28:50.697421','2019-05-01',1,1,8,1),(22,'2019-05-01 12:28:50.697421','2019-05-01',1,3,8,1),(23,'2019-05-01 12:28:50.697421','2019-05-01',1,5,8,1),(24,'2019-05-01 12:28:50.697421','2019-05-01',1,1,9,1),(25,'2019-05-01 12:28:50.697421','2019-05-01',1,3,9,1),(26,'2019-05-01 12:28:50.697421','2019-05-01',1,5,9,1),(27,'2019-05-01 12:49:06.599631','2019-05-01',1,6,10,1),(28,'2019-05-01 12:49:06.599631','2019-05-01',1,5,10,1),(29,'2019-05-01 12:49:06.599631','2019-05-01',1,3,10,1),(30,'2019-05-01 12:49:06.599631','2019-05-01',1,2,11,1),(31,'2019-05-01 12:49:06.599631','2019-05-01',1,2,12,1),(32,'2019-05-10 02:14:49.216364','2019-05-10',1,1,13,1),(33,'2019-05-10 02:14:49.216364','2019-05-10',1,5,13,1),(34,'2019-05-10 02:14:49.216364','2019-05-10',1,3,13,1);
/*!40000 ALTER TABLE `devices_deviceuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_furnituretype`
--

DROP TABLE IF EXISTS `devices_furnituretype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_furnituretype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_furnituretype_user_id_766c259a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `devices_furnituretype_user_id_766c259a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_furnituretype`
--

LOCK TABLES `devices_furnituretype` WRITE;
/*!40000 ALTER TABLE `devices_furnituretype` DISABLE KEYS */;
INSERT INTO `devices_furnituretype` VALUES (1,'电视','2019-04-15 12:03:00.000000','2019-04-15 12:05:59.359730',1),(2,'洗衣机','2019-04-16 02:25:00.000000','2019-04-16 02:29:08.392365',1),(3,'测试','2019-04-16 04:01:00.000000','2019-04-16 04:02:22.995179',1),(4,'测试家电类型api','2019-05-11 06:20:48.830282','2019-05-11 06:20:48.830375',1),(5,'12','2019-05-11 06:41:50.573995','2019-05-11 06:41:50.574035',1),(6,'111','2019-05-11 06:47:34.289568','2019-05-11 06:47:34.289613',3);
/*!40000 ALTER TABLE `devices_furnituretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices_question`
--

DROP TABLE IF EXISTS `devices_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `furniture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_question_furniture_id_041f1d7e_fk_devices_f` (`furniture_id`),
  CONSTRAINT `devices_question_furniture_id_041f1d7e_fk_devices_f` FOREIGN KEY (`furniture_id`) REFERENCES `devices_furnituretype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices_question`
--

LOCK TABLES `devices_question` WRITE;
/*!40000 ALTER TABLE `devices_question` DISABLE KEYS */;
INSERT INTO `devices_question` VALUES (1,'您平时打游戏吗？','2019-04-27 03:22:38.528100',1),(2,'您家客厅多大？','2019-04-27 03:22:57.062138',1),(3,'您家有小孩子吗','2019-04-27 03:23:33.036415',1);
/*!40000 ALTER TABLE `devices_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(26,'devices','answer'),(17,'devices','device'),(16,'devices','devicetype'),(18,'devices','deviceuse'),(15,'devices','furnituretype'),(25,'devices','question'),(24,'logs','devicelog'),(23,'logs','usagelog'),(22,'orders','logistic'),(21,'orders','logistictype'),(20,'orders','order'),(19,'orders','orderadress'),(10,'reversion','revision'),(11,'reversion','version'),(5,'sessions','session'),(12,'users','banner'),(13,'users','emailverifyrecord'),(14,'users','userprofile'),(6,'xadmin','bookmark'),(9,'xadmin','log'),(7,'xadmin','usersettings'),(8,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-15 12:02:32.658304'),(2,'contenttypes','0002_remove_content_type_name','2019-04-15 12:02:32.735178'),(3,'auth','0001_initial','2019-04-15 12:02:32.805645'),(4,'auth','0002_alter_permission_name_max_length','2019-04-15 12:02:33.034917'),(5,'auth','0003_alter_user_email_max_length','2019-04-15 12:02:33.046345'),(6,'auth','0004_alter_user_username_opts','2019-04-15 12:02:33.058638'),(7,'auth','0005_alter_user_last_login_null','2019-04-15 12:02:33.071483'),(8,'auth','0006_require_contenttypes_0002','2019-04-15 12:02:33.078098'),(9,'auth','0007_alter_validators_add_error_messages','2019-04-15 12:02:33.092588'),(10,'auth','0008_alter_user_username_max_length','2019-04-15 12:02:33.107077'),(11,'auth','0009_alter_user_last_name_max_length','2019-04-15 12:02:33.120792'),(12,'auth','0010_alter_group_name_max_length','2019-04-15 12:02:33.197829'),(13,'auth','0011_update_proxy_permissions','2019-04-15 12:02:33.210697'),(14,'users','0001_initial','2019-04-15 12:02:33.374377'),(15,'admin','0001_initial','2019-04-15 12:02:33.624362'),(16,'admin','0002_logentry_remove_auto_add','2019-04-15 12:02:33.739112'),(17,'admin','0003_logentry_add_action_flag_choices','2019-04-15 12:02:33.757235'),(18,'devices','0001_initial','2019-04-15 12:02:33.919200'),(19,'reversion','0001_squashed_0004_auto_20160611_1202','2019-04-15 12:02:34.183146'),(20,'sessions','0001_initial','2019-04-15 12:02:34.379835'),(21,'xadmin','0001_initial','2019-04-15 12:02:34.525173'),(22,'xadmin','0002_log','2019-04-15 12:02:34.759641'),(23,'xadmin','0003_auto_20160715_0100','2019-04-15 12:02:34.938833'),(24,'devices','0002_auto_20190415_1222','2019-04-15 12:22:53.016906'),(25,'devices','0003_auto_20190416_0049','2019-04-16 00:49:22.529494'),(26,'devices','0004_auto_20190416_0216','2019-04-16 02:16:25.668077'),(27,'orders','0001_initial','2019-04-18 11:52:38.215604'),(28,'devices','0005_auto_20190418_1152','2019-04-18 11:52:38.919143'),(29,'devices','0006_auto_20190421_0658','2019-04-21 06:58:15.140337'),(30,'logs','0001_initial','2019-04-21 06:58:15.614087'),(31,'orders','0002_orderadress_user','2019-04-22 07:13:19.007985'),(32,'devices','0007_auto_20190422_1028','2019-04-22 10:28:30.741428'),(33,'devices','0008_auto_20190423_0525','2019-04-23 05:25:31.974999'),(34,'devices','0009_auto_20190423_0757','2019-04-23 07:57:10.933063'),(35,'orders','0003_order_type','2019-04-23 07:57:11.011602'),(36,'devices','0010_auto_20190427_0241','2019-04-27 02:59:21.162570'),(37,'devices','0011_auto_20190427_0242','2019-04-27 02:59:22.266932'),(38,'devices','0012_auto_20190427_0259','2019-04-27 02:59:22.330956');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7hucez5pdba5sidt3ud03vczbirvwgio','MjA1NzgyNzA2ZTY1NjBmNWFkYTJhNTQ3MWY0ZmE3OTY1MGYxMzdkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjViNDk3ZjZjNWMzN2NlNTY5NTU2M2NkOTZkYWMxM2NkNGYyZTg1IiwiTElTVF9RVUVSWSI6W1siZGV2aWNlcyIsImZ1cm5pdHVyZXR5cGUiXSwiIl19','2019-05-26 00:37:25.125574'),('99d01kc275i4zeg0giet5huqzxzav4ek','ZjZkMjdiOGFlYzAyNTIxZmRiZDAyMGNhYjFiNjY5Zjg3ZTUyNGM1OTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWViODYxNTk4ZTNhMTg4ZTUwZGUyZmVhZjM5Njg0NTQyNTgyZjU3MCIsInVzZXJuYW1lIjoiMTIzNDU2In0=','2019-05-25 02:53:15.978771'),('a10p42iflwj2kgzmm82nteesdjcuq56l','ZjZkMjdiOGFlYzAyNTIxZmRiZDAyMGNhYjFiNjY5Zjg3ZTUyNGM1OTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWViODYxNTk4ZTNhMTg4ZTUwZGUyZmVhZjM5Njg0NTQyNTgyZjU3MCIsInVzZXJuYW1lIjoiMTIzNDU2In0=','2019-05-25 06:47:12.874957'),('eh2acalfwho00plb4z4jkyw7j7s56cyt','ZjZkMjdiOGFlYzAyNTIxZmRiZDAyMGNhYjFiNjY5Zjg3ZTUyNGM1OTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWViODYxNTk4ZTNhMTg4ZTUwZGUyZmVhZjM5Njg0NTQyNTgyZjU3MCIsInVzZXJuYW1lIjoiMTIzNDU2In0=','2019-05-25 04:13:22.198207'),('pmm5rrf2zgreg8zmn3zkoz3zfaxts1xo','YTllOTdmZTQ2ZDkyZWRiMTU4MDQ4OTE3OGQ0MTU5YzU2NDc0YzkzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjViNDk3ZjZjNWMzN2NlNTY5NTU2M2NkOTZkYWMxM2NkNGYyZTg1IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2019-05-15 13:08:41.718840'),('xp3f0yjh25jfp67dcguyxizwp9cwot6k','ZDdhYTVjMjU3Zjk4OTJhNTk1OGJlMzA5NzA2NDJiYmU4ZDE5YTU2ODp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjM1MDI1YjFkNTk1YjQ5ZjNlYzQ0NDEwMDY5MWYyOWUwYzZmOWZjOSIsInVzZXJuYW1lIjoiMTIzNDU2In0=','2019-05-25 02:30:39.941270'),('z37auazxaa6hp98wz4bgixeii42addds','YTllOTdmZTQ2ZDkyZWRiMTU4MDQ4OTE3OGQ0MTU5YzU2NDc0YzkzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjViNDk3ZjZjNWMzN2NlNTY5NTU2M2NkOTZkYWMxM2NkNGYyZTg1IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2019-05-06 06:26:09.533193');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_devicelog`
--

DROP TABLE IF EXISTS `logs_devicelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_devicelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `day` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `forniture_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_devicelog_forniture_type_id_5c88c256_fk_devices_f` (`forniture_type_id`),
  KEY `logs_devicelog_user_id_6f927393_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `logs_devicelog_forniture_type_id_5c88c256_fk_devices_f` FOREIGN KEY (`forniture_type_id`) REFERENCES `devices_furnituretype` (`id`),
  CONSTRAINT `logs_devicelog_user_id_6f927393_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_devicelog`
--

LOCK TABLES `logs_devicelog` WRITE;
/*!40000 ALTER TABLE `logs_devicelog` DISABLE KEYS */;
INSERT INTO `logs_devicelog` VALUES (1,'2019-05-02 03:28:28.689412','2019-05-02','watch',1,1,1);
/*!40000 ALTER TABLE `logs_devicelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_usagelog`
--

DROP TABLE IF EXISTS `logs_usagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_usagelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `day` date NOT NULL,
  `info` longtext NOT NULL,
  `forniture_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_usagelog_forniture_type_id_618f0c35_fk_devices_f` (`forniture_type_id`),
  KEY `logs_usagelog_user_id_badf16c9_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `logs_usagelog_forniture_type_id_618f0c35_fk_devices_f` FOREIGN KEY (`forniture_type_id`) REFERENCES `devices_furnituretype` (`id`),
  CONSTRAINT `logs_usagelog_user_id_badf16c9_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_usagelog`
--

LOCK TABLES `logs_usagelog` WRITE;
/*!40000 ALTER TABLE `logs_usagelog` DISABLE KEYS */;
INSERT INTO `logs_usagelog` VALUES (1,'2019-05-02 03:28:59.463850','2019-05-02','{cpu:80%, ram:50%}',1,1);
/*!40000 ALTER TABLE `logs_usagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_logistic`
--

DROP TABLE IF EXISTS `orders_logistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_logistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `num` varchar(255) NOT NULL,
  `logistic_type_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_logistic_logistic_type_id_71719505_fk_orders_lo` (`logistic_type_id`),
  KEY `orders_logistic_order_id_9e67fec6_fk_orders_order_id` (`order_id`),
  CONSTRAINT `orders_logistic_logistic_type_id_71719505_fk_orders_lo` FOREIGN KEY (`logistic_type_id`) REFERENCES `orders_logistictype` (`id`),
  CONSTRAINT `orders_logistic_order_id_9e67fec6_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_logistic`
--

LOCK TABLES `orders_logistic` WRITE;
/*!40000 ALTER TABLE `orders_logistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_logistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_logistictype`
--

DROP TABLE IF EXISTS `orders_logistictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_logistictype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_logistictype_user_id_6d9643e8_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `orders_logistictype_user_id_6d9643e8_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_logistictype`
--

LOCK TABLES `orders_logistictype` WRITE;
/*!40000 ALTER TABLE `orders_logistictype` DISABLE KEYS */;
INSERT INTO `orders_logistictype` VALUES (1,'2019-04-22 02:33:53.283598','顺丰快递','http://www.sf-express.com/',1);
/*!40000 ALTER TABLE `orders_logistictype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `day` date NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_address_id_0daf897b_fk_orders_orderadress_id` (`address_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `orders_order_address_id_0daf897b_fk_orders_orderadress_id` FOREIGN KEY (`address_id`) REFERENCES `orders_orderadress` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (3,'2019-04-23 01:25:31.114873','2019-04-23',7,1,NULL),(6,'2019-04-23 08:00:06.292128','2019-04-23',7,1,'电视'),(8,'2019-05-01 12:33:20.596900','2019-05-01',NULL,1,'电视'),(9,'2019-05-01 12:34:35.164354','2019-05-01',NULL,1,'电视'),(10,'2019-05-01 12:49:48.275014','2019-05-01',7,1,'电视'),(11,'2019-05-01 12:50:08.811905','2019-05-01',7,1,'洗衣机'),(12,'2019-05-01 12:58:12.899362','2019-05-01',7,1,'洗衣机'),(13,'2019-05-10 03:23:54.979053','2019-05-10',7,1,'电视');
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderadress`
--

DROP TABLE IF EXISTS `orders_orderadress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_orderadress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `telphone` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderadress_user_id_25ac9d9d_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `orders_orderadress_user_id_25ac9d9d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderadress`
--

LOCK TABLES `orders_orderadress` WRITE;
/*!40000 ALTER TABLE `orders_orderadress` DISABLE KEYS */;
INSERT INTO `orders_orderadress` VALUES (7,'罗梁','1302313121','山东','青岛','崂山区松岭路238号','测试',1),(9,'临时数据流','13023131211','四川省','qd','沙河镇建新村4社','',1);
/*!40000 ALTER TABLE `orders_orderadress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$150000$1pC5QKNOcddO$aWSNyIgLAdEt+Ts9jB42aQoEAI3py65gdVYCBMKxwjk=','2019-05-11 02:34:00.000000',1,'admin','','','luoliang@stu.ouc.edu.cn',1,1,'2019-04-15 12:03:00.000000','1','2019-05-11','female','1','1','image/201905/WX20190510-153509.png'),(3,'pbkdf2_sha256$150000$i6jS0tpVf5AD$guH1dz1t1s7zd4379OtVphb+OTKfnQ/8eex6y4Pskh8=','2019-04-16 09:38:00.000000',1,'海尔1','','','',1,1,'2019-04-16 03:21:00.000000','1',NULL,'female','11',NULL,'image/201904/0c0a63a7-9d6a-4cda-81b6-b36351d84bb0_fAhS8NZ.jpg'),(4,'',NULL,0,'1','','','',0,1,'2019-04-16 09:28:05.666317','',NULL,'female','',NULL,'image/default.png'),(5,'pbkdf2_sha256$150000$UZG5TdBBMWF6$sUJAzdF3wIn6zH/gpDDM9yQyFfbcghItgvnktJGPooU=',NULL,0,'a919273926','','','',0,1,'2019-04-17 05:08:50.638483','',NULL,'female','',NULL,'image/default.png'),(6,'',NULL,0,'1999','','','',0,1,'2019-04-17 05:09:21.956987','',NULL,'female','',NULL,'image/default.png'),(7,'',NULL,0,'test01','','','',0,1,'2019-05-10 10:27:06.169675','',NULL,'female','',NULL,'image/default.png'),(8,'',NULL,0,'test02','','','',0,1,'2019-05-10 10:42:48.153523','test02',NULL,'female','',NULL,'image/default.png'),(9,'',NULL,0,'test03','','','',0,1,'2019-05-10 10:45:05.268943','test03',NULL,'female','','15954086320','image/default.png'),(10,'pbkdf2_sha256$150000$qIh69vNLMmVC$uZnIuei43EELLUomweN9w/VE6+EaKFAXbNBjmgbtnLQ=','2019-05-11 06:47:00.000000',0,'123456','','','',0,1,'2019-05-10 10:52:00.000000','test03',NULL,'female','`','15954086320','image/201905/3defe866-423a-49bf-8d97-d6912881bd8a_Z2isTWX.jpg'),(13,'pbkdf2_sha256$150000$iwvvhDOoifCa$B7ZAPstQjw4qm5gbHLT8eO3px5VtbLY8yHIdud/gWrs=',NULL,0,'201905101','','','',0,1,'2019-05-11 01:10:53.514377','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (2,1,1),(1,3,1);
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-04-15 12:05:53.321174','127.0.0.1','1','电视','create','已添加。',15,1),(2,'2019-04-15 12:05:59.361233','127.0.0.1','1','电视','change','没有字段被修改。',15,1),(3,'2019-04-15 12:06:23.003403','127.0.0.1','1','显示器','create','已添加。',16,1),(4,'2019-04-15 12:23:41.852030','127.0.0.1','1','','create','已添加。',10,1),(5,'2019-04-15 12:24:04.709527','127.0.0.1',NULL,'','delete','批量删除 1 个 revision',NULL,1),(6,'2019-04-15 13:19:53.291083','127.0.0.1','2','hello','delete','',14,1),(7,'2019-04-16 02:20:14.371866','127.0.0.1','1','显示器32英寸','create','已添加。',17,1),(8,'2019-04-16 02:25:03.504857','127.0.0.1',NULL,'','delete','批量删除 1 个 用户小组件',NULL,1),(9,'2019-04-16 02:29:08.393398','127.0.0.1','2','洗衣机','create','已添加。',15,1),(10,'2019-04-16 02:29:28.168654','127.0.0.1','2','滚筒','create','已添加。',16,1),(11,'2019-04-16 02:30:08.388639','127.0.0.1','2','滚筒60l','create','已添加。',17,1),(12,'2019-04-16 03:20:51.752179','127.0.0.1','1','企业组','create','已添加。',3,1),(13,'2019-04-16 03:21:44.367722','127.0.0.1','3','海尔1','create','已添加。',14,1),(14,'2019-04-16 03:22:18.540879','127.0.0.1','3','海尔1','change','修改 groups，nick_name，adress 和 image',14,1),(15,'2019-04-16 03:23:00.325609','127.0.0.1','3','海尔1','change','修改 is_staff 和 image',14,1),(16,'2019-04-16 04:02:22.998788','127.0.0.1','3','测试','create','已添加。',15,3),(17,'2019-04-17 05:07:31.758653','127.0.0.1','3','海尔1','change','修改 last_login，is_superuser 和 image',14,1),(18,'2019-04-17 05:08:50.847699','127.0.0.1','5','a919273926','create','已添加。',14,1),(19,'2019-04-18 12:00:35.840416','127.0.0.1','2','个人用户','create','已添加。',3,1),(20,'2019-04-22 02:11:14.272037','127.0.0.1','1','罗梁 山东省青岛市崂山区松岭路238号','create','已添加。',19,1),(21,'2019-04-22 02:11:19.469890','127.0.0.1','1','Order object (1)','create','已添加。',20,1),(22,'2019-04-22 02:33:53.295526','127.0.0.1','1','顺丰快递','create','已添加。',21,1),(23,'2019-04-22 02:34:15.932782','127.0.0.1','1','顺丰快递 37021232323232','create','已添加。',22,1),(24,'2019-04-22 10:47:00.738511','127.0.0.1','3','内存','create','已添加。',16,1),(25,'2019-04-22 10:47:12.633400','127.0.0.1','4','CPU','create','已添加。',16,1),(26,'2019-04-23 00:44:54.894624','127.0.0.1','3','CPU-2.2GHZ','create','已添加。',17,1),(27,'2019-04-23 00:47:02.967547','127.0.0.1','4','内存-4G','create','已添加。',17,1),(28,'2019-04-23 01:17:14.902663','127.0.0.1',NULL,'','delete','批量删除 1 个 订单列表',NULL,1),(29,'2019-04-23 01:23:58.766154','127.0.0.1',NULL,'','delete','批量删除 1 个 订单列表',NULL,1),(30,'2019-04-23 01:24:34.648514','127.0.0.1',NULL,'','delete','批量删除 3 个 配件使用记录',NULL,1),(31,'2019-04-23 01:55:46.824594','127.0.0.1','5','内存-8G','create','已添加。',17,1),(32,'2019-04-23 05:27:39.321335','127.0.0.1',NULL,'','delete','批量删除 9 个 配件使用记录',NULL,1),(33,'2019-04-23 05:28:04.117685','127.0.0.1',NULL,'','delete','批量删除 1 个 物流列表',NULL,1),(34,'2019-04-23 07:31:07.604341','127.0.0.1','13','DeviceUse object (13)','create','已添加。',18,1),(35,'2019-04-23 07:39:30.144736','127.0.0.1','14','内存-4G','create','已添加。',18,1),(36,'2019-04-27 03:22:38.536568','127.0.0.1','1','Question object (1)','create','已添加。',25,1),(37,'2019-04-27 03:22:57.065721','127.0.0.1','2','Question object (2)','create','已添加。',25,1),(38,'2019-04-27 03:23:08.459506','127.0.0.1','2','Question object (2)','change','修改 question',25,1),(39,'2019-04-27 03:23:15.362369','127.0.0.1','1','Question object (1)','change','修改 question',25,1),(40,'2019-04-27 03:23:33.044262','127.0.0.1','3','Question object (3)','create','已添加。',25,1),(41,'2019-04-27 04:08:47.551197','127.0.0.1','1','打','create','已添加。',26,1),(42,'2019-04-30 08:12:43.818015','127.0.0.1','1','您平时打游戏吗？----打','change','没有字段被修改。',26,1),(43,'2019-04-30 08:13:01.097939','127.0.0.1','2','您平时打游戏吗？----不打','create','已添加。',26,1),(44,'2019-04-30 08:13:39.472739','127.0.0.1','3','您家客厅多大？----30m²','create','已添加。',26,1),(45,'2019-04-30 08:14:22.609791','127.0.0.1','6','显示器-55英寸','create','已添加。',17,1),(46,'2019-04-30 08:14:25.449474','127.0.0.1','4','您家客厅多大？----60','create','已添加。',26,1),(47,'2019-04-30 08:14:54.473339','127.0.0.1','5','您家有小孩子吗----有','create','已添加。',26,1),(48,'2019-04-30 08:15:37.592448','127.0.0.1','6','您家有小孩子吗----没有','create','已添加。',26,1),(49,'2019-05-02 03:28:28.708920','127.0.0.1','1','DeviceLog object (1)','create','已添加。',24,1),(50,'2019-05-02 03:28:59.482555','127.0.0.1','1','UsageLog object (1)','create','已添加。',23,1),(51,'2019-05-10 02:16:58.634321','127.0.0.1','1','UsageLog object (1)','change','修改 user',23,1),(52,'2019-05-10 03:24:31.121570','127.0.0.1','1','DeviceLog object (1)','change','修改 user',24,1),(53,'2019-05-10 11:08:45.333679','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(54,'2019-05-11 03:12:33.733963','127.0.0.1','1','admin','change','修改 last_login，groups，nick_name，birthday，adress，mobile 和 image',14,1),(55,'2019-05-11 06:52:15.009558','127.0.0.1','10','123456','change','修改 last_login，is_staff，adress 和 image',14,1),(56,'2019-05-11 06:53:04.874297','127.0.0.1','10','123456','change','修改 is_staff 和 image',14,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','7,6',1),(2,'site-theme','https://bootswatch.com/3/paper/bootstrap.min.css',1),(3,'dashboard:home:pos','',3),(4,'site-theme','https://bootswatch.com/3/journal/bootstrap.min.css',3);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
INSERT INTO `xadmin_userwidget` VALUES (6,'home','list','{\"title\": \"设备情况\", \"model\": \"devices.device\"}',1),(7,'home','chart','{\"id\": \"7\", \"title\": \"11\", \"model\": \"devices.furnituretype\"}',1);
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-14 10:03:28
