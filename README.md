# MySQL_Course
## Домашнее задание к семенару 1

1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
2. Выведите название, производителя и цену для товаров, количество которых превышает 2.
3. Выведите весь ассортимент товаров марки “Samsung”
4. С помощю регулярных выражений найти:
  
   4.1 Товары, в которых есть упоминание "Iphone"
   
   4.2 Товары, в которых есть упоминание "Samsung"

   4.3 Товары, в которых есть ЦИФРЫ
   
   4.3 Товары, в которых есть ЦИФРА "8"

## Домашнее задание к семинару 2

1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
4. Чем NULL отличается от 0?

## Домашнее задание к семенару 3

1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания.
2. Выведите 5 максимальных заработных плат (saraly).
3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
5. Найдите количество специальностей.
6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.

## Домашнее задание к семинару 4

1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
2. Определить кто больше поставил лайков (всего): мужчины или женщины.
3. Вывести всех пользователей, которые не отправляли сообщения.
4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.

## Домашнее задание к семинару 5

1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)
3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
   
## Домашнее задание к семинару 6

1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно).
2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, communities и messages в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа. (не выполнено :( )
