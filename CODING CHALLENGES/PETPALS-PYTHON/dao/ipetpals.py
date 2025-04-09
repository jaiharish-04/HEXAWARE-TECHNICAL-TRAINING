from abc import ABC, abstractmethod

class IPetPals(ABC):
    @abstractmethod
    def add_pet(self, pet):
        pass

    @abstractmethod
    def list_available_pets(self):
        pass

    @abstractmethod
    def remove_pet(self, pet_id):
        pass

    @abstractmethod
    def get_donation_summary(self):
        """
        Returns donor names, number of donations, and total cash amount donated.
        For item donations, amount will be shown as 0.
        """
        pass
