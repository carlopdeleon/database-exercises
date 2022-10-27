
/* JOIN EXAMPLE EXERCISES */

USE join_example_db;

-- 1. Join Example Databse
SELECT * 
FROM users;

SELECT * 
FROM roles;

-- 2. 
SELECT * 
FROM users
JOIN roles
ON users.role_id = roles.id; -- Inner Join

SELECT * 
FROM users
LEFT JOIN roles
ON users.role_id = roles.id; -- Left Join

SELECT * 
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id; -- Right Join

-- 3. 
SELECT roles.name, count(*) AS employed
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id
GROUP BY roles.name;
/* Why is there a commenter? 
admin	1
author	1
reviewer	2
commenter	1 */

/* Employees Database */
-- 1. 
USE employees;

-- 2. 
SELECT departments.dept_name, employees.first_name, employees.last_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 3. 
SELECT departments.dept_name, employees.first_name, employees.last_name, employees.gender, dept_manager.to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE employees.gender = 'F' 
	AND dept_manager.to_date LIKE '9999%';

-- 4. 

SELECT departments.dept_name, titles.title, COUNT(*)
FROM departments
JOIN dept_emp USING (dept_no)
JOIN employees ON dept_emp.emp_no = employees.`emp_no`
JOIN titles ON employees.emp_no = titles.emp_no
WHERE dept_emp.to_date LIKE '9999%'AND titles.to_date LIKE '9999%' 
	AND dept_name = 'Customer Service'
GROUP BY titles.title;
	
-- 5. 

SELECT departments.dept_name, employees.first_name, employees.last_name, manager.to_date, salaries.salary
FROM departments
JOIN dept_manager AS manager USING (dept_no)
JOIN employees ON manager.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE manager.to_date LIKE '9999%' and salaries.to_date LIKE '9999%';

-- 6. 

SELECT departments.dept_no, departments.dept_name, COUNT(*)
FROM departments
JOIN dept_emp USING (dept_no)
WHERE to_date LIKE '9999%' 
GROUP BY dept_name;

-- 7.

SELECT departments.dept_name, AVG(salary)
FROM departments
JOIN dept_emp USING (dept_no)
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
GROUP BY dept_name
ORDER BY AVG(salary) DESC
LIMIT 1;

-- 8. 

SELECT employees.first_name, employees.last_name, salaries.salary
FROM departments
JOIN dept_emp USING (dept_no)
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date LIKE '9999%'
	AND dept_name = 'Marketing'
ORDER BY salaries.salary DESC
LIMIT 1;

-- 9. 

SELECT employees.first_name, employees.last_name, salaries.salary, departments.dept_name
FROM departments
JOIN dept_emp USING (dept_no)
JOIN dept_manager ON dept_emp.emp_no = dept_manager.emp_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date LIKE '9999%' and salaries.to_date LIKE '9999%'
	AND dept_manager.to_date LIKE '9999%'
ORDER BY salaries.salary DESC
LIMIT 1;

-- 10. 

SELECT departments.dept_name, ROUND(AVG(salaries.salary),0) AS average_salary
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY departments.dept_name
ORDER BY ROUND(AVG(salaries.salary),0) DESC;










