-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: yueeronline
-- ------------------------------------------------------
-- Server version	8.0.16

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'教师组'),(3,'管理员');
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (10,2,29),(11,2,30),(12,2,31),(13,2,32),(14,2,33),(15,2,34),(16,2,35),(17,2,36),(18,2,37),(19,2,38),(20,2,39),(21,2,40),(22,2,55),(5,2,66),(6,2,67),(7,2,68),(8,2,69),(9,2,70),(23,3,1),(24,3,2),(25,3,3),(26,3,4),(27,3,5),(28,3,6),(29,3,7),(30,3,8),(31,3,9),(32,3,10),(33,3,11),(34,3,12),(35,3,13),(36,3,14),(37,3,15),(38,3,16),(39,3,17),(40,3,18),(41,3,19),(42,3,20),(43,3,21),(44,3,22),(45,3,23),(46,3,24),(47,3,25),(48,3,26),(49,3,27),(50,3,28),(51,3,29),(52,3,30),(53,3,31),(54,3,32),(55,3,33),(56,3,34),(57,3,35),(58,3,36),(59,3,37),(60,3,38),(61,3,39),(62,3,40),(63,3,41),(64,3,42),(65,3,43),(66,3,44),(67,3,45),(68,3,46),(69,3,47),(70,3,48),(71,3,49),(72,3,50),(73,3,51),(74,3,52),(75,3,53),(76,3,54),(77,3,55),(78,3,56),(79,3,57),(80,3,58),(81,3,59),(82,3,60),(83,3,61),(84,3,62),(85,3,63),(86,3,64),(87,3,65),(88,3,66),(89,3,67),(90,3,68),(91,3,69),(92,3,70),(93,3,71),(94,3,72),(95,3,73),(96,3,74),(97,3,75),(98,3,76),(99,3,77),(100,3,78),(101,3,79),(102,3,80),(103,3,81),(104,3,82),(105,3,83),(106,3,84),(107,3,85),(108,3,86),(109,3,87),(110,3,88),(111,3,89),(112,3,90),(113,3,91),(114,3,92),(115,3,93),(116,3,94),(117,3,95),(118,3,96),(119,3,97),(120,3,98),(121,3,99),(122,3,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add 用户信息',4,'add_userprofile'),(14,'Can change 用户信息',4,'change_userprofile'),(15,'Can delete 用户信息',4,'delete_userprofile'),(16,'Can view 用户信息',4,'view_userprofile'),(17,'Can add log entry',5,'add_logentry'),(18,'Can change log entry',5,'change_logentry'),(19,'Can delete log entry',5,'delete_logentry'),(20,'Can add session',6,'add_session'),(21,'Can change session',6,'change_session'),(22,'Can delete session',6,'delete_session'),(23,'Can add 邮箱验证码',7,'add_emailverifyrecord'),(24,'Can change 邮箱验证码',7,'change_emailverifyrecord'),(25,'Can delete 邮箱验证码',7,'delete_emailverifyrecord'),(26,'Can add 轮播图',8,'add_banner'),(27,'Can change 轮播图',8,'change_banner'),(28,'Can delete 轮播图',8,'delete_banner'),(29,'Can add 课程',9,'add_course'),(30,'Can change 课程',9,'change_course'),(31,'Can delete 课程',9,'delete_course'),(32,'Can add 章节',10,'add_lesson'),(33,'Can change 章节',10,'change_lesson'),(34,'Can delete 章节',10,'delete_lesson'),(35,'Can add 视频',11,'add_video'),(36,'Can change 视频',11,'change_video'),(37,'Can delete 视频',11,'delete_video'),(38,'Can add 课程资源',12,'add_courseresource'),(39,'Can change 课程资源',12,'change_courseresource'),(40,'Can delete 课程资源',12,'delete_courseresource'),(41,'Can add 城市',13,'add_citydict'),(42,'Can change 城市',13,'change_citydict'),(43,'Can delete 城市',13,'delete_citydict'),(44,'Can add 课程机构',14,'add_courseorg'),(45,'Can change 课程机构',14,'change_courseorg'),(46,'Can delete 课程机构',14,'delete_courseorg'),(47,'Can add 教师',15,'add_teacher'),(48,'Can change 教师',15,'change_teacher'),(49,'Can delete 教师',15,'delete_teacher'),(50,'Can add 用户咨询',16,'add_userask'),(51,'Can change 用户咨询',16,'change_userask'),(52,'Can delete 用户咨询',16,'delete_userask'),(53,'Can add 课程评论',17,'add_coursecomments'),(54,'Can change 课程评论',17,'change_coursecomments'),(55,'Can delete 课程评论',17,'delete_coursecomments'),(56,'Can add 用户收藏',18,'add_userfavorite'),(57,'Can change 用户收藏',18,'change_userfavorite'),(58,'Can delete 用户收藏',18,'delete_userfavorite'),(59,'Can add 用户消息',19,'add_usermessage'),(60,'Can change 用户消息',19,'change_usermessage'),(61,'Can delete 用户消息',19,'delete_usermessage'),(62,'Can add 用户课程',20,'add_usercourse'),(63,'Can change 用户课程',20,'change_usercourse'),(64,'Can delete 用户课程',20,'delete_usercourse'),(65,'Can view log entry',5,'view_logentry'),(66,'Can view 课程',9,'view_course'),(67,'Can view 课程资源',12,'view_courseresource'),(68,'Can view 章节',10,'view_lesson'),(69,'Can view 视频',11,'view_video'),(70,'Can view 课程评论',17,'view_coursecomments'),(71,'Can view 用户咨询',16,'view_userask'),(72,'Can view 用户课程',20,'view_usercourse'),(73,'Can view 用户收藏',18,'view_userfavorite'),(74,'Can view 用户消息',19,'view_usermessage'),(75,'Can view 城市',13,'view_citydict'),(76,'Can view 课程机构',14,'view_courseorg'),(77,'Can view 教师',15,'view_teacher'),(78,'Can view session',6,'view_session'),(79,'Can view 轮播图',8,'view_banner'),(80,'Can view 邮箱验证码',7,'view_emailverifyrecord'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore'),(101,'Can view 轮播课程',26,'view_bannercourse'),(102,'Can add add course',27,'add_addcourse'),(103,'Can change add course',27,'change_addcourse'),(104,'Can delete add course',27,'delete_addcourse'),(105,'Can view add course',27,'view_addcourse'),(106,'Can add 轮播课程',9,'add_bannercourse'),(107,'Can change 轮播课程',9,'change_bannercourse'),(108,'Can delete 轮播课程',9,'delete_bannercourse');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (190,'WQWS','wqws','c557a380017173faf230a0890e31f6eb786e2dee','2020-02-29 15:04:08.857182'),(191,'KRAC','krac','7a1ee873b15401516ecc1b091fe372d51313869f','2020-02-29 15:04:12.069145'),(192,'HSLF','hslf','187e22e8203525c8524adad929b588ee47289c6b','2020-02-29 15:05:27.911913');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11),
  `need_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'电子乐入门','电子乐入门','<p>&nbsp; &nbsp; 电子乐入门</p>','cj',20,1,1,'courses/2019/11/asdsad.jpg',78,'2019-11-16 02:07:00.000000',2,'yq','乐器',2,'学电子乐请认准我俞泽锋！^o^','嘀哩嘀哩嘀哩嘀哩',0),(2,'钢琴','钢琴','<p>&nbsp; &nbsp; 钢琴</p>','gj',20,0,0,'courses/2019/11/89eac19bec764a4bad19dbcd404d9915.jpg',1,'2019-11-24 15:13:00.000000',2,'yq','唱歌技巧',2,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(3,'电子琴','电子琴','<p>&nbsp; &nbsp; 电子琴</p>','cj',20,0,0,'courses/2019/11/2.jpg',0,'2019-11-24 15:14:00.000000',2,'yq','乐器',2,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(4,'二胡','二胡','二胡','zj',20,0,0,'courses/2019/11/3.jpg',0,'2019-11-24 15:14:00.000000',3,'yq','乐器',4,'要认真听课哦','要认真听课哦',1),(5,'吉他','吉他','<p>&nbsp; &nbsp; 吉他吉他</p>','zj',20,0,0,'courses/2019/11/4.jpg',0,'2019-11-24 15:14:00.000000',3,'yq','乐器',4,'要认真听课哦','要认真听课哦',0),(6,'童谣','童谣','童谣童谣','cj',20,0,0,'courses/2019/11/5.jpg',0,'2019-11-24 15:15:00.000000',4,'cg','唱歌技巧',5,'要认真听课哦','要认真听课哦',1),(7,'流行乐','流行乐','<p>&nbsp; &nbsp; 流行乐流行乐</p>','zj',20,1,0,'courses/2019/11/5a53116de7bce7259115de3d.jpg',2,'2019-11-24 15:15:00.000000',4,'yq','唱歌技巧',5,'要认真听课哦','要认真听课哦',0),(8,'古典音乐','古典音乐','<p>&nbsp; &nbsp; 古典音乐古典音乐</p>','gj',20,0,0,'courses/2019/11/06.jpg',2,'2019-11-24 15:17:00.000000',5,'yq','乐器',6,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(9,'华语音乐教学','华语音乐教学华语音乐教学','<p>&nbsp; &nbsp; 华语音乐教学华语音乐教学华语音乐教学</p>','cj',20,0,0,'courses/2019/11/6fc82e3650c4a8b3.jpg',0,'2019-11-24 15:17:00.000000',5,'yq','唱歌技巧',6,'要认真听课哦','要认真听课哦',0),(10,'摇滚音乐教学','摇滚音乐教学摇滚音乐教学','摇滚音乐教学摇滚音乐教学摇滚音乐教学','cj',20,0,0,'courses/2019/11/19.jpg',1,'2019-11-24 15:19:00.000000',6,'cg','唱歌技巧',7,'要认真听课哦','要认真听课哦',1),(11,'电子乐教学','电子乐教学','<p>&nbsp; &nbsp; 电子乐教学电子乐教学</p>','cj',20,0,0,'courses/2019/11/21.jpg',0,'2019-11-24 15:19:00.000000',6,'yq','唱歌技巧',7,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(12,'ACG音乐教学','ACG音乐教学ACG音乐教学','<p>&nbsp; &nbsp; ACG音乐教学ACG音乐教学ACG音乐教学</p>','gj',20,0,0,'courses/2019/11/33.jpg',0,'2019-11-24 15:20:00.000000',7,'yq','唱歌技巧',8,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(13,'说唱教学','说唱教学说唱教学','说唱教学说唱教学说唱教学','gj',20,0,0,'courses/2019/11/57fe2c8e69401b34865e14cf.jpg',0,'2019-11-24 15:20:00.000000',8,'cg','唱歌技巧',9,'要认真听课哦','要认真听课哦',1),(14,'爵士乐教学','爵士乐教学爵士乐教学','<p>&nbsp; &nbsp; 爵士乐教学爵士乐教学爵士乐教学</p>','zj',20,0,0,'courses/2019/11/58a2db77e7bce745d1f932ea.jpg',0,'2019-11-24 15:21:00.000000',8,'yq','乐器',9,'要认真听课哦','要认真听课哦',0),(15,'日语歌曲教学','日语歌曲教学日语歌曲教学','<p>&nbsp; &nbsp; 日语歌曲教学日语歌曲教学日语歌曲教学</p>','zj',20,0,0,'courses/2019/11/58b52406e7bce768222f2806.jpg',0,'2019-11-24 15:21:00.000000',9,'yq','唱歌技巧',10,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(16,'韩语歌曲教学','韩语歌曲教学韩语歌曲教学','<p>&nbsp; &nbsp; 韩语歌曲教学韩语歌曲教学韩语歌曲教学</p>','zj',20,0,0,'courses/2019/11/390266052.jpg',11,'2019-11-24 15:22:00.000000',9,'cg','唱歌技巧',10,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(17,'民族音乐教学','民族音乐教学民族音乐教学','<p>&nbsp; &nbsp; 民族音乐教学民族音乐教学民族音乐教学</p>','cj',20,0,0,'courses/2019/11/109951164422797722.jpg',0,'2019-11-24 15:22:00.000000',10,'yq','唱歌技巧',3,'带好眼睛和耳朵就行','嘀哩嘀哩嘀哩嘀哩',0),(18,'小提琴教学','小提琴教学小提琴教学','<p>&nbsp; &nbsp; 小提琴教学小提琴教学小提琴教学</p>','gj',20,0,0,'courses/2019/11/201804271136025972_small.jpg',2,'2019-11-24 15:23:00.000000',10,'yq','乐器',3,'请认准我俞泽锋！^o^','嘀哩嘀哩嘀哩嘀哩',0),(19,'西班牙语音乐教学','西班牙语音乐教学西班牙语音乐教学','<p>&nbsp; &nbsp; 西班牙语音乐教学西班牙语音乐教学西班牙语音乐教学</p>','cj',20,1,0,'courses/2019/11/gamersky_01small_02_201711181744158.jpg',20,'2019-11-24 15:24:00.000000',11,'cg','唱歌技巧',12,'学唢呐请认准我俞泽锋！^o^','嘀哩嘀哩嘀哩嘀哩',0),(20,'如何唱高音？高音技巧教学','如何唱高音？高音技巧教学如何唱高音？高音技巧教学','<p>&nbsp; &nbsp; 如何唱高音？高音技巧教学如何唱高音？高音技巧教学如何唱高音？高音技巧教学如何唱高音？高音技巧教学</p>','gj',20,0,0,'courses/2019/11/gamersky_04origin_07_20183241923F66.jpg',4,'2019-11-24 15:24:00.000000',11,'cg','唱歌技巧',12,'带好眼睛和耳朵就行','啦啦啦啦啦',0),(21,'唢呐教学','唢呐教学唢呐教学','<p>&nbsp; &nbsp; 唢呐教学唢呐教学唢呐教学</p><p><img src=\"/media/courses/ueditor/IMG_20170320_001513_20191215163342_424.jpg\" title=\"\" alt=\"IMG_20170320_001513.jpg\" width=\"354\" height=\"230\" style=\"width: 354px; height: 230px;\"/> </p><p>2019-12-15</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> <img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> <img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> <img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> </p>','gj',20,2,1,'courses/2019/11/gamersky_03origin_05_20171118174423F.jpg',115,'2019-11-24 15:25:00.000000',12,'yq','乐器',1,'学唢呐请认准我俞泽锋！^o^','唢呐唢呐滴滴滴吹',0),(22,'陈玺的音乐','cxcxcxcx','<p>&nbsp; &nbsp; cxcxcxcxcxcxcxcxcxcx哈哈哈</p>','gj',20,2,1,'courses/2019/11/82daa3552524cd49048623534891f38dcbb299def68500b44.jpg',43,'2019-11-24 15:27:00.000000',12,'cg','乐器',1,'带好眼睛和耳朵就行','啦啦啦啦啦',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'如何选择唢呐','course/resource/2019/11/Download.zip','2019-11-24 19:22:00.000000',21),(2,'唢呐天下第一','course/resource/2019/11/Download_nYAilBK.zip','2019-11-24 19:26:00.000000',21),(3,'唢呐哈哈哈哈哈','course/resource/2019/11/Download_T1NEnU3.zip','2019-11-24 19:26:00.000000',21),(4,'我才不学唢呐','course/resource/2019/11/Download_zYy0kiy.zip','2019-11-24 19:27:00.000000',21);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一节','2019-11-16 02:11:00.000000',1),(2,'第二节','2019-11-16 02:14:00.000000',1),(3,'第三节','2019-11-17 02:17:00.000000',1),(5,'第四节','2019-11-17 02:19:00.000000',1),(6,'第五节','2019-11-17 02:19:00.000000',1),(7,'第一章  基础知识','2019-11-24 18:37:00.000000',21),(8,'第二章  进阶教学','2019-11-24 18:39:00.000000',21),(9,'第三章  知识回顾','2019-11-24 18:40:00.000000',21);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 第一节','2019-11-24 18:52:00.000000',7,'http://q6ge54lpv.bkt.clouddn.com/test.mp4?e=1582967477&token=y7k-joOhrEX-qsurh6pUNh6w5A6IanC2SfdsiJ4k:H0ZXoz0dZ1DWgbfiIXjIvc06FDs=',6),(2,'1.2 第二节','2019-11-24 18:54:00.000000',7,'http://q6ge54lpv.bkt.clouddn.com/test.mp4?e=1582967477&token=y7k-joOhrEX-qsurh6pUNh6w5A6IanC2SfdsiJ4k:H0ZXoz0dZ1DWgbfiIXjIvc06FDs=',23),(3,'2.1 第一节','2019-11-24 18:54:00.000000',8,'http://q6ge54lpv.bkt.clouddn.com/test.mp4?e=1582967477&token=y7k-joOhrEX-qsurh6pUNh6w5A6IanC2SfdsiJ4k:H0ZXoz0dZ1DWgbfiIXjIvc06FDs=',20),(4,'3.1 第一节','2019-11-24 18:54:00.000000',9,'http://q6ge54lpv.bkt.clouddn.com/test.mp4?e=1582967477&token=y7k-joOhrEX-qsurh6pUNh6w5A6IanC2SfdsiJ4k:H0ZXoz0dZ1DWgbfiIXjIvc06FDs=',22);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-16 00:33:09.268141','2','test1',1,'Added.',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(25,'captcha','captchastore'),(3,'contenttypes','contenttype'),(26,'courses','bannercourse'),(9,'courses','course'),(12,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(17,'operation','coursecomments'),(16,'operation','userask'),(20,'operation','usercourse'),(18,'operation','userfavorite'),(19,'operation','usermessage'),(13,'organization','citydict'),(14,'organization','courseorg'),(15,'organization','teacher'),(6,'sessions','session'),(27,'users','addcourse'),(8,'users','banner'),(7,'users','emailverifyrecord'),(4,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-12 08:51:09.987264'),(2,'contenttypes','0002_remove_content_type_name','2019-11-12 08:51:11.455339'),(3,'auth','0001_initial','2019-11-12 08:51:12.627239'),(4,'auth','0002_alter_permission_name_max_length','2019-11-12 08:51:16.512860'),(5,'auth','0003_alter_user_email_max_length','2019-11-12 08:51:16.581669'),(6,'auth','0004_alter_user_username_opts','2019-11-12 08:51:16.648493'),(7,'auth','0005_alter_user_last_login_null','2019-11-12 08:51:16.716277'),(8,'auth','0006_require_contenttypes_0002','2019-11-12 08:51:16.798061'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-12 08:51:16.874891'),(10,'auth','0008_alter_user_username_max_length','2019-11-12 08:51:16.941674'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-12 08:51:17.007531'),(12,'auth','0010_alter_group_name_max_length','2019-11-12 08:51:17.796391'),(13,'auth','0011_update_proxy_permissions','2019-11-12 08:51:17.865208'),(15,'courses','0001_initial','2019-11-12 17:28:59.953974'),(16,'admin','0001_initial','2019-11-13 16:27:09.499762'),(17,'admin','0002_logentry_remove_auto_add','2019-11-13 16:27:09.747880'),(18,'operation','0001_initial','2019-11-13 16:27:14.717499'),(20,'sessions','0001_initial','2019-11-13 16:27:17.887753'),(22,'xadmin','0001_initial','2019-11-17 00:41:04.337261'),(23,'xadmin','0002_log','2019-11-17 00:41:06.221108'),(24,'xadmin','0003_auto_20160715_0100','2019-11-17 00:41:07.170114'),(25,'users','0001_initial','2019-11-17 01:37:16.904089'),(26,'organization','0001_initial','2019-11-17 03:45:57.407592'),(27,'captcha','0001_initial','2019-11-21 00:05:32.159545'),(28,'users','0002_emailverifyrecord_is_used','2019-11-22 02:27:05.669785'),(29,'organization','0002_auto_20191123_1416','2019-11-23 14:16:32.475021'),(30,'organization','0003_auto_20191123_1602','2019-11-23 16:02:46.082194'),(31,'organization','0004_auto_20191123_1621','2019-11-23 16:21:51.256180'),(32,'operation','0002_auto_20191123_1745','2019-11-23 17:45:48.176681'),(33,'courses','0002_course_course_org','2019-11-24 11:43:42.179308'),(34,'organization','0005_teacher_image','2019-11-24 12:19:49.450842'),(35,'courses','0003_course_category','2019-11-24 16:41:07.101149'),(36,'courses','0004_course_tag','2019-11-24 17:09:38.354922'),(37,'courses','0005_video_url','2019-11-24 18:51:29.860778'),(38,'courses','0006_video_learn_time','2019-11-24 19:10:59.970567'),(39,'courses','0007_course_teacher','2019-11-24 20:04:43.870735'),(40,'courses','0008_auto_20191124_2013','2019-11-24 20:13:43.122593'),(41,'organization','0006_teacher_age','2019-11-26 00:29:58.113023'),(42,'users','0003_auto_20191127_1230','2019-11-27 12:30:25.165278'),(43,'users','0004_auto_20191127_1232','2019-11-27 12:32:27.969474'),(44,'courses','0009_course_is_banner','2019-11-28 00:02:40.568858'),(45,'organization','0007_courseorg_tag','2019-11-28 00:42:21.907389'),(46,'courses','0010_auto_20191130_2305','2019-11-30 23:05:20.066898'),(47,'organization','0008_remove_courseorg_course_nums','2019-12-11 17:27:50.830636'),(48,'organization','0009_courseorg_course_nums','2019-12-11 17:31:41.228550'),(49,'courses','0011_auto_20200229_1749','2020-02-29 17:51:37.974208'),(50,'users','0005_addcourse','2020-02-29 17:51:38.982310'),(51,'users','0006_auto_20200301_1644','2020-03-01 16:44:47.271647'),(52,'users','0007_auto_20200301_1735','2020-03-01 17:36:14.628433'),(53,'users','0008_userprofile_is_teacher','2020-03-01 17:46:14.663799'),(54,'users','0009_addcourse_is_add','2020-03-02 11:40:26.394305');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6wvl0s389h50wt9hamb5hmdcr7vqeiex','ODgzMzY0M2ZhMjA4NjJhYWRjOWUzMTk5YWM4Njc5ZTM5MmQ3NjBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyNjBiNDFlMTFlMTZjY2RlMmNmYzhiMzk4ZTM0NGU0YzcyZWY1M2EifQ==','2019-12-11 13:04:22.575354'),('f1nm11xnwk7eywz050ci12fmfv67w80c','NzYwZGU4MWIxYWIyNDViNjk5NDk5YmE0MWMzYzkzZjNlOWYzMjA3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyNjBiNDFlMTFlMTZjY2RlMmNmYzhiMzk4ZTM0NGU0YzcyZWY1M2EiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2019-12-25 01:32:09.721390'),('fq6meijbinua01oxenaw2fgrj74r51ws','MmUwYjI4ZjU1NTAyODJiZDhlNjJlMTA3MzliMmIxMmU1NGRkZDRlZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRjZjE2NjJjZDUyOGZhNzM3MGI1YWFiMGQwMTI3YzhmMTNhNWI3NWMifQ==','2019-12-11 00:56:45.859194'),('h4qgiuf8gyvh81r3hx54lhp3zqbz2fvt','NzYwZGU4MWIxYWIyNDViNjk5NDk5YmE0MWMzYzkzZjNlOWYzMjA3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyNjBiNDFlMTFlMTZjY2RlMmNmYzhiMzk4ZTM0NGU0YzcyZWY1M2EiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2019-12-30 17:09:23.621633'),('scm48pjch5wlsjc8x93cag7gd651nui2','MzA2MDllYTY2YTAzNTE1NGM0ZmE0NWM5ZDcyZDAyN2U3NzRlZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyNjBiNDFlMTFlMTZjY2RlMmNmYzhiMzk4ZTM0NGU0YzcyZWY1M2EiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsImFkZGNvdXJzZSJdLCIiXX0=','2020-03-16 11:55:17.492736'),('tr7zn65ybcls3q7abt7p0qpod1f9tswi','MmUwYjI4ZjU1NTAyODJiZDhlNjJlMTA3MzliMmIxMmU1NGRkZDRlZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRjZjE2NjJjZDUyOGZhNzM3MGI1YWFiMGQwMTI3YzhmMTNhNWI3NWMifQ==','2019-12-11 00:06:28.191739'),('wdgpstjgqx2o1tjl85flxx33prflltkr','ODgzMzY0M2ZhMjA4NjJhYWRjOWUzMTk5YWM4Njc5ZTM5MmQ3NjBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyNjBiNDFlMTFlMTZjY2RlMmNmYzhiMzk4ZTM0NGU0YzcyZWY1M2EifQ==','2019-12-09 12:43:58.932843');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'123123312','2019-11-24 21:20:38.328653',21,1),(2,'asd','2019-11-24 21:25:11.640051',21,1),(3,'asdasdagfas','2019-11-24 21:25:13.856883',21,1),(4,'war24315qwata','2019-11-24 21:25:16.361662',21,1),(5,'俞泽锋牛逼！','2019-11-24 21:25:40.056010',21,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'陈玺','18873320898','django','2019-11-23 17:46:07.353931'),(2,'慕课网','18873320898','django','2019-11-23 17:48:04.707414'),(3,'慕课网','18873320898','django','2019-11-23 17:48:05.308854'),(4,'asd','18873320898','asd','2019-11-23 17:53:08.403867'),(5,'陈玺','18873320898','django','2019-11-23 18:13:54.550665'),(6,'陈玺','18873320898','django','2019-11-23 18:14:53.875533'),(7,'陈玺','18873320898','django','2019-11-23 18:15:38.467162'),(8,'陈玺','18873320898','django','2019-11-23 18:18:05.819015'),(9,'陈玺','18873320898','django','2019-11-23 18:19:30.740426'),(10,'陈玺','18873320898','django','2019-11-23 18:20:34.756902'),(11,'慕课网','18873320898','sads','2019-11-23 18:26:14.684197'),(12,'asd','18873320898','唢呐教学','2020-03-02 11:22:34.408585'),(13,'asd','18873320898','唢呐教学','2020-03-02 11:23:07.921946');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (12,'2019-12-16 16:07:55.833060',21,1),(13,'2019-12-16 16:08:30.815792',22,1),(14,'2019-12-16 16:39:47.597192',19,1),(15,'2019-12-16 17:11:58.257180',1,1),(16,'2020-02-29 15:07:01.631533',22,10),(17,'2020-02-29 15:07:17.784027',21,10),(18,'2020-02-29 16:03:35.532429',7,10);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (21,3,2,'2019-11-27 16:48:01.569081',1),(22,3,3,'2019-11-27 17:00:39.949549',1),(29,22,1,'2019-11-29 13:04:36.233090',1),(30,2,2,'2019-11-30 23:30:45.343421',1),(31,1,1,'2019-11-30 23:30:54.851896',1),(32,12,2,'2019-12-16 16:03:48.791644',1),(33,21,1,'2019-12-16 16:03:54.458352',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'kkkk',1,'2019-11-27 20:54:00.000000'),(2,1,'779',1,'2019-11-27 20:54:00.000000'),(3,1,'ll',1,'2019-11-27 20:54:00.000000'),(4,0,'kkkk',0,'2019-11-27 22:34:00.000000'),(5,0,'1231231231321',0,'2019-11-27 22:36:00.000000'),(6,1,'123132312312',1,'2019-11-27 22:37:00.000000'),(8,1,'123123213',1,'2019-11-28 12:13:00.000000'),(9,10,'欢迎注册悦耳在线网',1,'2020-02-29 14:24:36.331505');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2019-11-23 13:33:00.000000'),(2,'上海市','上海市','2019-11-23 13:33:00.000000'),(3,'广州市','广州市','2019-11-23 13:33:00.000000'),(4,'深圳市','深圳市','2019-11-23 13:33:00.000000'),(5,'天津市','天津市','2019-11-23 13:34:00.000000'),(6,'杭州市','杭州市','2019-11-23 14:03:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `course_nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (2,'慕课网_北京','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。\r\n    4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',37,1,'org/2019/11/慕课网.jpg','北京市','2019-11-23 13:43:00.000000',1,'pxjg',1,'全国知名',3),(3,'大卫音乐网','是国内首家音乐在线学习平台,提供各种乐器与声乐的在线教学视频课程,包括钢琴即兴伴奏教程,流行钢琴弹唱教程,吉他教程等。我们的宗旨是:老师会不重要,学员会才重要!',3,0,'org/2019/11/大卫音乐.png','上海市','2019-11-23 13:45:00.000000',2,'gx',0,'全国知名',2),(4,'慕课网_广州','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。\r\n    4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/慕课网_HeLQGNL.jpg','广州市','2019-11-23 13:50:00.000000',3,'gx',1,'全国知名',2),(5,'网易公开课','网易正式推出“全球名校视频公开课项目” ，首批1200集课程上线，其中有200多集配有中文字幕。用户可以在线免费观看来自于哈佛大学等世界级名校的公开课课程，可汗学院，TED等教育性组织的精彩视频，内容涵盖人文、社会、艺术、科学、金融等领域。 网易公开课，力求为爱学习的网友创造一个公开的免费课程平台，借此向外界公开招聘兼职字幕翻译。网易公开课翻译平台目的是秉承互联网精神：开放、平等、协作、分享，让知识无国界！',0,0,'org/2019/11/网易公开课.png','北京市','2019-11-23 13:53:00.000000',1,'pxjg',0,'全国知名',2),(6,'牛客网','“牛客网”是一个专注于程序员的学习和成长的专业平台，集笔面试系统、课程教育、社群交流、招聘内推于一体。\r\n2016年7月25日，“牛客网”获 得1000 万人民币 Pre-A 轮融资。',0,0,'org/2019/11/牛客网.jpg','北京市','2019-11-23 13:55:00.000000',1,'gx',0,'全国知名',2),(7,'网易云音乐','网易云音乐是一款由网易开发的音乐产品，是网易杭州研究院的成果，依托专业音乐人、DJ、好友推荐及社交功能，在线音乐服务主打歌单、社交、大牌推荐和音乐指纹，以歌单、DJ节目、社交、地理位置为核心要素，主打发现和分享。\r\n    该产品2013年4月23日正式发布，截止2017年04月，产品已经包括iPhone、Android、Web、Windows、iPad、WP8、Mac、Win10UWP、Linux等九大平台客户端 。2015年1月16日，网易云音乐荣膺百度中国好应用“年度优秀视觉设计奖”。\r\n    2018年2月9日，网易云音乐与腾讯音乐达成版权互授合作。3月6日，网易云音乐与阿里音乐达成版权互授合作。4月5日，腾讯音乐娱乐集团发表声明称，暂停与网易云音乐的转授权合作洽谈。\r\n    2019年6月11日，网易云音乐入选“2019福布斯中国最具创新力企业榜”。9月6日，阿里巴巴作为领投方，领投网易云音乐7亿美元融资。',0,0,'org/2019/11/网易云音乐.png','杭州市','2019-11-23 14:03:00.000000',6,'pxjg',0,'全国知名',1),(8,'腾讯课堂','腾讯课堂是腾讯推出的专业在线教育平台，聚合大量优质教育机构和名师，下设职业培训、公务员考试、托福雅思、考证考级、英语口语、中小学教育等众多在线学习精品课程，打造老师在线上课教学、学生及时互动学习的课堂。',2,0,'org/2019/11/腾讯课堂.jpg','深圳市','2019-11-23 14:04:00.000000',4,'pxjg',0,'全国知名',2),(9,'学堂在线','学堂在线是由清华大学研发出的中文MOOC（大规模开放在线课程，简称慕课）平台，于2013年10月10日正式启动，面向全球提供在线课程。任何拥有上网条件的学生均可通过该平台，在网上学习课程视频。\r\n    2015年，学堂在线运行了包括清华大学、北京大学、复旦大学、斯坦福大学、麻省理工学院、加州大学伯克利分校等国内外几十所顶尖高校的优质课程，涵盖计算机、经管创业、理学、工程、文学、历史、艺术等多个领域。\r\n    在2016年发布的“全球慕课排行”中，学堂在线被评为“拥有最多精品好课”的三甲平台之一。截至到2016年10月，学堂在线注册用户数达到500万，选课人次690万，运行的课程数量已经超过1000门。',1,0,'org/2019/11/学堂在线.png','北京市','2019-11-23 14:06:00.000000',1,'gr',0,'全国知名',2),(10,'爱课程','爱课程是教育部、财政部“十二五”期间启动实施的“高等学校本科教学质量与教学改革工程”支持建设的一个高等教育课程资源共享平台，集中展示“中国大学视频公开课”和“中国大学资源共享课”，并对课程资源进行运行、更新、维护和管理。\r\n    网站利用现代信息技术和网络技术， 面向高校师生和社会大众。提供优质教育资源共享和个性化教学资源服务，具有资源浏览、搜索、重组、评价、课程包的导入导出、发布、互动参与和“教”“学”兼备等功能。\r\n    本网站是高等教育优质教学资源的汇聚平台，优质资源服务的网络平台，教学资源可持续建设和运营平台。网站致力于推动优质课程资源的广泛传播和共享，深化本科教育教学改革，提高高等教育质量，推动高等教育开放，并从一定程度上满足人民群众日趋强烈的学习需求、促进学习型社会建设。',0,0,'org/2019/11/爱课程.jpg','北京市','2019-11-23 14:09:00.000000',1,'gr',0,'全国知名',2),(11,'慕课网_天津','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。\r\n    4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/慕课网_nm4usEF.jpg','天津市','2019-11-23 14:11:00.000000',5,'pxjg',1,'全国知名',2),(12,'陈玺','陈玺',3,1,'org/2019/11/gamersky_02origin_03_20181618498AA.jpg','杭州市','2019-11-23 16:08:00.000000',6,'gr',4,'全国知名',2);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `teach_years` int(11) NOT NULL,
  `work_org` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'陈玺',25,'陈玺','总裁','xxxx',0,0,'2019-11-24 11:39:00.000000',12,'teacher/2019/11/Erzh6ogwyidYGnMpP2CAFw3D3D2F109951164393979652.jpg',21),(2,'李方辉',14,'小米','首席执行官','xxxx',100,0,'2019-11-24 11:39:00.000000',2,'teacher/2019/11/57948ffb69401b1a2741265e.jpg',21),(3,'俞泽锋',2000,'602工作室','打工仔','像个笨比',1000,0,'2019-11-24 20:05:00.000000',10,'teacher/2019/11/gamersky_02origin_03_20171072115F7A.jpg',21),(4,'大卫',3,'阿里巴巴','打工仔','xxxx',0,0,'2019-12-16 16:20:00.000000',3,'teacher/2019/12/57fe2c8e69401b34865e14cf.jpg',21),(5,'光州',13,'阿里巴巴','总裁','像个笨比',0,0,'2019-12-16 16:21:00.000000',4,'teacher/2019/12/89eac19bec764a4bad19dbcd404d9915.jpg',33),(6,'王毅',11,'网易','普通职员','我哪知道',0,0,'2019-12-16 16:23:00.000000',5,'teacher/2019/12/5.jpg',22),(7,'牛子',12,'602工作室','打工仔','像个笨比',0,0,'2019-12-16 16:25:00.000000',6,'teacher/2019/12/21_wuhF0wH.jpg',22),(8,'王益云',0,'网易','门卫','嗷嗷嗷',0,0,'2019-12-16 16:25:00.000000',7,'teacher/2019/12/109951164422797722.jpg',33),(9,'腾格尔',2,'腾讯','副主任','高高高',0,0,'2019-12-16 16:26:00.000000',8,'teacher/2019/12/201804271136025972_small.jpg',56),(10,'薛堂',6,'阿里巴巴','门卫','一动不动',0,0,'2019-12-16 16:27:00.000000',9,'teacher/2019/12/asdads.jpg',21),(12,'甜景',3,'小米','普通职员','xxxx',0,0,'2019-12-16 16:28:00.000000',11,'teacher/2019/12/57948ffb69401b1a2741265e_ECnfc42.jpg',21);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_addcourse`
--

DROP TABLE IF EXISTS `users_addcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_addcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_org` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `teacher` varchar(10) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `need_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `course` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_addcourse`
--

LOCK TABLES `users_addcourse` WRITE;
/*!40000 ALTER TABLE `users_addcourse` DISABLE KEYS */;
INSERT INTO `users_addcourse` VALUES (5,'asd','asd','管理员陈玺','asd',123,'teacher/add_course/2020/03/IMG_0110_2peDdhC.jpg','asd','asd','teacher/add_course/2020/03/skin_yFFMsda.zip','2020-03-02 11:49:07.292441',1),(6,'asd','asd','管理员陈玺','asd',123,'teacher/add_course/2020/03/IMG_0110_eStPdQr.jpg','asd','asd','teacher/add_course/2020/03/IMG_0110_J0apPLX.jpg','2020-03-02 11:58:45.898301',0);
/*!40000 ALTER TABLE `users_addcourse` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'第一个','banner/2019/11/gamersky_04origin_07_20175132146431.jpg','http://www.baidu.com/',1,'2019-11-28 00:06:00.000000'),(3,'第三个','banner/2019/11/gamersky_01origin_01_201712231824635.jpg','http://www.bilibili.com/',3,'2019-11-28 00:09:00.000000'),(4,'第四个','banner/2019/11/gamersky_01origin_01_20181131846728.jpg','http://www.hao123.com/',4,'2019-11-28 00:10:00.000000'),(5,'第二个','banner/2019/11/gamersky_02origin_03_201712231824CC1.jpg','http://www.baidu.com/',2,'2019-11-28 00:27:00.000000');
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
  `send_type` varchar(12) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'admin','xxx@qq.com','register','2019-11-16 01:39:00.000000',0),(2,'chenxi','616529325@qq.com','register','2019-11-16 01:47:00.000000',0),(6,'agNeKG4eBUGQB8H0','yueeronline@sina.com','register','2019-11-21 17:14:21.499904',1),(8,'lSHe8Kmm2HSivtGf','yueeronline@sina.com','forget','2019-11-22 02:34:37.652141',1),(17,'YGUB','1691152574@qq.com','update_email','2019-11-27 13:07:32.666440',1),(18,'Iss7','1691152574@qq.com','update_email','2019-11-27 13:31:27.438846',1),(19,'QbOI','616529325@qq.com','update_email','2019-11-27 14:10:59.888517',1),(20,'xBhH','1691152574@qq.com','update_email','2019-11-27 14:18:20.694584',1),(21,'J8al','616529325@qq.com','update_email','2019-11-27 14:25:36.490237',1),(22,'hjZxL3JrIHtYOHil','1691152574@qq.com','register','2020-02-29 14:24:36.381371',1),(23,'BwSwSjoHqjLt8hmv','1691152574@qq.com','forget','2020-02-29 15:00:59.863193',0),(24,'pSL811fBNN763nfw','1691152574@qq.com','forget','2020-02-29 15:01:37.555603',0);
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
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$X21J3jmxkBg1$ZzsiJMhPuoFJD2Guo0wwx+GA0pDC8NoX1bmFPcbZT+w=','2020-03-02 11:24:23.408386',1,'chenxi','','','616529325@qq.com',1,1,'2019-11-16 00:22:00.000000','管理员陈玺','2019-11-15','female','火星','18873320898','image/2019/11/XReYB9biRur0Rtigs2gqFQ3D3D2F109951163105440698.jpg',1),(7,'pbkdf2_sha256$24000$FrHbfxpXrGDG$GDEoK7s8F9Q+JRQgHCmEvIdbji19NpvhroGMAcdy+lQ=','2019-11-27 23:03:00.000000',0,'yueeronline@sina.com','','','yueeronline@sina.com',1,1,'2019-11-21 17:14:00.000000','悦耳',NULL,'female','湖南长沙','','image/2019/11/33.jpg',0),(10,'pbkdf2_sha256$24000$sbyUOsjjeds6$7YpRUL/d9NmhaVswSpg9NkNof3d+EvWtU+GK280QOg8=','2020-03-02 11:12:22.894843',0,'1691152574@qq.com','陈','玺','1691152574@qq.com',0,1,'2020-02-29 14:24:00.000000','教师账号1',NULL,'female','杭州市','','image/2020/02/6fc82e3650c4a8b3.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (4,1,3),(2,7,2);
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
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-11-17 01:39:47.688822','127.0.0.1','1','EmailVerifyRecord object','create','已添加',7,1),(2,'2019-11-17 01:47:59.170654','127.0.0.1','2','chenxi(616529325@qq.com)','create','已添加',7,1),(3,'2019-11-17 02:07:04.113972','127.0.0.1','1','Course object','create','已添加',9,1),(4,'2019-11-17 02:11:27.189842','127.0.0.1','1','Lesson object','create','已添加',10,1),(5,'2019-11-17 02:14:02.335712','127.0.0.1','2','Lesson object','create','已添加',10,1),(6,'2019-11-17 02:17:48.263878','127.0.0.1','3','第三节','create','已添加',10,1),(7,'2019-11-17 02:18:55.186492','127.0.0.1','4','django入门的第四届','create','已添加',10,1),(8,'2019-11-17 02:19:05.102149','127.0.0.1',NULL,'','delete','批量删除 1 个 章节',NULL,1),(9,'2019-11-17 02:19:14.908424','127.0.0.1','5','django入门的第四节','create','已添加',10,1),(10,'2019-11-17 02:19:40.683549','127.0.0.1','6','django入门 第五节','create','已添加',10,1),(11,'2019-11-23 13:33:39.958646','127.0.0.1','1','北京市','create','已添加',13,1),(12,'2019-11-23 13:33:48.665673','127.0.0.1','2','上海市','create','已添加',13,1),(13,'2019-11-23 13:33:57.837809','127.0.0.1','3','广州市','create','已添加',13,1),(14,'2019-11-23 13:34:09.683445','127.0.0.1','4','深圳市','create','已添加',13,1),(15,'2019-11-23 13:34:16.076833','127.0.0.1','5','天津市','create','已添加',13,1),(16,'2019-11-23 13:41:31.617242','127.0.0.1','1','慕课网','create','已添加',14,1),(17,'2019-11-23 13:43:34.725705','127.0.0.1',NULL,'','delete','批量删除 1 个 课程机构',NULL,1),(18,'2019-11-23 13:43:58.293348','127.0.0.1','2','慕课网','create','已添加',14,1),(19,'2019-11-23 13:49:04.284185','127.0.0.1','3','大卫音乐网','create','已添加',14,1),(20,'2019-11-23 13:51:10.342205','127.0.0.1','4','慕课网_广州','create','已添加',14,1),(21,'2019-11-23 13:51:23.858946','127.0.0.1','2','慕课网_北京','change','已修改 name 。',14,1),(22,'2019-11-23 13:55:30.167810','127.0.0.1','5','网易公开课','create','已添加',14,1),(23,'2019-11-23 13:59:47.551752','127.0.0.1','6','牛客网','create','已添加',14,1),(24,'2019-11-23 14:03:31.838862','127.0.0.1','6','杭州市','create','已添加',13,1),(25,'2019-11-23 14:04:33.563669','127.0.0.1','7','网易云音乐','create','已添加',14,1),(26,'2019-11-23 14:06:30.842450','127.0.0.1','8','腾讯课堂','create','已添加',14,1),(27,'2019-11-23 14:08:14.813183','127.0.0.1','9','学堂在线','create','已添加',14,1),(28,'2019-11-23 14:11:14.016599','127.0.0.1','10','爱课程','create','已添加',14,1),(29,'2019-11-23 14:12:49.217882','127.0.0.1','11','慕课网_天津','create','已添加',14,1),(30,'2019-11-23 16:09:36.987914','127.0.0.1','12','陈玺','create','已添加',14,1),(31,'2019-11-24 11:39:54.995267','127.0.0.1','1','陈玺 陈玺','create','已添加',15,1),(32,'2019-11-24 11:40:16.763155','127.0.0.1','2','慕课网_北京 李方辉','create','已添加',15,1),(33,'2019-11-24 11:40:51.156345','127.0.0.1','1','陈玺 陈玺','change','已修改 work_org 。',15,1),(34,'2019-11-24 11:44:19.181007','127.0.0.1','1','django入门','change','已修改 course_org 和 image 。',9,1),(35,'2019-11-24 12:20:29.212706','127.0.0.1','2','慕课网_北京 李方辉','change','已修改 image 。',15,1),(36,'2019-11-24 12:20:40.152584','127.0.0.1','1','陈玺 陈玺','change','已修改 image 。',15,1),(37,'2019-11-24 15:14:10.297961','127.0.0.1','2','钢琴','create','已添加',9,1),(38,'2019-11-24 15:14:27.446823','127.0.0.1','3','电子琴','create','已添加',9,1),(39,'2019-11-24 15:14:43.527777','127.0.0.1','4','二胡','create','已添加',9,1),(40,'2019-11-24 15:14:59.786201','127.0.0.1','5','吉他','create','已添加',9,1),(41,'2019-11-24 15:15:44.901894','127.0.0.1','6','童谣','create','已添加',9,1),(42,'2019-11-24 15:16:18.267691','127.0.0.1','7','流行乐','create','已添加',9,1),(43,'2019-11-24 15:17:49.960095','127.0.0.1','8','古典音乐','create','已添加',9,1),(44,'2019-11-24 15:18:59.923791','127.0.0.1','9','华语','create','已添加',9,1),(45,'2019-11-24 15:19:31.066437','127.0.0.1','9','华语音乐教学','change','已修改 name，desc 和 detail 。',9,1),(46,'2019-11-24 15:19:53.048202','127.0.0.1','10','摇滚音乐教学','create','已添加',9,1),(47,'2019-11-24 15:20:18.951492','127.0.0.1','11','电子乐教学','create','已添加',9,1),(48,'2019-11-24 15:20:39.702626','127.0.0.1','12','ACG音乐教学','create','已添加',9,1),(49,'2019-11-24 15:21:21.722878','127.0.0.1','13','说唱教学','create','已添加',9,1),(50,'2019-11-24 15:21:50.370405','127.0.0.1','14','爵士乐教学','create','已添加',9,1),(51,'2019-11-24 15:22:24.299273','127.0.0.1','15','日语歌曲教学','create','已添加',9,1),(52,'2019-11-24 15:22:44.396633','127.0.0.1','16','韩语歌曲教学','create','已添加',9,1),(53,'2019-11-24 15:23:09.555596','127.0.0.1','17','民族音乐教学','create','已添加',9,1),(54,'2019-11-24 15:24:01.280262','127.0.0.1','18','小提琴教学','create','已添加',9,1),(55,'2019-11-24 15:24:39.412692','127.0.0.1','19','西班牙语音乐教学','create','已添加',9,1),(56,'2019-11-24 15:25:42.295651','127.0.0.1','20','如何唱高音？高音技巧教学','create','已添加',9,1),(57,'2019-11-24 15:27:33.908721','127.0.0.1','21','唢呐教学','create','已添加',9,1),(58,'2019-11-24 15:28:08.988540','127.0.0.1','22','哈哈哈哈哈','create','已添加',9,1),(59,'2019-11-24 16:50:34.057646','127.0.0.1','1','UserCourse object','create','已添加',20,1),(60,'2019-11-24 16:52:14.841303','127.0.0.1','1','chenxi','change','已修改 last_login，nick_name，gender，address 和 image 。',4,1),(61,'2019-11-24 17:22:01.648036','127.0.0.1','22','cx','change','已修改 name，desc，detail 和 tag 。',9,1),(62,'2019-11-24 17:22:12.453992','127.0.0.1','21','唢呐教学','change','已修改 tag 。',9,1),(63,'2019-11-24 17:22:56.225796','127.0.0.1','20','如何唱高音？高音技巧教学','change','已修改 tag 和 category 。',9,1),(64,'2019-11-24 17:23:07.221858','127.0.0.1','19','西班牙语音乐教学','change','已修改 tag 和 category 。',9,1),(65,'2019-11-24 17:25:35.334117','127.0.0.1','18','小提琴教学','change','已修改 tag 。',9,1),(66,'2019-11-24 18:37:55.294737','127.0.0.1','7','唢呐教学 第一章  基础知识','create','已添加',10,1),(67,'2019-11-24 18:38:36.070487','127.0.0.1','7','唢呐教学 第一章  基础知识','change','没有字段被修改。',10,1),(68,'2019-11-24 18:39:43.116770','127.0.0.1','8','唢呐教学 第二章  进阶教学','create','已添加',10,1),(69,'2019-11-24 18:41:02.250775','127.0.0.1','9','唢呐教学 第三章  知识回顾','create','已添加',10,1),(70,'2019-11-24 18:53:25.888707','127.0.0.1','1','唢呐教学 第一章  基础知识 1.1 第一节','create','已添加',11,1),(71,'2019-11-24 18:54:35.237682','127.0.0.1','2','唢呐教学 第一章  基础知识 1.2 第二节','create','已添加',11,1),(72,'2019-11-24 18:54:44.680797','127.0.0.1','3','唢呐教学 第二章  进阶教学 2.1 第一节','create','已添加',11,1),(73,'2019-11-24 18:54:53.760804','127.0.0.1','4','唢呐教学 第三章  知识回顾 3.1 第一节','create','已添加',11,1),(74,'2019-11-24 19:25:31.532528','127.0.0.1','1','唢呐教学 如何选择唢呐','create','已添加',12,1),(75,'2019-11-24 19:26:49.940830','127.0.0.1','2','唢呐教学 唢呐天下第一','create','已添加',12,1),(76,'2019-11-24 19:27:00.566480','127.0.0.1','3','唢呐教学 哈哈哈哈哈','create','已添加',12,1),(77,'2019-11-24 19:27:12.674472','127.0.0.1','4','唢呐教学 我才不学唢呐','create','已添加',12,1),(78,'2019-11-24 19:27:33.827690','127.0.0.1','3','唢呐教学 唢呐哈哈哈哈哈','change','已修改 name 。',12,1),(79,'2019-11-24 20:07:20.541991','127.0.0.1','3','爱课程 俞泽锋','create','已添加',15,1),(80,'2019-11-24 20:07:38.886514','127.0.0.1','21','唢呐教学','change','已修改 teacher 。',9,1),(81,'2019-11-24 20:14:42.964545','127.0.0.1','21','唢呐教学','change','已修改 need_know 和 teacher_tell 。',9,1),(82,'2019-11-25 12:12:32.383827','127.0.0.1','2','UserCourse object','create','已添加',20,1),(83,'2019-11-27 20:54:32.642517','127.0.0.1','1','UserMessage object','create','已添加',19,1),(84,'2019-11-27 20:54:57.090374','127.0.0.1','2','UserMessage object','create','已添加',19,1),(85,'2019-11-27 20:55:01.207647','127.0.0.1','3','UserMessage object','create','已添加',19,1),(86,'2019-11-27 22:36:26.244217','127.0.0.1','4','UserMessage object','create','已添加',19,1),(87,'2019-11-27 22:36:50.413087','127.0.0.1','5','UserMessage object','create','已添加',19,1),(88,'2019-11-27 22:37:08.905706','127.0.0.1','6','UserMessage object','create','已添加',19,1),(89,'2019-11-27 22:42:23.633005','127.0.0.1','7','消息','create','已添加',19,1),(90,'2019-11-27 22:42:34.531511','127.0.0.1',NULL,'','delete','批量删除 1 个 用户消息',NULL,1),(91,'2019-11-28 00:07:48.846395','127.0.0.1','1','Banner object','create','已添加',8,1),(92,'2019-11-28 00:09:05.566988','127.0.0.1','2','Banner object','create','已添加',8,1),(93,'2019-11-28 00:10:21.497148','127.0.0.1','3','Banner object','create','已添加',8,1),(94,'2019-11-28 00:11:00.534904','127.0.0.1','4','轮播图 第四个','create','已添加',8,1),(95,'2019-11-28 00:27:03.504892','127.0.0.1',NULL,'','delete','批量删除 1 个 轮播图',NULL,1),(96,'2019-11-28 00:27:30.498085','127.0.0.1','5','轮播图 第二个','create','已添加',8,1),(97,'2019-11-28 12:14:04.707940','127.0.0.1','8','消息','create','已添加',19,1),(98,'2019-11-29 14:43:31.055338','127.0.0.1','1','唢呐教学 第一章  基础知识 1.1 第一节','change','已修改 url 。',11,1),(99,'2019-11-29 14:49:52.541892','127.0.0.1','1','唢呐教学 第一章  基础知识 1.1 第一节','change','已修改 learn_time 。',11,1),(100,'2019-11-29 14:51:21.932293','127.0.0.1','2','唢呐教学 第一章  基础知识 1.2 第二节','change','已修改 url 和 learn_time 。',11,1),(101,'2019-11-29 14:51:38.403350','127.0.0.1','3','唢呐教学 第二章  进阶教学 2.1 第一节','change','已修改 url 和 learn_time 。',11,1),(102,'2019-11-29 14:51:59.919770','127.0.0.1','4','唢呐教学 第三章  知识回顾 3.1 第一节','change','已修改 url 和 learn_time 。',11,1),(103,'2019-11-29 14:53:45.723295','127.0.0.1','2','唢呐教学 第一章  基础知识 1.2 第二节','change','已修改 url 。',11,1),(104,'2019-11-30 23:00:38.215588','127.0.0.1','1','轮播图 第一个','change','已修改 image 。',8,1),(105,'2019-11-30 23:02:07.049005','127.0.0.1','22','陈玺的音乐','change','已修改 name，teacher，need_know 和 teacher_tell 。',9,1),(106,'2019-11-30 23:07:44.187768','127.0.0.1','22','陈玺的音乐','change','已修改 category 。',9,1),(107,'2019-11-30 23:15:13.679264','127.0.0.1','1','电子乐入门','change','已修改 name，desc，detail，teacher，need_know 和 teacher_tell 。',9,1),(108,'2019-11-30 23:29:10.710245','127.0.0.1','26','UserFavorite object','delete','',18,1),(109,'2019-12-10 16:47:53.594053','127.0.0.1','1','日志组','create','已添加',2,1),(110,'2019-12-10 16:48:39.971503','127.0.0.1','2','课程组','create','已添加',2,1),(111,'2019-12-10 16:48:46.008528','127.0.0.1','7','yueeronline@sina.com','change','已修改 last_login，groups 和 is_staff 。',4,1),(112,'2019-12-12 00:15:20.175192','127.0.0.1','21','唢呐教学','change','已修改 is_banner 。',9,1),(113,'2019-12-12 00:15:28.083561','127.0.0.1','21','唢呐教学','change','已修改 is_banner 。',26,1),(114,'2019-12-16 16:01:10.914502','127.0.0.1',NULL,'','delete','批量删除 6 个 用户课程',NULL,1),(115,'2019-12-16 16:05:35.535117','127.0.0.1',NULL,'','delete','批量删除 2 个 用户课程',NULL,1),(116,'2019-12-16 16:20:57.206348','127.0.0.1','4','大卫','create','已添加',15,1),(117,'2019-12-16 16:21:59.262617','127.0.0.1','5','光州','create','已添加',15,1),(118,'2019-12-16 16:24:45.899042','127.0.0.1','6','王毅','create','已添加',15,1),(119,'2019-12-16 16:25:29.930038','127.0.0.1','7','牛子','create','已添加',15,1),(120,'2019-12-16 16:26:17.329928','127.0.0.1','8','王益云','create','已添加',15,1),(121,'2019-12-16 16:27:24.127777','127.0.0.1','9','腾格尔','create','已添加',15,1),(122,'2019-12-16 16:28:18.818316','127.0.0.1','10','薛堂','create','已添加',15,1),(123,'2019-12-16 16:28:53.193802','127.0.0.1','11','甜景','create','已添加',15,1),(124,'2019-12-16 16:28:53.262603','127.0.0.1','12','甜景','create','已添加',15,1),(125,'2019-12-16 16:29:03.213405','127.0.0.1',NULL,'','delete','批量删除 1 个 教师',NULL,1),(126,'2019-12-16 16:59:05.780295','127.0.0.1','13','说唱教学','change','已修改 tag，category，teacher，need_know 和 teacher_tell 。',26,1),(127,'2019-12-16 16:59:29.262259','127.0.0.1','10','摇滚音乐教学','change','已修改 tag，category，teacher，need_know 和 teacher_tell 。',26,1),(128,'2019-12-16 16:59:44.911825','127.0.0.1','6','童谣','change','已修改 category，teacher，need_know 和 teacher_tell 。',26,1),(129,'2019-12-16 17:00:05.537507','127.0.0.1','4','二胡','change','已修改 tag，teacher，need_know 和 teacher_tell 。',26,1),(130,'2020-02-29 17:00:01.098187','127.0.0.1','2','教师组','change','已修改 name 和 permissions 。',2,1),(131,'2020-02-29 17:00:18.798178','127.0.0.1',NULL,'','delete','批量删除 1 个 组',NULL,1),(132,'2020-02-29 17:04:16.111986','127.0.0.1','10','1691152574@qq.com','change','已修改 last_login，groups，first_name，last_name，nick_name，address 和 image 。',4,1),(133,'2020-02-29 17:05:10.597422','127.0.0.1','3','管理员','create','已添加',2,1),(134,'2020-02-29 17:05:34.077360','127.0.0.1','1','chenxi','change','已修改 last_login 和 groups 。',4,1),(135,'2020-02-29 17:08:22.982277','127.0.0.1','10','1691152574@qq.com','change','已修改 is_staff 。',4,1),(136,'2020-02-29 17:11:34.996831','127.0.0.1','10','1691152574@qq.com','change','已修改 last_login，groups 和 is_staff 。',4,1),(137,'2020-03-01 17:55:19.872352','127.0.0.1','1','chenxi','change','已修改 last_login 和 is_teacher 。',4,1),(138,'2020-03-02 11:27:17.629754','127.0.0.1',NULL,'','delete','批量删除 1 个 教师上传的课程',NULL,1),(139,'2020-03-02 11:38:21.212239','127.0.0.1',NULL,'','delete','批量删除 3 个 教师上传的课程',NULL,1),(140,'2020-03-02 11:51:06.452827','127.0.0.1','5','教师上传的课程','change','已修改 is_add 。',27,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','1',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'dashboard:home:pos','',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
INSERT INTO `xadmin_userwidget` VALUES (1,'home','html','{\"id\": \"1\", \"title\": \"欢迎语\", \"content\": \"<!DOCTYPE html>\\r\\n<html lang=\\\"en\\\">\\r\\n<head>\\r\\n    <meta charset=\\\"UTF-8\\\">\\r\\n    <title>Title</title>\\r\\n</head>\\r\\n<body>\\r\\n    <h1>欢迎你！管理员。</h1>\\r\\n</body>\\r\\n</html>\"}',1);
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

-- Dump completed on 2020-03-03 14:32:38
