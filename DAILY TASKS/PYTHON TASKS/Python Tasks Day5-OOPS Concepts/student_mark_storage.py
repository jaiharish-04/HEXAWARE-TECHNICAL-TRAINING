class Student:
    def __init__(self, name, marks):
        self.name = name
        self.marks = marks  # list of 3 subject marks

    def display(self):
        print(f"Name: {self.name}, Marks: {self.marks}")

n = int(input("Enter number of students: "))
students = []

for _ in range(n):
    name = input("Enter student name: ")
    marks = list(map(int, input("Enter 3 subject marks: ").split()))
    students.append(Student(name, marks))

for s in students:
    s.display()
