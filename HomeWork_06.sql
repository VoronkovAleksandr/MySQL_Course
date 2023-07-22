USE seminar_4;
/*
Создайте таблицу users_old, аналогичную таблице users. 
Создайте процедуру, с помощью которой можно переместить любого (одного) 
пользователя из таблицы users в таблицу users_old. 
(использование транзакции с выбором commit или rollback – обязательно).
*/

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);


DROP PROCEDURE IF EXISTS move_user;
DELIMITER //
CREATE PROCEDURE move_user (user_id INT)
BEGIN
START TRANSACTION;
	SELECT id FROM users WHERE id = user_id;
    INSERT INTO users_old (id, firstname, lastname, email) VALUES (
		(SELECT id FROM users WHERE id = user_id),
		(SELECT firstname FROM users WHERE id = user_id),
		(SELECT lastname FROM users WHERE id = user_id),
		(SELECT email FROM users WHERE id = user_id)
		);
	DELETE FROM users WHERE id = user_id;
COMMIT;
END
//
DELIMITER ;

CALL move_user(1);

/*
2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".
*/

DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello (now_time TIME)
BEGIN
	DECLARE now_time TIME DEFAULT now_time;
    DECLARE GOOD_MORNING TEXT DEFAULT "Доброе утро";
    DECLARE GOOD_DAY TEXT DEFAULT 'Добрый день';
    DECLARE GOOD_EVENINIG TEXT DEFAULT 'Добрый вечер';
    DECLARE GOOD_NIGHT TEXT DEFAULT "Доброй ночи";
	DECLARE result TEXT;
    SET result =
		CASE 
			WHEN TIME(now_time) BETWEEN TIME('06:00') AND TIME('12:00')
				THEN GOOD_MORNING
			WHEN TIME(now_time) BETWEEN TIME('12:00') AND TIME('18:00')
				THEN GOOD_DAY
			WHEN TIME(now_time) BETWEEN TIME('18:00') AND TIME('24:00')
				THEN GOOD_EVENINIG
			WHEN TIME(now_time) BETWEEN TIME('00:00') AND TIME('06:00')
				THEN GOOD_NIGHT
		END;
    SELECT result;
END 
//
DELIMITER ;

CALL hello(TIME(NOW()));

