USE company_db1;

-- Clean start
DROP TABLE IF EXISTS employees_group;

CREATE TABLE employees_group (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DOUBLE
);

INSERT INTO employees_group VALUES
(1, 'Khushboo', 'IT', 60000),
(2, 'Shivam', 'HR', 45000),
(3, 'Kumkum', 'IT', 70000),
(4, 'Rahul', 'Finance', 50000),
(5, 'Aman', 'IT', 55000),
(6, 'Riya', 'HR', 48000);

SELECT * FROM employees_group;

-- COUNT total employees
SELECT COUNT(*) AS total_employees
FROM employees_group;

-- SUM of all salaries
SELECT SUM(salary) AS total_salary
FROM employees_group;

-- AVG salary
SELECT AVG(salary) AS average_salary
FROM employees_group;

-- Highest salary
SELECT MAX(salary) AS highest_salary
FROM employees_group;

-- Lowest salary
SELECT MIN(salary) AS lowest_salary
FROM employees_group;

-- GROUP BY department
SELECT department, COUNT(*) AS employee_count
FROM employees_group
GROUP BY department;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees_group
GROUP BY department;

-- Departments with average salary > 55000
SELECT department, AVG(salary) AS avg_salary
FROM employees_group
GROUP BY department
HAVING AVG(salary) > 55000;