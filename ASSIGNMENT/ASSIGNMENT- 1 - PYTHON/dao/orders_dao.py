from util.db_connection import Database
from exceptions.custom_exceptions import DatabaseException

class OrdersDAO:
    def __init__(self):
        try:
            self.conn = Database.get_connection()
            if self.conn is None:
                raise DatabaseException("Failed to establish database connection.")
        except Exception as e:
            raise DatabaseException(f"Database connection error: {e}")

    def add_order(self, customer_id, product_id, quantity):
        """ Creates a new order and lets the database trigger calculate total amount """
        try:
            cursor = self.conn.cursor()

            # Fetch product price
            cursor.execute("SELECT Price FROM ShopDBSchema.Products WHERE ProductID = ?", (product_id,))
            product = cursor.fetchone()
            if not product:
                print(f"❌ Product ID {product_id} not found.")
                return

            product_price = float(product[0])
            subtotal = product_price * quantity  # For order_details

            # Step 1: Insert order (TotalAmount will be auto-updated later by trigger)
            order_query = """INSERT INTO ShopDBSchema.Orders (CustomerID, OrderDate, Status)
                             OUTPUT INSERTED.OrderID 
                             VALUES (?, GETDATE(), ?)"""
            cursor.execute(order_query, (customer_id, 'Processing'))
            order_id = cursor.fetchone()[0]

            # Step 2: Insert order details with subtotal
            order_details_query = """INSERT INTO ShopDBSchema.OrderDetails (OrderID, ProductID, Quantity, Subtotal) 
                                     VALUES (?, ?, ?, ?)"""
            cursor.execute(order_details_query, (order_id, product_id, quantity, subtotal))

            self.conn.commit()

            print(f"✅ Order added successfully with ID: {order_id}. Total Amount: ₹{subtotal:.2f}")
            return order_id

        except Exception as e:
            raise DatabaseException(f"Error adding order: {e}")

    def get_all_orders(self):
        """ Retrieves all orders along with product details and subtotal """
        try:
            cursor = self.conn.cursor()
            query = """
                SELECT 
                    o.OrderID,
                    o.CustomerID,
                    o.OrderDate,
                    o.Status,
                    p.ProductName,
                    p.Price,
                    od.Quantity,
                    od.Subtotal
                FROM 
                    ShopDBSchema.Orders o
                JOIN 
                    ShopDBSchema.OrderDetails od ON o.OrderID = od.OrderID
                JOIN 
                    ShopDBSchema.Products p ON od.ProductID = p.ProductID
                ORDER BY 
                    o.OrderID
            """
            cursor.execute(query)
            rows = cursor.fetchall()

            result = []
            for row in rows:
                order_id = row[0]
                customer_id = row[1]
                order_date = row[2].strftime('%Y-%m-%d %H:%M:%S') if row[2] else None
                status = row[3]
                product_name = row[4]
                price = float(row[5])
                quantity = row[6]
                subtotal = float(row[7])

                result.append((
                    order_id,
                    customer_id,
                    order_date,
                    product_name,
                    price,
                    quantity,
                    subtotal,
                    status
                ))

            return result

        except Exception as e:
            raise DatabaseException(f"Error retrieving detailed orders: {e}")

    def get_order_by_id(self, order_id):
        """ Retrieves a specific order with product details """
        try:
            cursor = self.conn.cursor()
            query = """
                SELECT 
                    o.OrderID,
                    o.CustomerID,
                    o.OrderDate,
                    o.Status,
                    p.ProductName,
                    p.Price,
                    od.Quantity,
                    od.Subtotal
                FROM 
                    ShopDBSchema.Orders o
                JOIN 
                    ShopDBSchema.OrderDetails od ON o.OrderID = od.OrderID
                JOIN 
                    ShopDBSchema.Products p ON od.ProductID = p.ProductID
                WHERE 
                    o.OrderID = ?
            """
            cursor.execute(query, (order_id,))
            row = cursor.fetchone()

            if row:
                return (
                    row[0],  # OrderID
                    row[1],  # CustomerID
                    row[2].strftime('%Y-%m-%d %H:%M:%S') if row[2] else None,  # OrderDate
                    row[4],  # Product Name
                    float(row[5]),  # Product Price
                    row[6],  # Quantity
                    float(row[7]),  # Subtotal
                    row[3]  # Status
                )
            else:
                print(f"❌ Order ID {order_id} not found.")
                return None

        except Exception as e:
            raise DatabaseException(f"Error retrieving order by ID: {e}")

    def update_order_status(self, order_id, new_status):
        """ Updates the order status """
        try:
            cursor = self.conn.cursor()

            # Check if order exists
            cursor.execute("SELECT COUNT(*) FROM ShopDBSchema.Orders WHERE OrderID = ?", (order_id,))
            if cursor.fetchone()[0] == 0:
                print(f"❌ Order ID {order_id} not found.")
                return

            # Update order status
            query = "UPDATE ShopDBSchema.Orders SET Status = ? WHERE OrderID = ?"
            cursor.execute(query, (new_status, order_id))
            self.conn.commit()

            print(f"✅ Order ID {order_id} status updated to '{new_status}'.")
        except Exception as e:
            raise DatabaseException(f"Error updating order status: {e}")

    def delete_order(self, order_id):
        """ Deletes an order and resets auto-increment counter """
        try:
            cursor = self.conn.cursor()

            # Delete order
            cursor.execute("DELETE FROM ShopDBSchema.Orders WHERE OrderID = ?", (order_id,))
            self.conn.commit()

            print(f"✅ Order ID {order_id} deleted successfully.")

            # ✅ Reset auto-increment to ensure sequential Order IDs
            cursor.execute("SELECT MAX(OrderID) FROM ShopDBSchema.Orders")
            max_order_id = cursor.fetchone()[0] or 0

            cursor.execute(f"DBCC CHECKIDENT ('ShopDBSchema.Orders', RESEED, {max_order_id})")
            self.conn.commit()

        except Exception as e:
            raise DatabaseException(f"Error deleting order: {e}")
