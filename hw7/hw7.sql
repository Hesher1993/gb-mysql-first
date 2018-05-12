USE geodata;
-- 1. Создать нового пользователя и задать ему права доступа на базу данных «Страны и города мира».
-- создаем юзера
CREATE USER 'lesson7'@'localhost' IDENTIFIED BY '123123';
-- смотрим что создался юзер
SELECT user,host FROM mysql.user;
-- даем права юзеру на талицу geodata
GRANT ALL PRIVILEGES ON `geodata`.* TO 'lesson7'@'localhost';
-- обновляем все права
FLUSH PRIVILEGES;
-- 2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.
