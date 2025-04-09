class DatabaseException(Exception):
    """Raised when there is a database connection issue"""
    def __init__(self, message="Database connection failed."):
        self.message = message
        super().__init__(self.message)

class PetException(Exception):
    """Raised for errors related to pets (adding, removing, etc.)"""
    def __init__(self, message="Pet operation failed."):
        self.message = message
        super().__init__(self.message)

class DonationException(Exception):
    """Raised when an error occurs while recording a donation"""
    def __init__(self, message="Donation operation failed."):
        self.message = message
        super().__init__(self.message)

class EventException(Exception):
    """Raised for errors related to adoption events"""
    def __init__(self, message="Event operation failed."):
        self.message = message
        super().__init__(self.message)
