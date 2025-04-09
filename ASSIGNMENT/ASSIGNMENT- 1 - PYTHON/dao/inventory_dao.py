from util.db_connection import Database
from exceptions.custom_exceptions import DatabaseException
from datetime import datetime

class InventoryDAO:
    def __init__(self):
        try:
            self.conn = Database.get_connection()
            if self.conn is None:
                raise DatabaseException("❌ Failed to establish database connection.")
        except Exception as e:
            raise DatabaseException(f"❌ Database connection error: {e}")

    def get_product(self, inventory_id):
        """Returns the product associated with the inventory ID"""
        try:
            cursor = self.conn.cursor()
            query = """SELECT p.ProductID, p.ProductName, p.Description, p.Price
                       FROM ShopDBSchema.Inventory i
                       JOIN ShopDBSchema.Products p ON i.ProductID = p.ProductID
                       WHERE i.InventoryID = ?"""
            cursor.execute(query, (inventory_id,))
            return cursor.fetchone()
        except Exception as e:
            raise DatabaseException(f"❌ Error fetching product: {e}")

    def get_quantity_in_stock(self, product_id):
        """Returns the current quantity of the product in stock"""
        try:
            cursor = self.conn.cursor()
            query = "SELECT QuantityInStock FROM ShopDBSchema.Inventory WHERE ProductID = ?"
            cursor.execute(query, (product_id,))
            row = cursor.fetchone()
            return row[0] if row else 0
        except Exception as e:
            raise DatabaseException(f"❌ Error fetching stock quantity: {e}")

    def add_to_inventory(self, product_id, quantity):
        """Adds a specified quantity of product to inventory"""
        try:
            cursor = self.conn.cursor()
            query = """UPDATE ShopDBSchema.Inventory 
                       SET QuantityInStock = QuantityInStock + ?, LastStockUpdate = GETDATE()
                       WHERE ProductID = ?"""
            cursor.execute(query, (quantity, product_id))
            self.conn.commit()
            print(f"✅ {quantity} units added to inventory for Product ID {product_id}")
        except Exception as e:
            raise DatabaseException(f"❌ Error adding inventory: {e}")

    def remove_from_inventory(self, product_id, quantity):
        """Removes a specified quantity of product from inventory"""
        try:
            current_qty = self.get_quantity_in_stock(product_id)
            if quantity > current_qty:
                raise ValueError("❌ Not enough stock to remove.")
            cursor = self.conn.cursor()
            query = """UPDATE ShopDBSchema.Inventory 
                       SET QuantityInStock = QuantityInStock - ?, LastStockUpdate = GETDATE()
                       WHERE ProductID = ?"""
            cursor.execute(query, (quantity, product_id))
            self.conn.commit()
            print(f"✅ {quantity} units removed from inventory for Product ID {product_id}")
        except Exception as e:
            raise DatabaseException(f"❌ Error removing inventory: {e}")

    def update_stock_quantity(self, product_id, new_quantity):
        """Updates the stock quantity to a new value"""
        try:
            cursor = self.conn.cursor()
            query = """UPDATE ShopDBSchema.Inventory 
                       SET QuantityInStock = ?, LastStockUpdate = GETDATE()
                       WHERE ProductID = ?"""
            cursor.execute(query, (new_quantity, product_id))
            self.conn.commit()
            print(f"✅ Inventory updated to {new_quantity} units for Product ID {product_id}")
        except Exception as e:
            raise DatabaseException(f"❌ Error updating inventory quantity: {e}")

    def is_product_available(self, product_id, quantity_to_check):
        """Checks if a specified quantity is available"""
        try:
            available = self.get_quantity_in_stock(product_id)
            return available >= quantity_to_check
        except Exception as e:
            raise DatabaseException(f"❌ Error checking product availability: {e}")

    def get_inventory_value(self, product_id):
        """Returns total inventory value for a product"""
        try:
            cursor = self.conn.cursor()
            query = """SELECT p.Price, i.QuantityInStock 
                       FROM ShopDBSchema.Products p 
                       JOIN ShopDBSchema.Inventory i ON p.ProductID = i.ProductID
                       WHERE p.ProductID = ?"""
            cursor.execute(query, (product_id,))
            row = cursor.fetchone()
            return round(row[0] * row[1], 2) if row else 0
        except Exception as e:
            raise DatabaseException(f"❌ Error calculating inventory value: {e}")

    def list_low_stock_products(self, threshold):
        """Lists products below a stock threshold"""
        try:
            cursor = self.conn.cursor()
            query = """SELECT p.ProductID, p.ProductName, i.QuantityInStock 
                       FROM ShopDBSchema.Inventory i
                       JOIN ShopDBSchema.Products p ON i.ProductID = p.ProductID
                       WHERE i.QuantityInStock < ?"""
            cursor.execute(query, (threshold,))
            return cursor.fetchall()
        except Exception as e:
            raise DatabaseException(f"❌ Error listing low stock products: {e}")

    def list_out_of_stock_products(self):
        """Lists products that are out of stock"""
        try:
            return self.list_low_stock_products(1)
        except Exception as e:
            raise DatabaseException(f"❌ Error listing out-of-stock products: {e}")

    def get_all_inventory(self):
        """Fetches all inventory records with product details"""
        try:
            cursor = self.conn.cursor()
            query = """
                SELECT i.ProductID, p.ProductName, i.QuantityInStock, i.LastStockUpdate
                FROM ShopDBSchema.Inventory i
                JOIN ShopDBSchema.Products p ON i.ProductID = p.ProductID
            """
            cursor.execute(query)
            return cursor.fetchall()
        except Exception as e:
            raise DatabaseException(f"❌ Error fetching all inventory: {e}")

    def get_inventory_by_product_id(self, product_id):
        """Fetches inventory details for a specific product ID"""
        try:
            cursor = self.conn.cursor()
            query = """
                SELECT i.ProductID, p.ProductName, i.QuantityInStock, i.LastStockUpdate
                FROM ShopDBSchema.Inventory i
                JOIN ShopDBSchema.Products p ON i.ProductID = p.ProductID
                WHERE i.ProductID = ?
            """
            cursor.execute(query, (product_id,))
            return cursor.fetchone()
        except Exception as e:
            raise DatabaseException(f"❌ Error fetching inventory by Product ID: {e}")
