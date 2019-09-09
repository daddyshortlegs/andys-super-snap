import XCTest
@testable import AndysSuperSnap

class SnapTests: XCTestCase, GameStatusPresenter {

    var snap: Snap!
    
    var statusMessages = [String]()

    var currentCardView: String!
    
    var previousCardView: String!
    
    var fakeDeck: FakeDeck!
    
    override func setUp() {
        snap = Snap(presenter: self)
    }
    
    func testShouldGameOverMessage_whenNoCardsTurned() {
        snap.play()
        verifyMessageDisplayed(message: "Game over")
    }

    func testShouldShowPlayerTurnedCard_whenCardTakenFromDeck() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .five, suit: .hearts))
        snap.deck = fakeDeck

        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned 5H")
        verifyMessageDisplayed(message: "Game over")
    }
    
    func verifyMessageDisplayed(message: String) {
        let foundMessage = statusMessages.first { $0 == message }
        XCTAssertTrue((foundMessage != nil))
    }
    
    func displayStatus(message: String) {
        self.statusMessages.append(message)
    }
    
    func updateCurrentCardView(drawnCard: String?) {
        self.currentCardView = drawnCard
    }
    
    func updatePreviousCardView(drawnCard: String?) {
        self.previousCardView = drawnCard
    }
}


