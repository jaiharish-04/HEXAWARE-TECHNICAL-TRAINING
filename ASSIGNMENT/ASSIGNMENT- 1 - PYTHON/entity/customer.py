import re  # For email validation

# ✅ FIX: Use a relative import to avoid "ModuleNotFoundError"
try:
    from exceptions.custom_exceptions import InvalidDataException
except ModuleNotFoundError:
    from ..exceptions.custom_exceptions import InvalidDataException  # Relative import for package structure


class Customer:
    def __init__(self, customer_id, first_name, last_name, email, phone, address):
        self.__customer_id = customer_id
        self.__first_name = first_name
        self.__last_name = last_name
        self.email = email  # Uses setter with validation
        self.phone = phone  # Uses setter with validation
        self.address = address  # Uses setter with validation

    # ✅ Getters (Read-Only for Customer ID)
    @property
    def customer_id(self):
        return self.__customer_id

    @property
    def first_name(self):
        return self.__first_name

    @property
    def last_name(self):
        return self.__last_name

    @property
    def email(self):
        return self.__email

    @property
    def phone(self):
        return self.__phone

    @property
    def address(self):
        return self.__address

    # ✅ Setters with Validation
    @email.setter
    def email(self, value):
        if not re.match(r"[^@]+@[^@]+\.[^@]+", value):
            raise InvalidDataException("❌ Invalid email format!")
        self.__email = value

    @phone.setter
    def phone(self, value):
        if not value.isdigit() or len(value) != 10:
            raise InvalidDataException("❌ Phone number must contain exactly 10 digits!")
        self.__phone = value

    @address.setter
    def address(self, value):
        if not value.strip():
            raise InvalidDataException("❌ Address cannot be empty!")
        self.__address = value

    # ✅ Returns Customer's Full Name
    def get_full_name(self):
        return f"{self.__first_name} {self.__last_name}"

    # ✅ Get Customer Details (For Display)
    def get_customer_details(self):
        return (f"Customer {self.__customer_id}: {self.get_full_name()}, "
                f"Email: {self.__email}, Phone: {self.__phone}, Address: {self.__address}")

    # ✅ Method to Update Customer Info with Proper Validation
    def update_customer_info(self, email=None, phone=None, address=None):
        if email:
            self.email = email  # Uses setter for validation
        if phone:
            self.phone = phone  # Uses setter for validation
        if address:
            self.address = address  # Uses setter for validation

    # ✅ Convert Object to Dictionary (Useful for Database Operations)
    def to_dict(self):
        return {
            "customer_id": self.__customer_id,
            "first_name": self.__first_name,
            "last_name": self.__last_name,
            "email": self.__email,
            "phone": self.__phone,
            "address": self.__address,
        }

    # ✅ Fix: String Representation for Readability
    def __str__(self):
        """ Returns a readable string representation of the customer """
        return (f"Customer ID: {self.__customer_id}, Full Name: {self.get_full_name()}, "
                f"Email: {self.__email}, Phone: {self.__phone}, Address: {self.__address}")

    def __repr__(self):
        """ Returns a developer-friendly representation of the customer """
        return (f"Customer({self.__customer_id}, '{self.__first_name}', '{self.__last_name}', "
                f"'{self.__email}', '{self.__phone}', '{self.__address}')")
