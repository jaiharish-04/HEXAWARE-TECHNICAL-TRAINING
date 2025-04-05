-- 1. Find employees in HR department with salary > 50000
SELECT Name 
FROM Employees 
WHERE Department = 'HR' AND Salary > 50000;

-- 2. Find duplicate CustomerID values in Orders table
SELECT CustomerID, COUNT(CustomerID)
FROM Orders
GROUP BY CustomerID
HAVING COUNT(CustomerID) > 1;


-- 3. Find total quantity sold for each product
SELECT ProductID, SUM(Quantity) AS TotalQuantity 
FROM Sales 
GROUP BY ProductID;

-- 4. Find transactions that occurred in the last 30 days
SELECT * 
FROM Transactions 
WHERE TransactionDate >= DATEADD(DAY, -30, GETDATE());

-- 5. Increase price of products by 10% if stock < 100
UPDATE Products 
SET Price = Price * 1.10 
WHERE StockQuantity < 100;

-- 6. Delete inactive users who haven't logged in for the past year
DELETE FROM Users 
WHERE Status = 'inactive' 
AND LastLoginDate < DATEADD(YEAR, -1, GETDATE());

-- 9. Replace NULL discounts with 'No Discount'
SELECT ProductName, 
       ISNULL(Discount, 'No Discount') AS Discount 
FROM Products;

-- 10. Rank sales amounts for each product
SELECT SaleID, ProductID, SaleAmount, SaleDate, 
       RANK() OVER (PARTITION BY ProductID ORDER BY SaleAmount DESC) AS Rank 
FROM Sales;

-- 11. Fetch values in test_a that are not in test_b without using NOT
SELECT a.id 
FROM test_a a 
LEFT JOIN test_b b ON a.id = b.id 
WHERE b.id IS NULL;

-- 12. Find the 10th highest salary
SELECT MIN(Salary) 
FROM (SELECT DISTINCT TOP 10 Salary FROM Employees ORDER BY Salary DESC) AS TopSalaries;

-- 13. Insert/Update Col2 to be the opposite of Col1
UPDATE TableName 
SET Col2 = CASE WHEN Col1 = 1 THEN 0 ELSE 1 END;
