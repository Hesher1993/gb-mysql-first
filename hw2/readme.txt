Geekbrains
ДЗ 2: Базы данных. Базовый курс
Выполнил: Олег Фадеев

1. Имеющаяся у нас схема не очень годится для работы. Нужно привести её в нормальный вид,
таблицы должны выглядеть следующим образом:
Таблица​​_countries
FIELD   TYPE         NULL  KEY         EXTRA
id      INT          NOT   Primary Key auto_increment
title   VARCHAR(150) NOT   INDEX

Таблица​​_regions
FIELD       TYPE          NULL  KEY         EXTRA
id          INT           NO    Primary Key auto_increment
country_id  INT           NO    Foreign Key _countries (id)
title       VARCHAR(150)  NO    INDEX

Таблица​​_cities
FIELD       TYPE          NULL  KEY           EXTRA
id          INT           NO    Primary Key   auto_increment
country_id  INT           NO    Foreign Key   _countries (id)
important   TINYINT(1)    NO
region_id   INT           NO    Foreign Key   _regions (id)
title       VARCHAR(150)  NO    INDEX

Самый простой способ - написать команды ALTER TABLE в отдельном файле с расширением .sql и
импортировать его через

mysql -u[username] -p[password] [database name] < file.sql

На изменение схемы может уйти очень много времени (до 1 часа), так что не пугайтесь, если команда
заставит вас долго ждать.

Для проверки результатов работы могут быть полезны следующие команды:

Показать команду DDL, с помощью которой таблица была создана

SHOW CREATE TABLE `<yourtable>`;

Показать структуру таблицы:

SHOW COLUMNS FROM `<yourtable>`;