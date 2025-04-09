from db_connection import get_connection

def update_student():
    conn = get_connection()
    cursor = conn.cursor()
    
    student_id = int(input("Enter Student ID to update: "))
    new_name = input("Enter new name: ")
    new_age = int(input("Enter new age: "))
    new_dept = input("Enter new department: ")
    
    cursor.execute("UPDATE Students SET Name=?, Age=?, Department=? WHERE StudentID=?", (new_name, new_age, new_dept, student_id))
    conn.commit()
    conn.close()
    print("Student updated successfully.")

update_student()
