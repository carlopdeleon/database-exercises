
/* CASE EXERCISES */

USE employees;

-- 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT CONCAT(first_name,' ', last_name) AS Fullname, dept_no, hire_date, to_date, IF(to_date > NOW(), TRUE, FALSE) AS Employed
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no);

-- come back and use CASE statements to see if I can filter down more.


-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name,
	CASE
		WHEN LEFT(first_name, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
		WHEN LEFT(first_name, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
		WHEN LEFT(first_name, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
	END AS alpha_group
FROM employees
ORDER BY first_name;

-- 3. How many employees (current or previous) were born in each decade?

SELECT birth_date FROM employees ORDER BY birth_date DESC;
-- checking bday range.


SELECT birth_date,
		COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s' 			END) AS 50s, 				
		COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s' 			END) AS 60s
FROM employees
GROUP BY birth_date; 
-- Query that adds the bdays in 50s and 60s. Will use it in a subquery.




SELECT SUM(50s) as born_in_50s, SUM(60s) as born_in_60s
FROM
 	(SELECT birth_date, 
		COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s' 			END) AS 50s, 				
		COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s' 			END) AS 60s
	FROM employees
	GROUP BY birth_date) as z; -- SUM'd the counts inside the sub-query
	
-- 4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

select dept_name from departments;



SELECT dept_name, 
	CASE WHEN dept_name IN ('research', 'development') THEN R&D
	CASE WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
	CASE WHEN dept_name IN ('Producton', 'Quality Management') THEN 'Prod & QM'
	CASE WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
	CASE WHEN dept_name IN ('Customer Service') THEN 'Customer Service'

		
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no;



SELECT 
	CASE
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
		WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
		WHEN dept_name IN ('Producton', 'Quality Management') THEN 'Prod & QM'
		WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
		WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
	END as 'new_dept', round(avg(salary),2) as mean_salary
FROM departments
JOIN dept_emp as de USING(dept_no)
JOIN salaries as s USING (emp_no)
WHERE de.to_date > NOW()
 AND s.to_date > NOW()
GROUP BY new_dept
;
-- Class review solution ^^^^^
	

	

	

