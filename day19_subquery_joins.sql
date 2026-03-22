USE company_db1;

DROP TABLE IF EXISTS employees_d19;
DROP TABLE IF EXISTS departments_d19;

CREATE TABLE departments_d19 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees_d19 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_d19(dept_id)
);

INSERT INTO departments_d19 VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

INSERT INTO employees_d19 VALUES
(1,'Khushboo',60000,1),
(2,'Shivam',45000,2),
(3,'Kumkum',70000,1),
(4,'Rahul',50000,3),
(5,'Aman',55000,1),
(6,'Neha',48000,2);

SELECT * FROM employees_d19;
SELECT * FROM departments_d19;


-- Employees earning above overall average salary
SELECT name, salary
FROM employees_d19
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_d19
);


-- Join employees with departments
SELECT e.name, e.salary, d.dept_name
FROM employees_d19 e
JOIN departments_d19 d
ON e.dept_id = d.dept_id;


-- Employees earning above department average (correlated subquery)
SELECT e.name, e.salary, d.dept_name
FROM employees_d19 e
JOIN departments_d19 d
ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees_d19
    WHERE dept_id = e.dept_id
);


-- Highest salary employee in each department
SELECT e.name, e.salary, d.dept_name
FROM employees_d19 e
JOIN departments_d19 d
ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees_d19
    WHERE dept_id = e.dept_id
);