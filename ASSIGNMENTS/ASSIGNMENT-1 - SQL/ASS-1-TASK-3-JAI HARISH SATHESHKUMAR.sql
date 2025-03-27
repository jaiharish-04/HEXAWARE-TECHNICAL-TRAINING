﻿USE TechShop;

/*-- ✅ 1. Retrieve a list of all orders along with customer information for each order
SELECT 
    o.OrderID, 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    c.Phone, 
    o.OrderDate, 
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- ✅ 2. Find the total revenue generated by each electronic gadget product
SELECT 
    p.ProductName, 
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- ✅ 3. List all customers who have made at least one purchase
SELECT DISTINCT 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- ✅ 4. Find the most popular electronic gadget (highest total quantity ordered)
SELECT TOP 1 
    p.ProductName, 
    SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

-- ✅ 5. Retrieve a list of electronic gadgets along with their descriptions
SELECT 
    p.ProductName, 
    p.Description 
FROM Products p;

-- ✅ 6. Calculate the average order value for each customer
SELECT 
    c.FirstName, 
    c.LastName, 
    COALESCE(AVG(o.TotalAmount), 0) AS AverageOrderValue
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- ✅ 7. Find the order with the highest total revenue
SELECT TOP 1 
    o.OrderID, 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    c.Phone, 
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

-- ✅ 8. List electronic gadgets and the number of times each product has been ordered
SELECT 
    p.ProductName, 
    COUNT(od.ProductID) AS NumberOfTimesOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- ✅ 9. Find customers who have purchased a specific electronic gadget  
-- Replace 'Laptop' with any other product name when querying  
SELECT DISTINCT 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';*/

-- ✅ 10. Calculate the total revenue generated by all orders within a specific time period  
-- Replace '2025-03-10' and '2025-03-20' with actual date range when querying  
SELECT 
    COALESCE(SUM(o.TotalAmount), 0) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN '2025-03-10' AND '2025-03-20';
