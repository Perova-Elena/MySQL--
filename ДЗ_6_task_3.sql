-- 3. Опрeдeлить кто большe поставил лaйков (всего) - мужчины или женщины?

SELECT IF(
	(SELECT COUNT(*) FROM LIKES WHERE users_id IN (
		SELECT users_id FROM profiles WHERE gender="m")
	) 
	> 
	(SELECT COUNT(*) FROM LIKES WHERE users_id IN (
		SELECT users_id FROM profiles WHERE gender="f")
	), 
   'Больше лайков поставили мужчины', 'Больше лайков поставили женщины') AS RESULT;