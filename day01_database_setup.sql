USE company_dbB;
-- Get employees from IT department
SELECT * FROM employees
WHERE department = 'IT';

-- Get employees with salary greater than 50000
SELECT * FROM employees
WHERE salary > 50000;

-- Get employee with id = 1
SELECT * FROM employees
WHERE id = 1;

-- Update salary of employee with id = 1
UPDATE employees
SET salary = 65000
WHERE id = 1;

-- Verify update
SELECT * FROM employees;

-- Delete employee with id = 3
DELETE FROM employees
WHERE id = 3;

-- Check remaining data
SELECT * FROM employees;

-- Sort employees by salary (low to high)
SELECT * FROM employees
ORDER BY salary ASC;

-- Sort employees by salary (high to low)
SELECT * FROM employees
ORDER BY salary DESC;