USE company_db1;

DROP TABLE IF EXISTS employees_d24;

CREATE TABLE employees_d24 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_d24 VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000),
(8,'Priya','IT',65000);

SELECT * FROM employees_d24;

SELECT *
FROM employees_d24
WHERE department = 'IT';

EXPLAIN
SELECT *
FROM employees_d24
WHERE department = 'IT';

CREATE INDEX idx_dept_d24
ON employees_d24(department);

EXPLAIN
SELECT *
FROM employees_d24
WHERE department = 'IT';

CREATE INDEX idx_dept_salary_d24
ON employees_d24(department, salary);

EXPLAIN
SELECT *
FROM employees_d24
WHERE department = 'IT'
AND salary > 60000;

DROP INDEX idx_dept_d24 ON employees_d24;