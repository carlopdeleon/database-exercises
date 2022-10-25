USE employees;

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;
/* 2. First Row = Irena Reutenauer. Last row = Vidya Simmen */

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name, last_name;
/* 3. Irena Acton, Vidya Zweizig */

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY last_name, first_name;
/* 4. Irena Acton, Maya Zyda */

SELECT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY emp_no;
/* 5. 898 employees, 10021 Ramzi Erde, 499648 Tadahiro Erde */


SELECT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC;
/* 6. 899 employees, Teiji Eldridge, Sergi Erde */

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
/* 362 employees, Khun Bernini, Douadi Pettis */















