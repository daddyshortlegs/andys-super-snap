class Snap {
    let presenter: GameStatusPresenter
    
    
    var previousDrawnCard: String?

    init(presenter: GameStatusPresenter) {
        self.presenter = presenter
    }
    
    func play() {
        let deck = Deck()
        
        
        presenter.displayStatus(message: "Get ready....")
        
        if !deck.isEmpty() {
            presenter.displayStatus(message: "")
            
            let drawnCard = deck.takeCard()?.value
            
            presenter.updateCurrentCardView(drawnCard: drawnCard)
            presenter.updatePreviousCardView(drawCard: previousDrawnCard)
            
            previousDrawnCard = drawnCard ?? ""
        } else {
            presenter.displayStatus(message: "Game over")
        }
    }
}
