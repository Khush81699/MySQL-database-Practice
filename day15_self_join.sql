USE company_db1;

DROP TABLE IF EXISTS employees_self;

CREATE TABLE employees_self (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_self VALUES
(1,'Khushboo',NULL),
(2,'Shivam',1),
(3,'Kumkum',1),
(4,'Rahul',2),
(5,'Aman',2);

SELECT * FROM employees_self;


SELECT 
e.name AS employee,
m.name AS manager
FROM employees_self e
LEFT JOIN employees_self m
ON e.manager_id = m.id;


SELECT 
e.name AS employee,
m.name AS manager
FROM employees_self e
INNER JOIN employees_self m
ON e.manager_id = m.id;