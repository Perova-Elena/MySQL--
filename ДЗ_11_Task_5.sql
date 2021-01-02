-- 5. Оргaнизуйте хрaнение кaтегорий и товaрных позиций учебной бaзы дaнных shоp в СУБД MongоDВ.

-- Решение: сохраним таблицу catalogs в СУБД MongoDB:

use catalogs
db.catalogs.insertMany([
{name: "Процессоры"}, {name: "Мат.платы"}, {name: "Видеокарты"}
])

-- Теперь сохраним таблицу products в СУБД MongoDB:

use products
db.products.insertMany([
	{name: "Intel Core i5", description: "Процессор для ПК", price: "6700.00", catalog_id: "Процессоры"},
	{name: "AMD NX-PRO560E", description: "Видеокарта для ноутбуков", price: "12300.00", catalog_id: "Видеокарты"}
    ])
