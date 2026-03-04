CREATE DATABASE IF NOT EXISTS price_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE price_db;
SET NAMES utf8mb4;

CREATE TABLE types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE=InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES types(id)
) ENGINE=InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;


INSERT INTO types (name) VALUES
('อุปกรณ์อิเล็กทรอนิกส์'),
('เครื่องใช้ไฟฟ้า'),
('เฟอร์นิเจอร์'),
('เสื้อผ้าและเครื่องแต่งกาย'),
('ของเล่นและเกม'),
('หนังสือและสื่อการเรียนรู้'),
('เครื่องสำอางและผลิตภัณฑ์ดูแลตัวเอง'),
('อาหารและเครื่องดื่ม'),
('กีฬาและกิจกรรมกลางแจ้ง');

INSERT INTO products (id, image_url, name, price, description, type_id) VALUES
(1, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772206521/a72sl9umfgsldteuf6di.jpg',
'Apple MacBook Pro 14 : M5 chip 10C CPU/10C GPU/16GB/512GB',
54900.00,
'MacBook Pro รุ่น 14 นิ้ว พร้อมชิป M5 มาพร้อมความเร็วเจเนอเรชั่นถัดไปและ AI อันทรงพลังบนอุปกรณ์สำหรับทั้งงานส่วนตัว งานระดับมืออาชีพ และงานสร้างสรรค์ที่คุณทำทุกๆ วัน ทั้งยังมีแบตเตอรี่ที่ใช้งานได้นานสูงสุด 24 ชั่วโมง และจอภาพ Liquid Retina XDR อีกด้วย',
1),

(2, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772208771/vwnphgju7ger0wkq0kxz.jpg',
'Apple iPhone 17 Pro Max 512GB Cosmic Orange',
56900.00,
'iPhone 17 Pro Max คือ iPhone ที่ทรงพลังที่สุดเท่าที่เคยมีมา โดยมาพร้อมจอภาพขนาด 6.9 นิ้วที่สวยสด ดีไซน์แบบอะลูมิเนียมชิ้นเดียว ชิป A19 Pro กล้องหลัง 48MP ทั้งหมด และแบตเตอรี่ที่ใช้งานได้นานที่สุดเท่าที่เคยมีมา',
1),

(3, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772208898/h8zfgjz2ekws568buxvx.jpg',
'Apple iPad Pro 11 : M5 Wi-Fi 256GB',
35900.00,
'iPad Pro ขับเคลื่อนด้วยชิป Apple M5 จึงมีประสิทธิภาพที่แรงสุดพลังเพื่อการทำงานที่ง่ายดายและเวิร์กโฟลว์ด้าน AI สุดล้ำ ด้วยจอภาพ Ultra Retina XDR ที่สวยงามน่าทึ่ง, Wi-Fi 7 รวมไปถึง Neural Accelerators สำหรับเวิร์กโหลดด้าน AI และ iPadOS ที่ออกแบบมาใหม่ ทีนี้คุณก็ทำอะไรได้อย่างไร้ขีดจำกัด',
1),

(4, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209011/pngzbbzzumzzzywvzgz1.jpg',
'Samsung Galaxy Z Flip7 (12+512GB) Coral (5G)',
37900.00,
'Galaxy Z Flip7 สัมผัสดีไซน์กะทัดรัด พกง่าย ชิปเซ็ตใหม่ล่าสุด กล้องคมชัดทุกมิติ แบตอึด พร้อมค้นพบสีสันและนวัตกรรมสมาร์ทโฟนพับได้แห่งอนาคต ราคาดีที่สุดเฉพาะที่',
1),

(5, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209288/l0quyo6swvnbpqv5ytpp.jpg',
'Xiaomi Redmi Note 15 Pro+ (12+256GB) Black (5G)',
13990.00,
'Redmi Note 15 Pro+ สมาร์ทโฟนป้องกันการตกกระแทก 2.5 เมตรตามมาตรฐาน SGS มาตรฐาน IP69K ทนทานต่อแรงดันน้ำ 176°F ที่แรงดัน 1,450 psi แช่น้ำลึกได้ 2 เมตร นานถึง 24 ชั่วโมง กล้องรุ่นใหม่ ถ่ายชัดทุกมุมมอง จับคู่กับเลนส์ Ultra-wide คมชัดทุกรายละเอียด',
1),

(6, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209426/w9hjzfpwhwzh65j2h51e.jpg',
'Xiaomi Smart Camera C400',
2190.00,
'กล้องวงจรปิด Xiaomi Smart Camera C400 White สามารถดูภาพแบบ Real-time ผ่าน Wi-Fi และบันทึกลงอุปกรณ์ได้ สามารถคุยสื่อสารผ่านตัวกล้องได้เลย เมื่อเชื่อมกับแอพ Mi Home และปรับมุมกล้องก้ม-เงย ได้ถึง 106 องศา รองรับการเล่นวีดิโอย้อนหลังที่ความเร็วสูง เพื่อง่ายต่อการค้นหาช่วงเวลาที่ต้องการ',
2),

(7, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209513/xcpgnpi79k6y3zwl5yed.jpg',
'Xiaomi Smart Air Purifier Elite White',
10790.00,
'สุขภาพดีเริ่มต้นด้วยอากาศที่บริสุทธิ์กับเครื่องฟอกอากาศ Xiaomi Smart Air Purifier Elite ที่ช่วยกำจัดอนุภาคฝุ่นขนาด 0.3μm ได้ 99.98% และกำจัดสารก่อภูมิแพ้ กลิ่นที่ไม่พึงประสงค์ได้อย่างมีประสิทธิภาพ',
2),

(8, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209608/adyhcef8xlnzyhwkmijf.jpg',
'Kapbira Cute Light',
590.00,
'ไฟตั้งโต๊ะ Kapbira Cute Light โคมไฟกลางคืนที่ทำจากซิลิโคนนุ่มปลอดภัย บีบได้เพื่อความผ่อนคลาย ให้แสงอบอุ่นปรับหรี่ได้',
2),

(9, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209700/wxap9aeffzvxgfhpmq2i.jpg',
'Jisulife FA53Pro Handheld Fan Gray',
1399.00,
'Jisulife FA53Pro Handheld Fan พัดลมพกพาที่สามารถปรับความแรงลมได้ถึง 100 ระดับ มาพร้อมหน้าจอ LED',
2),

(10, 'https://res.cloudinary.com/ddqyuznb0/image/upload/v1772209792/obplphk1cxz4q83np0rm.jpg',
'Xiaomi Smart Air Purifier 4 Pro Filter Gray',
1349.00,
'Xiaomi Air Purifier 4 Pro Filter ไส้กรองเครื่องฟอกอากาศที่มีไส้กรองมากถึง 3 ชั้น ช่วยกำจัดกลิ่นไม่พึงประสงค์',
2);