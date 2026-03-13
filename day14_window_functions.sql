USE company_db1;

DROP TABLE IF EXISTS employees_window;

CREATE TABLE employees_window (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_window VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000);

SELECT * FROM employees_window;


SELECT 
name,
department,
salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees_window;


SELECT 
name,
department,
salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees_window;


SELECT 
name,
department,
salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees_window;


SELECT 
name,
department,
salary,
AVG(salary) OVER (PARTITION BY department) AS department_avg_salary
FROM employees_window;