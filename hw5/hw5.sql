-- 1. Реализовать практические задания на примере других таблиц и запросов.
USE geodata;
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
USE employees;
SET AUTOCOMMIT = 0;
START TRANSACTION;
INSERT INTO
  employees (emp_no, first_name, last_name, gender, birth_date, hire_date)
VALUES ('500000','Ivan', 'Ivanov', 'M', '1970-10-10', '2018-04-30');
INSERT INTO
  salaries
  SET
    emp_no = '500000',
    salary = 10000,
    from_date = NOW(),
    to_date = '9999-01-01';
COMMIT;
SET AUTOCOMMIT = 1;
-- 3. Проанализировать несколько запросов с помощью EXPLAIN.
USE geodata;
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