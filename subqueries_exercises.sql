
/* Subquery Exercises */

USE employees;
-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT CONCAT(first_name, ' ', last_name)
from employees
WHERE emp_no IN 
			(SELECT emp_no FROM dept_emp WHERE to_date > CURDATE()) 
AND hire_date IN 
	 			(SELECT hire_date FROM employees WHERE emp_no = '101010');
/* sub-queried two times. First to find current employees. Second by hire date
   to equal employee 101010. */
					
					

-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT DISTINCT title
FROM (
      SELECT emp_no
      FROM employees
      WHERE first_name = 'Aamod'	
     ) as z
JOIN titles ON z.emp_no = titles.emp_no
WHERE to_date > CURDATE();
/* Table Subqueried to specify emp_no to Aamod, then in a WHERE clause, I put a curdate. */


-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
    

SELECT COUNT(*)
FROM 
	(SELECT emp_no FROM dept_emp WHERE to_date < CURDATE()) AS z
JOIN employees ON z.emp_no = employees.emp_no;

-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT CONCAT(first_name, ' ', last_name) as fullname
FROM 
	(SELECT emp_no FROM dept_manager WHERE to_date > CURDATE()) as z
JOIN employees ON z.emp_no = employees.emp_no
WHERE gender = 'f';
/* Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil */

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT DISTINCT CONCAT(first_name,' ',last_name), salary
FROM 
	(SELECT emp_no, AVG(salary) as average_salary from salaries GROUP BY emp_no) as z
JOIN employees ON z.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salary > average_salary and to_date > CURDATE();


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


SELECT count(*)
FROM salaries
WHERE salary BETWEEN (SELECT (MAX(salary) - STD(salary)) FROM salaries)
AND 
	(SELECT  (MAX(salary) + STD(salary)) FROM salaries)
AND salaries.to_date > CURDATE();

-- SOLUTION from class review ^^^. 


SELECT first_name, last_name, MAX(salary), COUNT(*)
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salary BETWEEN (MAX(salary) + STD(salary))
	AND salary BETWEEN (MAX(salary) - STD(salary))
;
	


