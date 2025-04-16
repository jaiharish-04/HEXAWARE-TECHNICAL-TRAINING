from dao.ipetpals import IPetPals
from util.db_connection import DBConnection
from datetime import datetime  # To use the current date and time for adoption date


class PetPalsImpl(IPetPals):
    def __init__(self):
        self.conn = DBConnection.get_connection()

    def add_pet(self, pet):
        try:
            cursor = self.conn.cursor()

            # Find missing PetID if any, else get next ID
            cursor.execute("""
                SELECT MIN(t1.PetID + 1) 
                FROM PetPalsSchema.Pets t1 
                LEFT JOIN PetPalsSchema.Pets t2 ON t1.PetID + 1 = t2.PetID 
                WHERE t2.PetID IS NULL
            """)
            next_id = cursor.fetchone()[0]

            if next_id is None:
                cursor.execute("SELECT ISNULL(MAX(PetID) + 1, 1) FROM PetPalsSchema.Pets")
                next_id = cursor.fetchone()[0]

            # Double check next_id is not taken
            cursor.execute("SELECT COUNT(*) FROM PetPalsSchema.Pets WHERE PetID = ?", (next_id,))
            existing_id_count = cursor.fetchone()[0]

            if existing_id_count > 0:
                cursor.execute("""
                    SELECT MIN(t1.PetID + 1)
                    FROM PetPalsSchema.Pets t1 
                    LEFT JOIN PetPalsSchema.Pets t2 ON t1.PetID + 1 = t2.PetID 
                    WHERE t2.PetID IS NULL
                """)
                next_id = cursor.fetchone()[0]

                if next_id is None:
                    cursor.execute("SELECT ISNULL(MAX(PetID) + 1, 1) FROM PetPalsSchema.Pets")
                    next_id = cursor.fetchone()[0]

            query = """
                INSERT INTO PetPalsSchema.Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) 
                VALUES (?, ?, ?, ?, ?, ?)
            """
            cursor.execute(query, (next_id, pet.get_name(), pet.get_age(), pet.get_breed(), pet.get_pet_type(), 1))
            self.conn.commit()

            print(f"Pet '{pet.get_name()}' added successfully with ID {next_id}.")

        except Exception as e:
            print(f"Error adding pet: {e}")

    def list_available_pets(self):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                SELECT PetID, Name, Age, Breed, Type 
                FROM PetPalsSchema.Pets 
                WHERE AvailableForAdoption = 1
            """)
            pets = cursor.fetchall()
            return pets

        except Exception as e:
            print(f"Error retrieving pets: {e}")
            return []

    def list_available_pets_by_type(self, pet_type):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                SELECT PetID, Name, Age, Breed, Type 
                FROM PetPalsSchema.Pets 
                WHERE Type = ? AND AvailableForAdoption = 1
            """, (pet_type,))
            pets = cursor.fetchall()
            return pets

        except Exception as e:
            print(f"Error retrieving pets by type: {e}")
            return []

    def remove_pet(self, pet_id):
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT * FROM PetPalsSchema.Pets WHERE PetID = ?", (pet_id,))
            pet = cursor.fetchone()

            if pet:
                cursor.execute("DELETE FROM PetPalsSchema.Pets WHERE PetID = ?", (pet_id,))
                self.conn.commit()
                print(f"Pet with ID {pet_id} removed successfully.")
            else:
                print(f"Pet with ID {pet_id} not found.")

        except Exception as e:
            print(f"Error removing pet: {e}")

    def update_pet_status(self, pet_id, available):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                UPDATE PetPalsSchema.Pets 
                SET AvailableForAdoption = ? 
                WHERE PetID = ?
            """, (available, pet_id))
            self.conn.commit()
            print(f"Pet ID {pet_id} availability updated to {'Available' if available else 'Adopted'}.")
        except Exception as e:
            print(f"Error updating pet status: {e}")

    def get_donation_summary(self):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                SELECT 
                    DonorName,
                    COUNT(*) AS NumberOfDonations,
                    SUM(CASE 
                        WHEN DonationAmount IS NOT NULL AND DonationAmount > 0 
                        THEN DonationAmount 
                        ELSE 0 
                    END) AS TotalCashDonated
                FROM PetPalsSchema.Donations
                GROUP BY DonorName
                HAVING SUM(CASE 
                        WHEN DonationAmount IS NOT NULL AND DonationAmount > 0 
                        THEN DonationAmount 
                        ELSE 0 
                    END) > 0
                ORDER BY TotalCashDonated DESC
            """)
            results = cursor.fetchall()
            return results

        except Exception as e:
            print(f"Error retrieving donation summary: {e}")
            return []

    def adopt_pet(self, pet_id, adopter_name):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                SELECT PetID, Name, Age, Breed, Type, AvailableForAdoption 
                FROM PetPalsSchema.Pets 
                WHERE PetID = ?
            """, (pet_id,))
            pet = cursor.fetchone()

            if not pet:
                print(f"No pet found with ID {pet_id}.")
                return False

            if pet[5] == 0:
                print(f"Pet '{pet[1]}' has already been adopted.")
                return False

            # Update the pet's availability status to adopted (AvailableForAdoption = 0)
            cursor.execute("""
                UPDATE PetPalsSchema.Pets 
                SET AvailableForAdoption = 0 
                WHERE PetID = ?
            """, (pet_id,))

            # Insert the adoption record into the Adoptions table
            adoption_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            cursor.execute("""
                INSERT INTO PetPalsSchema.Adoptions (PetID, PetName, PetType, PetBreed, AdoptedBy, AdoptedDate)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (pet_id, pet[1], pet[4], pet[3], adopter_name, adoption_date))

            self.conn.commit()

            print(f"Pet '{pet[1]}' has been adopted successfully by {adopter_name}!")
            return True

        except Exception as e:
            print(f"Error adopting pet: {e}")
            return False

    def view_adoption_history(self):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                SELECT p.PetID, p.Name, p.Type, p.Age, p.Breed, a.AdoptedBy, a.AdoptedDate
                FROM PetPalsSchema.Pets p
                LEFT JOIN PetPalsSchema.Adoptions a ON p.PetID = a.PetID
                WHERE p.AvailableForAdoption = 0  -- Only show adopted pets
                ORDER BY p.PetID DESC  -- Order by PetID, most recent adoption first
            """)
            adoptions = cursor.fetchall()

            # If there are adoptions, format them for easy reading
            if adoptions:
                adoption_summary = []
                for adoption in adoptions:
                    adoption_details = {
                        "PetID": adoption[0],
                        "PetName": adoption[1],
                        "PetType": adoption[2],
                        "PetAge": adoption[3],
                        "PetBreed": adoption[4],
                        "AdoptedBy": adoption[5],
                        "AdoptedDate": adoption[6]
                    }
                    adoption_summary.append(adoption_details)

                return adoption_summary
            else:
                print("No adoptions made so far.")
                return []

        except Exception as e:
            print(f"Error retrieving adoption summary: {e}")
            return []
