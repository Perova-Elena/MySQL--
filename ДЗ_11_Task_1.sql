-- 1. Создайте таблицу lоgs типа Аrchivе. Пусть при каждом создaнии записи в таблицах usеrs, catаlogs и prоducts в таблицу 
-- lоgs помещaется время и дата создaния записи, назвaние тaблицы, идентификaтор первичного ключа и содeржимое поля name.

-- Сначала создадим таблицу log на движке Archive. Он не поддерживает индексы, т.к. нужен чисто для хранения, 
-- поэтому не будем создавать столбец id.
CREATE TABLE logs (
	created_at DATETIME NOT NULL, -- Сюда будет записыватья дата и время создания записи
	table_name VARCHAR(145) NOT NULL, -- Сюда будет записываться имя таблицы, в которую внесена запись
	row_id BIGINT NOT NULL, -- Сюда будет записываться id-номер созданной записи
	name_value VARCHAR(145) NOT NULL -- Сюда будет записываться значение поля name
) ENGINE = ARCHIVE;

-- Далее создадим 3 триггера на каждую из таблиц (users, catalogs и products), он будет срабатывать 
-- сразу же после создания новой записи в одной из этих 3х таблицах.

delimiter //
CREATE TRIGGER insert_into_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, row_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //

delimiter //
CREATE TRIGGER insert_into_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, row_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //

delimiter //
CREATE TRIGGER insert_into_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, row_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;