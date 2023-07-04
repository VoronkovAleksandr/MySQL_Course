CREATE SCHEMA mysql_course: 
USE mysql_course;
-- 1. 
CREATE TABLE mobile_phones (
id INT  AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(20),
manufacturer VARCHAR(20),
product_count INT,
price INT
);
INSERT INTO mobile_phones
		(product_name, manufacturer, product_count, price)
VALUES 	('iPhone X', 'Apple', 3, 76000),
		('iPhone 8', 'Apple', 2, 51000),
        ('Galaxy S9', 'Samsung', 2, 56000),
        ('Galaxy S8', 'Samsung', 1, 41000),
        ('P20 Pro', 'Huawei', 5, 36000);
-- 2.
SELECT product_name, manufacturer, price
FROM mobile_phones
WHERE product_count > 2;
-- 3.
SELECT *
FROM mobile_phones
WHERE manufacturer = 'Samsung';
-- 4.1
SELECT *
FROM mobile_phones
WHERE product_name  LIKE '%iphone%';
-- 4.2
SELECT *
FROM mobile_phones
WHERE manufacturer LIKE '%samsung%';
-- 4.3
SELECT *
FROM mobile_phones
WHERE product_name RLIKE '[0-9]';
-- 4.4
SELECT *
FROM mobile_phones
WHERE product_name LIKE '%8%';
