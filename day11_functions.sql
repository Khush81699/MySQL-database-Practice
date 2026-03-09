USE company_db1;

DROP TABLE IF EXISTS employees_function;

CREATE TABLE employees_function (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_function (id, name, department, salary) VALUES
(1, 'Khushboo', 'IT', 60000),
(2, 'Shivam', 'HR', 45000),
(3, 'Kumkum', 'IT', 70000),
(4, 'Rahul', 'Finance', 50000),
(5, 'Aman', 'IT', 55000);

SELECT * FROM employees_function;


DELIMITER $$

CREATE FUNCTION get_bonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END $$

DELIMITER ;


SELECT 
name,
salary,
get_bonus(salary) AS bonus
FROM employees_function;


DELIMITER $$

CREATE FUNCTION salary_category(salary INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);

    IF salary >= 60000 THEN
        SET category = 'High Salary';
    ELSE
        SET category = 'Normal Salary';
    END IF;

    RETURN category;
END $$

DELIMITER ;


SELECT 
name,
salary,
salary_category(salary) AS salary_level
FROM employees_function;


SHOW FUNCTION STATUS
WHERE Db = 'company_db1';


DROP FUNCTION IF EXISTS get_bonus;