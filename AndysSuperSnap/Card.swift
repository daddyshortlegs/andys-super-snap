struct Card {
    enum Suit: String, CaseIterable {
        case hearts = "❤️"
        case clubs = "♣️"
        case diamonds = "♦️"
        case spades = "♠️"
    }

    enum Pip: String, CaseIterable {
        case ace = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "J"
        case queen = "Q"
        case king = "K"
    }
    
    let pipValue: Pip
    let suit: Suit
    
    var value: String {
        return "\(pipValue.rawValue)\(suit.rawValue)"
    }

    func matches(other: Card) -> Bool {
        return self.pipValue == other.pipValue
    }
}
