USE employees;
SHOW TABLES;
/* 6. I think dept_emp, dept_manager, employees, salaries, and titles have at least one numeric type column */

/* 7. I think all the tables, except salaries, will have a string type column. Salaries is a numeric value. */

/* 8. I think all tables, except departments, will have a date type column. */

DESCRIBE departments;
DESCRIBE employees;
EXPLAIN departments;
EXPLAIN employees;

/* 9. Both departments and employees have a Primary Key. However, I was unable to discern which employee worked in what department. Was expecting the department code be part of the content in the employee tables. */

SHOW CREATE TABLE dept_manager;

CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1