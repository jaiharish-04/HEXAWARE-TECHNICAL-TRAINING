from db_connection import get_connection

def add_row():
    conn = get_connection()
    cursor = conn.cursor()
    name = input("Enter Name: ")
    age = int(input("Enter Age: "))
    dept = input("Enter Department: ")
    cursor.execute("INSERT INTO Students (Name, Age, Department) VALUES (?, ?, ?)", (name, age, dept))
    conn.commit()
    conn.close()

def update_row():
    conn = get_connection()
    cursor = conn.cursor()
    sid = int(input("Enter Student ID to update: "))
    name = input("Enter New Name: ")
    age = int(input("Enter New Age: "))
    dept = input("Enter New Department: ")
    cursor.execute("UPDATE Students SET Name=?, Age=?, Department=? WHERE StudentID=?", (name, age, dept, sid))
    conn.commit()
    conn.close()

def delete_row():
    conn = get_connection()
    cursor = conn.cursor()
    sid = int(input("Enter Student ID to delete: "))
    cursor.execute("DELETE FROM Students WHERE StudentID=?", (sid,))
    conn.commit()
    conn.close()

def select_rows():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Students")
    for row in cursor.fetchall():
        print(row)
    conn.close()

def crud_app():
    while True:
        print("\n1. Add Row\n2. Update Row\n3. Delete Row\n4. Select Rows\n5. Exit")
        choice = input("Enter your choice: ")
        if choice == '1':
            add_row()
        elif choice == '2':
            update_row()
        elif choice == '3':
            delete_row()
        elif choice == '4':
            select_rows()
        elif choice == '5':
            break
        else:
            print("Invalid choice.")

crud_app()
