import math

"""# Task 1: Convert Celsius to Fahrenheit
celsius = float(input("Enter temperature in Celsius: "))
fahrenheit = (celsius * 9/5) + 32
print(f"Temperature in Fahrenheit: {fahrenheit}")

# Task 2: Find the area of a cube
side = float(input("Enter the side length of the cube: "))
area_cube = 6 * (side ** 2)
print(f"Surface area of the cube: {area_cube}")

# Task 3: Find the area of a cylinder
radius = float(input("Enter the radius of the cylinder: "))
height = float(input("Enter the height of the cylinder: "))
area_cylinder = 2 * math.pi * radius * (radius + height)
print(f"Surface area of the cylinder: {area_cylinder}")

# Task 4: Display hex, octal values, and square root
num = int(input("Enter a number: "))
print(f"Hexadecimal: {hex(num)}, Octal: {oct(num)}, Square Root: {math.sqrt(num)}")

# Task 5: Print the digit at one's place
num = int(input("Enter a number: "))
ones_digit = num % 10
print(f"One's place digit: {ones_digit}")

# Task 6: Memory location and identity check
var1 = int(input("Enter first number: "))
var2 = int(input("Enter second number: "))
print(f"Memory location of var1: {id(var1)}, Memory location of var2: {id(var2)}")
print(f"Variables use same memory location: {var1 is var2}")

# Task 7: Calculate the volume of a sphere
radius = float(input("Enter the radius of the sphere: "))
volume = (4/3) * math.pi * (radius ** 3)
print(f"Volume of the sphere: {volume}")

# Task 8: Calculate amount payable after simple interest
principal = float(input("Enter principal amount: "))
rate = float(input("Enter annual interest rate (in %): "))
time = float(input("Enter time (in years): "))
simple_interest = (principal * rate * time) / 100
amount_payable = principal + simple_interest
print(f"Amount payable after simple interest: {amount_payable}")"""

# Task 9: Calculate amount payable after compound interest
principal = float(input("Enter principal amount: "))
rate = float(input("Enter annual interest rate (in %): "))
time = float(input("Enter time (in years): "))
compound_interest = principal * (pow((1 + rate / 100), time)) - principal
amount_payable = principal + compound_interest
print(f"Amount payable after compound interest: {amount_payable}")
