class Snap {
    private let presenter: GameStatusPresenter
    var deck: Deck = Standard52CardDeck()
    private var previousDrawnCard: Card?
    private var currentPlayer = 1

    init(presenter: GameStatusPresenter) {
        self.presenter = presenter
    }
    
    func play() {
        deck.shuffle()
        
        presenter.displayStatus(message: "Get ready....")
        
        while !deck.isEmpty() {
            let drawnCard = deck.takeCard()
            
            //let drawnCard = theCard?.value
            if drawnCard != nil {
                let theString = "Player \(currentPlayer) turned " + drawnCard!.value
                
                if cardsMatch(previous: previousDrawnCard, current: drawnCard) {
                    presenter.displayStatus(message: "SNAP! Player 1 wins!!!")
                }
                
                presenter.displayStatus(message: theString)
                switchPlayer()


                presenter.updateCurrentCardView(drawnCard: drawnCard?.value)
                presenter.updatePreviousCardView(drawnCard: previousDrawnCard?.value)
                
                previousDrawnCard = drawnCard
            }
        }

        presenter.displayStatus(message: "Game over")
    }
    
    private func cardsMatch(previous: Card?, current: Card?) -> Bool {
        return previous != nil && current != nil && previous!.matches(other: current!)
    }
    
    private func switchPlayer() {
        if currentPlayer == 1 {
            currentPlayer = 2
        } else {
            currentPlayer = 1
        }
    }
}
