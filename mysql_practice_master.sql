CREATE DATABASE IF NOT EXISTS company_dbB;
USE company_dbB;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DOUBLE,
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Khushboo', 50000, 'IT'),
(2, 'Shivam', 45000, 'HR'),
(3, 'Kumkum', 60000, 'Finance');

SELECT * FROM employees;