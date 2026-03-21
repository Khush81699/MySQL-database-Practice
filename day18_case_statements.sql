USE company_db1;

DROP TABLE IF EXISTS employees_case;

CREATE TABLE employees_case (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_case VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Neha','HR',48000),
(7,'Arjun','Finance',52000);

SELECT * FROM employees_case;


-- Categorize salary using CASE
SELECT 
name,
salary,
CASE 
    WHEN salary >= 65000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees_case;


-- Department-wise bonus calculation
SELECT 
name,
department,
salary,
CASE 
    WHEN department = 'IT' THEN salary * 0.10
    WHEN department = 'HR' THEN salary * 0.08
    ELSE salary * 0.05
END AS bonus
FROM employees_case;


-- Conditional filtering using CASE
SELECT *
FROM employees_case
WHERE 
CASE 
    WHEN department = 'IT' THEN salary > 55000
    ELSE salary > 45000
END;