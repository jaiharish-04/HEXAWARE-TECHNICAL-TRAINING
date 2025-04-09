import pyodbc

class DBConnection:
    @staticmethod
    def get_connection():
        try:
            conn = pyodbc.connect(
                "DRIVER={SQL Server};"
                "SERVER=DRVENKATESHWAR\\SQLEXPRESS;"  # Replace with your SQL Server name
                "DATABASE=PetPals;"
                "Trusted_Connection=yes;"
            )
            return conn
        except Exception as e:
            print(f"❌ Error connecting to database: {e}")
            return None
