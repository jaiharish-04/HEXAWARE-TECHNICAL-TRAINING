-- 1. Create the database "JHBANK"
CREATE DATABASE JHBANK;
USE JHBANK;

-- 2. Define the schema for the Customers, Accounts, and Transactions tables

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    DOB DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),  -- e.g., savings, current, zero_balance
    balance DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),  -- e.g., deposit, withdrawal, transfer
    amount DECIMAL(15, 2),
    transaction_date DATETIME,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- 3. ERD (Entity Relationship Diagram)
-- You can generate the ERD using tools like MySQL Workbench, Lucidchart, or draw it manually. The relationships are as follows:
-- - The Customers table is related to the Accounts table via the customer_id (one-to-many).
-- - The Accounts table is related to the Transactions table via the account_id (one-to-many).

-- 4. Inserting sample records with South Indian names

-- Inserting records into Customers table with South Indian names
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'Ravi', 'Subramanian', '1990-05-15', 'ravi.subramanian@example.com', '1234567890', '123 Main St, Chennai, Tamil Nadu, India'),
(2, 'Sita', 'Nair', '1985-08-25', 'sita.nair@example.com', '9876543210', '456 Elm St, Kochi, Kerala, India'),
(3, 'Kumar', 'Venkatesh', '1992-03-10', 'kumar.venkatesh@example.com', '1239876540', '789 Pine St, Bangalore, Karnataka, India'),
(4, 'Priya', 'Rajendran', '1988-01-20', 'priya.rajendran@example.com', '1472583690', '101 Maple St, Hyderabad, Telangana, India'),
(5, 'Anil', 'Krishnan', '1994-07-30', 'anil.krishnan@example.com', '3216549870', '202 Oak St, Madurai, Tamil Nadu, India');

-- Inserting records into Accounts table
INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(1, 1, 'savings', 1500.00),
(2, 2, 'current', 2500.00),
(3, 3, 'savings', 3000.00),
(4, 4, 'zero_balance', 0.00),
(5, 5, 'savings', 2000.00);

-- Inserting records into Transactions table
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1, 1, 'deposit', 500.00, '2025-03-15 10:00:00'),
(2, 1, 'withdrawal', 200.00, '2025-03-16 12:30:00'),
(3, 2, 'deposit', 1000.00, '2025-03-14 14:00:00'),
(4, 3, 'withdrawal', 1500.00, '2025-03-18 15:45:00'),
(5, 5, 'deposit', 1200.00, '2025-03-19 09:20:00');

-- 5. Primary Key and Foreign Key Constraints
-- I have not added the query for Primary key and Foreign Key Constraints because:
-- The primary keys have already been defined in the table creation process.
-- The foreign key constraints are:
-- - The Accounts table has a foreign key referencing the Customers table (customer_id).
-- - The Transactions table has a foreign key referencing the Accounts table (account_id).
