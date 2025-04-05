-- Create User-Defined Schema
--CREATE SCHEMA PetPalsSchema;
--GO
-- Use PetPals Database
USE PetPals;
GO



-- Create Tables under the User-Defined Schema

/*CREATE TABLE PetPalsSchema.Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 0),
    Breed VARCHAR(100),
    Type VARCHAR(50),
    AvailableForAdoption BIT NOT NULL
);
GO

CREATE TABLE PetPalsSchema.Shelters (
    ShelterID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL
);
GO

CREATE TABLE PetPalsSchema.Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(100) NOT NULL,
    DonationType VARCHAR(50) NOT NULL CHECK (DonationType IN ('Cash', 'Item')),
    DonationAmount DECIMAL(10,2) NULL,
    DonationItem VARCHAR(255) NULL,
    DonationDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE PetPalsSchema.AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL DEFAULT GETDATE(),
    Location VARCHAR(255) NOT NULL
);
GO

CREATE TABLE PetPalsSchema.Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(100) NOT NULL,
    ParticipantType VARCHAR(50) NOT NULL CHECK (ParticipantType IN ('Shelter', 'Adopter')),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES PetPalsSchema.AdoptionEvents(EventID) ON DELETE CASCADE
);
GO

-- Insert Data into Shelters
INSERT INTO PetPalsSchema.Shelters (ShelterID, Name, Location) VALUES
(1, 'Happy Paws Shelter', 'Mumbai'),
(2, 'Furry Friends Haven', 'Delhi'),
(3, 'Rescue Pals', 'Bangalore'),
(4, 'Pawfect Home', 'Chennai'),
(5, 'Safe Haven Shelter', 'Hyderabad'),
(6, 'Animal Love Shelter', 'Kolkata'),
(7, 'Hopeful Hearts Rescue', 'Pune'),
(8, 'Bright Future Rescue', 'Ahmedabad'),
(9, 'Forever Home Shelter', 'Jaipur'),
(10, 'Loving Arms Shelter', 'Lucknow');
GO

-- Insert Data into Pets
INSERT INTO PetPalsSchema.Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) VALUES
(1, 'Sheru', 2, 'Labrador', 'Dog', 1),
(2, 'Mithu', 3, 'Siamese', 'Cat', 1),
(3, 'Chintu', 1, 'Beagle', 'Dog', 1),
(4, 'Rani', 4, 'Persian', 'Cat', 0),
(5, 'Rocky', 5, 'Bulldog', 'Dog', 1),
(6, 'Golu', 6, 'Golden Retriever', 'Dog', 0),
(7, 'Chikki', 2, 'Poodle', 'Dog', 1),
(8, 'Simba', 3, 'Maine Coon', 'Cat', 1),
(9, 'Moti', 1, 'Doberman', 'Dog', 1),
(10, 'Shera', 4, 'German Shepherd', 'Dog', 0);
GO

-- Insert Data into Donations
INSERT INTO PetPalsSchema.Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem) VALUES
(1, 'Amit', 'Cash', 1000.00, NULL),
(2, 'Priya', 'Item', NULL, 'Dog Food'),
(3, 'Rahul', 'Cash', 2000.00, NULL),
(4, 'Neha', 'Item', NULL, 'Cat Toys'),
(5, 'Suresh', 'Cash', 500.00, NULL),
(6, 'Meera', 'Item', NULL, 'Pet Beds'),
(7, 'Rohan', 'Cash', 1500.00, NULL),
(8, 'Deepa', 'Item', NULL, 'Leashes & Collars'),
(9, 'Ankit', 'Cash', 3000.00, NULL),
(10, 'Sneha', 'Item', NULL, 'Pet Shampoo');
GO

-- Insert Data into AdoptionEvents
INSERT INTO PetPalsSchema.AdoptionEvents (EventID, EventName, EventDate, Location) VALUES
(1, 'Puppy Love Adoption', '2025-04-10', 'Mumbai'),
(2, 'Kitten Rescue Fair', '2025-05-15', 'Delhi'),
(3, 'Adopt-a-Pet Day', '2025-06-20', 'Bangalore'),
(4, 'Forever Home Event', '2025-07-25', 'Chennai'),
(5, 'Rescue Me Event', '2025-08-30', 'Hyderabad'),
(6, 'Pawfect Pairing', '2025-09-05', 'Kolkata'),
(7, 'Home for the Holidays', '2025-10-10', 'Pune'),
(8, 'Pet Adoption Extravaganza', '2025-11-15', 'Ahmedabad'),
(9, 'Furry Friends Fest', '2025-12-20', 'Jaipur'),
(10, 'Love a Pet Day', '2026-01-10', 'Lucknow');
GO

-- Insert Data into Participants
INSERT INTO PetPalsSchema.Participants (ParticipantID, ParticipantName, ParticipantType, EventID) VALUES
(1, 'Happy Paws Shelter', 'Shelter', 1),
(2, 'Furry Friends Haven', 'Shelter', 2),
(3, 'Rescue Pals', 'Shelter', 3),
(4, 'Pawfect Home', 'Shelter', 4),
(5, 'Safe Haven Shelter', 'Shelter', 5),
(6, 'Arjun Kumar', 'Adopter', 6),
(7, 'Ananya Sharma', 'Adopter', 7),
(8, 'Vikram Reddy', 'Adopter', 8),
(9, 'Sonia Mehta', 'Adopter', 9),
(10, 'Manoj Verma', 'Adopter', 10);
GO*/

-- View all records from each table
SELECT * FROM PetPalsSchema.Pets;
SELECT * FROM PetPalsSchema.Shelters;
SELECT * FROM PetPalsSchema.Donations;
SELECT * FROM PetPalsSchema.AdoptionEvents;
SELECT * FROM PetPalsSchema.Participants;
