import math

'''# Task 1: Calculate tax based on income
income = float(input("Enter your taxable income: "))
if income <= 150000:
    tax = 0
elif income <= 300000:
    tax = 0.1 * (income - 150000)
elif income <= 500000:
    tax = (0.1 * 150000) + (0.2 * (income - 300000))
else:
    tax = (0.1 * 150000) + (0.2 * 200000) + (0.3 * (income - 500000))
print(f"Tax to be paid: {tax}")

# Task 2: Calculate the roots of a quadratic equation
a = float(input("Enter coefficient a: "))
b = float(input("Enter coefficient b: "))
c = float(input("Enter coefficient c: "))
discriminant = b**2 - 4*a*c

if discriminant > 0:
    root1 = (-b + math.sqrt(discriminant)) / (2*a)
    root2 = (-b - math.sqrt(discriminant)) / (2*a)
    print(f"Real and Distinct roots: {root1}, {root2}")
elif discriminant == 0:
    root = -b / (2*a)
    print(f"Equal roots: {root}")
else:
    real_part = -b / (2*a)
    imag_part = math.sqrt(abs(discriminant)) / (2*a)
    print(f"Imaginary roots: {real_part} ± {imag_part}i")

# Task 3: Calculate total marks, average, and grade
marks = [float(input(f"Enter marks for subject {i+1}: ")) for i in range(3)]
total = sum(marks)
avg = total / 3

if avg >= 80:
    grade = "A"
elif avg >= 70:
    grade = "B"
elif avg >= 60:
    grade = "C"
else:
    grade = "Fail"
print(f"Total Marks: {total}, Average: {avg}, Grade: {grade}")

# Task 4: Calculate bonus based on years of service
salary = float(input("Enter your salary: "))
years = int(input("Enter years of service: "))

if years >= 10:
    bonus = 0.1 * salary
elif years >= 5:
    bonus = 0.05 * salary
elif years >= 3:
    bonus = 0.03 * salary
else:
    bonus = 0
print(f"Bonus: {bonus}, Total Salary: {salary + bonus}")

# Task 5: Arithmetic operations using match case
operation = input("Enter operation (+, -, *, /, %): ")
num1, num2 = map(float, input("Enter two numbers: ").split())

match operation:
    case "+":
        result = num1 + num2
    case "-":
        result = num1 - num2
    case "*":
        result = num1 * num2
    case "/":
        result = num1 / num2 if num2 != 0 else "Division by zero error"
    case "%":
        result = num1 % num2
    case _:
        result = "Invalid operation"
print(f"Result: {result}")

# Task 6: Find area using match case
choice = int(input("Enter choice (1: Circle, 2: Triangle, 3: Rectangle): "))

match choice:
    case 1:
        r = float(input("Enter radius: "))
        area = math.pi * r * r
    case 2:
        a, b, c = map(float, input("Enter three sides: ").split())
        s = (a + b + c) / 2
        area = math.sqrt(s * (s - a) * (s - b) * (s - c))
    case 3:
        length, width = map(float, input("Enter length and width: ").split())
        area = length * width
    case _:
        area = "Invalid choice"
print(f"Area: {area}")

# Task 7: Sum of numbers from m to n
m, n = map(int, input("Enter two numbers (m, n): ").split())
print(f"Sum from {m} to {n}: {sum(range(m, n+1))}")

# Task 8: Check if a number is an Armstrong number
num = int(input("Enter a number: "))
sum_of_cubes = sum(int(digit) ** 3 for digit in str(num))
print("Armstrong Number" if sum_of_cubes == num else "Not an Armstrong Number")

# Task 9: Convert decimal to binary
decimal = int(input("Enter a decimal number: "))
print(f"Binary equivalent: {bin(decimal)[2:]}")'''

# Task 10: Check if a number is a palindrome
num = input("Enter a number: ")
print("Palindrome number" if num == num[::-1] else "Not a palindrome")
