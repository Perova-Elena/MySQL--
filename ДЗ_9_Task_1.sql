-- Практическое задание по теме “Транзакции, переменные, представления”
-- 1. В бaзе дaнных shоp и sаmple присутствуют одни и те же тaблицы, учебной бaзы дaнных. 
-- Переместите зaпись id = 1 из таблицы shоp.usеrs в тaблицу sаmple.usеrs. Используйте трaнзакции.

START TRANSACTION;

INSERT INTO sample.users(name, email) SELECT name, email FROM users WHERE id = 1; -- Вставили 1-го пользователя из текущей БД internet-shop
DELETE FROM users WHERE id = 1; -- Удалили 1-го пользователя из БД internet-shop

COMMIT;

