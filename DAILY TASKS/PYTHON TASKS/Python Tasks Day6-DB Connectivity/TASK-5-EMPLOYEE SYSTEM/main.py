from employee_crud import insert_employee, update_employee, delete_employee, view_employees

def main():
    while True:
        print("\nEmployee System - CRUD Menu")
        print("1. Add Employee")
        print("2. Update Employee")
        print("3. Delete Employee")
        print("4. View Employees")
        print("5. Exit")

        choice = input("Enter your choice (1-5): ")

        if choice == '1':
            empid = int(input("Enter Employee ID: "))
            name = input("Enter Name: ")
            age = int(input("Enter Age: "))
            dept = input("Enter Department: ")
            salary = float(input("Enter Salary: "))
            insert_employee(empid, name, age, dept, salary)

        elif choice == '2':
            empid = int(input("Enter Employee ID to update: "))
            name = input("Enter New Name: ")
            age = int(input("Enter New Age: "))
            dept = input("Enter New Department: ")
            salary = float(input("Enter New Salary: "))
            update_employee(empid, name, age, dept, salary)

        elif choice == '3':
            empid = int(input("Enter Employee ID to delete: "))
            delete_employee(empid)

        elif choice == '4':
            view_employees()

        elif choice == '5':
            print("Exiting... Goodbye!")
            break
        else:
            print("Invalid choice. Please select 1-5.")

if __name__ == "__main__":
    main()
