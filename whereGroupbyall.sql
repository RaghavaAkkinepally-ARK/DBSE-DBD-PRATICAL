

USE bankdb;


SELECT *
FROM bank_transactions
WHERE branch_name = 'Hyderabad';



SELECT *
FROM bank_transactions
ORDER BY amount DESC;


SELECT branch_name, COUNT(*) AS total_transactions
FROM bank_transactions
GROUP BY branch_name;



SELECT branch_name, SUM(amount) AS total_amount
FROM bank_transactions
GROUP BY branch_name
HAVING SUM(amount) > 20000;



SELECT MIN(amount) AS minimum_amount
FROM bank_transactions;


SELECT MAX(amount) AS maximum_amount
FROM bank_transactions;


SELECT COUNT(*) AS total_transactions
FROM bank_transactions;


SELECT SUM(amount) AS total_amount
FROM bank_transactions;


SELECT AVG(amount) AS average_amount
FROM bank_transactions;



SELECT
    MAX(amount) AS maximum_amount,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM bank_transactions;




SELECT customer_name, branch_name
FROM bank_transactions
WHERE branch_name = 'Hyderabad'

UNION

SELECT customer_name, branch_name
FROM bank_transactions
WHERE branch_name = 'Vizag';



SELECT customer_name
FROM bank_transactions
WHERE amount > 5000

INTERSECT

SELECT customer_name
FROM bank_transactions
WHERE txn_typ = 'Deposit';
