-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: domus    Database: appdb
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.20.04.3

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(45) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  UNIQUE KEY `ip_UNIQUE` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aprajapati1841','10.173.3.0'),(2,'Asingh3967','10.173.4.0'),(3,'Bkalariya5738','10.173.5.0'),(4,'Dakyea0145','10.173.6.0'),(5,'Dparmar1628','10.173.7.0'),(6,'Fionaalbert1785','10.173.8.0'),(7,'Gurpreetsingh2222','10.173.9.0'),(8,'Hezeanowi0446','10.173.10.0'),(9,'Ibinmohammed3004','10.173.11.0'),(10,'Jgrover0702','10.173.12.0'),(11,'Krawal3640','10.173.13.0'),(12,'Lantu5815','10.173.14.0'),(13,'Mhirani6192','10.173.15.0'),(14,'Mmistry3738','10.173.16.0'),(15,'Mtanuan9960','10.173.17.0'),(16,'Nkshetri5735','10.173.18.0'),(17,'Pindulekharajas3920','10.173.19.0'),(18,'Pkathuria6011','10.173.20.0'),(19,'Pmistry8185','10.173.21.0'),(20,'Psolanki1740','10.173.22.0'),(21,'Rjangaigar9369','10.173.23.0'),(22,'Sbalajirameshsi7703','10.173.24.0'),(23,'Schowdula1421','10.173.25.0'),(24,'Sjammula6373','10.173.26.0'),(25,'Skandibanda9664','10.173.27.0'),(26,'Sprajapati4221','10.173.28.0'),(27,'Spremanand0181','10.173.29.0'),(28,'Sthirumalaiswam5776','10.173.30.0'),(29,'Sucheana5869','10.173.31.0'),(30,'Tmangukiya9723','10.173.32.0'),(31,'Vbarot1329','10.173.33.0'),(32,'Vmudundi3746','10.173.34.0'),(33,'Vrajamohan7974','10.173.35.0'),(34,'Vsharma4063','10.173.36.0'),(35,'Jvallabhaneni8572','10.173.113.0');
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

-- Dump completed on 2024-06-19 16:16:14
