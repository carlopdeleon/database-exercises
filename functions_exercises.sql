USE employees;

SELECT CONCAT(first_name,' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE '%e';
/* 2. */

SELECT UPPER(CONCAT(first_name,' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE '%e';
/* 3. Upper cased */

SELECT first_name, last_name, datediff(now(), hire_date) AS time_at_company
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%-12-25';
/* 4. */

DESCRIBE salaries;
SELECT MAX(salary) AS big_money, MIN(salary) AS little_money
FROM salaries;
/* 5. */

SELECT CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2),SUBSTR(birth_date, 3, 2)) AS username, first_name, last_name, birth_date
FROM employees;
/* 6. */