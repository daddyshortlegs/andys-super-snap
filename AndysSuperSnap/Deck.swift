protocol Deck {
    func shuffle()
    func takeCard() -> Card?
    func isEmpty() -> Bool
}

