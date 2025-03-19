-- 1: Insert 10 sample records into the Customers, Accounts, and Transactions tables

-- Inserting 10 sample records into the Customers table
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'Arun', 'Reddy', '1990-05-10', 'arun.reddy@example.com', '9876543210', 'No. 12, Anna Nagar, Chennai, India'),
(2, 'Priya', 'Nair', '1985-11-15', 'priya.nair@example.com', '9876543211', 'No. 45, MG Road, Bangalore, India'),
(3, 'Kumar', 'Sundar', '1992-01-22', 'kumar.sundar@example.com', '9876543212', 'No. 89, T Nagar, Chennai, India'),
(4, 'Divya', 'Krishna', '1991-03-18', 'divya.krishna@example.com', '9876543213', 'No. 22, Mylapore, Chennai, India'),
(5, 'Rajesh', 'Kumar', '1988-08-30', 'rajesh.kumar@example.com', '9876543214', 'No. 33, BTM Layout, Bangalore, India'),
(6, 'Meera', 'Ravichandran', '1995-02-10', 'meera.ravi@example.com', '9876543215', 'No. 11, Coimbatore, India'),
(7, 'Suresh', 'Babu', '1987-04-04', 'suresh.babu@example.com', '9876543216', 'No. 99, Saravanampatti, Coimbatore, India'),
(8, 'Neha', 'Verma', '1993-09-27', 'neha.verma@example.com', '9876543217', 'No. 44, Koramangala, Bangalore, India'),
(9, 'Vijay', 'Sharma', '1990-07-14', 'vijay.sharma@example.com', '9876543218', 'No. 66, Rajajinagar, Bangalore, India'),
(10, 'Anjali', 'Bala', '1994-12-05', 'anjali.bala@example.com', '9876543219', 'No. 77, Anna Salai, Chennai, India');

-- Inserting 10 sample records into the Accounts table
INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(1, 1, 'savings', 2000.00),
(2, 2, 'current', 3500.00),
(3, 3, 'savings', 1500.00),
(4, 4, 'zero_balance', 0.00),
(5, 5, 'savings', 5000.00),
(6, 6, 'current', 10000.00),
(7, 7, 'savings', 0.00),
(8, 8, 'current', 7000.00),
(9, 9, 'savings', 1200.00),
(10, 10, 'current', 15000.00);

-- Inserting 10 sample records into the Transactions table
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1, 1, 'deposit', 2000.00, '2025-03-10'),
(2, 2, 'withdrawal', 500.00, '2025-03-12'),
(3, 3, 'deposit', 1000.00, '2025-03-15'),
(4, 4, 'deposit', 200.00, '2025-03-16'),
(5, 5, 'withdrawal', 1000.00, '2025-03-17'),
(6, 6, 'transfer', 2000.00, '2025-03-18'),
(7, 7, 'deposit', 500.00, '2025-03-19'),
(8, 8, 'withdrawal', 1500.00, '2025-03-20'),
(9, 9, 'deposit', 800.00, '2025-03-21'),
(10, 10, 'transfer', 3000.00, '2025-03-22');

-- 2: SQL Queries

-- 1. Retrieve the name, account type, and email of all customers
SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- 2. List all transactions corresponding to a customer
SELECT t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE c.customer_id = 1;  

-- 3. Increase the balance of a specific account by a certain amount
UPDATE Accounts
SET balance = balance + 500.00  
WHERE account_id = 1;  

-- 4. Combine first and last names of customers as a full_name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;

-- 5. Remove accounts with a balance of zero where the account type is savings
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

-- 6. Find customers living in a specific city
SELECT first_name, last_name, email
FROM Customers
WHERE address LIKE '%Chennai%';  

-- 7. Get the account balance for a specific account
SELECT balance
FROM Accounts
WHERE account_id = 1;

-- 8. List all current accounts with a balance greater than $1,000
SELECT account_id, balance
FROM Accounts
WHERE account_type = 'current' AND balance > 1000;

-- 9. Retrieve all transactions for a specific account
SELECT transaction_id, transaction_type, amount, transaction_date
FROM Transactions
WHERE account_id = 1;

-- 10. Calculate the interest accrued on savings accounts based on a given interest rate
SELECT account_id, balance * 0.05 AS interest_accrued  
FROM Accounts
WHERE account_type = 'savings';

-- 11. Identify accounts where the balance is less than a specified overdraft limit
SELECT account_id, balance
FROM Accounts
WHERE balance < -1000;  

-- 12. Find customers not living in a specific city
SELECT first_name, last_name, email
FROM Customers
WHERE address NOT LIKE '%Chennai%';  