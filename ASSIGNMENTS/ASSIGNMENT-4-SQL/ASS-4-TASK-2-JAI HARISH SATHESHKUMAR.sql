-- 1. List all customers:
-- Retrieves all customer details from the 'User' table.
SELECT * FROM User;

-- 2. List all orders for a specific customer:
-- Replace 'specific_user_id' with the actual UserID of the customer.
SELECT * 
FROM Courier 
WHERE SenderName = (SELECT Name FROM User WHERE UserID = specific_user_id);

-- 3. List all couriers:
-- Retrieves all courier details from the 'Courier' table.
SELECT * FROM Courier;

-- 4. List all packages for a specific order:
-- Replace 'specific_tracking_number' with the actual tracking number of the courier.
SELECT * 
FROM Courier 
WHERE TrackingNumber = 'specific_tracking_number';

-- 5. List all deliveries for a specific courier:
-- Replace 'specific_courier_id' with the actual CourierID.
SELECT * 
FROM Courier 
WHERE CourierID = specific_courier_id;

-- 6. List all undelivered packages:
-- Retrieves all packages whose status is not 'Delivered'.
SELECT * 
FROM Courier 
WHERE Status != 'Delivered';

-- 7. List all packages that are scheduled for delivery today:
-- Retrieves packages whose delivery date is today.
SELECT * 
FROM Courier 
WHERE DeliveryDate = CURDATE();

-- 8. List all packages with a specific status:
-- Replace 'specific_status' with the desired status (e.g., 'In Transit').
SELECT * 
FROM Courier 
WHERE Status = 'specific_status';

-- 9. Calculate the total number of packages for each courier:
-- Calculates the total number of packages assigned to each courier.
SELECT CourierID, COUNT(*) AS TotalPackages
FROM Courier
GROUP BY CourierID;

-- 10. Find the average delivery time for each courier:
-- Calculates the average delivery time for each courier based on the 'DeliveryDate'.
SELECT CourierID, AVG(DATEDIFF(DeliveryDate, CURDATE())) AS AverageDeliveryTime
FROM Courier 
WHERE Status = 'Delivered'
GROUP BY CourierID;

-- 11. List all packages with a specific weight range:
-- Replace 'min_weight' and 'max_weight' with the actual weight range values.
SELECT * 
FROM Courier 
WHERE Weight BETWEEN min_weight AND max_weight;

-- 12. Retrieve employees whose names contain 'John':
-- Finds all employees whose names contain 'John'.
SELECT * 
FROM Employee 
WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50:
-- Joins the 'Courier' and 'Payment' tables to find couriers with payments greater than $50.
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;
