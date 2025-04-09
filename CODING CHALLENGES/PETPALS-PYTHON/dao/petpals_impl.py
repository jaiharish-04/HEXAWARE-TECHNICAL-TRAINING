from dao.ipetpals import IPetPals
from util.db_connection import DBConnection

class PetPalsImpl(IPetPals):
    def __init__(self):
        self.conn = DBConnection.get_connection()

    def add_pet(self, pet):
        try:
            cursor = self.conn.cursor()

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
            cursor.execute("SELECT PetID, Name, Age, Breed, Type FROM PetPalsSchema.Pets WHERE AvailableForAdoption = 1")
            pets = cursor.fetchall()
            return pets

        except Exception as e:
            print(f"Error retrieving pets: {e}")
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
            cursor.execute("UPDATE PetPalsSchema.Pets SET AvailableForAdoption = ? WHERE PetID = ?", (available, pet_id))
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
