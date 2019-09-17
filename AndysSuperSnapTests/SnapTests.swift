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
        fakeDeck = FakeDeck()
        snap.deck = fakeDeck
        snap.play()
        verifyMessageDisplayed(message: "Game over")
    }

    func testShouldShowPlayerTurnedCard_whenCardTakenFromDeck() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .five, suit: .hearts))
        snap.deck = fakeDeck

        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned 5❤️")
        verifyMessageDisplayed(message: "Game over")
    }

    func testShouldSTurnADifferentCard() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .ace, suit: .spades))
        snap.deck = fakeDeck
        
        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned A♠️")
        verifyMessageDisplayed(message: "Game over")
    }

    func testShouldTurnOverCards_forEachPlayer() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .jack, suit: .diamonds))
        fakeDeck.addCard(Card(pipValue: .ace, suit: .spades))
        snap.deck = fakeDeck
        
        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned A♠️")
        verifyMessageDisplayed(message: "Player 2 turned J♦️")
        verifyMessageDisplayed(message: "Game over")
    }

    func testShouldTurnAThirdCard() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .five, suit: .hearts))
        fakeDeck.addCard(Card(pipValue: .jack, suit: .diamonds))
        fakeDeck.addCard(Card(pipValue: .ace, suit: .spades))
        snap.deck = fakeDeck
        
        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned A♠️")
        verifyMessageDisplayed(message: "Player 2 turned J♦️")
        verifyMessageDisplayed(message: "Player 1 turned 5❤️")
        verifyMessageDisplayed(message: "Game over")
    }

    func testPlayer1ShouldWin_whenMatchingCard() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .jack, suit: .hearts))
        fakeDeck.addCard(Card(pipValue: .jack, suit: .diamonds))
        fakeDeck.addCard(Card(pipValue: .ace, suit: .spades))
        snap.deck = fakeDeck
        
        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned A♠️")
        verifyMessageDisplayed(message: "Player 2 turned J♦️")
        verifyMessageDisplayed(message: "Player 1 turned J❤️")
        verifyMessageDisplayed(message: "SNAP! Player 1 wins!!!")
    }

    func testPlayer2ShouldWin_whenMatchingCard() {
        fakeDeck = FakeDeck()
        fakeDeck.addCard(Card(pipValue: .five, suit: .clubs))
        fakeDeck.addCard(Card(pipValue: .five, suit: .hearts))
        fakeDeck.addCard(Card(pipValue: .jack, suit: .diamonds))
        fakeDeck.addCard(Card(pipValue: .ace, suit: .spades))
        snap.deck = fakeDeck
        
        snap.play()
        
        verifyMessageDisplayed(message: "Player 1 turned A♠️")
        verifyMessageDisplayed(message: "Player 2 turned J♦️")
        verifyMessageDisplayed(message: "Player 1 turned 5❤️")
        verifyMessageDisplayed(message: "Player 2 turned 5♣️")
        verifyMessageDisplayed(message: "SNAP! Player 2 wins!!!")
    }

    
    
    func verifyMessageDisplayed(message: String) {
        let foundMessage = statusMessages.first { $0 == message }
        if foundMessage == nil {
            XCTFail("Couldn't find message \(message)")
        } else {
            XCTAssertEqual(message, foundMessage)
        }
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


