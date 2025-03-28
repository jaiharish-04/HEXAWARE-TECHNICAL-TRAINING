USE PetPals;
GO

/*-- 5. Retrieve a list of available pets for adoption
SELECT Name, Age, Breed, Type 
FROM Pets 
WHERE AvailableForAdoption = 1;
GO

-- 6. Retrieve names of participants registered for a specific adoption event
DECLARE @EventID INT = 1; -- Change the event ID as needed
SELECT p.ParticipantName, p.ParticipantType
FROM Participants p
WHERE p.EventID = @EventID;
GO

-- 7. Stored Procedure: Update shelter information
CREATE OR ALTER PROCEDURE UpdateShelterInfo
    @ShelterID INT,
    @NewName VARCHAR(100),
    @NewLocation VARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Shelters WHERE ShelterID = @ShelterID)
    BEGIN
        UPDATE Shelters
        SET Name = @NewName, Location = @NewLocation
        WHERE ShelterID = @ShelterID;
        PRINT 'Shelter updated successfully';
    END
    ELSE
    BEGIN
        PRINT 'Error: Shelter ID not found';
    END
END;
GO

-- 8. Retrieve total donation amount for each shelter
SELECT s.Name AS ShelterName, COALESCE(SUM(d.DonationAmount), 0) AS TotalDonations
FROM Shelters s
LEFT JOIN Donations d ON s.ShelterID = d.DonationID
GROUP BY s.Name;
GO

-- 9. Retrieve pets that do not have an owner
SELECT Name, Age, Breed, Type 
FROM Pets 
WHERE OwnerID IS NULL;
GO

-- 10. Retrieve total donation amount per month and year
SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear, 
       COALESCE(SUM(DonationAmount), 0) AS TotalDonation
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy')
ORDER BY MIN(DonationDate);
GO

-- 11. Retrieve distinct breeds of pets aged between 1-3 years or older than 5 years
SELECT DISTINCT Breed 
FROM Pets 
WHERE Age BETWEEN 1 AND 3 OR Age > 5;
GO

-- 12. Retrieve a list of pets and their respective shelters where pets are available for adoption
SELECT p.Name AS PetName, s.Name AS ShelterName
FROM Pets p
JOIN Shelters s ON p.ShelterID = s.ShelterID
WHERE p.AvailableForAdoption = 1;
GO

-- 13. Find total number of participants in events organized by shelters in a specific city
DECLARE @City VARCHAR(255) = 'Chennai'; -- Change city name as needed
SELECT COUNT(p.ParticipantID) AS TotalParticipants
FROM Participants p
JOIN AdoptionEvents e ON p.EventID = e.EventID
WHERE e.Location = @City;
GO

-- 14. Retrieve unique breeds of pets aged between 1 and 5 years
SELECT DISTINCT Breed 
FROM Pets 
WHERE Age BETWEEN 1 AND 5;
GO

-- 15. Find pets that have not been adopted
SELECT * 
FROM Pets 
WHERE OwnerID IS NULL;
GO

-- 16. Retrieve names of all adopted pets along with adopter's name
SELECT p.Name AS PetName, u.Name AS AdopterName
FROM Pets p
JOIN Adoption a ON p.PetID = a.PetID
JOIN Users u ON a.AdopterID = u.UserID;
GO

-- 17. Retrieve all shelters along with the count of pets available for adoption
SELECT s.Name AS ShelterName, COUNT(p.PetID) AS AvailablePets
FROM Shelters s
LEFT JOIN Pets p ON s.ShelterID = p.ShelterID AND p.AvailableForAdoption = 1
GROUP BY s.Name;
GO

-- 18. Find pairs of pets from the same shelter that have the same breed
SELECT p1.Name AS Pet1, p2.Name AS Pet2, p1.Breed, s.Name AS ShelterName
FROM Pets p1
JOIN Pets p2 ON p1.ShelterID = p2.ShelterID AND p1.Breed = p2.Breed AND p1.PetID < p2.PetID
JOIN Shelters s ON p1.ShelterID = s.ShelterID;
GO

-- 19. List all possible combinations of shelters and adoption events
SELECT s.Name AS ShelterName, e.EventName
FROM Shelters s
CROSS JOIN AdoptionEvents e;
GO*/

-- 20. Determine the shelter with the highest number of adopted pets
SELECT TOP 1 s.Name AS ShelterName, COUNT(a.PetID) AS TotalAdopted
FROM Shelters s
JOIN Pets p ON s.ShelterID = p.ShelterID
JOIN Adoption a ON p.PetID = a.PetID
GROUP BY s.Name
ORDER BY COUNT(a.PetID) DESC;
GO
