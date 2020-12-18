                             -- CRUD операции

INSERT INTO users VALUES
(DEFAULT, 'Sergey', 'Nikolaev', 'fin@mail.ru', 79037483068, 326549);

SELECT lastname FROM users; 

DELETE FROM users WHERE lastname = 'Perova';

SELECT lastname FROM users; 

SELECT * FROM users; 

INSERT INTO users VALUES
(101, 'Elena', 'Perova', 'perova@mail.ru', 79037483061, 326549);

SELECT * FROM users WHERE lastname = 'Perova'; 

INSERT users SET
id = DEFAULT,
firstname = 'Olga',
lastname = 'Dasenko',
email = 'olda@mail.ru',
phone = 79851234256,
password_hash = 326547;

--  Сервис-образец для курсовой работы.
/* База данных для "Сайта по продаже теплоутилизаторов". Возможно что-то лишнее написала. Предполагаемые таблицы: пользователи (фирмы), каталог, продукция, 
остатки товаров на складе (склад будет 1), заказы, список - что из заказанного отсутствует на складе и это надо закупить,
список закупленных теплоутилизаторов, список растоможенных теплоутилизаторов, список что еще ждем (в пути).*/




