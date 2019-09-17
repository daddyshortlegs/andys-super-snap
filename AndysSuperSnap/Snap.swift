import Foundation

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
        var gameOver = false
        
        while let drawnCard = deck.takeCard() {
            presenter.displayStatus(message: "Player \(currentPlayer) turned " + drawnCard.value)

            if cardsMatch(previous: previousDrawnCard, current: drawnCard) {
                gameOver = true
                break
            }


            switchPlayer()

            DispatchQueue.main.async {
                self.presenter.updateCurrentCardView(drawnCard: drawnCard.value)
                self.presenter.updatePreviousCardView(drawnCard: self.previousDrawnCard?.value)
            }
            
//                sleep(UInt32(TimeInterval(1)))
            
            previousDrawnCard = drawnCard
        }

        if gameOver == true {
            presenter.displayStatus(message: "SNAP! Player \(currentPlayer) wins!!!")
        } else {
            presenter.displayStatus(message: "Game over")
        }
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
