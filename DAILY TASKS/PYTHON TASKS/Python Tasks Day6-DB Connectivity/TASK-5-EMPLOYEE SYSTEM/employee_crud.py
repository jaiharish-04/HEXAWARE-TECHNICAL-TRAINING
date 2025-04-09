from db_connection import get_connection

def insert_employee(empid, name, age, dept, salary):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Employees (EmpID, EmpName, EmpAge, EmpDept, EmpSalary) VALUES (?, ?, ?, ?, ?)",
                   (empid, name, age, dept, salary))
    conn.commit()
    conn.close()
    print("Employee added successfully.")

def update_employee(empid, name, age, dept, salary):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Employees SET EmpName=?, EmpAge=?, EmpDept=?, EmpSalary=? WHERE EmpID=?",
                   (name, age, dept, salary, empid))
    conn.commit()
    conn.close()
    print("Employee updated successfully.")

def delete_employee(empid):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Employees WHERE EmpID=?", (empid,))
    conn.commit()
    conn.close()
    print("Employee deleted successfully.")

def view_employees():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Employees")
    rows = cursor.fetchall()
    conn.close()
    for row in rows:
        print(row)
