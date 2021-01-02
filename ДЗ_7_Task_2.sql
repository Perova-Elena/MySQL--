-- 2. Вывeдите список товaров prоducts и раздeлов catalоgs, который соотвeтствует товару.

SELECT 
	p.id, p.name as 'Название товара', c.name as 'Раздел каталога'
FROM 
products AS p
LEFT JOIN catalogs AS c -- LEFT JOIN, чтобы отобразить товары, не относящиеся ни к какому разделу
ON c.id = p.catalogs_id;