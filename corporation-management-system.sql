-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (arm64)
--
-- Host: localhost    Database: corporation-management-system
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account_menu`
--

DROP TABLE IF EXISTS `account_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_menu` (
  `account_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`account_id`,`menu_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `account_menu_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `authority_account` (`id`),
  CONSTRAINT `account_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `authority_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_menu`
--

LOCK TABLES `account_menu` WRITE;
/*!40000 ALTER TABLE `account_menu` DISABLE KEYS */;
INSERT INTO `account_menu` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11),(1,12),(2,12),(3,12),(4,12),(5,12),(1,13),(2,13),(3,13),(4,13),(5,13),(1,14),(2,14),(3,14),(4,14),(5,14),(1,15),(2,15),(3,15),(4,15),(5,15),(1,16),(2,16),(3,16),(4,16),(5,16),(1,17),(1,18),(1,19),(1,20),(1,21),(4,21),(1,22),(4,22),(1,23),(4,23),(1,24),(4,24),(1,25),(4,25),(1,26),(4,26),(1,27),(4,27),(1,33),(3,33),(1,34),(3,34),(1,35),(3,35),(1,37),(3,37),(1,38),(3,38),(1,39),(3,39),(1,41),(3,41),(1,42),(3,42),(1,43),(3,43),(1,45),(5,45),(1,46),(5,46),(1,47),(5,47),(1,48),(5,48),(1,49),(5,49),(1,50),(5,50),(1,51),(5,51);
/*!40000 ALTER TABLE `account_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority_account`
--

DROP TABLE IF EXISTS `authority_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `remark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `statu` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority_account`
--

