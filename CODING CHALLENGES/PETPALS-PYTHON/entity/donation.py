from abc import ABC, abstractmethod
from datetime import datetime

class Donation(ABC):
    def __init__(self, donor_name, amount):
        self._donor_name = donor_name
        self._amount = amount

    def get_donor_name(self):
        return self._donor_name

    def get_amount(self):
        return self._amount

    @abstractmethod
    def record_donation(self):
        pass


class CashDonation(Donation):
    def __init__(self, donor_name, amount, donation_date=None):
        super().__init__(donor_name, amount)
        self._donation_date = donation_date if donation_date else datetime.now()

    def record_donation(self):
        return f"💵 Cash Donation: {self._donor_name} donated ${self._amount} on {self._donation_date}"


class ItemDonation(Donation):
    def __init__(self, donor_name, amount, item_type):
        super().__init__(donor_name, amount)
        self._item_type = item_type

    def record_donation(self):
        return f"🎁 Item Donation: {self._donor_name} donated {self._amount} {self._item_type}(s)"
