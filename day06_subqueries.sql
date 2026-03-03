USE company_db1;

DROP TABLE IF EXISTS employees_sub;

CREATE TABLE employees_sub (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DOUBLE
);

INSERT INTO employees_sub VALUES
(1, 'Khushboo', 'IT', 60000),
(2, 'Shivam', 'HR', 45000),
(3, 'Kumkum', 'IT', 70000),
(4, 'Rahul', 'Finance', 50000),
(5, 'Aman', 'IT', 55000);

-- Find employee with highest salary
SELECT *
FROM employees_sub
WHERE salary = (
    SELECT MAX(salary)
    FROM employees_sub
);

-- Employees earning more than average salary
SELECT *
FROM employees_sub
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_sub
);

-- Employees working in same department as 'Khushboo'
SELECT *
FROM employees_sub
WHERE department = (
    SELECT department
    FROM employees_sub
    WHERE name = 'Khushboo'
);