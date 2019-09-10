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
        
        var currentPlayer = 1
        while !deck.isEmpty() {
            let theCard = deck.takeCard()
            
            let drawnCard = theCard?.value
            if drawnCard != nil {
                let theString = "Player \(currentPlayer) turned " + drawnCard!
                presenter.displayStatus(message: theString)
                
                if currentPlayer == 1 {
                    currentPlayer = 2
                } else {
                    currentPlayer = 1
                }
            }

            presenter.updateCurrentCardView(drawnCard: drawnCard)
            presenter.updatePreviousCardView(drawnCard: previousDrawnCard)
            
            previousDrawnCard = drawnCard ?? ""
        }

        presenter.displayStatus(message: "Game over")

    }
}
