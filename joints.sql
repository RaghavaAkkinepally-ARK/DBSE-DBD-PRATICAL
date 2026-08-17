

CREATE DATABASE IF NOT EXISTS bankdb;

USE bankdb;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);



INSERT INTO customers VALUES
(1, 'Ravi', 'Hyderabad'),
(2, 'Sita', 'Hyderabad'),
(3, 'Kiran', 'Vijayawada'),
(4, 'Anil', 'Vizag'),
(5, 'Priya', 'Hyderabad'),
(6, 'Rahul', 'Warangal');

INSERT INTO accounts VALUES
(101, 1, 'Savings', 25000),
(102, 2, 'Current', 40000),
(103, 3, 'Savings', 35000),
(104, 4, 'Savings', 50000),
(105, 5, 'Current', 20000);



SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;



SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id;



SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
RIGHT JOIN accounts a
ON c.customer_id = a.customer_id;




SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id

UNION

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
RIGHT JOIN accounts a
ON c.customer_id = a.customer_id;




SELECT
    c.customer_name,
    a.account_type
FROM customers c
CROSS JOIN accounts a;




ALTER TABLE customers
ADD manager_id INT;



UPDATE customers
SET manager_id = 1
WHERE customer_id IN (2, 3);

UPDATE customers
SET manager_id = 2
WHERE customer_id IN (4, 5);

-- SELF JOIN

SELECT
    e.customer_id AS employee_id,
    e.customer_name AS employee,
    m.customer_id AS manager_id,
    m.customer_name AS manager
FROM customers e
LEFT JOIN customers m
ON e.manager_id = m.customer_id;




SELECT
    c.customer_name,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > 30000;

SELECT
    c.customer_name,
    c.city,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance DESC;
