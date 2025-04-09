import pyodbc

class Database:
    _instance = None  # Singleton instance

    def __init__(self):
        if not Database._instance:
            try:
                self.connection = pyodbc.connect(
                    "DRIVER={SQL Server};"
                    "SERVER=DRVENKATESHWAR\\SQLEXPRESS;"  # Replace with actual server name
                    "DATABASE=ShopDB;"
                    "Trusted_Connection=yes;"
                )
                Database._instance = self
                print("✅ Database connection established successfully.")
            except Exception as e:
                print(f"❌ Database Connection Error: {e}")
                self.connection = None  # Ensure connection is explicitly set to None
                Database._instance = self  # Still set instance to prevent NoneType errors

    @staticmethod
    def get_connection():
        """ Returns the database connection instance. """
        if not Database._instance or not Database._instance.connection:
            Database()
        
        if not Database._instance.connection:
            raise Exception("Database connection could not be established.")
        
        return Database._instance.connection

    def close(self):
        if self.connection:
            self.connection.close()
            Database._instance = None
