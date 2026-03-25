USE company_db1;

DROP TABLE IF EXISTS employees_d20;

CREATE TABLE employees_d20 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_d20 VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000);

SELECT * FROM employees_d20;

CREATE VIEW employee_public_view AS
SELECT id, name, department
FROM employees_d20;

SELECT * FROM employee_public_view;

CREATE VIEW high_salary_view AS
SELECT name, department, salary
FROM employees_d20
WHERE salary > 55000;

SELECT * FROM high_salary_view;

CREATE VIEW it_department_view AS
SELECT name, salary
FROM employees_d20
WHERE department = 'IT';

SELECT * FROM it_department_view;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

DROP VIEW IF EXISTS high_salary_view;