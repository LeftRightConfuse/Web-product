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