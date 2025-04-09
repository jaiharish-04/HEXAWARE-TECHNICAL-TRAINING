import pyodbc
from entity.customer import Customer  
from entity.products import Product  
from exceptions import InvalidDataException  
from util.db_connection import Database  

class Order:
    VALID_STATUSES = {"Processing", "Shipped", "Delivered", "Cancelled"}  
    VALID_PAYMENT_STATUSES = {"Pending", "Paid", "Refunded"}  

    def __init__(self, order_id=None, customer=None, order_date=None, total_amount=0.0, status="Processing", payment_status="Pending"):
        if isinstance(customer, int):
            self.__customer_id = customer
        elif isinstance(customer, Customer):
            self.__customer_id = customer.customer_id
        else:
            raise TypeError("❌ customer must be an instance of Customer or an integer (CustomerID)!")

        self.__order_id = order_id
        self.__order_date = order_date  
        self.total_amount = float(total_amount)  
        self.status = status  
        self.payment_status = payment_status  
        self.__order_items = []  

    @property
    def order_id(self):
        return self.__order_id

    @property
    def customer_id(self):
        return self.__customer_id

    @property
    def order_date(self):
        return self.__order_date

    @property
    def total_amount(self):
        return self.__total_amount

    @property
    def status(self):
        return self.__status

    @property
    def payment_status(self):
        return self.__payment_status

    @property
    def order_items(self):
        return self.__order_items

    @total_amount.setter
    def total_amount(self, value):
        if value < 0:
            raise InvalidDataException("❌ Total amount cannot be negative!")
        self.__total_amount = round(value, 2)  

    @status.setter
    def status(self, value):
        if value not in self.VALID_STATUSES:
            raise InvalidDataException(f"❌ Invalid status! Choose from {self.VALID_STATUSES}")
        self.__status = value

    @payment_status.setter
    def payment_status(self, value):
        if value not in self.VALID_PAYMENT_STATUSES:
            raise InvalidDataException(f"❌ Invalid payment status! Choose from {self.VALID_PAYMENT_STATUSES}")
        self.__payment_status = value

    def add_order_to_db(self):
        """  Inserts order into the database and retrieves the generated OrderID """
        conn = Database.get_connection()
        cursor = conn.cursor()

        query = """
        INSERT INTO TechShopSchema.Orders (CustomerID, TotalAmount, Status) 
        VALUES (?, ?, ?)"""
        
        cursor.execute(query, (self.__customer_id, self.__total_amount, self.__status))
        conn.commit()
        
        self.__order_id = cursor.execute("SELECT SCOPE_IDENTITY()").fetchone()[0]  # Get last inserted OrderID
        cursor.close()
        conn.close()
        return self.__order_id

    def add_order_item(self, product, quantity):
        """  Adds an item to the order in the OrderDetails table """
        if not isinstance(product, Product):
            raise TypeError("❌ product must be an instance of Product!")
        if quantity <= 0:
            raise InvalidDataException("❌ Quantity must be at least 1!")

        self.__order_items.append({"product": product, "quantity": quantity})

        conn = Database.get_connection()
        cursor = conn.cursor()

        query = """
        INSERT INTO TechShopSchema.OrderDetails (OrderID, ProductID, Quantity, Subtotal) 
        VALUES (?, ?, ?, ?)"""
        
        subtotal = round(product.price * quantity, 2)
        cursor.execute(query, (self.__order_id, product.product_id, quantity, subtotal))
        conn.commit()
        
        self.total_amount += subtotal  

        cursor.close()
        conn.close()

    def update_order_status(self, new_status):
        """  Updates order status in the database """
        if new_status not in self.VALID_STATUSES:
            raise InvalidDataException(f"❌ Invalid status! Choose from {self.VALID_STATUSES}")

        conn = Database.get_connection()
        cursor = conn.cursor()

        query = "UPDATE TechShopSchema.Orders SET Status = ? WHERE OrderID = ?"
        cursor.execute(query, (new_status, self.__order_id))
        conn.commit()

        self.__status = new_status  

        cursor.close()
        conn.close()

    def remove_order_item(self, product_id):
        """  Removes an item from the order in the database """
        conn = Database.get_connection()
        cursor = conn.cursor()

        query = "DELETE FROM TechShopSchema.OrderDetails WHERE OrderID = ? AND ProductID = ?"
        cursor.execute(query, (self.__order_id, product_id))
        conn.commit()

        for item in self.__order_items:
            if item["product"].product_id == product_id:
                self.total_amount -= round(item["product"].price * item["quantity"], 2)  
                self.__order_items.remove(item)
                break

        cursor.close()
        conn.close()

    def get_order_details(self):
        """  Fetches order details from the database """
        conn = Database.get_connection()
        cursor = conn.cursor()

        query = """
        SELECT O.OrderID, O.CustomerID, O.OrderDate, O.TotalAmount, O.Status, OD.ProductID, OD.Quantity, OD.Subtotal
        FROM TechShopSchema.Orders O
        LEFT JOIN TechShopSchema.OrderDetails OD ON O.OrderID = OD.OrderID
        WHERE O.OrderID = ?"""
        
        cursor.execute(query, (self.__order_id,))
        result = cursor.fetchall()

        cursor.close()
        conn.close()

        if not result:
            return "❌ Order not found!"

        order_summary = f"""
        🛒 Order {self.__order_id} for Customer ID: {self.__customer_id}
        📅 Date: {self.__order_date}
        📦 Status: {self.__status}
        🏷️ Total: {self.__total_amount:.2f} USD
        """

        items_summary = "\n".join([
            f"  - Product ID: {row.ProductID} (Qty: {row.Quantity}, Subtotal: {row.Subtotal:.2f} USD)"
            for row in result if row.ProductID is not None
        ])

        return order_summary + "\n📋 Items:\n" + (items_summary if items_summary else "No items added yet.")

    def __str__(self):
        return f"Order ID: {self.__order_id}, Customer ID: {self.__customer_id}, Status: {self.__status}, Total: {self.__total_amount:.2f} USD"
