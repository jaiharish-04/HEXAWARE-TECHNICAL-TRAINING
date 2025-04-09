from dao.customers_dao import CustomersDAO
from dao.products_dao import ProductsDAO
from dao.orders_dao import OrdersDAO
from dao.inventory_dao import InventoryDAO  # ✅ New import
from datetime import datetime  # ✅ For datetime formatting

def main():
    customer_dao = CustomersDAO()
    product_dao = ProductsDAO()
    order_dao = OrdersDAO()
    inventory_dao = InventoryDAO()  # ✅ New instance

    while True:
        print("\nTechShop System - Main Menu")
        print("1. Customer Management")
        print("2. Product Management")
        print("3. Order Management")
        print("4. Inventory Management")  # ✅ New Menu Option
        print("5. Exit")

        choice = input("Enter choice: ")

        if choice == "1":
            manage_customers(customer_dao)
        elif choice == "2":
            manage_products(product_dao)
        elif choice == "3":
            manage_orders(order_dao, customer_dao, product_dao)
        elif choice == "4":
            manage_inventory(inventory_dao)  # ✅ Call Inventory Management
        elif choice == "5":
            print("Exiting...")
            break
        else:
            print("❌ Invalid choice. Please try again.")

def manage_customers(customer_dao):
    while True:
        print("\nCustomer Management")
        print("1. Add Customer")
        print("2. View All Customers")
        print("3. View Customer by ID")
        print("4. Update Customer")
        print("5. Delete Customer")
        print("6. Back to Main Menu")

        choice = input("Enter choice: ")

        if choice == "1":
            first_name = input("Enter first name: ")
            last_name = input("Enter last name: ")
            email = input("Enter email: ")
            phone = input("Enter phone: ")
            address = input("Enter address: ")
            customer_dao.add_customer(first_name, last_name, email, phone, address)

        elif choice == "2":
            customers = customer_dao.get_all_customers()
            for customer in customers:
                print(customer)

        elif choice == "3":
            customer_id = input("Enter Customer ID: ")
            customer = customer_dao.get_customer_by_id(customer_id)
            if customer:
                print(customer)

        elif choice == "4":
            customer_id = input("Enter Customer ID: ")
            email = input("Enter new email (or press Enter to skip): ")
            phone = input("Enter new phone (or press Enter to skip): ")
            address = input("Enter new address (or press Enter to skip): ")
            customer_dao.update_customer(customer_id, email=email or None, phone=phone or None, address=address or None)

        elif choice == "5":
            customer_id = input("Enter Customer ID to delete: ")
            customer_dao.delete_customer(customer_id)

        elif choice == "6":
            break
        else:
            print("❌ Invalid choice. Please try again.")

def manage_products(product_dao):
    while True:
        print("\nProduct Management")
        print("1. Add Product")
        print("2. View All Products")
        print("3. View Product by ID")
        print("4. Update Product")
        print("5. Delete Product")
        print("6. Back to Main Menu")

        choice = input("Enter choice: ")

        if choice == "1":
            name = input("Enter product name: ")
            description = input("Enter product description: ")
            price = float(input("Enter product price: "))
            product_dao.add_product(name, description, price)

        elif choice == "2":
            products = product_dao.get_all_products()
            for product in products:
                print(product)

        elif choice == "3":
            product_id = input("Enter Product ID: ")
            product = product_dao.get_product_by_id(product_id)
            if product:
                print(product)

        elif choice == "4":
            product_id = input("Enter Product ID: ")
            description = input("Enter new description (or press Enter to skip): ")
            price = input("Enter new price (or press Enter to skip): ")
            product_dao.update_product(product_id, description=description or None, price=float(price) if price else None)

        elif choice == "5":
            product_id = input("Enter Product ID to delete: ")
            product_dao.delete_product(product_id)

        elif choice == "6":
            break
        else:
            print("❌ Invalid choice. Please try again.")

