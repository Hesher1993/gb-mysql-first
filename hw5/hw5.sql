-- 1. Реализовать практические задания на примере других таблиц и запросов.
-- взял чистую бд городов, без индексов
EXPLAIN SELECT
  ci.title as city_name,
  r.title as region_name,
  co.title as country_name
FROM _cities ci
  JOIN _regions r ON ci.region_id = r.id
  JOIN _countries co ON ci.country_id = co.id;

EXPLAIN SELECT
  r.title as region_name,
  ci.title as city_name
FROM _regions r
  JOIN _cities ci ON r.id = ci.region_id
WHERE r.title = 'Московская область';
-- 2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.

-- 3. Проанализировать несколько запросов с помощью EXPLAIN.
-- завпросы из п.1 с индексами
EXPLAIN SELECT
  ci.title as city_name,
  r.title as region_name,
  co.title as country_name
FROM _cities ci
  JOIN _regions r ON ci.region_id = r.id
  JOIN _countries co ON ci.country_id = co.id;

EXPLAIN SELECT
  r.title as region_name,
  ci.title as city_name
FROM _regions r
  JOIN _cities ci ON r.id = ci.region_id
WHERE r.title = 'Московская область';