-- 2. (по желaнию) Создaйте SQL-запрос, который помещает в таблицу users миллиoн записей.

-- Для начала определим заполняемые поля (Not Null) в моей таблице users. Это: name и email. 
-- И создадим процедуру, которая их заполняет. Поле id будет заполняться автоматически за счет свойства этого столбца AUTOINCREMENT

delimiter //
CREATE PROCEDURE insert_1_million_users ()
BEGIN
	DECLARE i INT DEFAULT 1000000;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO users(name, email) VALUES (CONCAT('user_', j), CONCAT(CONCAT('user_', j), '@mail.ru'));
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;

CALL insert_1_million_users ();