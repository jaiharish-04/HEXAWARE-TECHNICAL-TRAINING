USE PetPals;
GO

/*-- 1. Retrieve a list of all pets available for adoption.
SELECT PetID, Name, Age, Breed, Type 
FROM Pets
WHERE AvailableForAdoption = 1;
GO

-- 2. Find the total number of pets available for adoption.
SELECT COUNT(*) AS TotalAvailablePets
FROM Pets
WHERE AvailableForAdoption = 1;
GO

-- 3. List all shelters and their locations.
SELECT ShelterID, Name, Location 
FROM Shelters;
GO

-- 4. Find the total amount of cash donations received.
SELECT SUM(DonationAmount) AS TotalCashDonations
FROM Donations
WHERE DonationType = 'Cash';
GO

-- 5. Retrieve a list of all donation items along with donor names.
SELECT DonorName, DonationItem 
FROM Donations
WHERE DonationType = 'Item';
GO

-- 6. Get details of the next adoption event (the one happening soonest).
SELECT TOP 1 EventID, EventName, EventDate, Location 
FROM AdoptionEvents
ORDER BY EventDate ASC;
GO

-- 7. List all participants along with their type (Shelter/Adopter) for a specific event.
-- Replace 1 with the desired EventID
SELECT ParticipantID, ParticipantName, ParticipantType
FROM Participants
WHERE EventID = 1;
GO

-- 8. Find the total number of adoption events scheduled in a particular year.
-- Replace '2025' with the desired year.
SELECT COUNT(*) AS TotalEvents
FROM AdoptionEvents
WHERE YEAR(EventDate) = 2025;
GO

-- 9. Retrieve the most generous donor based on cash donations.
SELECT TOP 1 DonorName, SUM(DonationAmount) AS TotalDonated
FROM Donations
WHERE DonationType = 'Cash'
GROUP BY DonorName
ORDER BY TotalDonated DESC;
GO*/

-- 10. Find all shelters that have participated in at least one adoption event.
SELECT DISTINCT s.ShelterID, s.Name, s.Location
FROM Shelters s
JOIN Participants p ON s.Name = p.ParticipantName
WHERE p.ParticipantType = 'Shelter';
GO
