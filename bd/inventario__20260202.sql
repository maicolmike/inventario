-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add equipo',7,'add_equipo'),(26,'Can change equipo',7,'change_equipo'),(27,'Can delete equipo',7,'delete_equipo'),(28,'Can view equipo',7,'view_equipo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'registro','equipo'),(5,'sessions','session'),(6,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-12-29 21:39:42.970291'),(2,'contenttypes','0002_remove_content_type_name','2025-12-29 21:39:43.035005'),(3,'auth','0001_initial','2025-12-29 21:39:43.209744'),(4,'auth','0002_alter_permission_name_max_length','2025-12-29 21:39:43.249980'),(5,'auth','0003_alter_user_email_max_length','2025-12-29 21:39:43.256687'),(6,'auth','0004_alter_user_username_opts','2025-12-29 21:39:43.263931'),(7,'auth','0005_alter_user_last_login_null','2025-12-29 21:39:43.269273'),(8,'auth','0006_require_contenttypes_0002','2025-12-29 21:39:43.271965'),(9,'auth','0007_alter_validators_add_error_messages','2025-12-29 21:39:43.277648'),(10,'auth','0008_alter_user_username_max_length','2025-12-29 21:39:43.285635'),(11,'auth','0009_alter_user_last_name_max_length','2025-12-29 21:39:43.290399'),(12,'auth','0010_alter_group_name_max_length','2025-12-29 21:39:43.328042'),(13,'auth','0011_update_proxy_permissions','2025-12-29 21:39:43.335071'),(14,'auth','0012_alter_user_first_name_max_length','2025-12-29 21:39:43.339360'),(15,'users','0001_initial','2025-12-29 21:39:43.539942'),(16,'admin','0001_initial','2025-12-29 21:39:43.637654'),(17,'admin','0002_logentry_remove_auto_add','2025-12-29 21:39:43.643950'),(18,'admin','0003_logentry_add_action_flag_choices','2025-12-29 21:39:43.651785'),(19,'registro','0001_initial','2025-12-29 21:39:43.675436'),(20,'sessions','0001_initial','2025-12-29 21:39:43.706996');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bt6aldqapc6si71nwnvp4xiloji996zf','.eJxVjEEOwiAQRe_C2hAQ6jAu3XsGMjBTqRpISrsy3l2bdKHb_977LxVpXUpcu8xxYnVWVh1-t0T5IXUDfKd6azq3usxT0puid9r1tbE8L7v7d1Col299TDyQ-JxPFFLy4AUw4wjOIlpyEFBMArIDG0MBHYOAYQ6BxdLoQL0_9uw4RQ:1vlw0s:rGSGcDNck81n77dvjB0Pn7jWrmH2sBciLOyaZ3A53S8','2026-01-30 21:56:46.662613'),('d6qhg7qrb8o2lc5ya0ef4izaal1hih1o','.eJxVjDsOwjAQBe_iGll47ewaSnrOYK0_iwPIkeKkQtwdIqWA9s3Me6nA61LD2sscxqzOCkEdfsfI6VHaRvKd223SaWrLPEa9KXqnXV-nXJ6X3f07qNzrtx6SFwdRLAtmKgWNp2SQo0BGduBBjMEjO0I7eEmWEIFsPoktZFxU7w8W0Tfn:1vfkNp:pn8okI4kdY8mkQ0Fy-J7i-bM7N-j8KHNOj5ZMW3BpBE','2026-01-13 20:18:53.684472'),('f0cq26jm14wp2snjvz47gkn07d7gfikf','.eJxVjEEOwiAQRe_C2hAQ6jAu3XsGMjBTqRpISrsy3l2bdKHb_977LxVpXUpcu8xxYnVWVh1-t0T5IXUDfKd6azq3usxT0puid9r1tbE8L7v7d1Col299TDyQ-JxPFFLy4AUw4wjOIlpyEFBMArIDG0MBHYOAYQ6BxdLoQL0_9uw4RQ:1vafk0:Bqm9sBg0fY2lZIcrvDdldVsMHhDWnbcijyJpEiBIGek','2025-12-30 20:20:48.897431'),('gs7z86fblflvb8k78rm1lp3nhe9fa6v1','.eJxVjEEOgjAQRe_StWnotGWKS_eegQzTGUFNSSisjHdXEha6_e-9_zI9bevYb1WWfsrmbADM6XcciB9SdpLvVG6z5bmsyzTYXbEHrfY6Z3leDvfvYKQ6fmsdPCfygVsQjI4ZlMB7ZI2owLETl5JQFxCJE4IjaGJg1VayNBrM-wMaZTid:1vmwll:NOtIvKyC2x1-xuc-wjwhJxQSje8VPUduGY3JpMUDukI','2026-02-02 16:57:21.729167'),('ko102i2len1j4n3gx0yxo3av2rx33kcu','.eJxVjDsOwjAQBe_iGll47ewaSnrOYK0_iwPIkeKkQtwdIqWA9s3Me6nA61LD2sscxqzOCkEdfsfI6VHaRvKd223SaWrLPEa9KXqnXV-nXJ6X3f07qNzrtx6SFwdRLAtmKgWNp2SQo0BGduBBjMEjO0I7eEmWEIFsPoktZFxU7w8W0Tfn:1vg8ZI:d30RC1f9bvgzrePMXE7V4EfwF_FxLD0xpCeL7ruDjww','2026-01-14 22:08:20.100385'),('oc35zxuer2w5asudzam60c1y1yyqlb5h','.eJxVjEEOwiAQRe_C2hBgKjAu3XsGMsOgVA1NSrsy3l2bdKHb_977L5VoXWpae5nTKOqknFOH35EpP0rbiNyp3Sadp7bMI-tN0Tvt-jJJeZ539--gUq_f2rAIYgzIhbF4cpydGAQO4IUjG7gO1h4dBk-IwWQPeYCMUGLwlkS9PxI4N-g:1vafSu:tEIiNfSFTU44XOEWd234sd7i7Lhph8AgdSaj81qW0-A','2025-12-30 20:03:08.802660');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_equipo`
--

DROP TABLE IF EXISTS `registro_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_equipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `modelo` varchar(150) NOT NULL,
  `color` varchar(50) NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `sucursal` varchar(50) NOT NULL,
  `clasificacion` varchar(100) NOT NULL,
  `valor` bigint NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `numero_acta` varchar(150) NOT NULL,
  `recursos` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cargo_funcionario` varchar(100) NOT NULL,
  `funcionario_responsable` varchar(100) NOT NULL,
  `nit_proveedor` varchar(20) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `observaciones` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  CONSTRAINT `registro_equipo_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_equipo`
--

LOCK TABLES `registro_equipo` WRITE;
/*!40000 ALTER TABLE `registro_equipo` DISABLE KEYS */;
INSERT INTO `registro_equipo` VALUES (1,'ag01-fdo','ATRIL','AT009','no aplica','at009','gris',2,'mocoa','equipo de comunicacion y audiovisual',4371659,'2018-12-10','2018-12-10','000','fondo de educacion','nuevo','director de agencia','carlos ivan romero bastidas','70552867-1','og acrilicos','ATRILES CON CAJA DE CONECTIVIDAD Y MICROFONOS SHURE'),(2,'ag02-fdo','ATRIL','N/A','no aplica','at009','gris',1,'sibundoy','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(3,'ag03-fdo','ATRIL','N/A3','no aplica','at009','gris',1,'puerto asis','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','freddy alberto guinchin estrada','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(4,'ag04-fdo','ATRIL','N/A4','no aplica','at009','gris',1,'hormiga','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(5,'ag05-fdo','ATRIL','N/A5','no aplica','at009','gris',1,'orito','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(6,'ag06-fdo','ATRIL','N/A6','no aplica','at009','gris',1,'puerto leguizamo','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(7,'ag07-fdo','ATRIL','N/A7','no aplica','at009','gris',1,'dorada','equipo de comunicacion y audiovisual',1262768,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','70552867-1','og acrilicos','ATRIL CON CAJA DE CONECTIVIDAD Y MICROFONO SHURE'),(8,'ag01-fdo','Astas en madera x 3 unidades con base desarmable.','N/8','no aplica','n/a','gris',1,'mocoa','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','carlos ivan romero bastidas','900711197-8','banderas de lujo s.a.s','JUEGO POR TRES ASTAS MADERA'),(9,'ag02-fdo','Astas en madera x 3 unidades con base desarmable.','N/A9','no aplica','n/a','gris',1,'sibundoy','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(10,'ag03-fdo','Astas en madera x 3 unidades con base desarmable.','N/10','no aplica','n/a','gris',1,'puerto asis','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','freddy alberto guinchin estrada','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(11,'ag04-fdo','Astas en madera x 3 unidades con base desarmable.','N/11','no aplica','n/a','gris',1,'hormiga','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(12,'ag05-fdo','Astas en madera x 3 unidades con base desarmable.','N/A12','no aplica','n/a','gris',1,'orito','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(13,'ag06-fdo','Astas en madera x 3 unidades con base desarmable.','N/A13','no aplica','n/a','gris',1,'puerto leguizamo','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(14,'ag07-fdo','Astas en madera x 3 unidades con base desarmable.','N/A14','no aplica','n/a','gris',1,'dorada','muebles y enseres',571200,'2019-11-15','2019-11-15','000','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','900711197-8','banderas de lujo s.a.s','JUEGO DE ASTAS POR TRES UNDS'),(15,'ag01-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A15','no aplica','n/a','amarillo',1,'mocoa','otros',720000,'2019-12-20','2020-02-25','FEQC: 01-016-2020','fondo de educacion','nuevo','director de agencia','carlos ivan romero bastidas','1.061.749.792-3','dotaciones y suministros del sur',''),(16,'ag02-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A16','no aplica','n/a','amarillo',1,'sibundoy','otros',720000,'2019-12-15','2020-02-25','FEQC: 01-010-2020','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','1.061.749.792-3','dotaciones y suministros del sur',''),(17,'ag03-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A17','no aplica','n/a','amarillo',1,'puerto asis','otros',720000,'2019-12-15','2020-12-25','FEQC: 01-011-2020','fondo de educacion','nuevo','director de agencia','freddy alberto guinchin estrada','1.061.749.792-3','dotaciones y suministros del sur',''),(18,'ag04-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A18','no aplica','n/a','amarillo',1,'hormiga','otros',720000,'2019-12-15','2020-02-25','FEQC: 01-012-2020','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','1.061.749.792-3','dotaciones y suministros del sur',''),(19,'ag05-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A19','no aplica','n/a','amarillo',1,'orito','otros',720000,'2019-12-15','2020-02-25','FEQC: 01-013-2020','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','1.061.749.792-3','dotaciones y suministros del sur',''),(20,'ag06-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A20','no aplica','n/a','amarillo',1,'puerto leguizamo','otros',720000,'2019-12-20','2020-02-25','FEQC: 01-014-2020','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','1.061.749.792-3','dotaciones y suministros del sur',''),(21,'ag07-fdo','Juego de banderas x  3 unidades Colombia, Cootep logo bordado y Putumayo','N/A21','no aplica','n/a','amarillo',1,'dorada','otros',720000,'2019-12-15','2020-02-25','FEQC: 01-015-2020','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','1.061.749.792-3','dotaciones y suministros del sur',''),(22,'ag05-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A22','no aplica','n/a','verde',5,'orito','adornos',600000,'2019-05-06','2016-05-06','FEQC: 01-007-19','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','1.061.749.792-3','dotaciones y suministros del sur',''),(23,'ag02-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A23','no aplica','n/a','verde',5,'sibundoy','adornos',600000,'2019-05-06','2019-05-06','FEQC: 01-008-19','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','1.061.749.792-3','dotaciones y suministros del sur',''),(24,'ag03-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A24','no aplica','n/a','verde',5,'puerto asis','adornos',600000,'0019-12-05','0019-12-05','FEQC: 01-010-19','fondo de educacion','nuevo','director de agencia','freddy alberto guinchin estrada','1.061.749.792-3','dotaciones y suministros del sur',''),(25,'ag04-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A25','no aplica','n/a','verde',5,'hormiga','adornos',600000,'2019-05-13','2019-05-13','FEQC: 01-009-19','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','1.061.749.792-3','dotaciones y suministros del sur',''),(26,'ag05-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A26','no aplica','n/a','verde',5,'orito','adornos',600000,'2019-05-13','2019-05-13','FEQC: 01-011-19','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','1.061.749.792-3','dotaciones y suministros del sur',''),(27,'ag06-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A27','no aplica','n/a','verde',5,'puerto leguizamo','adornos',600000,'2019-05-13','2019-05-13','FEQC: 01-012-19','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','1.061.749.792-3','dotaciones y suministros del sur',''),(28,'ag07-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A28','no aplica','n/a','verde',5,'dorada','adornos',600000,'2019-05-13','2019-05-13','FEQC: 01-013-19','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','1.061.749.792-3','dotaciones y suministros del sur',''),(29,'ag01-fdo','Juego de mantel x3unds 2.95x150, con 3 caminos blanco 2.95x20, 3 caminos color verde 2.95x20 y 3 centros de mesa color blanco 1x1 mts, todos con logo bordado.','N/A29','no aplica','n/a','verde',10,'mocoa','adornos',1200000,'2019-05-13','2019-05-13','FEQC: 01-014-19','fondo de educacion','nuevo','auxiliar servicios generales','mery norbeyi castillo nupan','1.061.749.792-3','dotaciones y suministros del sur',''),(30,'ag01-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A30','no aplica','hx-yl001','blanco',10,'mocoa','muebles y enseres',2390000,'2020-07-17','2020-07-21','FEQC: 01-040-2020','fondo de educacion','nuevo','director de agencia','carlos ivan romero bastidas','900378553 – 9','world service international s.a.s',''),(31,'ag02-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A31','no aplica','hx-yl001','blanco',10,'sibundoy','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-043-2020','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','900378553 – 9','world service international s.a.s',''),(32,'ag03-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A32','no aplica','hx-yl001','blanco',10,'puerto asis','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-044-2020','fondo de educacion','nuevo','director de agencia','freddy alberto guinchin estrada','900378553 – 9','world service international s.a.s',''),(33,'ag04-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A33','no aplica','hx-yl001','blanco',10,'hormiga','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-045-2020','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','900378553 – 9','world service international s.a.s',''),(34,'ag05-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A34','no aplica','hx-yl001','blanco',10,'orito','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-046-2020','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','900378553 – 9','world service international s.a.s',''),(35,'ag06-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A35','no aplica','hx-yl001','blanco',10,'puerto leguizamo','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-042-2020','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','900378553 – 9','world service international s.a.s',''),(36,'ag07-fdo','Mesa plegable, 183cm, ancho 74.5 cm, alto 74 cm.','N/A41','no aplica','hx-yl001','blanco',10,'dorada','muebles y enseres',2704350,'2020-07-17','2020-07-21','FEQC: 01-041-2020','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','900378553 – 9','world service international s.a.s',''),(37,'ag01-fdo','NIKON D3400+ LENTE 18-55 mm + ESTUCHE +SD 16 GIGAS CLASE 10 + TRIPODE','3783065','no aplica','nikon ref: d3400 18-55 vr kit','negro',1,'mocoa','equipo de comunicacion y audiovisual',2444000,'2018-04-19','2018-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director comercial y de mercadeo','fabian lopez getial','900378553 – 9','world service international s.a.s',''),(38,'ag02-fdo','NIKON A100+ESTUCHE+SD 8 GIGAS','30013733','no aplica','nikon coolpix a300','gris',1,'sibundoy','equipo de comunicacion y audiovisual',762000,'2019-04-19','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','bueno','director de agencia','hernan froilan burbano caicedo','900378553 – 9','world service international s.a.s',''),(39,'ag03-fdo','CAMARA FOTOGRAFICA NIKON A100+ESTUCHE+SD 8 GIGAS','30021860','no aplica','nikon coolpix a300','gris',1,'puerto asis','equipo de comunicacion y audiovisual',762000,'2019-04-09','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de crédito','freddy alberto guinchin estrada','900378553 – 9','world service international s.a.s',''),(40,'ag04-fdo','CAMARA FOTOGRAFICA NIKON A100+ESTUCHE+SD 8 GIGAS','30021855','no aplica','nikon coolpix a300','gris',1,'hormiga','equipo de comunicacion y audiovisual',762000,'2019-04-19','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','ana marly segura diaz','900378553 – 9','world service international s.a.s',''),(41,'ag05-fdo','CAMARA FOTOGRAFICA NIKON A100+ESTUCHE+SD 8 GIGAS','30013736','no aplica','nikon coolpix a300','gris',1,'orito','equipo de comunicacion y audiovisual',762000,'2019-04-19','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','900378553 – 9','world service international s.a.s',''),(42,'ag06-fdo','CAMARA FOTOGRAFICA NIKON A100+ESTUCHE+SD 8 GIGAS','30022027','no aplica','nikon coolpix a300','gris',1,'puerto leguizamo','equipo de comunicacion y audiovisual',762000,'2019-04-19','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','magda johana sanabria tejada','900378553 – 9','world service international s.a.s',''),(43,'ag07-fdo','CAMARA FOTOGRAFICA NIKON A100+ESTUCHE+SD 8 GIGAS','30015222','no aplica','nikon coolpix a300','gris',1,'dorada','equipo de comunicacion y audiovisual',762000,'2019-04-19','2019-04-19','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','yesica obando ordonez','900378553 – 9','world service international s.a.s',''),(44,'ag02-fdo','Video beam EPSON PL W42+','X4JA8300071','epson','h845a','blanco',1,'sibundoy','equipo de comunicacion y audiovisual',3970000,'2018-06-21','2018-07-16','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','hernan froilan burbano caicedo','900378553 – 9','world service international s.a.s',''),(45,'ag05-fdo','Video beam EPSON PL W42+','X4JA8300124','epson','h845a','blanco',1,'orito','equipo de comunicacion y audiovisual',3790000,'2018-06-21','2018-07-13','SE ENTREGA CON OFICIO','fondo de educacion','nuevo','director de agencia','amilda berenice caicedo caicedo','900378553 – 9','world service international s.a.s',''),(46,'ag08-fdo','Video beam EPSON PL PL 2250U','X3NL810387L','epson','h871a','blanco',1,'villagarzon','equipo de comunicacion y audiovisual',9665106,'2018-06-21','2024-01-01','SE ENTREGA CON OFICIO','fondo de educacion','bueno','coordinador de operaciones de corresponsal solidario','camilo alejandro zambrano hernandez','900378553 – 9','world service international s.a.s','');
/*!40000 ALTER TABLE `registro_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `agencia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$1000000$fF3JBUFICjK2AhrKbPa85D$2o0QXIEx231EOmVyHV+1K/qXEQz9m/WokFx7OeSaios=','2026-01-30 21:23:54.329977',1,'admin11','','','soportesistemas@cootep.com.co',1,1,'2025-12-29 21:40:42.615993',0,''),(2,'pbkdf2_sha256$870000$W3UioeiUkPPiXzzrtTGhDL$+imBEQkXyWArtVBdDou/KaZ0kRWXmfTY/AK2FR0nddA=',NULL,0,'ACHAMO','ALFREDO RICARDO CHAMORRO BURBANO','','credito@cootep.com.co',0,1,'2025-12-30 19:01:33.463982',0,'MOCOA'),(3,'pbkdf2_sha256$870000$iemHOeQZ9k6Lf5zWstYZx8$Whj6Em3R+wOiSqmTQBdOCSUOd5Dx0hE9zqClI4XGcWI=',NULL,0,'ACAICE','AMILDA BERENICE CAICEDO CAICEDO','','agenciaorito@cootep.com.co',0,1,'2025-12-30 19:01:33.875930',0,'ORITO'),(4,'pbkdf2_sha256$870000$tLz4HlktWcpo59jvQNdThU$UmykYfyhNnPqXpJ9RheR0Oa11vHv5RUBh03JS4C6qok=',NULL,0,'ASEGUR','ANA MARLY SEGURA DIAZ','','agenciahormiga@cootep.com.co',0,1,'2025-12-30 19:01:34.296311',0,'HORMIGA'),(5,'pbkdf2_sha256$870000$360wEdRONNhGCLW3kiA1Zh$jNRRnCRQIEyVyUfwvs9u7qfsGUmq3KJLr1LGVzMlddc=',NULL,0,'MIRUAN','ANA MILENA RUANO CHAMORRO','','ana.ruano@cootep.com.co',0,1,'2025-12-30 19:01:34.725521',0,'HORMIGA'),(6,'pbkdf2_sha256$870000$AJ2nGXxqnWaA8OVKCSuiCj$v74Ev2j3d1J35E+VL5oUUDno5+2cUXSUN4+y6I8Tzt0=',NULL,0,'AROSER','ANA VIKY ROSERO ADARME','','contabilidad@cootep.com.co',0,1,'2025-12-30 19:01:35.154725',0,'MOCOA'),(7,'pbkdf2_sha256$870000$A7sl0aSXd0dz0xuuJJXNQJ$WuNCs6bosSMWqy81yAx6JPw/avSNPUe8jeIVo8dr8ws=',NULL,0,'ANVER','ANDREA CAROLINA VERDUGO BENAVIDES','','asiscontabilidad@cootep.com.co',0,1,'2025-12-30 19:01:35.583965',0,'MOCOA'),(8,'pbkdf2_sha256$870000$A2XzYdpZXl63jKK38Q0OT3$tk3leZDkc+2dXST1n0YI6y/rM3rgJyZfNYG+AVy/FdI=',NULL,0,'DVALLE','ANDREA DANIELA VALLEJOS PULIDO','','asesororito1@cootep.com.co',0,1,'2025-12-30 19:01:36.005799',0,'ORITO'),(9,'pbkdf2_sha256$870000$NeLsI05RuPRKAVWlprPaXo$Cm/rAc6gmWglZKAZMyftcWsfSuUhGP6k7lvS7sutacE=',NULL,0,'AURBAN','ANGELA MILENA URBANO NARVAEZ','','atencionalcliente@cootep.com.co',0,1,'2025-12-30 19:01:36.435103',0,'MOCOA'),(10,'pbkdf2_sha256$870000$iZCw54H0F0w4fvnBCHZ8MF$d3pIVEzo+xqT1EyDkSyzxTXiBgY5DSNL+dgEqmmH+j0=',NULL,0,'BGUERR','BRANDON DANILO GUERRERO JAJOY','','asesorsibundoy1@cootep.com.co',0,1,'2025-12-30 19:01:36.847215',0,'SIBUNDOY'),(11,'pbkdf2_sha256$870000$7dZxfRopi87Qd1x3Rxz8tl$YA7M+H9+zIR96DL4vxUZL5jw6/4MMCzeFjmSj+4pYko=',NULL,0,'ACARVA','ELIAS ADIRVEY GALVIS CARVAJAL','','asesormocoa6@cootep.com.co',0,1,'2025-12-30 19:01:37.266702',0,'MOCOA'),(12,'pbkdf2_sha256$870000$2ZRVcGhQAYoycGeBmJyU3o$sWK5zkhDsn0bUiB3j9AgSxbZOqHqpQu9PSqen5f3QLc=',NULL,0,'CAAZAM','CAMILO ALEJANDRO ZAMBRANO HERNANDEZ','','corresponsalvillagarzon@cootep.com.co',0,1,'2025-12-30 19:01:37.681625',0,'VILLA GARZON'),(13,'pbkdf2_sha256$870000$S0JlUB3vjBy6LMKeIG2PAF$mkdLySKBZXH9wTYNRnTWcI71BxE5VdugMWpVQrTLAnE=',NULL,0,'CCAICE','CARLOS HERNAN CAICEDO RAMOS','','auxcaja01@cootep.com.co',0,1,'2025-12-30 19:01:38.095288',0,'MOCOA'),(14,'pbkdf2_sha256$870000$BYZbF866H4LBkelDEYUtMD$mwsUrq716K6NYgzkp9ddxChzTxJJme/+UNN/XhE6FOk=',NULL,0,'IVAROM','CARLOS IVAN ROMERO BASTIDAS','','agenciamocoa@cootep.com.co',0,1,'2025-12-30 19:01:38.513144',0,'MOCOA'),(15,'pbkdf2_sha256$870000$hqnp40hOcsUWBHWe0fl7Nq$jboxd1Rdbz01u3oKUs6GElS+9OtmFC+MavjE62euQNI=',NULL,0,'CGARCI','CARLOS REINALDO GARCIA NASTAR','','riesgos@cootep.com.co',0,1,'2025-12-30 19:01:38.930020',0,'MOCOA'),(16,'pbkdf2_sha256$870000$uDGYf5njuNbOVM7grru9yo$zuzR8iDyzH+Yu9nX95ZL8xJ9hZ9GYq21LF9p3GpHAm8=',NULL,0,'HZAMBR','HERNAN SANTIAGO ZAMBRANO ENRIQUEZ','','microcreditosibundoy@cootep.com.co',0,1,'2025-12-30 19:01:39.345012',0,'SIBUNDOY'),(17,'pbkdf2_sha256$870000$a4Qem1PJxj96eKbhIuT4B8$49nZZm1tmgXu+UwV4sJndWpy+RJ3VwXaSmUueAMgFOk=',NULL,0,'CGAVIR','CLAUDIA PAOLA GAVIRIA DIAZ','','auxagenciapuerto@cootep.com.co',0,1,'2025-12-30 19:01:39.756156',0,'PUERTO ASIS'),(18,'pbkdf2_sha256$870000$iL8SkxhYgmNowALwaUjNrh$mZLXkHgjBl1ZaD5pWq9aI2Koc46Uj0jhdKZ8EOz41P0=',NULL,0,'CCORDO','CRISTHIAN ANDRES OLARTE CORDOBA','','asesordeservicios@cootep.com.co',0,1,'2025-12-30 19:01:40.182721',0,'MOCOA'),(19,'pbkdf2_sha256$870000$e3eKylQFBPrlN2rjAtVdM6$QmzxkUDVRW8vHkZFhgFE3OdAHiBnNxeUSWjF7Ra3xD4=',NULL,1,'CROBLE','CRISTIAN MANUEL ROBLES','','auxsistemas@cootep.com.co',0,1,'2025-12-30 19:01:40.605707',0,'Mocoa'),(20,'pbkdf2_sha256$870000$tIqfA6J1mijFSjbdpb07V2$tYbzMCqPOmcIpV4b8NOnuk3aXv299frhm3bz4sQDfMw=',NULL,0,'DTORRES','DANNY YULIETH TORRES CASTRO','','asistente.oym@cootep.com.co',0,1,'2025-12-30 19:01:41.017237',0,'MOCOA'),(21,'pbkdf2_sha256$870000$zIlzeZFrFbm7td6ATRx7t7$jXmPgdUkcePVU3zDw1hUAjchMr8Pm34xIia4egsKQy0=',NULL,0,'MQUENA','DEYVY MILENA MUÑOZ QUENAN','','asesorapuertoasis@cootep.com.co',0,1,'2025-12-30 19:01:41.435175',0,'PUERTO ASIS'),(22,'pbkdf2_sha256$1000000$hmXnCeAlgIYIZRDR6rG2wD$HMr+MQxMvpmoQCh7VWKt5Kn3X4cVFElzGRv4xPJBqzw=','2026-02-02 13:13:24.050651',1,'DACERO','DIANA ALEJANDRA ACERO CARRILLO','','subgerencia@cootep.com.co',0,1,'2025-12-30 19:01:41.850738',0,'Mocoa'),(23,'pbkdf2_sha256$870000$IRT83v7VGsrqMlbZBNc3ky$aHWmkHAep2uo9Xa+khGYmM4va4ehsH8x5V6DMR0bVt8=',NULL,0,'DREYES','DIANA EMILSE REYES SOLARTE','','diana.reyes@cootep.com.co',0,1,'2025-12-30 19:01:42.260639',0,'SIBUNDOY'),(24,'pbkdf2_sha256$870000$6MRqIN3PB0uWdmRNr4xFhm$X44oRWTKZHJzZR4GaL0W20QozEbrnBKb/3eDoeL+A1I=',NULL,0,'DCONGO','DIANA YADIRA CONGOTE ANDRADE','','asistenteriesgos@cootep.com.co',0,1,'2025-12-30 19:01:42.721428',0,'MOCOA'),(25,'pbkdf2_sha256$870000$cTLIQb267yBRe7PYiwZcfA$fU1d2X9mLB8JgD6wDYjaoDF1gsjGY9+nCGhZaold9Gk=',NULL,0,'XNARVA','EDNA XIMENA NARVAEZ RAMIREZ','','auxleguizamo@cootep.com.co',0,1,'2025-12-30 19:01:43.221519',0,'PUERTO LEGUIZAMO'),(26,'pbkdf2_sha256$870000$osC86GeewzF91B5l6jO2JV$tazUAW1feF9StY7n5quIJr1JHOorCAMYZu6bnZXYzME=',NULL,0,'ECUARA','EDUARDO CUARAN TIPAZ','','microcreditoorito@cootep.com.co',0,1,'2025-12-30 19:01:43.752869',0,'HORMIGA'),(27,'pbkdf2_sha256$870000$t86LM8y6afGyPu6GrGpX1C$ixqLeO9/LjBdxkRgBGpLVZ0uDlt5LQN0dwKgtrSv3GM=',NULL,0,'DPEREZ','JERSON DAVID SOLARTE PEREZ','','coordinadordorada@cootep.com.co',0,1,'2025-12-30 19:01:44.290920',0,'PUERTO ASIS'),(28,'pbkdf2_sha256$870000$PC40t3OLGUqQdQ4LzytRBC$n7u6KmJetijoKPTO8qdBIoU6FIFm/PPM7lkkXyfTeHk=',NULL,0,'MAELV','ELVER MAURICIO GRUESO VAINAS','','saludocupacional@cootep.com.co',0,1,'2025-12-30 19:01:44.915415',0,'MOCOA'),(29,'pbkdf2_sha256$870000$JKDL7Jp35OjG0zdQIyumHn$54IjcxR9qvFI2RcIdAoAUsZ3Um3vUmYgi/8J0Umlm+U=',NULL,0,'FAGELO','FABIAN LOPEZ GETIAL','','jcomercial@cootep.com.co',0,1,'2025-12-30 19:01:45.472335',0,'MOCOA'),(30,'pbkdf2_sha256$870000$XAWFQEtvplMHiThXREVE7d$s5BRrIkOZcX6k1dYkoMVvwt3/sgT0UuSYWXDvVh+ubc=',NULL,0,'LBENAV','LAURA SOFIA ALVARADO BENAVIDES','','lauraalvarado9511@gmail.com',0,1,'2025-12-30 19:01:45.942464',0,'MOCOA'),(31,'pbkdf2_sha256$870000$TLWRccPASIeUkVzGKB3kWd$iFULX6cRd4V2vwjokW6CJ7wc6xCcME8OL1Ygn1n4jbc=',NULL,0,'FOJEDA','FAVIO NELSON OJEDA GOMEZ','','asesormocoa5@cootep.com.co',0,1,'2025-12-30 19:01:46.404210',0,'MOCOA'),(32,'pbkdf2_sha256$870000$vhqVUqGU3KTSotLqgGoNWn$gvd0gh+TLjWW6q3/UYYeg4xotyYEz6zy9TCMDbDEX74=',NULL,0,'FAGUIN','FREDDY ALBERTO GUINCHIN ESTRADA','','agenciaptoasis@cootep.com.co',0,1,'2025-12-30 19:01:47.075201',0,'PUERTO ASIS'),(33,'pbkdf2_sha256$870000$EIYQLHy32XhL1vawBCruzP$TMVyskULD2n215aXkpcPcza3XQgyzIbNatkP5ncyptU=',NULL,0,'GRODRI','GERLIN DUVAN RODRIGUEZ PORTILLO','','asesorhormiga2@cootep.com.co',0,1,'2025-12-30 19:01:47.647671',0,'HORMIGA'),(34,'pbkdf2_sha256$870000$0A1ropaDfgYr0zxGRXravD$46bl4ZtPWHZFIbKFutnW60Igd/S6MqFntGS1oAbSJTc=',NULL,0,'GECRUZ','GERMAN DARIO DE LA CRUZ CHAVEZ','','microcreditohormiga@cootep.com.co',0,1,'2025-12-30 19:01:48.075391',0,'HORMIGA'),(35,'pbkdf2_sha256$870000$BZ1CAnp2ZuYBzZe9G146SR$tKGl8YFu659bxzDMqLlmvt6ESiCjQGFEgZRCkdrMnYo=',NULL,0,'GLADAP','GLADIS YANET APRAEZ TAPIAS','','microcreditopuerto@cootep.com.co',0,1,'2025-12-30 19:01:48.594047',0,'PUERTO ASIS'),(36,'pbkdf2_sha256$870000$wrX7M13u6fH5gQho3FfrTV$wUa3FTkyKUQQm3UXiwB+Ee337bdBRHWcKEKNSJDu85k=',NULL,0,'HPARRA','HERNAN ANTURY PARRA','','auxcontabilidad@cootep.com.co',0,1,'2025-12-30 19:01:49.027846',0,'MOCOA'),(37,'pbkdf2_sha256$870000$q3Bes77auhIb3m1WANZjat$OZSlUT09M726ybFZIomPWxl02cy7LNkQ+ElcZSHMCWk=',NULL,0,'HBURBA','HERNAN FROILAN BURBANO CAICEDO','','agenciasibundoy@cootep.com.co',0,1,'2025-12-30 19:01:49.453787',0,'SIBUNDOY'),(38,'pbkdf2_sha256$870000$r2kwqDQoAiVHfn7QLyYxuk$pSQq0ch60+tsXvfLKNsV/kYXWBClwEjLI6VDG9IcuNY=',NULL,0,'HGUTIE','HOLMER GUTIERREZ URBANO','','asistentecartera@cootep.com.co',0,1,'2025-12-30 19:01:49.865884',0,'MOCOA'),(39,'pbkdf2_sha256$870000$hVVQM8dz3ONyVUwrt5Cl8D$VLlwu5mId3ZU1/l1dhlglrgnpgYpqledm0iS/+TPCWc=',NULL,0,'IOBAND','IRMA YOLANDA OBANDO MORA','','tesoreria@cootep.com.co',0,1,'2025-12-30 19:01:50.279931',0,'MOCOA'),(40,'pbkdf2_sha256$870000$Sk5UgCA2rKHac5ZjWMcwxR$kkYTUgnx6UK2cAFpBlOcyOwJURcmiIkTvIpxcS4mGjU=',NULL,0,'JGUERR','JAIDER ALFONSO GUERRA SANCHEZ','','jaider.guerra@cootep.com.co',0,1,'2025-12-30 19:01:50.704939',0,'HORMIGA'),(41,'pbkdf2_sha256$1000000$H219Z4vlPeqNxZxJCYMQft$fJ1vNfCN+rxSnePZW6Y7sdyP41pOLOlqDOgQvXQ2buw=','2025-12-30 19:23:16.219070',1,'JROCER','JAIME FERNANDO ROSERO SANCHEZ','','sistemas@cootep.com.co',0,1,'2025-12-30 19:01:51.130583',0,'Mocoa'),(42,'pbkdf2_sha256$870000$DazaQS7giX08VyeGcZFLx0$DgN7mZ1vd1yPa+pJv76eXN+G/K2IJY7wAOOYKyOGG9M=',NULL,0,'OROSER','JAVIER OLMEDO ACOSTA ROSERO','','olmedoacosta@outlook.com',0,1,'2025-12-30 19:01:51.576590',0,'MOCOA'),(43,'pbkdf2_sha256$870000$C00vP2gIPtqyfGzirYr3bW$wJkEBK4/41qI57q+wzyUn0aazlM4SkDWMF3CXe0HRes=',NULL,0,'YVARGA','JEIMY KATERINE VARGAS ARENAS','','auxiliarptoasis2@cootep.com.co',0,1,'2025-12-30 19:01:52.015155',0,'PUERTO ASIS'),(44,'pbkdf2_sha256$870000$v3alUO6vtHABWVW1fe8mGT$j1R4WpOA0A5OfefBc7p3PRLOwJUyu/1UMVgZ7FF9xeA=',NULL,0,'JORTIZ','JENNY MARINA ORTIZ CARLOSAMA','','coordinadorsibundoy@cootep.com.co',0,1,'2025-12-30 19:01:52.447132',0,'SIBUNDOY'),(45,'pbkdf2_sha256$870000$BgcxHOmplbd1m9rOnyls1n$koXv6BVYy03OKUqptezI9qG309RXUsJxBX3mWR4j2lo=',NULL,0,'JGARCI','JESUS ALBERTO GARCIA MUÑOZ','','auditoria@cootep.com.co',0,1,'2025-12-30 19:01:52.872881',0,'MOCOA'),(46,'pbkdf2_sha256$870000$9wmLPJpzpYrI71U7ylby6m$GyNNZxfn437wbvzxR4BkeU484z4xGVYrAM8+Fya+Xys=',NULL,0,'JRIASC','JHAN BRANDON RIASCOS MARTINEZ','','organizacionymetodos@cootep.com.co',0,1,'2025-12-30 19:01:53.298200',0,'MOCOA'),(47,'pbkdf2_sha256$870000$JuffhCZVdhqC8qO8MpJHgg$X3bgG/K3Xv/zosKz+qL3mZK75bdZ0BE7uYkyiXeizKs=',NULL,0,'JMORAL','JOHANA MARITZA MORALES CARDENAS','','auxiliarptoasis4@cootep.com.co',0,1,'2025-12-30 19:01:53.710458',0,'PUERTO ASIS'),(48,'pbkdf2_sha256$870000$ajYyFJYlaRGFvyRA9TIHgJ$5C826q4X+NmBa/hzkBta2KjLMq5OBfVseTaCaozliz8=',NULL,0,'JOMAPE','JONATHAN MAURICIO PEJENDINO ROSERO','','talentohumano@cootep.com.co',0,1,'2025-12-30 19:01:54.163616',0,'SIBUNDOY'),(49,'pbkdf2_sha256$870000$C3UA9Z6ZkLs2B0A21BtAsd$eoY8hSl9D4t1OnN6LAIsls743aEo7/hgWEZwv9KrXJk=',NULL,0,'JDELGA','KAREN JACKELINE CAMPAÑA DELGADO','','karen.delgado@cootep.com.co',0,1,'2025-12-30 19:01:55.231834',0,'ORITO'),(50,'pbkdf2_sha256$870000$KRKhPUD66lmSSlKgBLhfEB$Qy4V922hI9kDp3OEmvya7lHXbmN35lG42GxJC11prmo=',NULL,0,'KAVILL','KAREN LILIANA VILLOTA HERNANDEZ','','juridico@cootep.com.co',0,1,'2025-12-30 19:01:56.210587',0,'MOCOA'),(51,'pbkdf2_sha256$870000$gfFYn1CgMw8qS7Fy38kVlh$NnnQYBK9kKn6FDEAcPNenz2ok2MOy4tFuaJQ4qpN6x8=',NULL,0,'KGUERR','KELY MABEL GUERRERO LAZO','','asesorptoasis5@cootep.com.co',0,1,'2025-12-30 19:01:56.997354',0,'PUERTO ASIS'),(52,'pbkdf2_sha256$870000$P7crZ905Y91abTWHvjxsvd$jU5JarAPzy5qQ8q7asSBGYmyvVhrvc5w+S87RO09kwc=',NULL,0,'CGALA','KEVIN CAMILO GALARRAGA CORDOBA','','oficialdecumplimiento@cootep.com.co',0,1,'2025-12-30 19:01:57.648160',0,'MOCOA'),(53,'pbkdf2_sha256$870000$ryiIVChHZ8YfdeLlpxi3CN$FIyZB/waz9WX8IZ9VZt1i9CBiJD2fuAVKOEPPjIKJao=',NULL,0,'KPANTO','LICETH KAROLINA PANTOJA MORA','','karolina.pantoja@cootep.com.co',0,1,'2025-12-30 19:01:58.103565',0,'VILLA GARZON'),(54,'pbkdf2_sha256$870000$nL5wYIVmd62QMHFIW80KGy$Jq5nbScdvmyVvxHFCLtXTY/ANnjlxK49Xc5IXFoFAlk=',NULL,0,'LHERRE','LORENA LISETH HERRERA MONCAYO','','cartera@cootep.com.co',0,1,'2025-12-30 19:01:58.534291',0,'MOCOA'),(55,'pbkdf2_sha256$870000$DmqFvtfzu0MRlrof9OWFv2$mPM500Vlip40jzTsnwTPTHPVVSwy0GYgyRaDvqd36Q8=',NULL,0,'LCHAMO','LORENA LISSETH PAZ CHAMORRO','','asesordorada1@cootep.com.co',0,1,'2025-12-30 19:01:58.955244',0,'DORADA'),(56,'pbkdf2_sha256$870000$kOAahhQ0DlrzWBocdpLsLU$g4VotNvyY2ZxJlU5YkHF1QEXxcQzoBg7K5oEjLSyFRI=',NULL,0,'LJAMAU','LUIS JAIDE JAMAUCA CORREA','','luis.jamauca@cootep.com.co',0,1,'2025-12-30 19:01:59.411210',0,'MOCOA'),(57,'pbkdf2_sha256$870000$dELIM69yzMSJVnCbRsFtwU$qVY906n3pl2xIt62U9IruYwTBQTnWLRDNOFk2t7bdGk=',NULL,0,'FCRIOL','LUISA FERNANDA CUERO CRIOLLO','','secretaria@cootep.com.co',0,1,'2025-12-30 19:01:59.986902',0,'MOCOA'),(58,'pbkdf2_sha256$870000$XSoZ2g8n0y6NbihUCJTUqq$AcXiJe3UOlkccNqKkgvBO57oJj100kkWi94KoS+uuwI=',NULL,0,'MSANAB','MAGDA JOHANA SANABRIA TEJADA','','agencialeguizamo@cootep.com.co',0,1,'2025-12-30 19:02:00.563936',0,'PUERTO LEGUIZAMO'),(59,'pbkdf2_sha256$870000$VTJ7QiY17cmSJ0R2mHX2ts$RCdGOJAnmQU1o2fYyJU2kj7mwAJgLAz592+6L+d/12I=',NULL,0,'ODIAZ','MARIA OLGA DIAZ','','archivo@cootep.com.co',0,1,'2025-12-30 19:02:01.011933',0,'MOCOA'),(60,'pbkdf2_sha256$870000$fDXdN9OeffckemHvhoQu1j$5bACxB6Qhu6Dy0Gm1yslvQp/4D3sthTyV1MUQxI175Y=',NULL,0,'MARDUE','MARIO STEBAN DUEÑAS DE LA CRUZ','','asistente.auditoria@cootep.com.co',0,1,'2025-12-30 19:02:01.432708',0,'MOCOA'),(61,'pbkdf2_sha256$870000$5LVwOuoK3LNtJfz6wensm6$lko+qxTQcHI+w6Q7qRnqv1rRng0R0AvrvVZ4Sdv3BJ8=',NULL,0,'MGUERR','MARY LUCY GUERRON MADROÑERO','','auxcartera01@cootep.com.co',0,1,'2025-12-30 19:02:01.860967',0,'MOCOA'),(62,'pbkdf2_sha256$1000000$8soR7zeqPdP19iPQ7EsHCb$hjKNRdHI9D+Zf2R5Gs9c+TSolVVEy5hMAFc10oWadXw=','2026-01-14 21:38:18.316307',1,'MYELA','MICHAEL YELA VALENCIA','','soportesistemas@cootep.com.co',0,1,'2025-12-30 19:02:02.280795',0,'MOCOA'),(63,'pbkdf2_sha256$870000$Ppmj9GiamifyNnCrSqwyE5$7SUGXnSx8X0mlMhZMhgi+p6uTiW5cltnRbCVBdH+BHg=',NULL,0,'MIPOCA','MYRIAM MILENA PORTILLO CASTRO','','operacionesmocoa@cootep.com.co',0,1,'2025-12-30 19:02:02.700314',0,'MOCOA'),(64,'pbkdf2_sha256$870000$TYnUrzTWWtWih9NncprE0b$Ynre0IgGNtSk3UpnElH24DulkOvCzekNxSQynYV/O/A=',NULL,0,'NPIMEN','NASSON PIMENTEL CRIOLLO','','auxiliarleguizamo@cootep.com.co',0,1,'2025-12-30 19:02:03.116566',0,'PUERTO LEGUIZAMO'),(65,'pbkdf2_sha256$870000$2L8CA8jY009v2UjM3FTwJt$V41DyBD8+/Iw11Q65JCZHOfHPgDYbQEvk9KggimiYQQ=',NULL,0,'JVILLA','NINFA JHOJANA CANAMEJOY VILLAMUES','','johana1201@gmail.com',0,1,'2025-12-30 19:02:03.541857',0,'PUERTO ASIS'),(66,'pbkdf2_sha256$870000$5yAnOInsr944sMWGAw237w$kMGMuykxlgU8qA8L3iPJgsjlQf1QYUpbOX1CLJnMh+0=',NULL,0,'ANARVA','OSWALDO ALEJANDRO NARVAEZ ARAUJO','','auxiliarmocoa2@cootep.com.co',0,1,'2025-12-30 19:02:03.961891',0,'MOCOA'),(67,'pbkdf2_sha256$870000$hCohP8jKTXasDJRBier9Hm$grx2wgePSfGyxGPrYHXEIrILpc4dzEy4krrBuWmYDSc=',NULL,0,'RMALUA','RAQUEL MALUA SAYALPUD','','gerencia@cootep.com.co',0,1,'2025-12-30 19:02:04.372263',0,'MOCOA'),(68,'pbkdf2_sha256$870000$KcDtnZ3QJTTN5ksWEgOJzn$ixu9p5aABBRork7chVCQx1K2DF+TWWss90DxWCWIKtU=',NULL,0,'ASOLAR','RUTH ALEIDA CUARAN SOLARTE','','asesorhormiga1@cootep.com.co',0,1,'2025-12-30 19:02:04.797939',0,'HORMIGA'),(69,'pbkdf2_sha256$870000$MkgBuCigXQZcI2M2eYDpkE$7/nlnRxGD0NM+7+FCQ51C3ZDOGWvEzT0A9aBakvW/A8=',NULL,0,'SCUBIL','SONIA YANETH CUBILLOS BELTRAN','','asesorhormiga3@cootep.com.co',0,1,'2025-12-30 19:02:05.216975',0,'HORMIGA'),(70,'pbkdf2_sha256$870000$Zb89zs495ETDxj82nGbzpy$E9SsLYauMT5MNXu6JaGoaznY4bhUC0ZPK58y/dbgB9E=',NULL,0,'WMARC','WILBER MARCIAL PEREZ MAYTAHUARI','','wilbertmarcialperez@gmail.com',0,1,'2025-12-30 19:02:05.639769',0,'PUERTO LEGUIZAMO'),(71,'pbkdf2_sha256$870000$acN8lIuekuubkQWpNDyNhR$oTu/5204zLpZfL2gMXMnTuwTdP7qcV4UqpQrrJbraFM=',NULL,0,'WMOREN','WILMER MORENO ESTRADA','','oficialseguridad@cootep.com.co',0,1,'2025-12-30 19:02:06.061967',0,'MOCOA'),(72,'pbkdf2_sha256$870000$8HiEoZzLGMfL7AjejHBD28$xOQqxttEhdc0vQgOWRRHW62UcS6MYlTrKbwlQ4mAquk=',NULL,0,'YMOREN','YERZON DUVAN MORENO SANCHEZ','','auxiliarptoasis1@cootep.com.co',0,1,'2025-12-30 19:02:06.488348',0,'PUERTO ASIS'),(73,'pbkdf2_sha256$870000$oHNpFKNQ3iHjYWccky8qFW$g7j/4eUQgT/ifAWR1HLXSAQ7NSu9MxnRY4yeDR45pb0=',NULL,0,'YORDON','YESICA OBANDO ORDOÑEZ','','agenciadorada@cootep.com.co',0,1,'2025-12-30 19:02:06.908026',0,'DORADA'),(74,'pbkdf2_sha256$870000$0AiiJL6dAkPWc3PTWxCSDA$ffwh5XGv9zdbEwznzprr8fXkR2lvh4n5dXuaHwYhF2Q=',NULL,0,'YHENAO','YUDY ANDREA HENAO LOPEZ','','asistentecomercial@cootep.com.co',0,1,'2025-12-30 19:02:07.327629',0,'MOCOA'),(75,'pbkdf2_sha256$870000$zNqC8VRkjpYdCRmtdJUmqB$px9tXJGr0bb4iDL/byMPZNG/k3s/879aC6CUBJAOdHk=',NULL,0,'YRODRI','YURANY DEL PILAR RODRIGUEZ CEBALLOS','','coordinadororito@cootep.com.co',0,1,'2025-12-30 19:02:07.743647',0,'ORITO'),(76,'pbkdf2_sha256$870000$4Da7ExdOsYG0M2vMHwJAWI$+Hv8GJ26Xu4XPv94aoBtDa3oP7pi/qowB1D0rftd2qs=',NULL,0,'ZGUERR','AYDA ZULEYMA GUERRERO RIASCOS','','caja.villagarzon@serlogyc.com.co',0,1,'2025-12-30 19:02:08.164264',0,'VILLA GARZON'),(77,'pbkdf2_sha256$870000$BU2LEdhiK2fsQHDmBguO3h$EhxfEUeDQxr88AhOPRFk98NcJYyoUYJR1lM/bxBrxQs=',NULL,0,'MZAMOR','MARIBEL MARICELA ZAMORA ASCUNTAR','','asesormocoa5@cootep.com.co',0,1,'2025-12-30 19:02:08.587990',0,'MOCOA'),(78,'pbkdf2_sha256$870000$6F498AwhGmtnFzmKxwVcTm$qbykG/CntBB/OPwHZaVSN1h95yyOrRD98+2552w8GVc=',NULL,0,'MCASTI','MERY NORBEYI CASTILLO NUPAN','','maiacas1995@hotmail.com',0,1,'2025-12-30 19:02:09.004517',0,'MOCOA');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-02 16:29:02
