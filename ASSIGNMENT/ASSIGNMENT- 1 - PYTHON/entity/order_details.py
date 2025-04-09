from exceptions import IncompleteOrderException

class OrderDetail:
    def __init__(self, order_id, product, quantity):
        if not product:
            raise IncompleteOrderException("Product reference is required in order details")

        self.order_id = order_id
        self.product = product
        self.quantity = quantity

    def calculate_subtotal(self):
        """ Calculates the subtotal for the order detail """
        return self.quantity * self.product.price
