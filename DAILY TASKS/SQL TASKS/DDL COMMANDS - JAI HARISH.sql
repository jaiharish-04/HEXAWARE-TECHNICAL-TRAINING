-- 1. Create the TRG_DEPT Table
CREATE TABLE TRG_DEPT (
    ID NUMBER(7) PRIMARY KEY,
    NAME VARCHAR2(25) NOT NULL
);

-- 2. Populate the DEPT101 Table with Data from DEPARTMENTS
INSERT INTO DEPT101 (ID, NAME)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS;

-- 3. Create the TRG_EMP Table
CREATE TABLE TRG_EMP (
    ID NUMBER(7) PRIMARY KEY,
    LAST_NAME VARCHAR2(25) NOT NULL,
    FIRST_NAME VARCHAR2(25),
    DEPT_ID NUMBER(7),
    CONSTRAINT FK_DEPT FOREIGN KEY (DEPT_ID) REFERENCES TRG_DEPT(ID)
);

-- 4. Modify the TRG_EMP Table to Allow Longer Employee Last Names
ALTER TABLE TRG_EMP MODIFY LAST_NAME VARCHAR2(50);

-- 5. Create the TRG_EMPLOYEES Table Based on EMPLOYEES
CREATE TABLE TRG_EMPLOYEES AS 
SELECT EMPLOYEE_ID AS ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID AS DEPT_ID 
FROM EMPLOYEES;

-- 6. Drop the TRG_EMP Table
DROP TABLE TRG_EMP;

-- 7. Rename the TRG_EMPLOYEES Table to TRG_EMP
ALTER TABLE TRG_EMPLOYEES RENAME TO TRG_EMP;

-- 8. Drop the FIRST_NAME Column from TRG_EMP
ALTER TABLE TRG_EMP DROP COLUMN FIRST_NAME;
