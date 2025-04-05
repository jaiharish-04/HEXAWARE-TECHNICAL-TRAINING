'''# Task 1: Print pattern
# * * * * *
# * * * *
# * * *
# * *
# *
for i in range(5, 0, -1):  
    for j in range(i):  
        print('*', end=' ')  
    print()  

# Task 2: Print pattern
# 1 2 3 4 5
# 1 2 3 4
# 1 2 3
# 1 2
# 1
for i in range(5, 0, -1):  
    for j in range(1, i + 1):  
        print(j, end=' ')  
    print()  

# Task 3: Print pattern
# 1
# 1 2 1
# 1 2 2 1
# 1 2 2 2 1
for i in range(1, 6):  
    for j in range(1, i + 1):  
        if j == 1 or j == i:  
            print(1, end=' ')  
        else:  
            print(2, end=' ')  
    print()  

# Task 4: Print pattern
# 5 5 5 5 5
# 4 4 4 4
# 3 3 3
# 2 2
# 1
for i in range(5, 0, -1):  
    for j in range(i):  
        print(i, end=' ')  
    print()  

# Task 5: Print pattern
# 1
# 2 3
# 4 5 6
# 7 8 9 10
num = 1  
for i in range(1, 5):  
    for j in range(i):  
        print(num, end=' ')  
        num += 1  
    print()  

# Task 6: Sum of even and odd numbers
even_sum, odd_sum = 0, 0  
for _ in range(10):  
    num = int(input("Enter a number: "))  
    if num % 2 == 0:  
        even_sum += num  
    else:  
        odd_sum += num  
print(f"Sum of even numbers: {even_sum}")  
print(f"Sum of odd numbers: {odd_sum}")  

# Task 7: Fibonacci series
n = int(input("Enter number of terms: "))  
a, b = 0, 1  
for _ in range(n):  
    print(a, end=" ")  
    a, b = b, a + b  
print()  

# Task 8: Simple calculator using a while loop
while True:  
    print("\nCalculator Menu:\n1. Add\n2. Subtract\n3. Multiply\n4. Divide\n5. Exit")  
    choice = int(input("Enter choice: "))  
    if choice == 5:  
        break  
    num1, num2 = map(float, input("Enter two numbers: ").split())  
    if choice == 1:  
        print(f"Result: {num1 + num2}")  
    elif choice == 2:  
        print(f"Result: {num1 - num2}")  
    elif choice == 3:  
        print(f"Result: {num1 * num2}")  
    elif choice == 4:  
        print(f"Result: {num1 / num2 if num2 != 0 else 'Error: Division by zero'}")  
    else:  
        print("Invalid choice")''' 

# Task 9: Check if a string is a palindrome
string = input("Enter a string: ").upper()  
print("Palindrome" if string == string[::-1] else "Not a palindrome")  
