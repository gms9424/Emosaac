-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: j8d203.p.ssafy.io    Database: emosaac
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_no` bigint NOT NULL AUTO_INCREMENT,
  `created_dt` datetime(6) NOT NULL,
  `modified_dt` datetime(6) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `depth` int DEFAULT NULL,
  `is_delete` bit(1) DEFAULT b'0',
  `like_score` double DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `emopick_no` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_no` bigint DEFAULT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `FKkko96rdq8d82wm91vh2jsfak7` (`book_id`),
  KEY `FKb6a8u0ffst0gpvf4urqaagqa5` (`emopick_no`),
  KEY `FKde3rfu96lep00br5ov0mdieyt` (`parent_id`),
  KEY `FKq0ekodjkru4a87f99qeyg28l0` (`user_no`),
  CONSTRAINT `FKb6a8u0ffst0gpvf4urqaagqa5` FOREIGN KEY (`emopick_no`) REFERENCES `emopick` (`emopick_no`),
  CONSTRAINT `FKde3rfu96lep00br5ov0mdieyt` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`comment_no`),
  CONSTRAINT `FKkko96rdq8d82wm91vh2jsfak7` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_no`),
  CONSTRAINT `FKq0ekodjkru4a87f99qeyg28l0` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'2023-03-29 09:39:28.647082','2023-03-29 10:06:44.538346','111',0,_binary '\0',1,1,NULL,NULL,6),(3,'2023-03-29 09:39:38.639778','2023-03-29 10:06:56.106343','222',0,_binary '\0',1,1,NULL,NULL,6),(4,'2023-03-29 09:39:43.084807','2023-03-29 09:39:43.084807','333',0,_binary '\0',NULL,1,NULL,NULL,6),(5,'2023-03-29 09:39:50.058169','2023-03-29 09:39:50.058169','333',1,_binary '\0',NULL,1,NULL,2,6),(8,'2023-03-30 09:03:34.845568','2023-03-30 09:03:34.845568','짱!',0,_binary '\0',NULL,257,NULL,NULL,3),(10,'2023-03-30 14:08:02.975850','2023-03-30 15:43:16.269399','헬리오 지켜 ㅜㅜ',0,_binary '\0',2,2315,NULL,NULL,3),(11,'2023-03-30 14:12:22.732804','2023-03-30 14:12:22.732804','외 않 봐?',0,_binary '\0',NULL,1387,NULL,NULL,3),(12,'2023-03-30 15:43:07.806696','2023-03-30 15:43:42.148461','진짜 ㅠㅠㅠㅠ',1,_binary '\0',1,2315,NULL,10,6),(16,'2023-04-03 13:19:24.928949','2023-04-03 13:19:32.909257','재밌어용',0,_binary '\0',0,4447,NULL,NULL,16),(22,'2023-04-04 15:00:47.760592','2023-04-04 15:00:47.760592','string',0,_binary '\0',NULL,1,NULL,NULL,6),(23,'2023-04-04 15:00:50.396733','2023-04-04 15:00:50.396733','string',0,_binary '\0',NULL,1,NULL,NULL,6),(24,'2023-04-04 15:00:50.985325','2023-04-04 15:00:50.985325','string',0,_binary '\0',NULL,1,NULL,NULL,6),(25,'2023-04-04 15:00:51.455826','2023-04-04 15:00:51.455826','string',0,_binary '\0',NULL,1,NULL,NULL,6),(26,'2023-04-04 15:00:51.765143','2023-04-04 15:00:51.765143','string',0,_binary '\0',NULL,1,NULL,NULL,6),(27,'2023-04-04 15:00:51.946524','2023-04-04 15:00:51.946524','string',0,_binary '\0',NULL,1,NULL,NULL,6),(28,'2023-04-04 15:00:52.118761','2023-04-04 15:00:52.118761','string',0,_binary '\0',NULL,1,NULL,NULL,6),(29,'2023-04-04 15:00:52.268027','2023-04-04 15:00:52.268027','string',0,_binary '\0',NULL,1,NULL,NULL,6),(30,'2023-04-04 15:00:52.421319','2023-04-04 15:00:52.421319','string',0,_binary '\0',NULL,1,NULL,NULL,6),(31,'2023-04-04 15:00:52.572021','2023-04-04 15:00:52.572021','string',0,_binary '\0',NULL,1,NULL,NULL,6),(32,'2023-04-04 15:00:52.722773','2023-04-04 15:00:52.722773','string',0,_binary '\0',NULL,1,NULL,NULL,6),(33,'2023-04-04 15:00:52.876097','2023-04-04 15:00:52.876097','string',0,_binary '\0',NULL,1,NULL,NULL,6),(34,'2023-04-04 15:00:53.043531','2023-04-04 15:00:53.043531','string',0,_binary '\0',NULL,1,NULL,NULL,6),(35,'2023-04-04 15:00:53.189441','2023-04-04 15:00:53.189441','string',0,_binary '\0',NULL,1,NULL,NULL,6),(36,'2023-04-04 15:00:53.350290','2023-04-04 15:00:53.350290','string',0,_binary '\0',NULL,1,NULL,NULL,6),(37,'2023-04-04 15:00:53.527623','2023-04-04 15:00:53.527623','string',0,_binary '\0',NULL,1,NULL,NULL,6),(38,'2023-04-04 15:00:53.665112','2023-04-04 15:00:53.665112','string',0,_binary '\0',NULL,1,NULL,NULL,6),(39,'2023-04-04 15:00:53.794521','2023-04-04 15:00:53.794521','string',0,_binary '\0',NULL,1,NULL,NULL,6),(40,'2023-04-04 15:00:54.102429','2023-04-04 15:00:54.102429','string',0,_binary '\0',NULL,1,NULL,NULL,6),(41,'2023-04-04 15:00:54.291845','2023-04-04 15:00:54.291845','string',0,_binary '\0',NULL,1,NULL,NULL,6),(42,'2023-04-04 15:00:54.417628','2023-04-04 15:00:54.417628','string',0,_binary '\0',NULL,1,NULL,NULL,6),(43,'2023-04-04 15:00:54.575114','2023-04-04 15:00:54.575114','string',0,_binary '\0',NULL,1,NULL,NULL,6),(44,'2023-04-04 15:00:54.735360','2023-04-04 15:00:54.735360','string',0,_binary '\0',NULL,1,NULL,NULL,6),(45,'2023-04-04 15:00:54.920066','2023-04-04 15:00:54.920066','string',0,_binary '\0',NULL,1,NULL,NULL,6),(46,'2023-04-04 15:00:55.079477','2023-04-04 15:00:55.079477','string',0,_binary '\0',NULL,1,NULL,NULL,6),(47,'2023-04-04 15:00:55.237739','2023-04-04 15:00:55.237739','string',0,_binary '\0',NULL,1,NULL,NULL,6),(48,'2023-04-04 15:00:55.408184','2023-04-04 15:00:55.408184','string',0,_binary '\0',NULL,1,NULL,NULL,6),(49,'2023-04-04 15:00:55.576779','2023-04-04 15:00:55.576779','string',0,_binary '\0',NULL,1,NULL,NULL,6),(50,'2023-04-04 15:00:55.738980','2023-04-04 15:00:55.738980','string',0,_binary '\0',NULL,1,NULL,NULL,6),(51,'2023-04-04 16:07:03.795375','2023-04-04 16:07:03.795375','이거 봐야지~~',0,_binary '\0',NULL,11355,NULL,NULL,3),(52,'2023-04-04 22:23:48.673319','2023-04-04 22:23:48.673319','이거 진짜 재밌어요 추천',0,_binary '\0',NULL,2404,NULL,NULL,46),(55,'2023-04-05 20:53:56.218827','2023-04-05 20:53:58.414840','재미있다',0,_binary '\0',1,207,NULL,NULL,6),(56,'2023-04-06 11:30:06.374605','2023-04-06 13:31:09.033812','정말 재밌어요!!',0,_binary '\0',0,2223,NULL,NULL,5),(57,'2023-04-06 11:59:48.622434','2023-04-06 11:59:48.622434','이모작에서 추천하는 웹툰 최고에요!',0,_binary '\0',NULL,7391,NULL,NULL,13),(58,'2023-04-06 12:00:03.079630','2023-04-06 12:00:03.079630','대댓글입니다!',1,_binary '\0',NULL,7391,NULL,57,13),(59,'2023-04-06 13:31:13.159045','2023-04-06 13:31:13.159045','진짜 최고...!!',0,_binary '\0',NULL,2223,NULL,NULL,5),(60,'2023-04-06 13:31:22.715145','2023-04-06 13:31:23.949723','답댓글입니다..!!',1,_binary '\0',1,2223,NULL,56,5),(61,'2023-04-06 13:43:31.155237','2023-04-06 13:43:31.155237','댓글ㄹㄹㄹㄹㄹ',0,_binary '\0',NULL,1,NULL,NULL,6),(62,'2023-04-06 15:02:55.505548','2023-04-06 23:36:46.177997','이거 너무 너무 재밌어요~~ 휴재 언제 끝나려나,,,,',0,_binary '\0',1,2582,NULL,NULL,6),(63,'2023-04-06 20:34:14.819723','2023-04-06 20:34:14.819723','잼써요',0,_binary '\0',NULL,4196,NULL,NULL,16),(64,'2023-04-06 22:42:37.742730','2023-04-06 22:42:41.347878','dsadassddas',0,_binary '\0',1,54,NULL,NULL,54),(65,'2023-04-06 22:42:39.515401','2023-04-06 22:42:40.571923','fweafwafwreffsd',0,_binary '\0',1,54,NULL,NULL,54),(66,'2023-04-06 22:42:43.400422','2023-04-06 22:42:43.400422','vdfsvfdsvf',1,_binary '\0',NULL,54,NULL,65,54),(67,'2023-04-06 23:20:04.118583','2023-04-06 23:20:04.118583','틴탑위고롹인드뢉잇팝잇헤이돈스탑잇탑잇',0,_binary '\0',NULL,3485,NULL,NULL,11),(68,'2023-04-06 23:21:41.892611','2023-04-06 23:21:41.892611','틴탑위고롹인드뢉잇팝잇헤이돈스탑잇탑잇',0,_binary '\0',NULL,2335,NULL,NULL,11),(69,'2023-04-06 23:34:39.036296','2023-04-06 23:36:45.114039','철먜 돌아와~~~',0,_binary '\0',1,2582,NULL,NULL,66),(70,'2023-04-06 23:49:49.629330','2023-04-06 23:49:58.388294','최강강아지 마루',0,_binary '\0',0,2310,NULL,NULL,66),(71,'2023-04-07 02:40:43.886132','2023-04-07 02:40:43.886132','ㅎㅎㅎㅇㅎㅇㅎ',0,_binary '\0',NULL,8,NULL,NULL,16),(72,'2023-04-07 02:41:23.971426','2023-04-07 02:41:23.971426','ㅎㅎ',0,_binary '\0',NULL,8,NULL,NULL,16),(73,'2023-04-07 02:41:29.868575','2023-04-07 02:41:29.868575','ㅎㅇ',1,_binary '\0',NULL,8,NULL,72,16),(74,'2023-04-07 02:43:22.006144','2023-04-07 02:43:22.006144','재밌다고 하더라구용',0,_binary '\0',NULL,2468,NULL,NULL,16);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-07  9:03:20
