USE company_db1;

DROP TABLE IF EXISTS employees_d21;

CREATE TABLE employees_d21 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_d21 VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000);

SELECT * FROM employees_d21;


-- 1. Second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees_d21
WHERE salary < (
    SELECT MAX(salary)
    FROM employees_d21
);


-- 2. Nth highest salary (example: 3rd highest)
SELECT DISTINCT salary
FROM employees_d21
ORDER BY salary DESC
LIMIT 1 OFFSET 2;


-- 3. Employees with salary above department average
SELECT name, department, salary
FROM employees_d21 e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_d21
    WHERE department = e.department
);


-- 4. Count employees in each department
SELECT department, COUNT(*) AS total_employees
FROM employees_d21
GROUP BY department;


-- 5. Highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM employees_d21
GROUP BY department;


-- 6. Duplicate salaries
SELECT salary, COUNT(*)
FROM employees_d21
GROUP BY salary
HAVING COUNT(*) > 1;


-- 7. Employees whose name starts with 'K'
SELECT *
FROM employees_d21
WHERE name LIKE 'K%';


-- 8. Employees sorted by salary descending
SELECT *
FROM employees_d21
ORDER BY salary DESC;