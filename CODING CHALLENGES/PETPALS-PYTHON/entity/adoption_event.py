from abc import ABC, abstractmethod

class IAdoptable(ABC):
    @abstractmethod
    def adopt(self):
        pass


class AdoptionEvent:
    def __init__(self):
        self._participants = []

    def register_participant(self, participant):
        if isinstance(participant, IAdoptable):
            self._participants.append(participant)
            print(f"✅ Participant registered: {participant}")
        else:
            print("❌ Error: Participant must implement IAdoptable.")

    def host_event(self):
        print("🎉 Adoption Event is Live! 🎉")
        for participant in self._participants:
            participant.adopt()
