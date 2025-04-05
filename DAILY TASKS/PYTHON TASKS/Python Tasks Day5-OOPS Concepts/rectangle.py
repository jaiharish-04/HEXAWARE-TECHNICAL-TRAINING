class Rectangle:
    def __init__(self, length, breadth):
        self.__length = length
        self.__breadth = breadth

    def area(self):
        return self.__length * self.__breadth

r = Rectangle(5, 3)
print("Area of rectangle:", r.area())
