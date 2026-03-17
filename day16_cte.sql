USE company_db1;

DROP TABLE IF EXISTS employees_cte;

CREATE TABLE employees_cte (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_cte VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000);

SELECT * FROM employees_cte;


WITH high_salary_employees AS (
    SELECT name, department, salary
    FROM employees_cte
    WHERE salary > 55000
)
SELECT *
FROM high_salary_employees;


WITH department_average AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees_cte
    GROUP BY department
)
SELECT *
FROM department_average;