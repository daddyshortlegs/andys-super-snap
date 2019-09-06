import XCTest
@testable import AndysSuperSnap

class DeckTests: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        deck = Deck()
    }
    
    func testAllCardsArePresent() {
        ["❤️", "♣️", "♦️", "♠️"].forEach { validateAllPipsPresent(for: $0) }
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
