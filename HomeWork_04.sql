USE  seminar_4;

/* 
1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
*/
SELECT u.id , p.birthday, COUNT(l.id)
FROM users AS u
JOIN profiles AS p ON u.id = p.user_id
JOIN likes as l ON p.user_id = l.user_id
WHERE birthday < DATE(CURRENT_DATE() - INTERVAL 12 YEAR)
GROUP BY u.id, p.birthday;

/*
2. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
SELECT p.gender, COUNT(*) AS likes
FROM profiles AS p
JOIN likes as l ON p.user_id = l.user_id
GROUP BY p.gender
ORDER BY likes DESC
LIMIT 1;

/*
3. Вывести всех пользователей, которые не отправляли сообщения.
*/
SELECT u.id, u.firstname, u.lastname
FROM users AS u
LEFT JOIN messages AS m  ON u.id = m.from_user_id 
WHERE from_user_id IS NULL;

/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, 
который больше всех написал ему сообщений.
*/
SELECT m.from_user_id, u.firstname, u.lastname, COUNT(*) AS count_messages
FROM users AS u
JOIN messages AS m ON u.id = m.to_user_id
WHERE u.id = 1
GROUP BY from_user_id
ORDER BY count_messages desc
LIMIT 1