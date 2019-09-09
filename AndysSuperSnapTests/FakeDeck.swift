@testable import AndysSuperSnap

class FakeDeck: Deck {
    
    var cards = [Card]()
    
    func shuffle() {
    }
    
    func addCard(_ card: Card) {
        cards.append(card)
    }
    
    func takeCard() -> Card? {
        return cards.popLast()
    }
    
    func isEmpty() -> Bool {
        return cards.count == 0
    }
    
    
}
