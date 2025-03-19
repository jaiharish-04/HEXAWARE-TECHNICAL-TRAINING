-- 1. Insert Sample Records into Each Table

-- Insert Sample Records into the Venu Table
INSERT INTO Venu (venue_id, venue_name, address) VALUES
(1, 'Jawaharlal Nehru Stadium', 'New Delhi, India'),
(2, 'Chennai Stadium', 'Chennai, Tamil Nadu, India'),
(3, 'Mysuru Palace Grounds', 'Mysuru, Karnataka, India'),
(4, 'Kochi Indoor Stadium', 'Kochi, Kerala, India'),
(5, 'Bangalore Indoor Arena', 'Bangalore, Karnataka, India'),
(6, 'Hyderabad City Auditorium', 'Hyderabad, Telangana, India'),
(7, 'Ravindra Bharathi', 'Hyderabad, Telangana, India'),
(8, 'Chidambaram Cricket Ground', 'Chidambaram, Tamil Nadu, India'),
(9, 'Indira Gandhi Indoor Stadium', 'Delhi, India'),
(10, 'Mysore Cricket Stadium', 'Mysore, Karnataka, India');

-- Insert Sample Records into Event Table
INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(1, 'IPL Final', '2025-05-15', '18:00:00', 1, 50000, 10000, 2000.00, 'Sports', 1),
(2, 'Carnatic Music Concert', '2025-06-10', '19:00:00', 2, 2000, 500, 1500.00, 'Concert', 2),
(3, 'Kuchipudi Dance Performance', '2025-07-05', '17:30:00', 3, 1000, 1000, 500.00, 'Concert', 3),
(4, 'Kochi Film Festival', '2025-09-01', '10:00:00', 4, 3000, 1500, 1000.00, 'Movie', 4),
(5, 'Tamil Nadu State Cricket Championship', '2025-07-12', '15:00:00', 5, 30000, 7000, 500.00, 'Sports', 5),
(6, 'Bhakti Sangeet', '2025-08-25', '18:30:00', 6, 2000, 500, 800.00, 'Concert', 6),
(7, 'Theater Play: Natyashastra', '2025-10-10', '20:00:00', 7, 1500, 500, 300.00, 'Movie', 7),
(8, 'Kochi Jazz Festival', '2025-12-01', '19:00:00', 8, 3000, 1000, 1500.00, 'Concert', 8),
(9, 'Chidambaram Dance and Music', '2025-11-20', '18:00:00', 9, 2000, 1000, 600.00, 'Concert', 9),
(10, 'Mysore Palace Light Show', '2025-10-15', '17:00:00', 10, 5000, 2000, 700.00, 'Movie', 10);

-- Insert Sample Records into Customer Table
INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1, 'Karthik Reddy', 'karthik.reddy@gmail.com', '9887766555', 1),
(2, 'Sundar Raj', 'sundar.raj@outlook.com', '9876543210', 2),
(3, 'Priya Pillai', 'priya.pillai@yahoo.com', '9944556677', 3),
(4, 'Ananya Nair', 'ananya.nair@gmail.com', '9567890321', 4),
(5, 'Vijay Kannan', 'vijay.kannan@hotmail.com', '9900667788', 5),
(6, 'Radhika Gupta', 'radhika.gupta@rediffmail.com', '9988776655', 6),
(7, 'Arvind Kumar', 'arvind.kumar@aol.com', '9111222333', 7),
(8, 'Nisha Patil', 'nisha.patil@indiatimes.com', '9122334455', 8),
(9, 'Ravi Shekhar', 'ravi.shekhar@gmail.com', '9700445566', 9),
(10, 'Divya Menon', 'divya.menon@ymail.com', '9866554433', 10);

-- Insert Sample Records into Booking Table
INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 1, 2, 4000.00, '2025-04-10'),
(2, 2, 2, 1, 1500.00, '2025-05-15'),
(3, 3, 3, 4, 2000.00, '2025-06-05'),
(4, 4, 4, 2, 2000.00, '2025-07-20'),
(5, 5, 5, 3, 1500.00, '2025-08-01'),
(6, 6, 6, 2, 1600.00, '2025-09-05'),
(7, 7, 7, 5, 1500.00, '2025-10-15'),
(8, 8, 8, 3, 4500.00, '2025-11-20'),
(9, 9, 9, 4, 2400.00, '2025-12-01'),
(10, 10, 10, 1, 700.00, '2025-12-05');

-- 2. List All Events
SELECT event_name, event_date, event_time, ticket_price, event_type
FROM Event;

-- 3. Select Events with Available Tickets
SELECT event_name, event_date, available_seats, ticket_price
FROM Event
WHERE available_seats > 0;

-- 4. Select Events with Name Partial Match with 'cup'
SELECT event_name, event_date, event_time
FROM Event
WHERE event_name LIKE '%cup%';

-- 5. Select Events with Ticket Price Range Between 1000 and 2500
SELECT event_name, ticket_price
FROM Event
WHERE ticket_price BETWEEN 1000 AND 2500;

-- 6. Retrieve Events with Dates Falling Within a Specific Range
SELECT event_name, event_date
FROM Event
WHERE event_date BETWEEN '2025-06-01' AND '2025-12-31';

-- 7. Retrieve Events with Available Tickets and 'Concert' in Their Name
SELECT event_name, available_seats, event_type
FROM Event
WHERE available_seats > 0 AND event_name LIKE '%Concert%';

-- 8. Retrieve Users in Batches of 5, Starting from the 6th User
SELECT *
FROM Customer
LIMIT 5 OFFSET 5;

-- 9. Retrieve Bookings with More Than 4 Tickets
SELECT b.booking_id, c.customer_name, e.event_name, b.num_tickets, b.total_cost
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Event e ON b.event_id = e.event_id
WHERE b.num_tickets > 4;

-- 10. Retrieve Customer Information Whose Phone Number Ends with '000'
SELECT customer_name, email, phone_number
FROM Customer
WHERE phone_number LIKE '%000';

-- 11. Retrieve Events in Order Whose Seat Capacity is More Than 15000
SELECT event_name, total_seats
FROM Event
WHERE total_seats > 15000
ORDER BY event_date;

-- 12. Select Events Name Not Starting with 'X', 'Y', 'Z'
SELECT event_name
FROM Event
WHERE event_name NOT LIKE 'X%' AND event_name NOT LIKE 'Y%' AND event_name NOT LIKE 'Z%';
