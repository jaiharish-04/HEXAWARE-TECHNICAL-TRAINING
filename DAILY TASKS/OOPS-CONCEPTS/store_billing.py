class Store:
    def __init__(self):
        self.products = {
            1: ("Rice", 50),
            2: ("Sugar", 40),
            3: ("Milk", 30),
            4: ("Oil", 100)
        }

    def display_menu(self):
        print("\nAvailable Products:")
        for code, (name, price) in self.products.items():
            print(f"{code}. {name} - ₹{price}")

    def generate_bill(self):
        total = 0
        for code, (name, price) in self.products.items():
            qty = int(input(f"Enter quantity for {name}: "))
            total += qty * price
        print(f"Total Bill Amount: ₹{total}")

store = Store()
store.display_menu()
store.generate_bill()
