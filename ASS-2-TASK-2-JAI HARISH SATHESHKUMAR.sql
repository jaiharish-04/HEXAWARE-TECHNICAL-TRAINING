-- 1. Insert a new student into the "Students" table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

-- 2. Enroll a student in a course (Choose student_id = 1 and course_id = 1 as an example)
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) 
VALUES (11, 1, 1, '2025-03-15');

-- 3. Update the email address of a specific teacher (Choose teacher_id = 1 as an example)
UPDATE Teacher 
SET email = 'saravanan.pillai@newemail.com' 
WHERE teacher_id = 1;

-- 4. Delete a specific enrollment record from the "Enrollments" table (Choose student_id = 1 and course_id = 1 as an example)
DELETE FROM Enrollments 
WHERE student_id = 1 AND course_id = 1;

-- 5. Update the "Courses" table to assign a specific teacher to a course (Choose course_id = 2 and teacher_id = 2 as an example)
UPDATE Courses 
SET teacher_id = 2 
WHERE course_id = 2;

-- 6. Delete a specific student from the "Students" table and remove all their enrollment records (Choose student_id = 11 as an example)
DELETE FROM Enrollments WHERE student_id = 11;  -- First, delete all enrollments for the student
DELETE FROM Students WHERE student_id = 11;     -- Then, delete the student from the Students table

-- 7. Update the payment amount for a specific payment record in the "Payments" table (Choose payment_id = 1 as an example)
UPDATE Payments 
SET amount = 250.00 
WHERE payment_id = 1;
