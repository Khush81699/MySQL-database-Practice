USE company_db1;

DROP TABLE IF EXISTS employees_trigger;
DROP TABLE IF EXISTS employee_log;

CREATE TABLE employees_trigger (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees_trigger
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(employee_id, action_type)
    VALUES (NEW.id, 'INSERT');
END $$

DELIMITER ;


INSERT INTO employees_trigger VALUES
(1,'Khushboo','IT',60000),
(2,'Shivam','HR',45000);


SELECT * FROM employees_trigger;

SELECT * FROM employee_log;


DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees_trigger
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(employee_id, action_type)
    VALUES (OLD.id, 'DELETE');
END $$

DELIMITER ;


DELETE FROM employees_trigger
WHERE id = 2;


SELECT * FROM employee_log;


SHOW TRIGGERS;