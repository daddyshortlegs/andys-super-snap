import XCTest
@testable import AndysSuperSnap

class SnapTests: XCTestCase, GameStatusPresenter {

    var snap: Snap!
    
    var statusMessages = [String]()

    var currentCardView: String!
    
    var previousCardView: String!
    
    override func setUp() {
        snap = Snap(presenter: self)
        snap.deck = FakeDeck()
    }
    
    func testShouldGameOverMessage_whenNoCardsTurned() {
        snap.play()
        
        verifyMessageDisplayed(message: "Game over")
    }

    func verifyMessageDisplayed(message: String) {
        let foundMessage = statusMessages.first { $0 == message }
        XCTAssertTrue((foundMessage != nil))
    }
    
    func displayStatus(message: String) {
        self.statusMessages.append(message)
    }
    
    func verifyStatusMessageSent(message: String) {
        
    }
    
    func updateCurrentCardView(drawnCard: String?) {
        self.currentCardView = drawnCard
    }
    
    func updatePreviousCardView(drawnCard: String?) {
        self.previousCardView = drawnCard
    }
}


