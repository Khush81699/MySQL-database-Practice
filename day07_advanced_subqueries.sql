USE company_db1;

DROP TABLE IF EXISTS employees_day7;

CREATE TABLE employees_day7 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_day7 VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000),
(6,'Riya','HR',48000);

SELECT * FROM employees_day7;


-- IN Operator with Subquery
-- Find employees working in departments where salary > 55000

SELECT name, department
FROM employees_day7
WHERE department IN (
    SELECT department
    FROM employees_day7
    WHERE salary > 55000
);


-- EXISTS Operator
-- Find employees if department exists with salary > 65000

SELECT name, department
FROM employees_day7 e
WHERE EXISTS (
    SELECT *
    FROM employees_day7
    WHERE salary > 65000
    AND department = e.department
);


-- ANY Operator
-- Find employees whose salary is greater than ANY salary in HR

SELECT name, salary
FROM employees_day7
WHERE salary > ANY (
    SELECT salary
    FROM employees_day7
    WHERE department = 'HR'
);


-- ALL Operator
-- Find employees whose salary is greater than ALL salaries in HR

SELECT name, salary
FROM employees_day7
WHERE salary > ALL (
    SELECT salary
    FROM employees_day7
    WHERE department = 'HR'
);