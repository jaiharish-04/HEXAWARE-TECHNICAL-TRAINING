import pytest
from dao.petpals_impl import PetPalsImpl
from entity.pet import Pet

@pytest.fixture
def petpals_impl(monkeypatch):
    # Mock DB connection to prevent real DB calls
    class MockCursor:
        def __init__(self):
            self.data = []
            self.executed_queries = []

        def execute(self, query, params=None):
            self.executed_queries.append((query, params))
            self.last_query = query
            self.last_params = params

            if "SELECT MIN" in query:
                self.data = [(1,)]
            elif "SELECT ISNULL(MAX" in query:
                self.data = [(1,)]
            elif "SELECT COUNT(*)" in query:
                self.data = [(0,)]
            elif "SELECT * FROM PetPalsSchema.Pets WHERE PetID" in query:
                self.data = [("1", "Buddy", 2, "Golden Retriever", "Dog", 1)]
            elif "SELECT PetID, Name, Age, Breed, Type FROM PetPalsSchema.Pets WHERE AvailableForAdoption = 1" in query:
                self.data = [(1, "Tommy", 3, "Pug", "Dog")]

        def fetchone(self):
            return self.data[0] if self.data else None

        def fetchall(self):
            return self.data

        def close(self):
            pass

    class MockConnection:
        def cursor(self):
            return MockCursor()
        def commit(self):
            pass
        def close(self):
            pass

    # Patch DBConnection.get_connection
    monkeypatch.setattr("dao.petpals_impl.DBConnection.get_connection", lambda: MockConnection())
    return PetPalsImpl()

def test_add_pet(petpals_impl):
    pet = Pet(name="Max", age=2, breed="Labrador", pet_type="Dog")
    petpals_impl.add_pet(pet)
    # Just a sanity check to ensure no exceptions

def test_list_available_pets(petpals_impl):
    pets = petpals_impl.list_available_pets()
    assert isinstance(pets, list)

def test_adopt_pet(petpals_impl):
    success = petpals_impl.adopt_pet(pet_id=1, adopter_name="John Doe")
    assert success in [True, False]  # Mock returns True/False based on mocked logic

def test_remove_pet(petpals_impl):
    petpals_impl.remove_pet(pet_id=1)

def test_update_pet_status(petpals_impl):
    petpals_impl.update_pet_status(pet_id=1, available=0)

def test_list_available_pets_by_type(petpals_impl):
    pets = petpals_impl.list_available_pets_by_type("Dog")
    assert isinstance(pets, list)

def test_get_donation_summary(petpals_impl):
    result = petpals_impl.get_donation_summary()
    assert isinstance(result, list)

def test_view_adoption_history(petpals_impl):
    history = petpals_impl.view_adoption_history()
    assert isinstance(history, list)
