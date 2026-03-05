USE company_db1;

DROP TABLE IF EXISTS employees_view;

CREATE TABLE employees_view (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_view VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000);

SELECT * FROM employees_view;


-- Create a view for IT department employees
CREATE VIEW it_employees AS
SELECT name, salary
FROM employees_view
WHERE department = 'IT';


-- Use the view
SELECT * FROM it_employees;


-- Create another view for high salary employees
CREATE VIEW high_salary_employees AS
SELECT name, department, salary
FROM employees_view
WHERE salary > 55000;


SELECT * FROM high_salary_employees;


-- Show all views
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


-- Drop view example
DROP VIEW high_salary_employees;