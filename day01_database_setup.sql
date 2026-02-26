CREATE DATABASE IF NOT EXISTS company_db1;

USE company_db1;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DOUBLE,
    department VARCHAR(50)
);

INSERT INTO employees (id, name, salary, department) VALUES
(1, 'Khushboo', 50000, 'IT'),
(2, 'Shivam', 45000, 'HR'),
(3, 'Kumkum', 60000, 'Finance');

SELECT * FROM employees;