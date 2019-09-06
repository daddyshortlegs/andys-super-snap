enum Suit: String {
    case hearts = "❤️"
    case clubs = "♣"
    case diamonds = "♦"
    case spades = "♠"
}


class Card {
    let pipValue: String
    let suit: Suit
    
    required init(pipValue: String, suit: Suit) {
        self.pipValue = pipValue
        self.suit = suit
    }
}