def manage_orders(order_dao, customer_dao, product_dao):
    while True:
        print("\nOrder Management")
        print("1. Place Order")
        print("2. View All Orders")
        print("3. View Order by ID")
        print("4. Update Order Status")
        print("5. Delete Order")
        print("6. Back to Main Menu")

        choice = input("Enter choice: ")

        if choice == "1":
            customer_id = input("Enter Customer ID: ")
            customer = customer_dao.get_customer_by_id(customer_id)
            if not customer:
                print("❌ Customer not found.")
                continue

            product_id = input("Enter Product ID: ")
            product = product_dao.get_product_by_id(product_id)
            if not product:
                print("❌ Product not found.")
                continue

            quantity = int(input("Enter Quantity: "))
            order_id = order_dao.add_order(customer_id, product_id, quantity)
            print(f"✅ Order placed successfully with Order ID: {order_id}")

        elif choice == "2":
            orders = order_dao.get_all_orders()
            for order in orders:
                print(order)

        elif choice == "3":
            order_id = input("Enter Order ID: ")
            order = order_dao.get_order_by_id(order_id)
            if order:
                print(order)

        elif choice == "4":
            order_id = input("Enter Order ID: ")
            new_status = input("Enter new status (Processing, Shipped, Delivered, Cancelled): ")
            order_dao.update_order_status(order_id, new_status)

        elif choice == "5":
            order_id = input("Enter Order ID to delete: ")
            order_dao.delete_order(order_id)

        elif choice == "6":
            break
        else:
            print("❌ Invalid choice. Please try again.")

def manage_inventory(inventory_dao):
    while True:
        print("\nInventory Management")
        print("1. Add Stock")
        print("2. View Inventory")
        print("3. View Inventory by Product ID")
        print("4. Update Stock")
        print("5. Get Low Stock Products")
        print("6. Get Out of Stock Products")
        print("7. Get Inventory Value for Product")
        print("8. Back to Main Menu")

        choice = input("Enter choice: ")

        if choice == "1":
            product_id = input("Enter Product ID: ")
            quantity = int(input("Enter quantity to add: "))
            inventory_dao.add_to_inventory(product_id, quantity)

        elif choice == "2":
            records = inventory_dao.get_all_inventory()
            for record in records:
                product_id, name, quantity, last_updated = record
                formatted_date = last_updated.strftime("%Y-%m-%d %H:%M:%S")
                print((product_id, name, quantity, formatted_date))

        elif choice == "3":
            product_id = input("Enter Product ID: ")
            inventory = inventory_dao.get_inventory_by_product_id(product_id)
            if inventory:
                product_id, name, quantity, last_updated = inventory
                formatted_date = last_updated.strftime("%Y-%m-%d %H:%M:%S")
                print((product_id, name, quantity, formatted_date))
            else:
                print("❌ Inventory record not found.")

        elif choice == "4":
            product_id = input("Enter Product ID: ")
            quantity = int(input("Enter new quantity: "))
            inventory_dao.update_stock_quantity(product_id, quantity)

        elif choice == "5":
            threshold = int(input("Enter stock threshold: "))
            low_stock = inventory_dao.list_low_stock_products(threshold)
            if low_stock:
                print(f"📉 Products with stock below {threshold}:")
                for item in low_stock:
                    print(item)
            else:
                print(f"✅ All products have stock above {threshold}.")

        elif choice == "6":
            out_of_stock = inventory_dao.list_out_of_stock_products()
            if out_of_stock:
                print("🚫 Out of Stock Products:")
                for item in out_of_stock:
                    print(item)
            else:
                print("✅ No products are currently out of stock.")

        elif choice == "7":
            product_id = input("Enter Product ID: ")
            value = inventory_dao.get_inventory_value(product_id)
            print(f"💰 Total inventory value: ₹{value}")

        elif choice == "8":
            break
        else:
            print("❌ Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
