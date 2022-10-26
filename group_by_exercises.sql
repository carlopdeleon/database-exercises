USE employees;
DESCRIBE titles;

SELECT DISTINCT title
FROM titles;
-- 2. 7 titles. 

SELECT last_name
FROM `employees`
WHERE last_name LIKE 'E%e'
GROUP BY last_name;
-- 3. 5 last names.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY first_name, last_name;
-- 4. 846 unique first and last name combinations.

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- 5. Chleq, Lindqvist, Qiwen

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- 6. Chleq 189, Lindqvist 190, Qiwen 168

SELECT first_name, COUNT(first_name) AS same_name, gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;
/* 7. Vidya	151	M
Irena	144	M
Irena	97	F
Maya	90	F
Vidya	81	F
Maya	146	M */

SELECT CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2),SUBSTR(birth_date, 3, 2)) AS username, COUNT(*) AS number_unique
FROM employees
GROUP BY username
HAVING number_unique >= 1;
/* 8. Yes, there are duplicate usernames. */

SELECT CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2),SUBSTR(birth_date, 3, 2)) AS username, COUNT(*) AS number_unique
FROM employees
GROUP BY username
HAVING number_unique >= 2;
-- 8.Bonus. 13,251

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
ORDER BY AVG(SALARY) DESC;
-- 9B. 1 bullet

DESCRIBE dept_emp;

SELECT dept_no, count(*) AS current_employees
FROM dept_emp
WHERE to_date LIKE '9999%'
GROUP BY dept_no;
-- 9B. 2 bullet

SELECT emp_no, count(salary) AS number_of_salaries
FROM salaries
GROUP BY emp_no;
-- 9B. 3 bullet

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;
-- 9B. 4 bullet

SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;
-- 9B. 5 bullet 

SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;
-- 9B. 6 bullet

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;
-- 9B. 7 bullet 

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;
-- 9B 8 bullet 