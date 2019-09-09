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
            presenter.displayStatus(message: "Player 1 turned 5H")
            
            let drawnCard = deck.takeCard()?.value
            
            presenter.updateCurrentCardView(drawnCard: drawnCard)
            presenter.updatePreviousCardView(drawnCard: previousDrawnCard)
            
            previousDrawnCard = drawnCard ?? ""
        }

        presenter.displayStatus(message: "Game over")

    }
}
