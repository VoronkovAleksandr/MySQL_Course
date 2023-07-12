USE mysql_course;

CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    post VARCHAR(50),
    seniority INT,
    salary INT,
    age INT NOT NULL
    );
    
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES 
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1. Отсортируйте  данные по полю заработная плата(salary) в порядке: убывания; возрастания
SELECT * FROM staff
ORDER BY salary ASC;
    
SELECT * FROM staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат(salary);
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную заработную плату(salary) по каждой специальности(post).
SELECT post, SUM(salary) FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью(post) "Рабочий" в возрасте от 24 до 49 лет включительно.
SELECT count(post) FROM staff
WHERE age > 23 AND age < 50
GROUP BY post
HAVING post='Рабочий';

-- 5. Найдите количество специальностей.
SELECT  count(DISTINCT post) FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT post, AVG(age) FROM staff
GROUP BY post
HAVING AVG(age) < 30;
