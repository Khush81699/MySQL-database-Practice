USE company_db1;

DROP TABLE IF EXISTS employees_d23;

CREATE TABLE employees_d23 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_d23 VALUES
(1,'Khushboo',NULL),
(2,'Shivam',1),
(3,'Kumkum',1),
(4,'Rahul',2),
(5,'Aman',2),
(6,'Neha',3);

SELECT * FROM employees_d23;

WITH RECURSIVE employee_hierarchy AS (
    SELECT id, name, manager_id, 1 AS level
    FROM employees_d23
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.name, e.manager_id, eh.level + 1
    FROM employees_d23 e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.id
)
SELECT * FROM employee_hierarchy;

WITH RECURSIVE path_hierarchy AS (
    SELECT id, name, manager_id, CAST(name AS CHAR(100)) AS path
    FROM employees_d23
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.name, e.manager_id,
           CONCAT(ph.path, ' -> ', e.name)
    FROM employees_d23 e
    JOIN path_hierarchy ph
    ON e.manager_id = ph.id
)
SELECT * FROM path_hierarchy;