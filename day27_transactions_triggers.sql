USE company_db1;

DROP TABLE IF EXISTS transactions_d27;
DROP TABLE IF EXISTS accounts_d27;

CREATE TABLE accounts_d27 (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance INT
);

CREATE TABLE transactions_d27 (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount INT,
    transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO accounts_d27 VALUES
(1,'Khushboo',10000),
(2,'Shivam',8000);

SELECT * FROM accounts_d27;

DELIMITER $$

CREATE TRIGGER before_transfer
BEFORE UPDATE ON accounts_d27
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Balance';
    END IF;
END $$

DELIMITER ;

START TRANSACTION;

UPDATE accounts_d27
SET balance = balance - 2000
WHERE account_id = 1;

UPDATE accounts_d27
SET balance = balance + 2000
WHERE account_id = 2;

INSERT INTO transactions_d27 (from_account, to_account, amount)
VALUES (1, 2, 2000);

COMMIT;

SELECT * FROM accounts_d27;
SELECT * FROM transactions_d27;

START TRANSACTION;

UPDATE accounts_d27
SET balance = balance - 20000
WHERE account_id = 1;

UPDATE accounts_d27
SET balance = balance + 20000
WHERE account_id = 2;

ROLLBACK;

SELECT * FROM accounts_d27;