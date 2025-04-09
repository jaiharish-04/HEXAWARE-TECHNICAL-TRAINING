from exceptions import PaymentFailedException

class Payment:
    def __init__(self, payment_id, order_id, amount, payment_method, status="Pending"):
        self.payment_id = payment_id
        self.order_id = order_id
        self.amount = amount
        self.payment_method = payment_method
        self.status = status

    def process_payment(self, success):
        """ Updates payment status based on transaction success or failure """
        if success:
            self.status = "Completed"
        else:
            raise PaymentFailedException("Payment was declined")
