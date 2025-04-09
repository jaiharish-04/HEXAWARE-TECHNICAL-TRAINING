from db_connection import get_connection

def insert_student():
    conn = get_connection()
    cursor = conn.cursor()
    while True:
        name = input("Enter Student Name: ")
        age = int(input("Enter Student Age: "))
        dept = input("Enter Department: ")
        
        cursor.execute("INSERT INTO Students (Name, Age, Department) VALUES (?, ?, ?)", (name, age, dept))
        conn.commit()
        
        more = input("Do you want to insert one more row? (y/n): ").lower()
        if more != 'y':
            break
    conn.close()

insert_student()
