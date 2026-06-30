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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'CUSTOMER',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@woodcraft.com','9999999999','admin123','ADMIN','2026-06-06 12:28:48'),(2,'DHINAADMIN','dhinakaransivam2004@gmail.com','9078675645','123','CUSTOMER','2026-06-06 15:06:53'),(5,'Divyaa','dhivya@gmail.com','1234312343','123','CUSTOMER','2026-06-06 16:26:08'),(6,'amaravathi','amaravathi@gmail.com','7867556778','123','CUSTOMER','2026-06-06 17:29:47'),(7,'prem','prem@gmail.com','7867564557','123','CUSTOMER','2026-06-06 17:46:48'),(8,'yokesh','yogesh121@gmail.com','9098786756','123','CUSTOMER','2026-06-07 10:10:00'),(9,'maheshwaran','mahesh12@gmail.com','1232123435','123','CUSTOMER','2026-06-07 11:56:32'),(10,'babu','babu@gmail.com','7867675645','123','CUSTOMER','2026-06-07 18:20:43'),(11,'dharshini','dharshini@gmail.com','1234512345','123','CUSTOMER','2026-06-07 22:09:56'),(12,'abhi','abhi@gmail.com','1234554321','123','CUSTOMER','2026-06-07 22:12:38'),(13,'adam','adam@gmail.com','1233212343','123','CUSTOMER','2026-06-07 22:26:10'),(14,'DhivyaDhina','divdhina@gmail.com','1461465432','123','CUSTOMER','2026-06-07 22:37:05'),(15,'waran','waran@gmail.com','1233211223','123','CUSTOMER','2026-06-08 09:00:50'),(16,'Dhaya','dhaya@gmail.com','1234567898','123','CUSTOMER','2026-06-08 09:58:35'),(17,'dev','dev@gmail.com','1233243212','123','CUSTOMER','2026-06-08 10:21:31'),(18,'mukilan','mukilan@gmail.com','7867567889','123','CUSTOMER','2026-06-08 14:08:23'),(19,'paramasivam','paramasivam@gmail.com','8977889786','123','CUSTOMER','2026-06-08 17:29:48'),(20,'dhayanithi','nidhi@gmail.com','8967566778','123','CUSTOMER','2026-06-09 18:30:04'),(21,'radha','radha@gmail.com','2345234565','123','CUSTOMER','2026-06-10 06:51:51'),(22,'jayabarathi','jaya@gmail.com','2341234543','123','CUSTOMER','2026-06-10 06:54:56'),(23,'mano','mano@gmail.com','8766788987','123','CUSTOMER','2026-06-10 08:47:58'),(24,'suba','suba@gmail.com','5667675645','123','CUSTOMER','2026-06-10 10:11:24'),(25,'kumaravel','kumaravel@gmail.com','1234567898','123','CUSTOMER','2026-06-12 05:50:04'),(26,'mahessss','mahesss@gmail.com','6725352876','123','CUSTOMER','2026-06-12 07:27:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-16  1:46:53
