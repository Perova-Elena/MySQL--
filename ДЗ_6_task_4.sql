-- 4. Нaйти 10 пользовaтелей, которые проявляют нaименьшую aктивность в использовaнии социaльной сети.
SELECT
* ,
(SELECT COUNT(*) FROM likes WHERE users_id = profiles.users_id) +
(SELECT COUNT(*) FROM media WHERE users_id = profiles.users_id) + 
(SELECT COUNT(*) FROM messages WHERE from_users_id = profiles.users_id) AS total_activity -- Подсчет суммы активности каждого пользователя
FROM vk.profiles
ORDER BY total_activity LIMIT 10; 








