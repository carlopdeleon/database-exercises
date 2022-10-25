USE employees;
DESCRIBE employees;

SELECT emp_no,first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya');
-- 2. 709 records returned.

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
/* 3. Yes, same amount of records as question 2. */

SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M'
AND first_name = 'Irena' OR 'Vidya' OR 'Maya';
/* 4. 144 records returned. */

SELECT emp_no, last_name 
FROM employees
WHERE last_name LIKE '%';
/* 5. 7330 employees last name start with an E. */

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT count(last_name)
FROM employees
WHERE last_name LIKE '%E';
/* 6. 30723 employees have names that start with or end with an E. Out of the total, 24292 of the last names end with an E. */

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE 'E%e';

SELECT last_name
FROM employees
WHERE last_name LIKE '%e';
/* 7. 899 employees last names start and end with an E. If the name does not start with an E, but ends with an E, then there would be a total of 24292 last names. */


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%';
/* 8. 135214 employees were hired in the 90s. */

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';
/* 9. 842 employees were born on Chirstmas. */

SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25'
	AND hire_date LIKE '199%';
/* 10. 362 employees were born on Christmas and hired in the 90s. */

SELECT emp_no,last_name
FROM employees
WHERE last_name LIKE 'Q%' 
	OR last_name LIKE '%q%'
	 OR last_name LIKE '%q';
/* 11. 1873 employees have a Q in their last name. */

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
/* 12. 547 last names found that have Q, but not QU. */











