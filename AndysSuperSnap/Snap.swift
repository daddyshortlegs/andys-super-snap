class Snap {
    let presenter: GameStatusPresenter
    
    var deck: Deck = Standard52CardDeck()

    var previousDrawnCard: String?

    init(presenter: GameStatusPresenter) {
        self.presenter = presenter
    }
    
    func play() {
        deck.shuffle()
        
        presenter.displayStatus(message: "Get ready....")
        
        if !deck.isEmpty() {
            
            let theCard = deck.takeCard()
            
            let drawnCard = theCard?.value
            if drawnCard != nil {
                let theString = "Player 1 turned " + drawnCard!
                presenter.displayStatus(message: theString)
            }

            presenter.updateCurrentCardView(drawnCard: drawnCard)
            presenter.updatePreviousCardView(drawnCard: previousDrawnCard)
            
            previousDrawnCard = drawnCard ?? ""
        }

        presenter.displayStatus(message: "Game over")

    }
}
