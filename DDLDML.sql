
CREATE DATABASE bankdb;

USE bankdb;



CREATE TABLE bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    txn_typ VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);


DESC bank_transactions;



INSERT INTO bank_transactions VALUES
(101,'Ravi','Hyderabad','Deposit',5000,'2024-01-05'),
(102,'Sita','Hyderabad','Withdrawal',2000,'2024-01-06'),
(103,'Kiran','Vijayawada','Deposit',12000,'2024-01-08'),
(104,'Anil','Vizag','Deposit',8000,'2024-01-10'),
(105,'Priya','Hyderabad','Withdrawal',3500,'2024-01-11'),
(106,'Ramesh','Vizag','Deposit',15000,'2024-01-12'),
(107,'Keerthi','Vijayawada','Withdrawal',1000,'2024-01-13'),
(108,'Rahul','Hyderabad','Deposit',9000,'2024-01-14'),
(109,'Sneha','Vizag','Withdrawal',4000,'2024-01-15'),
(110,'Madhu','Vijayawada','Deposit',11000,'2024-01-16');


SELECT * FROM bank_transactions;


UPDATE bank_transactions
SET amount = 5500
WHERE txn_id = 101;

DELETE FROM bank_transactions
WHERE txn_id = 110;



ALTER TABLE bank_transactions
ADD COLUMN account_type VARCHAR(20);


UPDATE bank_transactions
SET account_type = 'Savings';

ALTER TABLE bank_transactions
MODIFY customer_name VARCHAR(100);

ALTER TABLE bank_transactions
RENAME COLUMN txn_typ TO transaction_type;

