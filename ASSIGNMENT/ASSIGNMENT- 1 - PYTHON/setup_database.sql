-- Step 1: Drop Database If It Exists (For a Fresh Start)
/*USE master;
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ShopDB')
BEGIN
    ALTER DATABASE ShopDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ShopDB;
END;
GO

-- Step 2: Create the New Database
CREATE DATABASE ShopDB;
GO*/

-- Step 3: Use the ShopDB Database
USE ShopDB;
GO

-- Step 4: Create a User-Defined Schema
--CREATE SCHEMA ShopDBSchema;
--GO

-- Step 5: Create Customers Table
/*CREATE TABLE ShopDBSchema.Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(15) DEFAULT '',
    Address VARCHAR(MAX) DEFAULT ''
);
GO

-- Step 6: Create Products Table
CREATE TABLE ShopDBSchema.Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) CHECK (Price >= 0)
);
GO

-- Step 7: Create Orders Table
CREATE TABLE ShopDBSchema.Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) DEFAULT 0,  -- Will be updated by a trigger
    Status VARCHAR(50) DEFAULT 'Processing',
    FOREIGN KEY (CustomerID) REFERENCES ShopDBSchema.Customers(CustomerID) ON DELETE CASCADE
);
GO

-- Step 8: Create OrderDetails Table (Fixed Subtotal Issue)
CREATE TABLE ShopDBSchema.OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    Subtotal DECIMAL(10,2), -- Now a regular column
    FOREIGN KEY (OrderID) REFERENCES ShopDBSchema.Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES ShopDBSchema.Products(ProductID)
);
GO

-- Step 9: Create Inventory Table
CREATE TABLE ShopDBSchema.Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    QuantityInStock INT CHECK (QuantityInStock >= 0),
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES ShopDBSchema.Products(ProductID)
);
GO

-- Step 10: Create Payments Table
CREATE TABLE ShopDBSchema.Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10,2) CHECK (Amount >= 0),
    PaymentMethod VARCHAR(50) CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'Net Banking', 'UPI', 'Cash')),
    PaymentStatus VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (OrderID) REFERENCES ShopDBSchema.Orders(OrderID) ON DELETE CASCADE
);
GO

-- Step 11: Insert Sample Data into Customers
INSERT INTO ShopDBSchema.Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Street, City'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Avenue, City'),
('Alice', 'Brown', 'alice.brown@example.com', '5678901234', '789 Road, City');
GO

-- Step 12: Insert Sample Data into Products
INSERT INTO ShopDBSchema.Products (ProductName, Description, Price) VALUES
('Laptop', 'High-performance laptop', 75000.00),
('Smartphone', 'Latest model smartphone', 50000.00),
('Headphones', 'Noise-canceling headphones', 10000.00);
GO

-- Step 13: Insert Sample Data into Orders
INSERT INTO ShopDBSchema.Orders (CustomerID) VALUES
(1),
(2),
(3);
GO

-- Step 14: Insert Sample Data into OrderDetails (Calculate Subtotal in Python or Trigger)
INSERT INTO ShopDBSchema.OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 1, 75000.00),
(2, 2, 1, 50000.00),
(3, 3, 1, 10000.00);
GO

-- Step 15: Insert Sample Data into Inventory
INSERT INTO ShopDBSchema.Inventory (ProductID, QuantityInStock) VALUES
(1, 50),
(2, 100),
(3, 75);
GO

-- Step 16: Insert Sample Data into Payments
INSERT INTO ShopDBSchema.Payments (OrderID, Amount, PaymentMethod, PaymentStatus) VALUES
(1, 75000.00, 'Credit Card', 'Completed'),
(2, 50000.00, 'UPI', 'Pending'),
(3, 10000.00, 'Cash', 'Completed');
GO

-- Step 17: Create Trigger to Auto-Update Orders TotalAmount
CREATE TRIGGER UpdateTotalAmount 
ON ShopDBSchema.OrderDetails 
AFTER INSERT, UPDATE, DELETE 
AS 
BEGIN
    UPDATE o
    SET o.TotalAmount = (
        SELECT SUM(od.Subtotal) 
        FROM ShopDBSchema.OrderDetails od
        WHERE od.OrderID = o.OrderID
    )
    FROM ShopDBSchema.Orders o;
END;
GO

-- Step 18: Create Trigger for Auto-Updating Inventory
CREATE TRIGGER UpdateInventoryStock
ON ShopDBSchema.OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE i
    SET i.QuantityInStock = i.QuantityInStock - inserted.Quantity
    FROM ShopDBSchema.Inventory i
    INNER JOIN inserted ON i.ProductID = inserted.ProductID;
END;
GO

-- Step 19: Create Index for Faster Queries
CREATE INDEX idx_CustomerID ON ShopDBSchema.Orders(CustomerID);
GO*/

-- Step 20: View All Records for Verification
SELECT * FROM ShopDBSchema.Customers;
SELECT * FROM ShopDBSchema.Products;
SELECT * FROM ShopDBSchema.Orders;
SELECT * FROM ShopDBSchema.OrderDetails;
SELECT * FROM ShopDBSchema.Inventory;
SELECT * FROM ShopDBSchema.Payments;
GO
