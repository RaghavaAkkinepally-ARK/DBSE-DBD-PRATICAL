

CREATE DATABASE IF NOT EXISTS bankdb;

USE bankdb;



CREATE TABLE IF NOT EXISTS bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    txn_typ VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);



INSERT IGNORE INTO bank_transactions VALUES
(101, 'Ravi', 'Hyderabad', 'Deposit', 5000, '2024-01-05'),
(102, 'Sita', 'Hyderabad', 'Withdrawal', 2000, '2024-01-06'),
(103, 'Kiran', 'Vijayawada', 'Deposit', 12000, '2024-01-08'),
(104, 'Anil', 'Vizag', 'Deposit', 8000, '2024-01-10'),
(105, 'Priya', 'Hyderabad', 'Withdrawal', 3500, '2024-01-11'),
(106, 'Ramesh', 'Vizag', 'Deposit', 15000, '2024-01-12'),
(107, 'Keerthi', 'Vijayawada', 'Withdrawal', 1000, '2024-01-13'),
(108, 'Rahul', 'Hyderabad', 'Deposit', 9000, '2024-01-14'),
(109, 'Sneha', 'Vizag', 'Withdrawal', 4000, '2024-01-15'),
(110, 'Madhu', 'Vijayawada', 'Deposit', 11000, '2024-01-16');


]

DELIMITER //

CREATE PROCEDURE GetAllTransactions()
BEGIN
    SELECT *
    FROM bank_transactions;
END //

DELIMITER ;



CALL GetAllTransactions();




DELIMITER //

CREATE PROCEDURE GetBranchTransactions(
    IN branch VARCHAR(50)
)
BEGIN
    SELECT *
    FROM bank_transactions
    WHERE branch_name = branch;
END //

DELIMITER ;


CALL GetBranchTransactions('Hyderabad');


DELIMITER //

CREATE PROCEDURE GetTotalAmount(
    OUT total DECIMAL(10,2)
)
BEGIN
    SELECT SUM(amount)
    INTO total
    FROM bank_transactions;
END //

DELIMITER ;

-- Execute procedure

CALL GetTotalAmount(@total);

SELECT @total AS Total_Transaction_Amount;




CREATE TABLE transaction_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    txn_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




DELIMITER //

CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON bank_transactions
FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction amount cannot be negative';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON bank_transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit
    (txn_id, action_type)
    VALUES
    (NEW.txn_id, 'INSERT');
END //

DELIMITER ;




INSERT INTO bank_transactions
VALUES
(111, 'Arjun', 'Hyderabad', 'Deposit', 7000, '2024-01-20');



SELECT * FROM transaction_audit;




DELIMITER //

CREATE TRIGGER after_transaction_update
AFTER UPDATE ON bank_transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit
    (txn_id, action_type)
    VALUES
    (NEW.txn_id, 'UPDATE');
END //

DELIMITER ;




UPDATE bank_transactions
SET amount = 7500
WHERE txn_id = 111;



SELECT * FROM transaction_audit;




DELIMITER //

CREATE TRIGGER after_transaction_delete
AFTER DELETE ON bank_transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit
    (txn_id, action_type)
    VALUES
    (OLD.txn_id, 'DELETE');
END //

DELIMITER ;



DELETE FROM bank_transactions
WHERE txn_id = 111;


SELECT * FROM transaction_audit;




SELECT *
FROM transaction_audit
ORDER BY audit_id;
