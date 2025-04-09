import pyodbc

def get_connection():
    conn = pyodbc.connect(
        'DRIVER={SQL Server};'
        'SERVER=DRVENKATESHWAR\\SQLEXPRESS;'
        'DATABASE=EmployeeDB;'
        'Trusted_Connection=yes;'
    )
    return conn
