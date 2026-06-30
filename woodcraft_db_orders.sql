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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(30) DEFAULT 'PLACED',
  `shipping_address` text,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,19,7000.00,'DELIVERED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-08 17:30:22'),(2,2,7000.00,'CANCELLED','Main Road,Nagapattinam, Nagai, Tamil Nadu - 611103','2026-06-08 18:53:21'),(3,2,6999.00,'PLACED','null, null, null - null','2026-06-08 19:12:58'),(4,2,12000.00,'CANCELLED','null, null, null - null','2026-06-08 19:14:07'),(5,2,35000.00,'SHIPPED','Main Road,Meenambanallur ,Madapuram post, Nagapattinam, Tamil Nadu - 611103','2026-06-08 19:19:48'),(6,16,14999.00,'PLACED','main road, thanjavur, Tamil Nadu - 611103','2026-06-08 19:36:18'),(7,16,5999.00,'DELIVERED','main road, thanjavur, Tamil Nadu - 611103','2026-06-08 19:36:56'),(8,2,35000.00,'CANCELLED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-08 20:45:57'),(9,20,19996.00,'PLACED','main road, thanjavur, Tamil Nadu - 611103','2026-06-09 18:51:59'),(10,20,14999.00,'PLACED','Main Road,Nagapattinam, Nagai, Tamil Nadu - 611103','2026-06-09 18:52:33'),(11,22,3999.00,'PLACED','main road , thirupoondi, tamilnadu - 113243','2026-06-10 06:56:32'),(12,22,12000.00,'PLACED','Main Road,Nagapattinam, Nagai, Tamil Nadu - 611103','2026-06-10 06:57:30'),(13,23,14999.00,'PLACED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-10 08:48:30'),(14,24,12000.00,'DELIVERED','Main Road,Nagapattinam, Nagai, Tamil Nadu - 611103','2026-06-10 10:11:54'),(15,2,3999.00,'CANCELLED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-10 10:28:57'),(16,25,14999.00,'CANCELLED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-12 05:50:37'),(17,25,35000.00,'SHIPPED','Main Road,Meenambanallur ,Madapuram post, Nagapattinam, Tamil Nadu - 611103','2026-06-12 06:03:44'),(18,26,12000.00,'SHIPPED','Sri balaji Pg for gents, BENGALURU, Karnataka - 560076','2026-06-12 07:27:50'),(19,2,35000.00,'PLACED','Main Road,Meenambanallur ,Madapuram post, Nagapattinam, Tamil Nadu - 611103','2026-06-15 14:31:55'),(20,2,45000.00,'CANCELLED','Main Road,Meenambanallur ,Madapuram post, Nagapattinam, Tamil Nadu - 611103','2026-06-15 19:47:22');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
