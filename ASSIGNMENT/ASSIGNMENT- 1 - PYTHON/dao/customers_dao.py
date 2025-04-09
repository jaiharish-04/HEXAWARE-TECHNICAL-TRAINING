from util.db_connection import Database
from exceptions.custom_exceptions import DatabaseException, InvalidDataException
from entity.customer import Customer  # Import the Customer entity

class CustomersDAO:
    def __init__(self):
        """ Establish database connection """
        try:
            self.conn = Database.get_connection()
            if self.conn is None:
                raise DatabaseException("Failed to establish database connection.")
        except Exception as e:
            raise DatabaseException(f"Database connection error: {e}")

    def add_customer(self, first_name, last_name, email, phone, address):
        """ Adds a new customer and returns the generated ID """
        try:
            cursor = self.conn.cursor()
            query = """INSERT INTO ShopDBSchema.Customers (FirstName, LastName, Email, Phone, Address) 
                       OUTPUT INSERTED.CustomerID 
                       VALUES (?, ?, ?, ?, ?)"""
            
            cursor.execute(query, (first_name, last_name, email, phone, address))
            customer_id = cursor.fetchone()[0]  # Fetch the generated CustomerID
            self.conn.commit()

            print(f"✅ Customer added successfully with ID: {customer_id}.")
            return customer_id  # Ensure the ID is returned correctly

        except Exception as e:
            raise DatabaseException(f"Error adding customer: {e}")

    def get_all_customers(self):
        """ Retrieves all customers from the database and returns them as Customer objects """
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT CustomerID, FirstName, LastName, Email, Phone, Address FROM ShopDBSchema.Customers")
            customers = cursor.fetchall()
            return [Customer(*customer) for customer in customers]  # Convert tuples to Customer objects
        except Exception as e:
            raise DatabaseException(f"Error retrieving customers: {e}")

    def get_customer_by_id(self, customer_id):
        """ Retrieves a single customer by ID and returns a Customer object """
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT CustomerID, FirstName, LastName, Email, Phone, Address FROM ShopDBSchema.Customers WHERE CustomerID = ?", (customer_id,))
            row = cursor.fetchone()
            return Customer(*row) if row else None  # Convert tuple to Customer object
        except Exception as e:
            raise DatabaseException(f"Error retrieving customer: {e}")

    def update_customer(self, customer_id, email=None, phone=None, address=None):
        """ Updates customer information """
        try:
            cursor = self.conn.cursor()
            update_fields = []
            params = []
            
            if email:
                update_fields.append("Email = ?")
                params.append(email)
            if phone:
                update_fields.append("Phone = ?")
                params.append(phone)
            if address:
                update_fields.append("Address = ?")
                params.append(address)

            if not update_fields:
                raise InvalidDataException("No fields provided for update.")

            query = f"UPDATE ShopDBSchema.Customers SET {', '.join(update_fields)} WHERE CustomerID = ?"
            params.append(customer_id)
            cursor.execute(query, params)
            self.conn.commit()

            print(f"✅ Customer ID {customer_id} updated successfully.")
        except Exception as e:
            raise DatabaseException(f"Error updating customer: {e}")

    def delete_customer(self, customer_id):
        """ Deletes a customer from the database and resets the ID counter """
        try:
            cursor = self.conn.cursor()
            
            # Delete customer
            cursor.execute("DELETE FROM ShopDBSchema.Customers WHERE CustomerID = ?", (customer_id,))
            self.conn.commit()
            
            # Find the max existing CustomerID to reset identity counter
            cursor.execute("SELECT MAX(CustomerID) FROM ShopDBSchema.Customers")
            max_id = cursor.fetchone()[0]

            if max_id is None:  
                max_id = 0  # If table is empty, reset to 0
            
            # Reset identity counter
            cursor.execute(f"DBCC CHECKIDENT ('ShopDBSchema.Customers', RESEED, {max_id})")
            self.conn.commit()

            print(f"✅ Customer ID {customer_id} deleted successfully. ")

        except Exception as e:
            raise DatabaseException(f"Error deleting customer: {e}")
