USE company_db1;

DROP TABLE IF EXISTS employees_temp;

CREATE TABLE employees_temp (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_temp VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000);

SELECT * FROM employees_temp;


CREATE TEMPORARY TABLE high_salary_temp AS
SELECT *
FROM employees_temp
WHERE salary > 55000;


SELECT * FROM high_salary_temp;


DROP TEMPORARY TABLE high_salary_temp;