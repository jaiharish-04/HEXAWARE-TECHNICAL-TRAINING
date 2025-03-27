-- Create Source and Target Databases
CREATE DATABASE SourceDatabase;
GO

CREATE DATABASE DestinationDatabase;
GO

-- Create Schema and Table in Source Database
USE SourceDatabase;
GO

CREATE SCHEMA EmployeeSchema AUTHORIZATION dbo;
GO

CREATE TABLE EmployeeSchema.Staff (
    StaffID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Age INT,
    Department NVARCHAR(50)
);

INSERT INTO EmployeeSchema.Staff (StaffID, FullName, Age, Department)
VALUES (1, 'Jai', 32, 'Marketing'),
       (2, 'Harish', 29, 'IT'),
       (3, 'Kumar', 40, 'Finance');

-- TASK 1: Copy Data into dbo schema in DestinationDatabase
USE DestinationDatabase;
GO

SELECT * INTO dbo.Staff FROM SourceDatabase.EmployeeSchema.Staff;

ALTER TABLE dbo.Staff
ADD CONSTRAINT PK_Staff PRIMARY KEY (StaffID); -- Avoid duplication

-- TASK 2: Copy Data into Custom Schema in DestinationDatabase
USE DestinationDatabase;
GO

CREATE SCHEMA EmployeeSchema AUTHORIZATION dbo;
GO

SELECT * INTO DestinationDatabase.EmployeeSchema.Staff FROM SourceDatabase.EmployeeSchema.Staff;

-- TASK 3: Create User and Set Permissions
USE DestinationDatabase;
GO

CREATE LOGIN UserB WITH PASSWORD = 'VeryStrong123'; 
CREATE USER UserB FOR LOGIN UserB;

GRANT SELECT ON SCHEMA::EmployeeSchema TO UserB; 
REVOKE ALTER ON SCHEMA::EmployeeSchema FROM UserB; 
DENY CONTROL ON SCHEMA::EmployeeSchema TO UserB; 