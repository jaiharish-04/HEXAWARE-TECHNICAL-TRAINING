class Student:
    def __init__(self, rollno, name, marks):
        self.rollno = rollno
        self.name = name
        self.marks = marks

    def total(self):
        return sum(self.marks)

n = int(input("Enter number of students: "))
students = []

for _ in range(n):
    rollno = int(input("Roll No: "))
    name = input("Name: ")
    marks = list(map(int, input("Enter marks: ").split()))
    students.append(Student(rollno, name, marks))

for s in students:
    print(f"{s.rollno} - {s.name} - Total Marks: {s.total()}")
