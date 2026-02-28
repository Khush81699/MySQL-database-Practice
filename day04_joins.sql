USE company_db1;

-- Remove old tables if exist
DROP TABLE IF EXISTS employees_join;
DROP TABLE IF EXISTS departments_join;

-- Create Departments Table
CREATE TABLE departments_join (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments_join VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Create Employees Table
CREATE TABLE employees_join (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DOUBLE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_join(dept_id)
);

INSERT INTO employees_join VALUES
(1, 'Khushboo', 50000, 1),
(2, 'Shivam', 45000, 2),
(3, 'Kumkum', 60000, 3),
(4, 'Rahul', 40000, NULL);
SELECT employees_join.emp_name, departments_join.dept_name
FROM employees_join
INNER JOIN departments_join
ON employees_join.dept_id = departments_join.dept_id;

SELECT employees_join.emp_name, departments_join.dept_name
FROM employees_join
LEFT JOIN departments_join
ON employees_join.dept_id = departments_join.dept_id;

SELECT employees_join.emp_name, departments_join.dept_name
FROM employees_join
RIGHT JOIN departments_join
ON employees_join.dept_id = departments_join.dept_id;