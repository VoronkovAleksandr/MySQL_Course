USE seminar_4;

/*
1. Создайте представление, в которое попадет информация о пользователях 
(имя, фамилия, город и пол), которые не старше 20 лет.
*/
CREATE OR REPLACE VIEW under_twenty AS
SELECT u.firstname, u.lastname, p.hometown, p.gender
FROM users AS u
JOIN profiles AS p ON p.user_id = u.id
WHERE p.birthday > DATE(CURRENT_DATE() - INTERVAL 20 YEAR);

SELECT * FROM under_twenty;

/*
2. Найдите кол-во, отправленных сообщений каждым пользователем и 
выведите ранжированный список пользователей, указав имя и фамилию пользователя, 
количество отправленных сообщений и место в рейтинге 
(первое место у пользователя с максимальным количеством сообщений).
(используйте DENSE_RANK)
*/
WITH rank_table AS (
SELECT distinct  m.from_user_id, u.firstname,
	u.lastname,
	COUNT(m.id) OVER (PARTITION BY  m.from_user_id ) AS count_messages
FROM messages AS m
JOIN users as u on m.from_user_id = u.id
)
SELECT *, DENSE_RANK() OVER (ORDER BY count_messages DESC) AS user_rank
FROM rank_table;

/*
3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления 
(created_at) и найдите разницу дат отправления между соседними сообщениями, 
получившегося списка. (используйте LEAD или LAG)
*/
SELECT created_at, 
		body,
        TIME(created_at - LAG(created_at) OVER w) AS 'LAG_created_at',
        TIME(LEAD(created_at) OVER w -  created_at)  AS 'LAG_created_at'
FROM messages
WINDOW w AS (ORDER BY created_at);

