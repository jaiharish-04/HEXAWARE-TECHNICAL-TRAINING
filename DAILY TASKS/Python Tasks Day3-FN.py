'''# Task 1: Calculate the mean of a given list of numbers
numbers = [10, 20, 30, 40, 50]
mean_value = sum(numbers) / len(numbers)
print("Mean:", mean_value)

# Task 2: Search for an element in a given list of numbers
numbers = [10, 20, 30, 40, 50]
search_element = int(input("Enter element to search: "))
if search_element in numbers:
    print(f"{search_element} found at index {numbers.index(search_element)}")
else:
    print(f"{search_element} not found")

# Task 3: Find the maximum element from two lists and its index
list1 = [10, 20, 30, 40]
list2 = [50, 60, 25, 35]
max_list1 = max(list1)
max_list2 = max(list2)
if max_list1 > max_list2:
    print(f"Max element is {max_list1} at index {list1.index(max_list1)} in list1")
else:
    print(f"Max element is {max_list2} at index {list2.index(max_list2)} in list2")

# Task 4: Find the second largest number in a list
numbers = [10, 20, 30, 40, 50]
numbers.sort(reverse=True)
print("Second largest number:", numbers[1])

# Task 5: Create a nested tuple for student marks
marks = ((45, 45, 40), (80, 80, 70), (56, 67, 78), (70, 60, 50), (35, 45, 56))
print("Marks Tuple:", marks)

# Task 6: Extract even and odd values from a dictionary and find their sums
data = {'a': 10, 'b': 25, 'c': 34, 'd': 17, 'e': 50}
even_values = [v for v in data.values() if v % 2 == 0]
odd_values = [v for v in data.values() if v % 2 != 0]
print("Even values:", even_values, "Sum:", sum(even_values))
print("Odd values:", odd_values, "Sum:", sum(odd_values))

# Task 7: Find the highest 2 values from a dictionary
values = list(data.values())
values.sort(reverse=True)
print("Highest 2 values:", values[:2])'''

# Task 8: Display product information from a dictionary
products = {
    'P001': {'name': 'Laptop', 'price': 50000, 'stock': 10},
    'P002': {'name': 'Mouse', 'price': 500, 'stock': 50},
    'P003': {'name': 'Keyboard', 'price': 1000, 'stock': 30}
}
for key, value in products.items():
    print(f"Product ID: {key}, Name: {value['name']}, Price: {value['price']}, Stock: {value['stock']}")
