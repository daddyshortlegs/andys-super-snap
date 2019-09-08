@testable import AndysSuperSnap

class FakeDeck: Deck {
    func shuffle() {
        
    }
    
    func takeCard() -> Card? {
        return nil
    }
    
    func isEmpty() -> Bool {
        return true
    }
    
    
}
