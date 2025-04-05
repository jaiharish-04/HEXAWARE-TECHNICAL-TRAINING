-- 1. Describe the structure of the MY_EMPLOYEE table
EXEC sp_help MY_EMPLOYEE; 

-- 2. Insert data into MY_EMPLOYEE table without listing columns
INSERT INTO MY_EMPLOYEE 
VALUES (1, 'JAI', 'HARISH', 'SATHESH', 895);

-- 3. Insert data into MY_EMPLOYEE table by explicitly listing columns
INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES (2, 'FRANK', 'KANE', 'bdancs', 860);

-- 4. Confirm the additions to the table
SELECT * FROM MY_EMPLOYEE;

-- 5. Insert values using variables and generate USERID dynamically
DECLARE @ID INT, @LAST_NAME VARCHAR(25), @FIRST_NAME VARCHAR(25), @SALARY DECIMAL(9,2), @USERID VARCHAR(8);
SET @ID = 3;
SET @LAST_NAME = 'Smith';
SET @FIRST_NAME = 'John';
SET @SALARY = 950;
SET @USERID = UPPER(LEFT(@FIRST_NAME, 1) + LEFT(@LAST_NAME, 7));

INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES (@ID, @LAST_NAME, @FIRST_NAME, @USERID, @SALARY);

-- 6. Update last name of employee with ID 3 to 'Drexler'
UPDATE MY_EMPLOYEE 
SET LAST_NAME = 'Drexler' 
WHERE ID = 3;

-- 7. Update salary to 1000 for employees earning less than 900
UPDATE MY_EMPLOYEE 
SET SALARY = 1000 
WHERE SALARY < 900;

-- 8. Delete employee Betty Dancs from the MY_EMPLOYEE table
DELETE FROM MY_EMPLOYEE 
WHERE LAST_NAME = 'Dancs' AND FIRST_NAME = 'Betty';

-- 9. Empty the entire MY_EMPLOYEE table
TRUNCATE TABLE MY_EMPLOYEE;
