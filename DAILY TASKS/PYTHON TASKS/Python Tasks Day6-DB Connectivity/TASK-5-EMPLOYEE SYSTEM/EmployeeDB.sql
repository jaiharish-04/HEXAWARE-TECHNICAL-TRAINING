--CREATE DATABASE EmployeeDB;
--GO

USE EmployeeDB;
GO

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    EmpAge INT,
    EmpDept VARCHAR(50),
    EmpSalary FLOAT
);
