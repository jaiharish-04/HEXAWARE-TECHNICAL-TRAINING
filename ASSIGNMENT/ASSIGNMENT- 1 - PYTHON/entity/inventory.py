class Inventory:
    def __init__(self, inventory_id=None, product_id=None, quantity_in_stock=0, last_stock_update=None):
        self.inventory_id = inventory_id
        self.product_id = product_id
        self.quantity_in_stock = quantity_in_stock
        self.last_stock_update = last_stock_update

    def __str__(self):
        return (f"Inventory(ID: {self.inventory_id}, "
                f"Product ID: {self.product_id}, "
                f"Stock: {self.quantity_in_stock}, "
                f"Last Updated: {self.last_stock_update})")
