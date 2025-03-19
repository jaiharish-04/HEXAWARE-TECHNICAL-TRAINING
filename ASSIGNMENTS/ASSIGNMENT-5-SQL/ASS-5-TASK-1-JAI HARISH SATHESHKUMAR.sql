-- 1. Create the database named "TicketBookingSystem"
CREATE DATABASE TicketBookingSystem;
USE TicketBookingSystem;

-- 2. Create the tables

-- Venu Table
CREATE TABLE Venu (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique identifier for the venue
    venue_name VARCHAR(255) NOT NULL,                -- Name of the venue
    address VARCHAR(255) NOT NULL                    -- Address of the venue
);

-- Event Table
CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique identifier for the event
    event_name VARCHAR(255) NOT NULL,                 -- Name of the event
    event_date DATE NOT NULL,                         -- Date of the event
    event_time TIME NOT NULL,                         -- Time of the event
    venue_id INT,                                     -- Venue ID for the event (Foreign Key)
    total_seats INT NOT NULL,                         -- Total number of seats available for the event
    available_seats INT NOT NULL,                     -- Number of available seats for booking
    ticket_price DECIMAL(10, 2) NOT NULL,             -- Price of a single ticket
    event_type ENUM('Movie', 'Sports', 'Concert') NOT NULL, -- Type of event
    booking_id INT,                                   -- Booking ID (Foreign Key)
    FOREIGN KEY (venue_id) REFERENCES Venu(venue_id), -- Foreign key referencing Venu table
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) -- Foreign key referencing Booking table
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for the customer
    customer_name VARCHAR(255) NOT NULL,              -- Name of the customer
    email VARCHAR(255) NOT NULL,                      -- Email of the customer
    phone_number VARCHAR(20) NOT NULL,                -- Phone number of the customer
    booking_id INT,                                   -- Booking ID (Foreign Key)
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) -- Foreign key referencing Booking table
);

-- Booking Table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,       -- Unique identifier for the booking
    customer_id INT,                                  -- Customer ID (Foreign Key)
    event_id INT,                                     -- Event ID (Foreign Key)
    num_tickets INT NOT NULL,                         -- Number of tickets booked
    total_cost DECIMAL(10, 2) NOT NULL,               -- Total cost for the booking
    booking_date DATE NOT NULL,                       -- Date when the booking was made
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id), -- Foreign key referencing Customer table
    FOREIGN KEY (event_id) REFERENCES Event(event_id) -- Foreign key referencing Event table
);


-- 4. I have not added the query for primary key and foreign key because appropriate Primary Key and Foreign Key constraints are already defined above.

