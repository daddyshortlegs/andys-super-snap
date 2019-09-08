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
            presenter.displayStatus(message: "")
            
            let drawnCard = deck.takeCard()?.value
            
            presenter.updateCurrentCardView(drawnCard: drawnCard)
            presenter.updatePreviousCardView(drawnCard: previousDrawnCard)
            
            previousDrawnCard = drawnCard ?? ""
        } else {
            presenter.displayStatus(message: "Game over")
        }
    }
}
