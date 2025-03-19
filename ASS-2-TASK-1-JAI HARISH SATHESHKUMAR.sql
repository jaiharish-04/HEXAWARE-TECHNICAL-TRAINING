-- 1. Create the database "SISDB"
CREATE DATABASE SISDB;
USE SISDB;

-- 2. Define the schema for the tables

-- 2.1. Create the "Students" table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,  -- Student's unique ID
    first_name VARCHAR(100),     -- Student's first name
    last_name VARCHAR(100),      -- Student's last name
    date_of_birth DATE,          -- Date of birth of the student
    email VARCHAR(100) UNIQUE,   -- Email of the student
    phone_number VARCHAR(15)     -- Phone number of the student
);

-- 2.2. Create the "Teacher" table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,   -- Teacher's unique ID
    first_name VARCHAR(100),      -- Teacher's first name
    last_name VARCHAR(100),       -- Teacher's last name
    email VARCHAR(100) UNIQUE     -- Teacher's email
);

-- 2.3. Create the "Courses" table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,    -- Course's unique ID
    course_name VARCHAR(100),     -- Name of the course
    credits INT,                  -- Number of credits for the course
    teacher_id INT,               -- Teacher who teaches this course
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)  -- Foreign key reference to Teacher table
);

-- 2.4. Create the "Enrollments" table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,  -- Enrollment ID
    student_id INT,                 -- Student ID
    course_id INT,                  -- Course ID
    enrollment_date DATE,           -- Enrollment date
    FOREIGN KEY (student_id) REFERENCES Students(student_id),  -- Foreign key reference to Students table
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)     -- Foreign key reference to Courses table
);

-- 2.5. Create the "Payments" table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,    -- Payment ID
    student_id INT,                -- Student ID
    amount DECIMAL(10, 2),         -- Payment amount
    payment_date DATE,             -- Payment date
    FOREIGN KEY (student_id) REFERENCES Students(student_id)   -- Foreign key reference to Students table
);

-- 3. Insert sample data into the tables

-- 3.1. Insert sample data into "Students" table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Arun', 'Kumar', '1999-04-15', 'arun.kumar@example.com', '9876543210'),
(2, 'Anjali', 'Ravi', '1998-08-22', 'anjali.ravi@example.com', '9876543211'),
(3, 'Karthik', 'Vijay', '2000-01-11', 'karthik.vijay@example.com', '9876543212'),
(4, 'Priya', 'Nair', '1997-02-05', 'priya.nair@example.com', '9876543213'),
(5, 'Suresh', 'Selvaraj', '1999-06-19', 'suresh.selvaraj@example.com', '9876543214'),
(6, 'Divya', 'Ravi', '1998-12-09', 'divya.ravi@example.com', '9876543215'),
(7, 'Lakshmi', 'Raj', '2000-07-23', 'lakshmi.raj@example.com', '9876543216'),
(8, 'Vijay', 'Kumar', '1997-03-18', 'vijay.kumar@example.com', '9876543217'),
(9, 'Sangeetha', 'Krishnan', '1999-09-01', 'sangeetha.krishnan@example.com', '9876543218'),
(10, 'Ravi', 'Shankar', '2000-04-30', 'ravi.shankar@example.com', '9876543219');

-- 3.2. Insert sample data into "Teacher" table
INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Saravanan', 'Pillai', 'saravanan.pillai@example.com'),
(2, 'Kavitha', 'Sharma', 'kavitha.sharma@example.com'),
(3, 'Muthu', 'Rajendran', 'muthu.rajendran@example.com'),
(4, 'Vidya', 'Nair', 'vidya.nair@example.com'),
(5, 'Manoj', 'Krishnan', 'manoj.krishnan@example.com'),
(6, 'Sangeeta', 'Bala', 'sangeeta.bala@example.com'),
(7, 'Karthick', 'Ramaswamy', 'karthick.ramaswamy@example.com'),
(8, 'Ramya', 'Subramanian', 'ramya.subramanian@example.com'),
(9, 'Pradeep', 'Kumar', 'pradeep.kumar@example.com'),
(10, 'Meera', 'Raj', 'meera.raj@example.com');

-- 3.3. Insert sample data into "Courses" table
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Computer Science 101', 3, 1),
(2, 'Mathematics 101', 4, 2),
(3, 'Physics 101', 3, 3),
(4, 'Chemistry 101', 4, 4),
(5, 'Biology 101', 3, 5),
(6, 'History 101', 3, 6),
(7, 'Economics 101', 2, 7),
(8, 'English Literature', 3, 8),
(9, 'Philosophy 101', 3, 9),
(10, 'Psychology 101', 4, 10);

-- 3.4. Insert sample data into "Enrollments" table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2025-03-01'),
(2, 2, 2, '2025-03-02'),
(3, 3, 3, '2025-03-03'),
(4, 4, 4, '2025-03-04'),
(5, 5, 5, '2025-03-05'),
(6, 6, 6, '2025-03-06'),
(7, 7, 7, '2025-03-07'),
(8, 8, 8, '2025-03-08'),
(9, 9, 9, '2025-03-09'),
(10, 10, 10, '2025-03-10');

-- 3.5. Insert sample data into "Payments" table
INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 200.00, '2025-03-01'),
(2, 2, 250.00, '2025-03-02'),
(3, 3, 300.00, '2025-03-03'),
(4, 4, 150.00, '2025-03-04'),
(5, 5, 100.00, '2025-03-05'),
(6, 6, 350.00, '2025-03-06'),
(7, 7, 200.00, '2025-03-07'),
(8, 8, 300.00, '2025-03-08'),
(9, 9, 400.00, '2025-03-09'),
(10, 10, 500.00, '2025-03-10');
