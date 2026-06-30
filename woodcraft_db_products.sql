-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: woodcraft_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  `image_path` varchar(500) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `room_category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Premium Teak Chair','Handcrafted teak wood chair',9998.00,17,'webcontent/images/chair.jpg','2026-06-06 12:29:11',1),(2,2,'Luxury Dining Table','6 Seater wooden dining table',14999.00,6,'webcontent/images/dining-table.jpg','2026-06-06 12:29:11',3),(3,3,'King Size Wooden Bed','Solid wood king bed',35000.00,1,'webcontent/images/bed.jpg','2026-06-06 12:29:11',2),(4,1,'Luxury Wooden Chair','Premium teak wood chair',5999.00,9,'webcontent/images/luxwoodenchair.jpg','2026-06-06 13:05:59',1),(9,2,'Sofaset','Sofaset',12000.00,8,'webcontent/images/sofaset.jpg','2026-06-07 14:23:56',3),(13,1,'comfort sofa','most comfortable sofa',2999.00,0,'webcontent/images/sofaset.jpg','2026-06-09 11:58:16',1),(14,1,'Luxury Sofa Set','Premium living room sofa',45000.00,9,'webcontent/images/luxury-sofa.jpg','2026-06-15 13:34:31',1),(15,1,'Modern Coffee Table','Elegant coffee table',8999.00,15,'webcontent/images/coffee-table.jpg','2026-06-15 13:34:31',1),(16,1,'TV Unit','Wooden TV unit',17999.00,8,'webcontent/images/tv-unit.jpg','2026-06-15 13:34:31',1),(17,1,'Wooden Bookshelf','Luxury bookshelf',14999.00,6,'webcontent/images/bookshelf.jpg','2026-06-15 13:34:31',1),(18,3,'Queen Size Bed','Luxury queen bed',29999.00,5,'webcontent/images/queen-bed.jpg','2026-06-15 13:34:31',2),(19,3,'King Size Storage Bed','Storage bed with drawers',39999.00,4,'webcontent/images/storage-bed.jpg','2026-06-15 13:34:31',2),(20,3,'Wardrobe','Premium wardrobe',24999.00,7,'webcontent/images/wardrobe.jpg','2026-06-15 13:34:31',2),(21,3,'Bedside Table','Modern bedside table',4999.00,20,'webcontent/images/bedside-table.jpg','2026-06-15 13:34:31',2),(22,2,'6 Seater Dining Set','Premium dining table set',42999.00,5,'webcontent/images/dining-set.jpg','2026-06-15 13:34:31',3),(23,2,'Dining Bench','Wooden dining bench',9999.00,8,'webcontent/images/dining-bench.jpg','2026-06-15 13:34:31',3),(24,2,'Dining Chair Set','Dining chair combo',11999.00,10,'webcontent/images/dining-chair.jpg','2026-06-15 13:34:31',3),(25,1,'Executive Office Desk','Premium office desk',26999.00,5,'webcontent/images/office-desk.jpg','2026-06-15 13:34:31',4),(26,1,'Office Storage Cabinet','Office cabinet',15999.00,7,'webcontent/images/storage-cabinet.jpg','2026-06-15 13:34:31',4),(27,1,'Office Chair','Luxury office chair',12999.00,10,'webcontent/images/office-chair.jpg','2026-06-15 13:34:31',4),(28,1,'Garden Bench','Outdoor wooden bench',17999.00,4,'webcontent/images/garden-bench.jpg','2026-06-15 13:34:31',5),(29,1,'Patio Chair Set','Outdoor chair set',13999.00,6,'webcontent/images/patio-chair.jpg','2026-06-15 13:34:31',5),(30,5,'Wooden Wall Clock','Decor wall clock',2999.00,15,'webcontent/images/wall-clock.jpg','2026-06-15 13:34:31',6),(31,5,'Wooden Wall Art','Handcrafted wall art',4999.00,12,'webcontent/images/wall-art.jpg','2026-06-15 13:34:31',6),(32,1,'Festival Sofa Offer','Special discounted sofa',34999.00,3,'webcontent/images/offer-sofa.jpg','2026-06-15 13:34:31',7),(33,2,'Dining Offer Combo','Discount dining combo',24999.00,5,'webcontent/images/offer-dining.jpg','2026-06-15 13:34:31',7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-16  1:46:52
