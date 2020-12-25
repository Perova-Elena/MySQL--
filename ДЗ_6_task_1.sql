/* 1. Пусть зaдaн некоторый пользовaтель. 
Из всeх друзeй этого пользовaтeля найдите человекa, который большe всeх общался с нашим пользовaтелем */

-- Решение (вспомогательные этапы закомментируем):
/*
-- Посмотрим кому и кто писал сообщения и сколько их всего (те, кому ничего не писали отсутствуют в списке):
SELECT
to_users_id,
GROUP_CONCAT(from_users_id),
COUNT(*)
FROM messages 
GROUP BY to_users_id;  */

-- Для примера возьмем 2-го пользователя. Мы видим, что 9 и 5 пользователь больше всего написали ему сообщений (по 4 каждый) А 36й всего одно. 
-- Выведем теперь информацию более компактно, выделив только 2 пользователя:
/*
SELECT
to_users_id, from_users_id,
COUNT(*)
FROM messages 
WHERE to_users_id = 2
GROUP BY to_users_id, from_users_id; */

-- Теперь осталось понять являются ли эти пользователи друзьями со 2 пользователем.
-- Выведем решение в одну строку, где будет фигурировать только 9 пользователь, как самый активный друг 2-го пользователя:

SELECT
to_users_id, from_users_id AS 'Самый активный друг',
COUNT(*)
FROM messages 
WHERE to_users_id = 2 AND from_users_id IN (
SELECT IF(from_users_id = 2, to_users_id, from_users_id) FROM friend_requests WHERE status = 1 AND (to_users_id = 2 OR from_users_id = 2) -- Составляем список всех друзей 2-го пользователя с помощью таблицы friend_requests
)
GROUP BY to_users_id, from_users_id
ORDER BY count(*) DESC LIMIT 1; -- Сортируем результат по убыванию и выводим максимальное значение.

-- Ответ - пользователь 9 - самый активный друг.