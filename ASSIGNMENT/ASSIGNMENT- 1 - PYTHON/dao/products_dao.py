from util.db_connection import Database
from exceptions.custom_exceptions import DatabaseException, InvalidDataException

class ProductsDAO:
    def __init__(self):
        """ Establish database connection """
        try:
            self.conn = Database.get_connection()
            if self.conn is None:
                raise DatabaseException("Failed to establish database connection.")
        except Exception as e:
            raise DatabaseException(f"Database connection error: {e}")

    def add_product(self, product_name, description, price):
        """ Adds a new product and returns the generated ProductID """
        try:
            cursor = self.conn.cursor()
            query = """INSERT INTO ShopDBSchema.Products (ProductName, Description, Price) 
                       OUTPUT INSERTED.ProductID 
                       VALUES (?, ?, ?)"""
            
            cursor.execute(query, (product_name, description, price))
            product_id = cursor.fetchone()[0]  # Fetch the generated ProductID
            self.conn.commit()

            print(f"✅ Product added successfully with ID: {product_id}.")
            return product_id  # Ensure the ID is returned correctly

        except Exception as e:
            raise DatabaseException(f"Error adding product: {e}")

    def get_all_products(self):
        """ Retrieves all products and converts price to float """
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT ProductID, ProductName, Description, Price FROM ShopDBSchema.Products")
            products = cursor.fetchall()

            # Convert Decimal price to float before returning
            return [(p[0], p[1], p[2], float(p[3])) for p in products]
        except Exception as e:
            raise DatabaseException(f"Error retrieving products: {e}")

    def get_product_by_id(self, product_id):
        """ Retrieves a product by ID and converts price to float """
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT ProductID, ProductName, Description, Price FROM ShopDBSchema.Products WHERE ProductID = ?", (product_id,))
            product = cursor.fetchone()

            if product:
                return (product[0], product[1], product[2], float(product[3]))  # Convert Decimal to float
            else:
                print(f"❌ No product found with ID: {product_id}")
                return None
        except Exception as e:
            raise DatabaseException(f"Error retrieving product: {e}")

    def update_product(self, product_id, description=None, price=None):
        """ Updates product details """
        try:
            cursor = self.conn.cursor()
            update_fields = []
            params = []

            if description:
                update_fields.append("Description = ?")
                params.append(description)
            if price:
                update_fields.append("Price = ?")
                params.append(price)

            if not update_fields:
                raise InvalidDataException("No fields provided for update.")

            query = f"UPDATE ShopDBSchema.Products SET {', '.join(update_fields)} WHERE ProductID = ?"
            params.append(product_id)
            cursor.execute(query, params)
            self.conn.commit()

            print(f"✅ Product ID {product_id} updated successfully.")
        except Exception as e:
            raise DatabaseException(f"Error updating product: {e}")

    def delete_product(self, product_id):
        """ Deletes a product and resets ProductID sequence if necessary """
        try:
            cursor = self.conn.cursor()

            # Check if the product exists before deletion
            cursor.execute("SELECT COUNT(*) FROM ShopDBSchema.Products WHERE ProductID = ?", (product_id,))
            if cursor.fetchone()[0] == 0:
                print(f"❌ Product ID {product_id} not found.")
                return

            # Delete the product
            cursor.execute("DELETE FROM ShopDBSchema.Products WHERE ProductID = ?", (product_id,))
            self.conn.commit()

            print(f"✅ Product ID {product_id} deleted successfully.")

            # Reset ProductID sequence if necessary
            cursor.execute("SELECT MAX(ProductID) FROM ShopDBSchema.Products")
            max_product_id = cursor.fetchone()[0]

            if max_product_id is None:
                cursor.execute("DBCC CHECKIDENT ('ShopDBSchema.Products', RESEED, 0)")
            else:
                cursor.execute(f"DBCC CHECKIDENT ('ShopDBSchema.Products', RESEED, {max_product_id})")

            self.conn.commit()
            print("✅ ProductID sequence adjusted.")

        except Exception as e:
            raise DatabaseException(f"Error deleting product: {e}")
