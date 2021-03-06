USE `geodata`;

# для таблицы `_cities`, в задании нет данных про смену колонок `area_*`
# Таблица​​_cities
# FIELD       TYPE          NULL  KEY           EXTRA
# id          INT           NO    Primary Key   auto_increment
# country_id  INT           NO    Foreign Key   _countries (id)
# important   TINYINT(1)    NO
# region_id   INT           NO    Foreign Key   _regions (id)
# title       VARCHAR(150)  NO    INDEX

ALTER TABLE `_cities`
  DROP COLUMN `area_ru`,
  DROP COLUMN `region_ru`,
  DROP COLUMN `title_ua`,
  DROP COLUMN `area_ua`,
  DROP COLUMN `region_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `area_be`,
  DROP COLUMN `region_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `area_en`,
  DROP COLUMN `region_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `area_es`,
  DROP COLUMN `region_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `area_pt`,
  DROP COLUMN `region_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `area_de`,
  DROP COLUMN `region_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `area_fr`,
  DROP COLUMN `region_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `area_it`,
  DROP COLUMN `region_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `area_pl`,
  DROP COLUMN `region_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `area_ja`,
  DROP COLUMN `region_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `area_lt`,
  DROP COLUMN `region_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `area_lv`,
  DROP COLUMN `region_lv`,
  DROP COLUMN `title_cz`,
  DROP COLUMN `area_cz`,
  DROP COLUMN `region_cz`;

ALTER TABLE `_regions`
  DROP COLUMN `title_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `title_cz`;

ALTER TABLE `_countries`
  DROP COLUMN `title_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `title_cz`;


ALTER TABLE `_cities` ALTER `title_ru` DROP DEFAULT;
ALTER TABLE `_cities` CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX (`title`);

ALTER TABLE `_regions` ALTER `title_ru` DROP DEFAULT;
ALTER TABLE `_regions` CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL;
ALTER TABLE `_regions` ADD INDEX (`title`);

ALTER TABLE `_countries` ALTER `title_ru` DROP DEFAULT;
ALTER TABLE `_countries` CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` ADD INDEX (`title`);


ALTER TABLE `_cities` ALTER `city_id` DROP DEFAULT;
ALTER TABLE `_cities` CHANGE COLUMN `city_id` `id` INT(11) NOT NULL;
ALTER TABLE `_cities` ADD PRIMARY KEY (`id`);
ALTER TABLE `_cities` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `_regions` ALTER `region_id` DROP DEFAULT;
ALTER TABLE `_regions` CHANGE COLUMN `region_id` `id` INT(11) NOT NULL;
ALTER TABLE `_regions` ADD PRIMARY KEY (`id`);
ALTER TABLE `_regions` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `_countries` ALTER `country_id` DROP DEFAULT;
ALTER TABLE `_countries` CHANGE COLUMN `country_id` `id` INT(11) NOT NULL;
ALTER TABLE `_countries` ADD PRIMARY KEY (`id`);
ALTER TABLE `_countries` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `_cities` CHANGE COLUMN `country_id` `country_id` INT(11) NOT NULL;
ALTER TABLE `_cities` ADD CONSTRAINT city_country FOREIGN KEY (`country_id`) REFERENCES `_countries` (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `_cities` CHANGE COLUMN `region_id` `region_id` INT(11) NOT NULL;
ALTER TABLE `_cities` ADD CONSTRAINT city_region FOREIGN KEY (`region_id`) REFERENCES `_regions` (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `_regions` CHANGE COLUMN `country_id` `country_id` INT(11) NOT NULL;
ALTER TABLE `_regions` ADD CONSTRAINT region_country FOREIGN KEY (`country_id`) REFERENCES `_countries` (id) ON DELETE CASCADE ON UPDATE CASCADE;
