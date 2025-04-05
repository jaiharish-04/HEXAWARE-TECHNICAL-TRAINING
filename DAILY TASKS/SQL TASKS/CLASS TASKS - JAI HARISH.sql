--TASK-1
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2)
);

SELECT name AS Constraint_Name, definition AS Check_Condition 
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('Employees');

--TASK-2
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

INSERT INTO customers (name, city, age) VALUES
('Raj', 'Mumbai', 30),
('Amit', 'Delhi', 28),
('Raj', 'Mumbai', 30),
('Priya', 'Chennai', 35);

UPDATE TOP (1) customers
SET age = 31
WHERE name = 'Raj' AND city = 'Mumbai';
SELECT * FROM customers;

--TASK-3
CREATE TABLE Employees (
    emp_id INT, 
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2)
);

INSERT INTO Employees (emp_id, name, age, salary) VALUES
(101, 'Raj', 30, 50000.00),
(102, 'Amit', 28, 45000.50),
(103, 'Priya', 35, 60000.75);
ALTER TABLE Employees 
ADD CONSTRAINT PK_Employees PRIMARY KEY (emp_id);




