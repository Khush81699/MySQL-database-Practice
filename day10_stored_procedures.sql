USE company_db1;

DROP TABLE IF EXISTS employees_procedure;
-- Day 10 - Stored Procedures Practice
CREATE TABLE employees_procedure (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_procedure VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000),
(3,'Kumkum','IT',70000),
(4,'Rahul','Finance',50000),
(5,'Aman','IT',55000);

SELECT * FROM employees_procedure;


-- Stored Procedure: Get all employees
DELIMITER $$

CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * FROM employees_procedure;
END $$

DELIMITER ;

CALL get_all_employees();


-- Stored Procedure with parameter
DELIMITER $$

CREATE PROCEDURE get_employees_by_department(IN dept_name VARCHAR(50))
BEGIN
    SELECT * 
    FROM employees_procedure
    WHERE department = dept_name;
END $$

DELIMITER ;

CALL get_employees_by_department('IT');


-- Show stored procedures
SHOW PROCEDURE STATUS
WHERE Db = 'company_db1';


-- Drop procedure example
DROP PROCEDURE IF EXISTS get_all_employees;