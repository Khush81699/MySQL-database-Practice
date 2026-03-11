USE company_db1;

DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance INT
);

INSERT INTO bank_accounts VALUES
(1,'Khushboo',10000),
(2,'Shivam',8000),
(3,'Kumkum',12000);

SELECT * FROM bank_accounts;


START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 2000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 2000
WHERE account_id = 2;

COMMIT;

SELECT * FROM bank_accounts;


START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_id = 3;

ROLLBACK;

SELECT * FROM bank_accounts;


START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 2;

SAVEPOINT before_update;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 3;

ROLLBACK TO before_update;

COMMIT;

SELECT * FROM bank_accounts;