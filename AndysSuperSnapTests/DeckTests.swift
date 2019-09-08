import XCTest
@testable import AndysSuperSnap

class DeckTests: XCTestCase {

    var deck: Standard52CardDeck!
    
    override func setUp() {
        deck = Standard52CardDeck()
    }
    
    func testAllCardsArePresent() {
        XCTAssertFalse(deck.isEmpty())
        ["❤️", "♣️", "♦️", "♠️"].forEach { validateAllPipsPresent(for: $0) }
        XCTAssertTrue(deck.isEmpty())
    }
    
    func validateAllPipsPresent(for suit: String) {
        XCTAssertEqual("A\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("2\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("3\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("4\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("5\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("6\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("7\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("8\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("9\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("10\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("J\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("Q\(suit)", deck.takeCard()?.value)
        XCTAssertEqual("K\(suit)", deck.takeCard()?.value)
    }

}
