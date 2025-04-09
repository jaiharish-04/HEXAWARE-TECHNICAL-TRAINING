from exceptions import InvalidDataException  # Custom Exception Handling


class Product:
    def __init__(self, product_id, name, category=None, price=0.0, stock=0):
        self.__product_id = product_id
        self.__name = name
        self.__category = category if category is not None else "General"  # Default category
        self.__price = price
        self.__stock = stock

    #  Getters
    @property
    def product_id(self):
        return self.__product_id

    @property
    def name(self):
        return self.__name

    @property
    def category(self):
        return self.__category

    @property
    def price(self):
        return self.__price

    @property
    def stock(self):
        return self.__stock

    #  Setters (Ensure validation if needed)
    @price.setter
    def price(self, value):
        if value < 0:
            raise ValueError("❌ Price cannot be negative!")
        self.__price = value

    @stock.setter
    def stock(self, value):
        if value < 0:
            raise ValueError("❌ Stock quantity cannot be negative!")
        self.__stock = value

    #  Convert Object to Dictionary (Useful for Database Operations)
    def to_dict(self):
        return {
            "product_id": self.__product_id,
            "name": self.__name,
            "category": self.__category,
            "price": self.__price,
            "stock": self.__stock
        }

    #  String Representation for Readability
    def __str__(self):
        """ Returns a readable string representation of the product """
        return (f"Product ID: {self.__product_id}, Name: {self.__name}, "
                f"Category: {self.__category}, Price: ${self.__price:.2f}, Stock: {self.__stock}")

    def __repr__(self):
        """ Returns a developer-friendly representation of the product """
        return (f"Product({self.__product_id}, '{self.__name}', '{self.__category}', "
                f"{self.__price}, {self.__stock})")
