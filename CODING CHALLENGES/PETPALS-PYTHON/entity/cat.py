from entity.pet import Pet

class Cat(Pet):
    def __init__(self, pet_id, name, age, breed, available_for_adoption):
        super().__init__(pet_id, name, age, breed, "Cat", available_for_adoption)
