-- 1. Create the database
--CREATE DATABASE TechShop;
USE TechShop;

-- 2. Define the schema for the tables

-- Customers Table
/*CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);

-- Products Table (Tech-related products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);*

-- 3. Insert sample data into tables

-- Customers Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 Main St, Delhi, India'),
('Priya', 'Patel', 'priya.patel@example.com', '9876543211', '456 Park St, Mumbai, India'),
('Ravi', 'Kumar', 'ravi.kumar@example.com', '9876543212', '789 River St, Bangalore, India'),
('Sanya', 'Gupta', 'sanya.gupta@example.com', '9876543213', '101 Lake St, Kolkata, India'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', '9876543214', '202 High St, Chennai, India'),
('Neha', 'Verma', 'neha.verma@example.com', '9876543215', '303 Oak St, Pune, India'),
('Rohit', 'Singh', 'rohit.singh@example.com', '9876543216', '404 Pine St, Hyderabad, India'),
('Simran', 'Kaur', 'simran.kaur@example.com', '9876543217', '505 Palm St, Ahmedabad, India'),
('Karan', 'Yadav', 'karan.yadav@example.com', '9876543218', '606 Cedar St, Jaipur, India'),
('Tanvi', 'Joshi', 'tanvi.joshi@example.com', '9876543219', '707 Maple St, Lucknow, India');

-- Products Table
INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop', '15.6-inch laptop with Intel i5 processor, 8GB RAM, 512GB SSD', 599.99),
('Smartphone', 'Latest 5G smartphone with 128GB storage, 8GB RAM', 499.99),
('Smartwatch', 'Water-resistant smartwatch with heart-rate monitor and fitness tracker', 149.99),
('Tablet', '10.1-inch Android tablet with 64GB storage and 4GB RAM', 199.99),
('Wireless Headphones', 'Over-ear wireless headphones with noise cancellation', 89.99),
('Bluetooth Speaker', 'Portable Bluetooth speaker with 360-degree sound', 39.99),
('Gaming Console', 'Next-gen gaming console with 1TB storage', 399.99),
('Laptop Bag', 'Protective laptop bag with space for accessories', 29.99),
('External Hard Drive', '1TB external hard drive with USB 3.0 support', 59.99),
('USB Flash Drive', '64GB USB 3.0 flash drive for fast data transfer', 19.99);

-- Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-03-10', 849.98),
(2, '2025-03-12', 649.98),
(3, '2025-03-14', 519.98),
(4, '2025-03-16', 229.99),
(5, '2025-03-18', 499.98),
(6, '2025-03-19', 399.98),
(7, '2025-03-20', 269.99),
(8, '2025-03-21', 199.98),
(9, '2025-03-22', 289.98),
(10, '2025-03-23', 149.98);

-- OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1);

-- Inventory Table
INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 50, '2025-03-01'),
(2, 100, '2025-03-01'),
(3, 75, '2025-03-01'),
(4, 120, '2025-03-01'),
(5, 150, '2025-03-01'),
(6, 40, '2025-03-01'),
(7, 60, '2025-03-01'),
(8, 100, '2025-03-01'),
(9, 80, '2025-03-01'),
(10, 200, '2025-03-01');*/


select * from Customers;
select * from Products;
select * from Orders;
select * from OrderDetails;
select * from Inventory;

