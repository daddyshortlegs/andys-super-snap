import XCTest
@testable import AndysSuperSnap

class SnapTests: XCTestCase, GameStatusPresenter {

    var snap: Snap!
    
    var status: String!

    var currentCardView: String!
    
    var previousCardView: String!
    
    override func setUp() {
        snap = Snap(presenter: self)
        snap.deck = FakeDeck()
    }
    
    func testShouldShowGameStartingMessage() {
        snap.play()
        
        XCTAssertEqual("Game over", status)
    }

    
    func displayStatus(message: String) {
        self.status = message
    }
    
    func updateCurrentCardView(drawnCard: String?) {
        self.currentCardView = drawnCard
    }
    
    func updatePreviousCardView(drawnCard: String?) {
        self.previousCardView = drawnCard
    }
}


