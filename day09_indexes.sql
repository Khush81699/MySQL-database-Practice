USE company_db1;

DROP TABLE IF EXISTS employees_index;

CREATE TABLE employees_index (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_index (id, name, department, salary) VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Riya','HR',48000),
(7,'Arjun','Finance',52000),
(8,'Neha','IT',65000);

SELECT * FROM employees_index;

-- Create index on department column
CREATE INDEX idx_department
ON employees_index(department);

-- Query using indexed column
SELECT *
FROM employees_index
WHERE department = 'IT';

-- Create composite index
CREATE INDEX idx_dept_salary
ON employees_index(department, salary);

-- Query using composite index
SELECT *
FROM employees_index
WHERE department = 'IT'
AND salary > 60000;

-- Show indexes in table
SHOW INDEX FROM employees_index;

-- Drop index example
DROP INDEX idx_department ON employees_index;