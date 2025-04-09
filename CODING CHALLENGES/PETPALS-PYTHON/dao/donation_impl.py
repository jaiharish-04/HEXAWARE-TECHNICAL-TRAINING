from util.db_connection import DBConnection

class DonationImpl:
    def __init__(self):
        self.conn = DBConnection.get_connection()

    def record_cash_donation(self, donor_name, amount, donation_date):
        try:
            cursor = self.conn.cursor()

            # Fetch the max DonationID and increment by 1
            cursor.execute("SELECT MAX(DonationID) FROM PetPalsSchema.Donations")
            max_id = cursor.fetchone()[0]
            new_donation_id = (max_id + 1) if max_id else 1  # If table is empty, start from 1

            # Insert donation with manually generated DonationID
            query = """INSERT INTO PetPalsSchema.Donations (DonationID, DonorName, DonationType, DonationAmount, DonationDate) 
                       VALUES (?, ?, 'Cash', ?, ?)"""

            cursor.execute(query, (new_donation_id, donor_name, amount, donation_date))
            self.conn.commit()

            print(f"✅ Donation recorded successfully with ID {new_donation_id} for {donor_name}.")

        except Exception as e:
            print(f"❌ Error recording donation: {e}")
