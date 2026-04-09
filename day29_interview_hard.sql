USE company_db1;

DROP TABLE IF EXISTS employees_d29;

CREATE TABLE employees_d29 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_d29 VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000),
(8,'Priya','IT',65000);

SELECT * FROM employees_d29;

SELECT *
FROM (
    SELECT name, salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees_d29
) t
WHERE rnk = 2;

SELECT department, COUNT(*) AS total_employees
FROM employees_d29
GROUP BY department
HAVING COUNT(*) > 1;

SELECT name, department, salary
FROM employees_d29 e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_d29
    WHERE department = e.department
);

SELECT *
FROM employees_d29 e1
WHERE salary > (
    SELECT MIN(salary)
    FROM employees_d29 e2
    WHERE e1.department = e2.department
);

SELECT department, MAX(salary) AS highest_salary
FROM employees_d29
GROUP BY department;

SELECT name, salary
FROM employees_d29
ORDER BY salary DESC
LIMIT 3;

SELECT name
FROM employees_d29
WHERE name LIKE '%a';

SELECT department, AVG(salary) AS avg_salary
FROM employees_d29
GROUP BY department;

SELECT name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees_d29;

SELECT department, SUM(salary) AS total_salary
FROM employees_d29
GROUP BY department;