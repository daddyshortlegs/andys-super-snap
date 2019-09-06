class Deck {
    var cards: [Card] = []
    
    init() {
        addAllSuits()
        cards.shuffle()
    }
    
    func addAllSuits() {
        Card.Suit.allCases.reversed().forEach {
            addAllPips(for: $0)
        }
    }
    
    func addAllPips(for suit: Card.Suit) {
        Card.Pip.allCases.reversed().forEach {
            cards.append(Card(pipValue: $0, suit: suit))
        }
    }
    
    func takeCard() -> Card? {
        return cards.popLast()
    }
    
    func isEmpty() -> Bool {
        return cards.isEmpty
    }
}
