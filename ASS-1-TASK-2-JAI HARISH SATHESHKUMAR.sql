-- 1. Retrieve the names and emails of all customers
SELECT FirstName, LastName, Email
FROM Customers;

-- 2. List all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 3. Insert a new customer record into the "Customers" table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'John', 'Doe', 'john.doe@example.com', '9876543220', '101 New St, Delhi, India');

-- 4. Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName LIKE '%Gadget%' OR ProductName LIKE '%Laptop%' OR ProductName LIKE '%Smartphone%';

-- 5. Delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables
-- First, delete the order details associated with the order
DELETE FROM OrderDetails WHERE OrderID = ?;  -- Replace '?' with the order ID

-- Then, delete the order itself
DELETE FROM Orders WHERE OrderID = ?;  -- Replace '?' with the order ID

-- 6. Insert a new order into the "Orders" table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 1, '2025-03-25', 249.99);

-- 7. Update the contact information (e.g., email and address) of a specific customer in the "Customers" table
UPDATE Customers
SET Email = 'new.email@example.com', Address = '102 New Address, Mumbai, India'
WHERE CustomerID = ?;  -- Replace '?' with the customer ID

-- 8. Recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
)
WHERE EXISTS (
    SELECT 1 FROM OrderDetails WHERE OrderDetails.OrderID = Orders.OrderID
);

-- 9. Delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables
-- First, delete the order details associated with the customer
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = ?);

-- Then, delete the orders themselves
DELETE FROM Orders WHERE CustomerID = ?;  -- Replace '?' with the customer ID

-- 10. Insert a new electronic gadget product into the "Products" table
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES (11, 'Smart Watch', 'Fitness and health tracking smartwatch with heart-rate monitor', 199.99);

-- 11. Update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped")
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = ?;  -- Replace '?' with the order ID

-- 12. Calculate and update the number of orders placed by each customer in the "Customers" table
UPDATE Customers
SET TotalOrders = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);
