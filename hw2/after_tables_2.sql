USE `geodata`;
# для таблицы `_countries`
# Таблица​​_countries
# FIELD   TYPE         NULL  KEY         EXTRA
# id      INT          NOT   Primary Key auto_increment
# title   VARCHAR(150) NOT   INDEX
ALTER TABLE `_countries` ALTER `country_id` DROP DEFAULT;
ALTER TABLE `_countries` CHANGE COLUMN `country_id` `id` INT(11) NOT NULL FIRST;
ALTER TABLE `_countries` ADD PRIMARY KEY (`id`);
ALTER TABLE `_countries` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE `_countries` ADD INDEX (`title_ru`), CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_ua`), CHANGE COLUMN `title_ua` `title_ua` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_be`), CHANGE COLUMN `title_be` `title_be` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_en`), CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_es`), CHANGE COLUMN `title_es` `title_es` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_pt`), CHANGE COLUMN `title_pt` `title_pt` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_de`), CHANGE COLUMN `title_de` `title_de` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_fr`), CHANGE COLUMN `title_fr` `title_fr` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_it`), CHANGE COLUMN `title_it` `title_it` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_pl`), CHANGE COLUMN `title_pl` `title_pl` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_ja`), CHANGE COLUMN `title_ja` `title_ja` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_lt`), CHANGE COLUMN `title_lt` `title_lt` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_lv`), CHANGE COLUMN `title_lv` `title_lv` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title_cz`), CHANGE COLUMN `title_cz` `title_cz` VARCHAR(150) NOT NULL;

# для таблицы `_regions`
# Таблица​​_regions
# FIELD       TYPE          NULL  KEY         EXTRA
# id          INT           NO    Primary Key auto_increment
# country_id  INT           NO    Foreign Key _countries (id)
# title       VARCHAR(150)  NO    INDEX
ALTER TABLE `_regions` ALTER `region_id` DROP DEFAULT;
ALTER TABLE `_regions` CHANGE COLUMN `region_id` `id` INT(11) NOT NULL FIRST;
ALTER TABLE `_regions` ADD PRIMARY KEY (`id`);
ALTER TABLE `_regions` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE `_regions` CHANGE COLUMN `country_id` `country_id` INT(11) NOT NULL;
ALTER TABLE `_regions` ADD CONSTRAINT region_country FOREIGN KEY (`country_id`) REFERENCES `_countries` (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `_regions` ADD INDEX (`title_ru`), CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_ua`), CHANGE COLUMN `title_ua` `title_ua` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_be`), CHANGE COLUMN `title_be` `title_be` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_en`), CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_es`), CHANGE COLUMN `title_es` `title_es` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_pt`), CHANGE COLUMN `title_pt` `title_pt` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_de`), CHANGE COLUMN `title_de` `title_de` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_fr`), CHANGE COLUMN `title_fr` `title_fr` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_it`), CHANGE COLUMN `title_it` `title_it` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_pl`), CHANGE COLUMN `title_pl` `title_pl` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_ja`), CHANGE COLUMN `title_ja` `title_ja` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_lt`), CHANGE COLUMN `title_lt` `title_lt` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_lv`), CHANGE COLUMN `title_lv` `title_lv` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title_cz`), CHANGE COLUMN `title_cz` `title_cz` VARCHAR(150) NOT NULL;

# для таблицы `_cities`, в задании нет данных про смену колонок `area_*`
# Таблица​​_cities
# FIELD       TYPE          NULL  KEY           EXTRA
# id          INT           NO    Primary Key   auto_increment
# country_id  INT           NO    Foreign Key   _countries (id)
# important   TINYINT(1)    NO
# region_id   INT           NO    Foreign Key   _regions (id)
# title       VARCHAR(150)  NO    INDEX
ALTER TABLE `_cities` ALTER `city_id` DROP DEFAULT;
ALTER TABLE `_cities` CHANGE COLUMN `city_id` `id` INT(11) NOT NULL FIRST;
ALTER TABLE `_cities` ADD PRIMARY KEY (`id`);
ALTER TABLE `_cities` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE `_cities` CHANGE COLUMN `country_id` `country_id` INT(11) NOT NULL;
ALTER TABLE `_cities` ADD CONSTRAINT city_country FOREIGN KEY (`country_id`) REFERENCES `_countries` (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `_cities` CHANGE COLUMN `region_id` `region_id` INT(11) NOT NULL;
ALTER TABLE `_cities` ADD CONSTRAINT city_region FOREIGN KEY (`region_id`) REFERENCES `_regions` (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `_cities` ADD INDEX (`title_ru`), CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_ua`), CHANGE COLUMN `title_ua` `title_ua` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_be`), CHANGE COLUMN `title_be` `title_be` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_en`), CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_es`), CHANGE COLUMN `title_es` `title_es` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_pt`), CHANGE COLUMN `title_pt` `title_pt` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_de`), CHANGE COLUMN `title_de` `title_de` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_fr`), CHANGE COLUMN `title_fr` `title_fr` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_it`), CHANGE COLUMN `title_it` `title_it` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_pl`), CHANGE COLUMN `title_pl` `title_pl` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_ja`), CHANGE COLUMN `title_ja` `title_ja` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_lt`), CHANGE COLUMN `title_lt` `title_lt` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_lv`), CHANGE COLUMN `title_lv` `title_lv` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title_cz`), CHANGE COLUMN `title_cz` `title_cz` VARCHAR(150) NOT NULL;