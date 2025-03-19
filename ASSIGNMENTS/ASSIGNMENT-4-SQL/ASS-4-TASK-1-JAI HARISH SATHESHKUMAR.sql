-- 1. Create the database
CREATE DATABASE CourierManagement;
USE CourierManagement;

-- 2. Create the Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

-- 3. Create the Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(50)
);

-- 4. Create the Couriers Table
CREATE TABLE Couriers (
    courier_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 5. Create the Locations Table
CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    zip_code VARCHAR(10)
);

-- 6. Create the Parcels Table
CREATE TABLE Parcels (
    parcel_id INT PRIMARY KEY AUTO_INCREMENT,
    parcel_type VARCHAR(50),
    weight DECIMAL(10, 2),
    dimensions VARCHAR(50),
    status VARCHAR(50),
    order_id INT
);

-- 7. Create the Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    parcel_id INT,
    pickup_location_id INT,
    delivery_location_id INT,
    order_date DATE,
    delivery_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (parcel_id) REFERENCES Parcels(parcel_id),
    FOREIGN KEY (pickup_location_id) REFERENCES Locations(location_id),
    FOREIGN KEY (delivery_location_id) REFERENCES Locations(location_id)
);

-- 8. Create the Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 9. Create the CourierAssignments Table
CREATE TABLE CourierAssignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    courier_id INT,
    assigned_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (courier_id) REFERENCES Couriers(courier_id)
);

-- 10. Insert Sample Data into Customers Table
INSERT INTO Customers (first_name, last_name, email, phone_number, address) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '9999999990', '123 Main St, Chennai, India'),
('Priya', 'Nair', 'priya.nair@example.com', '9999999991', '456 Park St, Bangalore, India'),
('Vijay', 'Singh', 'vijay.singh@example.com', '9999999992', '789 River Rd, Mumbai, India');

-- 11. Insert Sample Data into Employees Table
INSERT INTO Employees (first_name, last_name, role) VALUES
('Ravi', 'Kumar', 'Manager'),
('Anjali', 'Reddy', 'Supervisor'),
('Suresh', 'Babu', 'Driver');

-- 12. Insert Sample Data into Couriers Table
INSERT INTO Couriers (first_name, last_name, email, phone_number, employee_id) VALUES
('Arun', 'Reddy', 'arun.reddy@example.com', '9876543210', 1),
('Maya', 'Nair', 'maya.nair@example.com', '9876543211', 2),
('Kumar', 'Singh', 'kumar.singh@example.com', '9876543212', 3);

-- 13. Insert Sample Data into Locations Table
INSERT INTO Locations (city, state, country, zip_code) VALUES
('Chennai', 'Tamil Nadu', 'India', '600001'),
('Bangalore', 'Karnataka', 'India', '560001'),
('Mumbai', 'Maharashtra', 'India', '400001');

-- 14. Insert Sample Data into Parcels Table
INSERT INTO Parcels (parcel_type, weight, dimensions, status, order_id) VALUES
('Document', 0.5, '30x20x5 cm', 'In Transit', 1),
('Electronics', 1.5, '50x30x10 cm', 'Delivered', 2),
('Clothes', 2.0, '40x30x10 cm', 'In Transit', 3);

-- 15. Insert Sample Data into Orders Table
INSERT INTO Orders (customer_id, parcel_id, pickup_location_id, delivery_location_id, order_date, delivery_date) VALUES
(1, 1, 1, 2, '2025-03-01', '2025-03-03'),
(2, 2, 2, 3, '2025-03-05', '2025-03-07'),
(3, 3, 3, 1, '2025-03-10', '2025-03-12');

-- 16. Insert Sample Data into Payments Table
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES
(1, '2025-03-01', 200.00, 'Credit Card'),
(2, '2025-03-05', 300.00, 'Debit Card'),
(3, '2025-03-10', 150.00, 'Cash');

-- 17. Insert Sample Data into CourierAssignments Table
INSERT INTO CourierAssignments (order_id, courier_id, assigned_date) VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-05'),
(3, 3, '2025-03-10');
