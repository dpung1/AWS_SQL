CREATE DATABASE  IF NOT EXISTS `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `product`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: product
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product_category_tb`
--

DROP TABLE IF EXISTS `product_category_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_tb` (
  `product_category_id` int NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`product_category_id`),
  UNIQUE KEY `product_category_name_UNIQUE` (`product_category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_tb`
--

LOCK TABLES `product_category_tb` WRITE;
/*!40000 ALTER TABLE `product_category_tb` DISABLE KEYS */;
INSERT INTO `product_category_tb` VALUES (1,'상의'),(3,'신발'),(2,'하의');
/*!40000 ALTER TABLE `product_category_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color_tb`
--

DROP TABLE IF EXISTS `product_color_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color_tb` (
  `product_color_id` int NOT NULL AUTO_INCREMENT,
  `product_color_name` varchar(45) NOT NULL,
  PRIMARY KEY (`product_color_id`),
  UNIQUE KEY `productcolor_name_UNIQUE` (`product_color_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color_tb`
--

LOCK TABLES `product_color_tb` WRITE;
/*!40000 ALTER TABLE `product_color_tb` DISABLE KEYS */;
INSERT INTO `product_color_tb` VALUES (1,'black'),(3,'blue'),(2,'red');
/*!40000 ALTER TABLE `product_color_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tb`
--

DROP TABLE IF EXISTS `product_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tb` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `product_price` int NOT NULL,
  `product_color_id` int NOT NULL,
  `product_category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tb`
--

LOCK TABLES `product_tb` WRITE;
/*!40000 ALTER TABLE `product_tb` DISABLE KEYS */;
INSERT INTO `product_tb` VALUES (3,'반팔티',30000,1,1),(4,'조거팬츠',35000,1,2),(5,'슬리퍼',15000,1,3);
/*!40000 ALTER TABLE `product_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'product'
--

--
-- Dumping routines for database 'product'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_insert_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_product`(
	in vs_product_name varchar(50),
    in vn_product_price int,
    in vs_product_color_name varchar(20),
    in vs_product_category_name varchar(20)
)
BEGIN
	declare _product_color_id int;
    declare _product_category_id int;
   
    select 
		product_color_id into _product_color_id
	from
		product_color_tb
	where
		product_color_name = vs_product_color_name;
        
	select
		product_category_id into _product_category_id
	from
		product_category_tb
	where
		product_category_name = vs_product_category_name;
        
	if ifnull(_product_color_id, 0) > 0 
		and ifnull(_product_category_id, 0) > 0
		then 
			insert into product_tb
            values(0, 
            vs_product_name,
            vn_product_price,
            _product_color_id,
            _product_category_id);
	end if;
        
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_update_product`(
	in vs_product_id int,
	in vs_product_name varchar(50),
    in vn_product_price int,
    in vs_product_color_name varchar(20),
    in vs_product_category_name varchar(20)
)
BEGIN
	
	declare _product_color_id int;
    declare _product_category_id int;
   
    select 
		product_color_id into _product_color_id
	from
		product_color_tb
	where
		product_color_name = vs_product_color_name;
        
	select
		product_category_id into _product_category_id
	from
		product_category_tb
	where
		product_category_name = vs_product_category_name;
        
	if ifnull(_product_color_id, 0) > 0 
		and ifnull(_product_category_id, 0) > 0
		then 
			update product_tb
            set product_name = vs_product_name, # 매개변수
				product_price = vn_product_price, # 매개변수 
                product_color_id = _product_color_id, # 지역변수
                product_category_id = _product_category_id # 지역변수
			where
				product_id = vs_product_id;
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-28 18:00:08
