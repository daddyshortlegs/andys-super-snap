import XCTest
@testable import AndysSuperSnap

class DeckTests: XCTestCase {

    func testExample() {
        let deck = Deck()
        
        let card = deck.takeCard()
        
        XCTAssertEqual("A❤️", card?.value)
    }

}