LOCK TABLES `authority_account` WRITE;
/*!40000 ALTER TABLE `authority_account` DISABLE KEYS */;
INSERT INTO `authority_account` VALUES (1,'管理员','admin','系统默认最高权限，不可以编辑和任意修改','2021-01-16 13:29:03','2021-01-17 15:50:45',1),(2,'普通用户','normal','只有基本查看功能','2021-01-04 10:09:14','2021-01-30 08:19:52',1),(3,'财务','accountant','财务管理','2023-03-25 20:41:15','2023-03-25 20:41:19',1),(4,'产品','product','产品与库存管理','2023-03-25 20:43:19','2023-03-25 20:43:21',1),(5,'人事','HR','人事管理','2023-03-25 21:09:33','2023-03-25 21:09:36',1);
/*!40000 ALTER TABLE `authority_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority_menu`
--

DROP TABLE IF EXISTS `authority_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `type` int NOT NULL COMMENT '类型     0：目录   1：菜单   2：按钮',
  `icon` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '菜单图标',
  `orderNum` int DEFAULT NULL COMMENT '排序',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `statu` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority_menu`
--

LOCK TABLES `authority_menu` WRITE;
/*!40000 ALTER TABLE `authority_menu` DISABLE KEYS */;
INSERT INTO `authority_menu` VALUES (1,0,'Dashboard','/index','sys:index','Index.vue',0,'bx bx-grid-alt',1,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(2,0,'Authority','','sys:authority','',0,'bx bx-collection',2,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(3,0,'Product','','sys:product',NULL,0,'el-icon-s-tools',3,'2021-01-15 19:06:11',NULL,1),(4,0,'Finance','/finance','sys:finance','Finance.vue',0,'bx bxs-dollar-circle',6,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(5,0,'Employee','/employee','sys:employee','Employee.vue',0,'bx bxs-user',7,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(7,0,'Department','/department','sys:department','Department.vue',0,'bx bxs-user',7,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(8,0,'Setting','/setting','sys:setting','Setting.vue',0,'bx bx-cog',8,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(9,2,'Account','/account','sys:authority:account','account.vue',1,'el-icon-s-custom',1,'2021-01-15 19:03:45','2021-01-15 19:03:48',1),(10,2,'Menu','/menu','sys:authority:menu','sys/Role',1,'el-icon-rank',2,'2021-01-15 19:03:45','2021-01-15 19:03:48',1),(11,3,'Category','/category','sys:product:category','Category.vue',1,'',1,'2021-01-15 19:07:18','2021-01-18 16:32:13',1),(12,3,'Stock','/stock','sys:product:stock','Stock.vue',1,'',2,'2021-01-15 19:07:18','2021-01-18 16:32:13',1),(13,4,'Analytics','/analytics','sys:analytics','Analytics.vue',1,'',4,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(14,4,'Property','/property','sys:property','Property.vue',1,'',5,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(15,4,'Business','/business','sys:business','Business.vue',1,'',5,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(16,4,'Expense','/expense','sys:expense','Expense.vue',1,'',5,'2021-01-15 18:58:18','2021-01-15 18:58:20',1),(17,9,'添加用户',NULL,'sys:account:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(18,9,'修改用户',NULL,'sys:account:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(19,9,'删除用户',NULL,'sys:account:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(20,9,'分配角色',NULL,'sys:account:role',NULL,2,NULL,4,'2021-01-17 21:49:58',NULL,1),(21,11,'添加产品',NULL,'sys:category:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(22,11,'修改产品',NULL,'sys:category:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(23,11,'删除产品',NULL,'sys:category:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(24,11,'分配产品',NULL,'sys:category:role',NULL,2,NULL,4,'2021-01-17 21:49:58',NULL,1),(25,12,'添加出入库记录',NULL,'sys:stock:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(26,12,'修改出入库记录',NULL,'sys:stock:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(27,12,'删除出入库记录',NULL,'sys:stock:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(33,14,'添加资产信息',NULL,'sys:property:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(34,14,'修改资产信息',NULL,'sys:property:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(35,14,'删除资产信息',NULL,'sys:property:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(37,15,'添加经营信息',NULL,'sys:business:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(38,15,'修改经营信息',NULL,'sys:business:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(39,15,'删除经营信息',NULL,'sys:business:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(41,16,'添加费用信息',NULL,'sys:expense:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(42,16,'修改费用信息',NULL,'sys:expense:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(43,16,'删除费用信息',NULL,'sys:expense:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(45,5,'添加员工信息',NULL,'sys:employee:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(46,5,'修改员工信息',NULL,'sys:employee:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(47,5,'删除员工信息',NULL,'sys:employee:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1),(48,5,'分配权限',NULL,'sys:employee:authority',NULL,2,NULL,4,'2021-01-17 21:49:58',NULL,1),(49,7,'添加部门信息',NULL,'sys:category:save',NULL,2,NULL,1,'2021-01-17 21:48:32',NULL,1),(50,7,'修改部门信息',NULL,'sys:category:update',NULL,2,NULL,2,'2021-01-17 21:49:03','2021-01-17 21:53:04',1),(51,7,'删除部门信息',NULL,'sys:category:delete',NULL,2,NULL,3,'2021-01-17 21:49:21',NULL,1);
/*!40000 ALTER TABLE `authority_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'研发部','Andrew','12345678900','1234567890@outlook.com'),(2,'财务部','Andrew','12345678900','1234567890@outlook.com'),(3,'人事部','Andrew','12345678900','1234567890'),(4,'产品部','Andrew','12345678900','1234567890'),(5,'销售部','Andrew','12345678900','1234567890');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `statu` int NOT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_USERNAME` (`username`) USING BTREE,
  KEY `department_id` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','$2a$10$tQSDauzSjiTw4kUfcUcPIuOriDHw4hxDGkCgxtKegt/Q6z9qQffo2','https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg','123@qq.com','广州','2021-01-12 22:13:53','2021-01-16 16:57:32','2020-12-30 08:38:37',1,NULL),(2,'test','$2a$10$tQSDauzSjiTw4kUfcUcPIuOriDHw4hxDGkCgxtKegt/Q6z9qQffo2','https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg','test@qq.com',NULL,'2021-01-30 08:20:22','2021-01-30 08:55:57',NULL,1,NULL),(3,'user','$2a$10$tQSDauzSjiTw4kUfcUcPIuOriDHw4hxDGkCgxtKegt/Q6z9qQffo2','guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg','user@qq.com','广州','2023-03-03 15:31:26','2023-03-03 15:31:29','2023-03-03 15:31:32',1,1),(4,'Andrew','$2a$10$tQSDauzSjiTw4kUfcUcPIuOriDHw4hxDGkCgxtKegt/Q6z9qQffo2',NULL,'893540035@qq.com','广州','2023-03-24 00:00:00',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_account`
--

DROP TABLE IF EXISTS `employee_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_account` (
  `employee_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`employee_id`,`account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `employee_account_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_account_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `authority_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_account`
--

LOCK TABLES `employee_account` WRITE;
/*!40000 ALTER TABLE `employee_account` DISABLE KEYS */;
INSERT INTO `employee_account` VALUES (1,1),(4,1),(2,2);
/*!40000 ALTER TABLE `employee_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_business`
--

DROP TABLE IF EXISTS `finance_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_business` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_business`
--

LOCK TABLES `finance_business` WRITE;
/*!40000 ALTER TABLE `finance_business` DISABLE KEYS */;
INSERT INTO `finance_business` VALUES (1,'项目A','2020-01-01',10000.00,15000.00,5000.00),(2,'项目B','2020-02-01',20000.00,25000.00,5000.00),(3,'项目C','2020-03-01',30000.00,35000.00,5000.00),(4,'项目D','2020-04-01',40000.00,45000.00,5000.00),(5,'项目E','2020-05-01',50000.00,55000.00,5000.00);
/*!40000 ALTER TABLE `finance_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_estate`
--

DROP TABLE IF EXISTS `finance_estate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_estate` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_estate`
--

LOCK TABLES `finance_estate` WRITE;
/*!40000 ALTER TABLE `finance_estate` DISABLE KEYS */;
INSERT INTO `finance_estate` VALUES (1,'ABC公司总部大楼','北京市朝阳区建国路1号',50000000.00,'2020-01-01'),(2,'XYZ公司分部办公室','上海市浦东新区张江高科技园区',3000000.00,'2021-05-01');
/*!40000 ALTER TABLE `finance_estate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_expense`
--

DROP TABLE IF EXISTS `finance_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_expense`
--

LOCK TABLES `finance_expense` WRITE;
/*!40000 ALTER TABLE `finance_expense` DISABLE KEYS */;
INSERT INTO `finance_expense` VALUES (1,'餐饮费','2022-03-20',120.50),(2,'差旅费','2022-03-15',800.00),(3,'办公用品费','2022-03-10',260.00),(4,'租金','2022-03-01',1200.00),(5,'水电费','2022-02-28',350.00);
/*!40000 ALTER TABLE `finance_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_expense_options`
--

DROP TABLE IF EXISTS `finance_expense_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_expense_options` (
  `id` int NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_expense_options`
--

LOCK TABLES `finance_expense_options` WRITE;
/*!40000 ALTER TABLE `finance_expense_options` DISABLE KEYS */;
INSERT INTO `finance_expense_options` VALUES (1,'option1','餐饮费'),(2,'option2','差旅费'),(3,'option3','办公用品费'),(4,'option4','租金'),(5,'option5','水电费'),(6,'option6','交通费');
/*!40000 ALTER TABLE `finance_expense_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_property`
--

DROP TABLE IF EXISTS `finance_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_property` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_property`
--

LOCK TABLES `finance_property` WRITE;
/*!40000 ALTER TABLE `finance_property` DISABLE KEYS */;
INSERT INTO `finance_property` VALUES (1,'电脑A',8000.00,'2020-01-01'),(2,'打印机B',2000.00,'2021-05-01');
/*!40000 ALTER TABLE `finance_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `desc` text,
  `address` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `totalQuantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Organic Apples','Fruits','Fresh and organic apples from local farms','California, USA',2.50,3.99,500),(2,'Grass-fed Beef','Meat','Lean and tender grass-fed beef from free-range cows','Texas, USA',5.99,8.99,200),(3,'Wild-caught Salmon','Seafood','Fresh and wild-caught salmon from the Pacific Northwest','Washington, USA',12.99,18.99,100),(4,'Organic Kale','Vegetables','Nutritious and flavorful organic kale from local farms','California, USA',1.50,2.99,300),(5,'Dark Chocolate','Sweets','Premium dark chocolate made with 70% cocoa','Switzerland',4.50,7.99,150);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stock` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
INSERT INTO `product_stock` VALUES (1,'2022-01-01',1,'Los Angeles, CA','Organic Apples',0,100),(2,'2022-01-05',2,'Houston, TX','Grass-fed Beef',0,50),(3,'2022-01-10',3,'Seattle, WA','Wild-caught Salmon',0,20),(4,'2022-01-15',4,'San Francisco, CA','Organic Kale',0,80),(5,'2022-01-20',5,'New York, NY','Dark Chocolate',0,30),(6,'2022-02-01',1,'Los Angeles, CA','Organic Apples',1,50),(7,'2022-02-05',2,'Houston, TX','Grass-fed Beef',1,25),(8,'2022-02-10',3,'Seattle, WA','Wild-caught Salmon',1,10),(9,'2022-02-15',4,'San Francisco, CA','Organic Kale',1,40),(10,'2022-02-20',5,'New York, NY','Dark Chocolate',1,15);
/*!40000 ALTER TABLE `product_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 19:47:50
