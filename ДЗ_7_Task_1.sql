-- 1. Состaвьте список пользовaтелей usеrs, которые осущeствили хотя бы один заказ ordеrs в интернет магазине.

-- 1 способ 

SELECT * FROM users
WHERE EXISTS (SELECT * FROM orders WHERE users_id = users.id);

-- 2 способ 

SELECT users_id FROM orders GROUP BY users_id; -- Получим id пользователей, сделавших хоть один заказ

-- 3 способ

SELECT * FROM users
WHERE id IN (SELECT Users_id FROM orders group by users_id);

-- 4 способ

SELECT 
	u.id, u.name,
	group_concat(o.id) AS 'id-номера сделанных заказов', 
    count(*) as 'Всего сделано заказов'
FROM 
users AS u
JOIN orders AS o 
ON u.id = o.users_id
group by u.id;