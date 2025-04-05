USE TechShop;

--  1. Retrieve the names and emails of all customers
/*SELECT FirstName, LastName, Email FROM TechShopSchema.Customers;

--  2. List all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM TechShopSchema.Orders
JOIN TechShopSchema.Customers ON Orders.CustomerID = Customers.CustomerID;

--  3. Insert a new customer record into the "Customers" table
INSERT INTO TechShopSchema.Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('John', 'Doe', 'john.doe@example.com', '9876543220', '101 New St, Delhi, India');

--  4. Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE TechShopSchema.Products
SET Price = Price * 1.10
WHERE ProductName IN ('Laptop', 'Smartphone', 'Smartwatch', 'Tablet', 
                      'Wireless Headphones', 'Bluetooth Speaker', 'Gaming Console');

--  5. Delete a specific order and its associated order details
DELETE FROM TechShopSchema.OrderDetails WHERE OrderID = 5;
DELETE FROM TechShopSchema.Orders WHERE OrderID = 5;

--  6. Insert a new order into the "Orders" table
INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-03-25', 249.99);

--  7. Update the contact information (email and address) of a specific customer
UPDATE TechShopSchema.Customers
SET Email = 'new.email@example.com', Address = '102 New Address, Mumbai, India'
WHERE CustomerID = 2;

--  8. Recalculate and update the total cost of each order in the "Orders" table
UPDATE TechShopSchema.Orders
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity)
    FROM TechShopSchema.OrderDetails
    JOIN TechShopSchema.Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

--  9. Delete all orders and their associated order details for a specific customer
DELETE FROM TechShopSchema.OrderDetails WHERE OrderID IN (SELECT OrderID FROM TechShopSchema.Orders WHERE CustomerID = 3);
DELETE FROM TechShopSchema.Orders WHERE CustomerID = 3;

--  10. Insert a new electronic gadget product into the "Products" table
INSERT INTO TechShopSchema.Products (ProductName, Description, Price)
VALUES ('Smart Watch', 'Fitness and health tracking smartwatch with heart-rate monitor', 199.99);

--  11. Ensure 'Status' column exists in "Orders" table before updating it
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = 'TechShopSchema' AND TABLE_NAME = 'Orders' AND COLUMN_NAME = 'Status'
)
BEGIN
    ALTER TABLE TechShopSchema.Orders ADD Status VARCHAR(20) DEFAULT 'Pending';
END

UPDATE TechShopSchema.Orders SET Status = 'Shipped' WHERE OrderID = 7;

--  12. Ensure 'TotalOrders' column exists in "Customers" table before updating it
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = 'TechShopSchema' AND TABLE_NAME = 'Customers' AND COLUMN_NAME = 'TotalOrders'
)
BEGIN
    ALTER TABLE TechShopSchema.Customers ADD TotalOrders INT DEFAULT 0;
END

-- Now that 'TotalOrders' column exists, update it correctly
UPDATE TechShopSchema.Customers
SET TotalOrders = (
    SELECT COUNT(*) 
    FROM TechShopSchema.Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);*/
