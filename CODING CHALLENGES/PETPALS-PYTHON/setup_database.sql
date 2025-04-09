--CREATE DATABASE PetPals;
USE PetPals;

-- Table: Pets

-- Drop existing table
--DROP TABLE IF EXISTS Pets;

-- Create table with IDENTITY column
/*CREATE TABLE Pets (
    PetID INT PRIMARY KEY IDENTITY(1,1),  -- Auto-increment primary key
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0),
    Breed VARCHAR(100),
    Type VARCHAR(50),
    AvailableForAdoption BIT NOT NULL
);

-- Table: Shelters
CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Table: Donations
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY IDENTITY(1,1),
    DonorName VARCHAR(100) NOT NULL,
    DonationType VARCHAR(50) NOT NULL CHECK (DonationType IN ('Cash', 'Item')),
    DonationAmount DECIMAL(10,2) NULL,
    DonationItem VARCHAR(255) NULL,
    DonationDate DATETIME DEFAULT GETDATE()
);

-- Table: AdoptionEvents
CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL DEFAULT GETDATE(),
    Location VARCHAR(255) NOT NULL
);

-- Table: Participants
CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY IDENTITY(1,1),
    ParticipantName VARCHAR(100) NOT NULL,
    ParticipantType VARCHAR(50) NOT NULL CHECK (ParticipantType IN ('Shelter', 'Adopter')),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID) ON DELETE CASCADE
);*/
