import pyodbc

class DBConnection:
    _connection = None

    @staticmethod
    def get_connection():
        if DBConnection._connection is None:
            try:
                DBConnection._connection = pyodbc.connect(
                    "DRIVER={SQL Server};"
                    "SERVER=DRVENKATESHWAR\\SQLEXPRESS;"
                    "DATABASE=VirtualArtGallery;"
                    "Trusted_Connection=yes;"
                )
            except Exception as e:
                print(f"Error connecting to the database: {e}")
        return DBConnection._connection
