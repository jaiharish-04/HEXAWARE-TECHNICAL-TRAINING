class Pet:
    def __init__(self, name, age, breed, pet_type):
        self._name = name
        self._age = age
        self._breed = breed
        self._pet_type = pet_type  # Added pet_type attribute

    # Getters
    def get_name(self):
        return self._name

    def get_age(self):
        return self._age

    def get_breed(self):
        return self._breed

    def get_pet_type(self):  # Added getter method
        return self._pet_type

    # Setters
    def set_name(self, name):
        self._name = name

    def set_age(self, age):
        self._age = age

    def set_breed(self, breed):
        self._breed = breed

    def set_pet_type(self, pet_type):  # Added setter method
        self._pet_type = pet_type

    def __str__(self):
        return f"Pet(Name: {self._name}, Age: {self._age}, Breed: {self._breed}, Type: {self._pet_type})"


class Dog(Pet):
    def __init__(self, name, age, breed, dog_breed):
        super().__init__(name, age, breed, "Dog")  # Set pet_type to "Dog"
        self._dog_breed = dog_breed

    def get_dog_breed(self):
        return self._dog_breed

    def set_dog_breed(self, dog_breed):
        self._dog_breed = dog_breed

    def __str__(self):
        return f"Dog(Name: {self.get_name()}, Age: {self.get_age()}, Breed: {self.get_breed()}, Dog Breed: {self._dog_breed})"


class Cat(Pet):
    def __init__(self, name, age, breed, cat_color):
        super().__init__(name, age, breed, "Cat")  # Set pet_type to "Cat"
        self._cat_color = cat_color

    def get_cat_color(self):
        return self._cat_color

    def set_cat_color(self, cat_color):
        self._cat_color = cat_color

    def __str__(self):
        return f"Cat(Name: {self.get_name()}, Age: {self.get_age()}, Breed: {self.get_breed()}, Color: {self._cat_color})"
