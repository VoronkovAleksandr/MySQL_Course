USE mysql_course

-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE TABLE sales 
	(id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT NOT NULL);
    
 INSERT INTO sales
	(order_date, count_product) 
VALUES
   ('2022-01-01', 156),
   ('2022-01-02', 180),
   ('2022-01-03', 21),
   ('2022-01-04', 124),
   ('2022-01-05', 341);
   
-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id,
IF (count_product < 100, 'Маленький заказ',
	IF (count_product BETWEEN 100 AND 300, 'Средний заказ',
		IF(count_product > 300, 'Большой заказ', NULL))) AS 'Тип заказа' 
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. 
--    Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders
	(id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10),
    amount DEC(5,2),
    order_status VARCHAR(10));
    
INSERT INTO orders
	(employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT *,
CASE
WHEN order_status = 'OPEN' THEN 'Order is in open status'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;

/*
4. Чем NULL отличается от 0?

NULL это пустая ячейка не содержит никакой информации, а 0 это число
*/

