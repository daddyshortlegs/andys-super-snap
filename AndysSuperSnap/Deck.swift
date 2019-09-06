class Deck {
    
    var cards: [Card] = []
    
    init() {
        for pip in Card.Pip.allCases.reversed() {
            let card = Card(pipValue: pip, suit: .hearts)
            cards.append(card)
        }
    }
    
    func takeCard() -> Card? {        
        return cards.popLast()
    }
}
