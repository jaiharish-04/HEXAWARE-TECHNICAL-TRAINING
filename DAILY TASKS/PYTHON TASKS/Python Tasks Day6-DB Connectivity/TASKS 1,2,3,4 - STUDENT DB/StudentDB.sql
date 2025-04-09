--CREATE DATABASE StudentDB;
--GO

USE StudentDB;
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Age INT,
    Department NVARCHAR(50)
);
