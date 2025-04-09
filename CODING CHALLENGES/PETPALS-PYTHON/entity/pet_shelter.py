from util.db_connection import DBConnection
from entity.pet import Pet

class PetShelter:
    def __init__(self):
        self.conn = DBConnection.get_connection()

    def list_pets(self):
        """Fetches and lists pets from the database"""
        try:
            cursor = self.conn.cursor()
            query = """SELECT PetID, Name, Age, Breed, Type, AvailableForAdoption 
                       FROM petpals.Pets"""  # Updated to include 'petpals' schema
            cursor.execute(query)
            pets = cursor.fetchall()
            return [Pet(*pet) for pet in pets]

        except Exception as e:
            print(f"❌ Error fetching pets: {e}")
            return []

    def add_pet(self, pet):
        """Adds a pet to the database"""
        try:
            cursor = self.conn.cursor()
            query = """INSERT INTO petpals.Pets (Name, Age, Breed, Type, AvailableForAdoption) 
                       VALUES (?, ?, ?, ?, ?)"""  # Updated to include 'petpals' schema
            cursor.execute(query, (pet.get_name(), pet.get_age(), pet.get_breed(), pet.get_pet_type(), 1))
            self.conn.commit()
            print(f"✅ Pet '{pet.get_name()}' added successfully.")

        except Exception as e:
            print(f"❌ Error adding pet: {e}")

    def remove_pet(self, pet_id):
        """Removes a pet from the database"""
        try:
            cursor = self.conn.cursor()
            query = "DELETE FROM petpals.Pets WHERE PetID = ?"  # Updated to include 'petpals' schema
            cursor.execute(query, (pet_id,))
            self.conn.commit()
            print(f"✅ Pet with ID {pet_id} removed successfully.")

        except Exception as e:
            print(f"❌ Error removing pet: {e}")
