from dao.petpals_impl import PetPalsImpl
from dao.donation_impl import DonationImpl
from dao.adoption_event_impl import AdoptionEventImpl
from entity.pet import Pet, Dog, Cat
from datetime import datetime

def main():
    pet_service = PetPalsImpl()
    donation_service = DonationImpl()
    event_service = AdoptionEventImpl()

    while True:
        print("\nPetPals Adoption System")
        print("1. Add Pet")
        print("2. List Available Pets")
        print("3. Remove Pet")
        print("4. Record Donation")
        print("5. List Adoption Events")
        print("6. Register for Adoption Event")
        print("7. View Donation Summary")
        print("8. View Event Registrations")  
        print("9. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            name = input("Enter pet name: ")
            age = int(input("Enter pet age: "))
            pet_type = input("Enter pet type (Dog/Cat): ").strip().capitalize()

            if pet_type not in ["Dog", "Cat"]:
                print("Invalid pet type. Please enter 'Dog' or 'Cat'.")
                continue

            breed = input(f"Enter {pet_type.lower()} breed: ")

            if pet_type == "Dog":
                pet = Dog(name, age, breed, breed)
            else:
                pet = Cat(name, age, breed, breed)

            pet_service.add_pet(pet)
            print(f"{pet_type} '{name}' has been added successfully!")

        elif choice == "2":
            pets = pet_service.list_available_pets()
            if not pets:
                print("No pets available for adoption.")
            else:
                print("Available Pets:")
                for pet in pets:
                    print(f"ID: {pet[0]}, Name: {pet[1]}, Age: {pet[2]}, Breed: {pet[3]}, Type: {pet[4]}")

        elif choice == "3":
            pet_id = int(input("Enter Pet ID to remove: "))
            pet_service.remove_pet(pet_id)

        elif choice == "4":
            donor_name = input("Enter donor name: ")
            amount = float(input("Enter donation amount: "))
            donation_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            donation_service.record_cash_donation(donor_name, amount, donation_date)

        elif choice == "5":
            events = event_service.list_upcoming_events()
            if not events:
                print("No upcoming adoption events.")
            else:
                print("Upcoming Adoption Events:")
                for event in events:
                    print(f"ID: {event[0]}, Name: {event[1]}, Date: {event[2]}")

        elif choice == "6":
            event_id = int(input("Enter Adoption Event ID: "))
            participant_name = input("Enter participant name: ")
            event_service.register_participant(event_id, participant_name)

        elif choice == "7":
            summary = pet_service.get_donation_summary()
            if not summary:
                print("No donations recorded.")
            else:
                print("Donation Summary:")
                print("Donor Name | Number of Donations | Total Cash Donated")
                for donor in summary:
                    print(f"{donor[0]} | {donor[1]} | ₹{donor[2]:.2f}")

        elif choice == "8":
            registrations = event_service.view_event_registrations()
            if not registrations:
                print("No participants registered for any events.")
            else:
                print("Event Registrations:")
                print("Participant Name | Event Name | Date | Location")
                for row in registrations:
                    print(f"{row[0]} | {row[1]} | {row[2]} | {row[3]}")

        elif choice == "9":
            print("Exiting... Thank you!")
            break

        else:
            print("Invalid choice, please try again.")

if __name__ == "__main__":
    main()
