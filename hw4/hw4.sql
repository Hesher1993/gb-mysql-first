-- 1. Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3.
USE 'geodata';
-- все данные о городе – регион, страна.
CREATE VIEW view_about_cities
AS SELECT
  ci.title as city_name,
  r.title as region_name,
  co.title as country_name
FROM _cities ci
  JOIN _regions r ON ci.region_id = r.id
JOIN _countries co ON ci.country_id = co.id
LIMIT 10;
-- все города из Московской области.
CREATE VIEW view_region_moscow
AS SELECT r.title as region_name, ci.title as city_name
FROM _regions r
JOIN _cities ci ON r.id = ci.region_id
WHERE r.title = 'Московская область'
LIMIT 5;

USE 'employees';
-- средняя зарплату по отделам.
CREATE VIEW view_avg_salary_dept
AS SELECT
  dp.dept_name as dept_name,
  AVG(s.salary) as avg_salary
FROM departments dp
  JOIN dept_emp de ON dp.dept_no = de.dept_no
  JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY dp.dept_name;
-- Максимальная зарплата у одного сотрудника
CREATE VIEW view_max_salary_emp
AS SELECT
  e.emp_no,
  CONCAT(e.first_name, ' ', e.last_name) as name,
  MAX(s.salary) as max_salary
FROM employees e
  JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no
ORDER BY max_salary DESC
LIMIT 1;
-- количество сотрудников во всех отделах.
CREATE VIEW view_count_emp_dept
AS SELECT
  dp.dept_name,
  COUNT(de.emp_no) as count
FROM departments dp
  JOIN dept_emp de
    ON de.dept_no = dp.dept_no
    AND de.to_date > NOW()
GROUP BY dp.dept_no;
-- количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
CREATE VIEW view_count_emp_salary_dept
AS SELECT
  dp.dept_name,
  COUNT(de.emp_no) as count,
  SUM(s.salary) as sum_salary
FROM departments dp
  JOIN dept_emp de
    ON de.dept_no = dp.dept_no
    AND de.to_date > NOW()
  JOIN salaries s
    ON de.emp_no = s.emp_no
    AND s.to_date > NOW()
GROUP BY dp.dept_name;
---------------------------------------------------
-- 2. Создать функцию, которая найдет менеджера по имени и фамилии.

---------------------------------------------------
-- 3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус в таблицу salary.
