from util.db_connection import DBConnection

class AdoptionEventImpl:
    def __init__(self):
        self.conn = DBConnection.get_connection()

    def list_upcoming_events(self):
        """Fetches all upcoming adoption events from the database."""
        try:
            cursor = self.conn.cursor()
            query = """SELECT EventID, EventName, EventDate, Location 
                       FROM PetPalsSchema.AdoptionEvents 
                       WHERE EventDate >= GETDATE()"""  # SQL Server syntax for current date
            cursor.execute(query)
            events = cursor.fetchall()

            if events:
                return events
            else:
                print("No upcoming adoption events found.")
                return []

        except Exception as e:
            print(f"Error fetching adoption events: {e}")
            return []

    def register_participant(self, event_id, participant_name):
        """Registers a participant for an adoption event."""
        try:
            cursor = self.conn.cursor()

            # Check if the event exists
            cursor.execute("SELECT COUNT(*) FROM PetPalsSchema.AdoptionEvents WHERE EventID = ?", (event_id,))
            event_exists = cursor.fetchone()[0]

            if event_exists == 0:
                print(f"Event ID {event_id} does not exist.")
                return

            # Generate a new ParticipantID (simulate auto-increment)
            cursor.execute("SELECT ISNULL(MAX(ParticipantID), 0) + 1 FROM PetPalsSchema.Participants")
            new_participant_id = cursor.fetchone()[0]

            # Insert the participant into the Participants table
            query = """INSERT INTO PetPalsSchema.Participants (ParticipantID, ParticipantName, ParticipantType, EventID) 
                       VALUES (?, ?, 'Adopter', ?)"""
            cursor.execute(query, (new_participant_id, participant_name, event_id))
            self.conn.commit()

            print(f"{participant_name} successfully registered for Event ID {event_id}.")

        except Exception as e:
            print(f"Error registering participant: {e}")

    def view_event_registrations(self):
        """Displays participants and the events they have registered for."""
        try:
            cursor = self.conn.cursor()
            query = """
                SELECT 
                    p.ParticipantName, 
                    e.EventName, 
                    e.EventDate, 
                    e.Location
                FROM PetPalsSchema.Participants p
                INNER JOIN PetPalsSchema.AdoptionEvents e ON p.EventID = e.EventID
                ORDER BY e.EventDate, e.EventName
            """
            cursor.execute(query)
            registrations = cursor.fetchall()
            return registrations

        except Exception as e:
            print(f"Error retrieving event registrations: {e}")
            return []
