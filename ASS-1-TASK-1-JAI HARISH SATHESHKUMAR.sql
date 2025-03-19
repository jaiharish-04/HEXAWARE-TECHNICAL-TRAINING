-- 1. Create the database
CREATE DATABASE TechShop;
USE TechShop;

-- 2. Define the schema for the tables

-- Customers Table
CREATE TABLE Customers (
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
);

-- 3. Insert sample data into tables

-- Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 Main St, Delhi, India'),
(2, 'Priya', 'Patel', 'priya.patel@example.com', '9876543211', '456 Park St, Mumbai, India'),
(3, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '9876543212', '789 River St, Bangalore, India'),
(4, 'Sanya', 'Gupta', 'sanya.gupta@example.com', '9876543213', '101 Lake St, Kolkata, India'),
(5, 'Vikram', 'Reddy', 'vikram.reddy@example.com', '9876543214', '202 High St, Chennai, India'),
(6, 'Neha', 'Verma', 'neha.verma@example.com', '9876543215', '303 Oak St, Pune, India'),
(7, 'Rohit', 'Singh', 'rohit.singh@example.com', '9876543216', '404 Pine St, Hyderabad, India'),
(8, 'Simran', 'Kaur', 'simran.kaur@example.com', '9876543217', '505 Palm St, Ahmedabad, India'),
(9, 'Karan', 'Yadav', 'karan.yadav@example.com', '9876543218', '606 Cedar St, Jaipur, India'),
(10, 'Tanvi', 'Joshi', 'tanvi.joshi@example.com', '9876543219', '707 Maple St, Lucknow, India');

-- Products Table (Tech-related)
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', '15.6-inch laptop with Intel i5 processor, 8GB RAM, 512GB SSD', 599.99),
(2, 'Smartphone', 'Latest 5G smartphone with 128GB storage, 8GB RAM', 499.99),
(3, 'Smartwatch', 'Water-resistant smartwatch with heart-rate monitor and fitness tracker', 149.99),
(4, 'Tablet', '10.1-inch Android tablet with 64GB storage and 4GB RAM', 199.99),
(5, 'Wireless Headphones', 'Over-ear wireless headphones with noise cancellation', 89.99),
(6, 'Bluetooth Speaker', 'Portable Bluetooth speaker with 360-degree sound', 39.99),
(7, 'Gaming Console', 'Next-gen gaming console with 1TB storage', 399.99),
(8, 'Laptop Bag', 'Protective laptop bag with space for accessories', 29.99),
(9, 'External Hard Drive', '1TB external hard drive with USB 3.0 support', 59.99),
(10, 'USB Flash Drive', '64GB USB 3.0 flash drive for fast data transfer', 19.99);

-- Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2025-03-10', 849.98),
(2, 2, '2025-03-12', 649.98),
(3, 3, '2025-03-14', 519.98),
(4, 4, '2025-03-16', 229.99),
(5, 5, '2025-03-18', 499.98),
(6, 6, '2025-03-19', 399.98),
(7, 7, '2025-03-20', 269.99),
(8, 8, '2025-03-21', 199.98),
(9, 9, '2025-03-22', 289.98),
(10, 10, '2025-03-23', 149.98);

-- OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 3, 4, 1),
(5, 3, 5, 1),
(6, 4, 6, 1),
(7, 5, 7, 1),
(8, 6, 8, 1),
(9, 7, 9, 1),
(10, 8, 10, 1);

-- Inventory Table
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 50, '2025-03-01'),
(2, 2, 100, '2025-03-01'),
(3, 3, 75, '2025-03-01'),
(4, 4, 120, '2025-03-01'),
(5, 5, 150, '2025-03-01'),
(6, 6, 40, '2025-03-01'),
(7, 7, 60, '2025-03-01'),
(8, 8, 100, '2025-03-01'),
(9, 9, 80, '2025-03-01'),
(10, 10, 200, '2025-03-01');
