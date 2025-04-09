from entity.pet import Pet

class Dog(Pet):
    def __init__(self, pet_id, name, age, breed, available_for_adoption):
        super().__init__(pet_id, name, age, breed, "Dog", available_for_adoption)
