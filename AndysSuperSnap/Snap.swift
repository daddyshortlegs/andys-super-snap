import Foundation

class Snap {
    private let presenter: GameStatusPresenter
    var deck: Deck = Standard52CardDeck()
    private var previousDrawnCard: Card?
    private var currentPlayer = 1
    private var gameOver = false


    init(presenter: GameStatusPresenter) {
        self.presenter = presenter
        deck.shuffle()
    }
    
    func takeTurn() {
        if let drawnCard = deck.takeCard() {
            presenter.displayStatus(message: "Player \(currentPlayer) turned " + drawnCard.value)

            if cardsMatch(previous: previousDrawnCard, current: drawnCard) {
                gameOver = true
            }

            switchPlayer()
            print("previous card = \(self.previousDrawnCard?.value), current card = \(drawnCard.value)")
                
            self.presenter.updateCurrentCardView(drawnCard: drawnCard.value)
            self.presenter.updatePreviousCardView(drawnCard: self.previousDrawnCard?.value)
                        
            previousDrawnCard = drawnCard
        } else {
            presenter.gameOver(message: "Draw :-(")
        }

        if gameOver == true {
            var maxRandom = 2000
            
            presenter.gameOver(message: "SNAP! Player \(currentPlayer) wins!!!")
        }
    }
    
    func isGameOver() -> Bool {
        return gameOver
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
        presenter.displayStatus(message: "Player \(currentPlayer) turn")
    }
}


extension Int {
  var arc4random: Int {
    if self > 0 {
      return Int(arc4random_uniform(UInt32(self)))
    } else if self < 0 {
      return -Int(arc4random_uniform(UInt32(self)))
    } else {
      return 0
    }
  }
}
