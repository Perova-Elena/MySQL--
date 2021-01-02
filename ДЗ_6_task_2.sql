-- 2. Подсчитaть общее количество лaйков, которые получили 10 сaмых молодых пользовaтелей.

SELECT
* ,
(SELECT COUNT(*) FROM likes WHERE media_id IN (SELECT id FROM media WHERE media.users_id = profiles.users_id)) +
(SELECT COUNT(*) FROM likes WHERE posts_id IN (SELECT id FROM posts WHERE posts.users_id = profiles.users_id)) + 
(SELECT COUNT(*) FROM likes WHERE messages_id IN (SELECT id FROM messages WHERE messages.from_users_id = profiles.users_id)) AS 'Сумма лайков медиа, постам и сообщениям 10 самым молодым пользователям'
FROM vk.profiles
ORDER BY birthday DESC LIMIT 10; -- Сначала идет сортировка по датам рождения по убыванию (т.к. самые молодые родились позже) и ограничили вывод 10 пользователями. Так, мы нашли те profiles.users_id, чьи медиа, посты и сообщения надо суммировать из лайков 


