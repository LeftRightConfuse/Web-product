-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: mysql    Database: price_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772206521/a72sl9umfgsldteuf6di.jpg','Apple MacBook Pro 14 : M5 chip 10C CPU/10C GPU/16GB/512GB',54900.00,'MacBook Pro รุ่น 14 นิ้ว พร้อมชิป M5 มาพร้อมความเร็วเจเนอเรชั่นถัดไปและ AI อันทรงพลังบนอุปกรณ์สำหรับทั้งงานส่วนตัว งานระดับมืออาชีพ และงานสร้างสรรค์ที่คุณทำทุกๆ วัน ทั้งยังมีแบตเตอรี่ที่ใช้งานได้นานสูงสุด 24 ชั่วโมง และจอภาพ Liquid Retina XDR อีกด้วย',1),(2,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772208771/vwnphgju7ger0wkq0kxz.jpg','Apple iPhone 17 Pro Max 512GB Cosmic Orange',56900.00,'iPhone 17 Pro Max คือ iPhone ที่ทรงพลังที่สุดเท่าที่เคยมีมา โดยมาพร้อมจอภาพขนาด 6.9 นิ้วที่สวยสด ดีไซน์แบบอะลูมิเนียมชิ้นเดียว ชิป A19 Pro กล้องหลัง 48MP ทั้งหมด และแบตเตอรี่ที่ใช้งานได้นานที่สุดเท่าที่เคยมีมา',1),(3,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772208898/h8zfgjz2ekws568buxvx.jpg','Apple iPad Pro 11 : M5 Wi-Fi 256GB',35900.00,'iPad Pro ขับเคลื่อนด้วยชิป Apple M5 จึงมีประสิทธิภาพที่แรงสุดพลังเพื่อการทำงานที่ง่ายดายและเวิร์กโฟลว์ด้าน AI สุดล้ำ ด้วยจอภาพ Ultra Retina XDR ที่สวยงามน่าทึ่ง, Wi-Fi 7 รวมไปถึง Neural Accelerators สำหรับเวิร์กโหลดด้าน AI และ iPadOS ที่ออกแบบมาใหม่ ทีนี้คุณก็ทำอะไรได้อย่างไร้ขีดจำกัด',1),(4,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209011/pngzbbzzumzzzywvzgz1.jpg','Samsung Galaxy Z Flip7 (12+512GB) Coral (5G)',37900.00,'Galaxy Z Flip7 สัมผัสดีไซน์กะทัดรัด พกง่าย ชิปเซ็ตใหม่ล่าสุด กล้องคมชัดทุกมิติ แบตอึด พร้อมค้นพบสีสันและนวัตกรรมสมาร์ทโฟนพับได้แห่งอนาคต ราคาดีที่สุดเฉพาะที่',1),(5,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209288/l0quyo6swvnbpqv5ytpp.jpg','Xiaomi Redmi Note 15 Pro+ (12+256GB) Black (5G)',13990.00,'Redmi Note 15 Pro+ สมาร์ทโฟนป้องกันการตกกระแทก 2.5 เมตรตามมาตรฐาน SGS มาตรฐาน IP69K ทนทานต่อแรงดันน้ำ 176°F ที่แรงดัน 1,450 psi แช่น้ำลึกได้ 2 เมตร นานถึง 24 ชั่วโมง กล้องรุ่นใหม่ ถ่ายชัดทุกมุมมอง จับคู่กับเลนส์ Ultra-wide คมชัดทุกรายละเอียด',1),(6,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209426/w9hjzfpwhwzh65j2h51e.jpg','Xiaomi Smart Camera C400',2190.00,'กล้องวงจรปิด Xiaomi Smart Camera C400 White สามารถดูภาพแบบ Real-time ผ่าน Wi-Fi และบันทึกลงอุปกรณ์ได้ สามารถคุยสื่อสารผ่านตัวกล้องได้เลย เมื่อเชื่อมกับแอพ Mi Home และปรับมุมกล้องก้ม-เงย ได้ถึง 106 องศา รองรับการเล่นวีดิโอย้อนหลังที่ความเร็วสูง เพื่อง่ายต่อการค้นหาช่วงเวลาที่ต้องการ',2),(7,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209513/xcpgnpi79k6y3zwl5yed.jpg','Xiaomi Smart Air Purifier Elite White',10790.00,'สุขภาพดีเริ่มต้นด้วยอากาศที่บริสุทธิ์กับเครื่องฟอกอากาศ Xiaomi Smart Air Purifier Elite ที่ช่วยกำจัดอนุภาคฝุ่นขนาด 0.3μm ได้ 99.98% และกำจัดสารก่อภูมิแพ้ กลิ่นที่ไม่พึงประสงค์ได้อย่างมีประสิทธิภาพ',2),(8,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209608/adyhcef8xlnzyhwkmijf.jpg','Kapbira Cute Light',590.00,'ไฟตั้งโต๊ะ Kapbira Cute Light โคมไฟกลางคืนที่ทำจากซิลิโคนนุ่มปลอดภัย บีบได้เพื่อความผ่อนคลาย ให้แสงอบอุ่นปรับหรี่ได้',2),(9,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209700/wxap9aeffzvxgfhpmq2i.jpg','Jisulife FA53Pro Handheld Fan Gray',1399.00,'Jisulife FA53Pro Handheld Fan พัดลมพกพาที่สามารถปรับความแรงลมได้ถึง 100 ระดับ มาพร้อมหน้าจอ LED',2),(10,'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209792/obplphk1cxz4q83np0rm.jpg','Xiaomi Smart Air Purifier 4 Pro Filter Gray',1349.00,'Xiaomi Air Purifier 4 Pro Filter ไส้กรองเครื่องฟอกอากาศที่มีไส้กรองมากถึง 3 ชั้น ช่วยกำจัดกลิ่นไม่พึงประสงค์',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'อุปกรณ์อิเล็กทรอนิกส์'),(2,'เครื่องใช้ไฟฟ้า'),(3,'เฟอร์นิเจอร์'),(4,'เสื้อผ้าและเครื่องแต่งกาย'),(5,'ของเล่นและเกม'),(6,'หนังสือและสื่อการเรียนรู้'),(7,'เครื่องสำอางและผลิตภัณฑ์ดูแลตัวเอง'),(8,'อาหารและเครื่องดื่ม'),(9,'กีฬาและกิจกรรมกลางแจ้ง');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-04 13:46:31
