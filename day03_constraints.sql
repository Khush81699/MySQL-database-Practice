USE company_db1;

-- UNIQUE Constraint
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO users VALUES
(1, 'Khushboo', 'khush@gmail.com'),
(2, 'Shivam', 'shivam@gmail.com');

SELECT * FROM users;

-- DEFAULT Constraint
DROP TABLE IF EXISTS employees_day3;

CREATE TABLE employees_day3 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50) DEFAULT 'General'
);

INSERT INTO employees_day3 (id, name)
VALUES (1, 'Kumkum');

INSERT INTO employees_day3 VALUES
(2, 'Rahul', 'IT');

SELECT * FROM employees_day3;

-- CHECK Constraint
DROP TABLE IF EXISTS salary_check;

CREATE TABLE salary_check (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DOUBLE CHECK (salary > 0)
);

INSERT INTO salary_check VALUES
(1, 'Aman', 30000);

SELECT * FROM salary_check;

-- FOREIGN KEY Constraint
DROP TABLE IF EXISTS employees_fk;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

CREATE TABLE employees_fk (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DOUBLE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees_fk VALUES
(1, 'Khushboo', 50000, 1),
(2, 'Shivam', 45000, 2);

SELECT * FROM employees_fk;