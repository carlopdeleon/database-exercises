
/* TEMPORARY TABLE EXERCISES */

USE noether_2021;


DROP TABLE IF EXISTS employees_with_departments;
-- 1. 

CREATE TEMPORARY TABLE employees_with_departments (first_name VARCHAR(14) NOT NULL, last_name VARCHAR(16), dept_name VARCHAR(20) NOT NULL) AS 
	(
	SELECT first_name, last_name,dept_name
	FROM employees.departments
	JOIN employees.dept_emp USING (dept_no)
	JOIN employees.employees USING (emp_no)
	WHERE employees.dept_emp.to_date > NOW()
	);

SELECT * FROM employees_with_departments;

-- 1a. 
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

-- 1b.
UPDATE employees_with_departments SET full_name = CONCAT(first_name,' ', last_name);
SELECT * FROM employees_with_departments;

-- 1c. 

ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;
SELECT * FROM employees_with_departments;

-- 1d. when building the table, instead of doing first_name and last_name fields, I could of just done it in the subquery as a CONCAT with an alias.


-- 2. Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

DROP TABLE IF EXISTS sakila_payment;

CREATE TEMPORARY TABLE sakila_payment AS 
	(
	SELECT payment_id, customer_id, payment_date, amount
	FROM sakila.payment
	 ); 
	 
SELECT * FROM sakila_payment;

UPDATE TABLE sakila_payment SET amount = amount * 100;
ALTER TABLE sakila_payment MODIFY COLUMN amount INT;


SELECT CAST(amount * 100 AS UNSIGNED) AS cents
FROM sakila_payment;
-- CLASSROOM SOLUTION ^^^

/* COME BACK AND TRY A DIFFERENT WAY */

-- 3. 

SELECT * FROM employees_with_departments;

DROP TABLE IF EXISTS employees_with_departments;

CREATE TEMPORARY TABLE employees_with_departments (first_name VARCHAR(14) NOT NULL, last_name VARCHAR(16), dept_name VARCHAR(20) NOT NULL) AS 
	(
	SELECT emp_no, first_name, last_name,dept_name, salary
	FROM employees.departments
	JOIN employees.dept_emp USING (dept_no)
	JOIN employees.employees USING (emp_no)
	JOIN employees.salaries USING (emp_no)
	WHERE employees.dept_emp.to_date > NOW()
	);


DROP TABLE IF EXISTS zscoretable;

CREATE TEMPORARY TABLE zscoretable AS 
	(
	 SELECT emp_no, salary, (salary - (SELECT AVG(salary) FROM employees.salaries))
	 /
	 (SELECT STD(salary) FROM employees.salaries) AS zscore
	 FROM employees.salaries
	 );
	
SELECT first_name, last_name, (AVG(x.salary) - zscore) as less_than, (AVG(x.salary) + zscore) as more_than
FROM employees_with_dpeartments as x
JOIN zscoretable ON x.emp_no = zscoretable.emp_no
WHERE to_date > NOW()

-- Maybe create multiple temp tables with aggregates, then add it to a main temp table to show differences... 



 


