import XCTest
@testable import AndysSuperSnap

class DeckTests: XCTestCase {

    func testExample() {
        let deck = Deck()
        
        
        XCTAssertEqual("A❤️", deck.takeCard()?.value)
        XCTAssertEqual("2❤️", deck.takeCard()?.value)
        XCTAssertEqual("3❤️", deck.takeCard()?.value)
        XCTAssertEqual("4❤️", deck.takeCard()?.value)
        XCTAssertEqual("5❤️", deck.takeCard()?.value)
        XCTAssertEqual("6❤️", deck.takeCard()?.value)
        XCTAssertEqual("7❤️", deck.takeCard()?.value)
        XCTAssertEqual("8❤️", deck.takeCard()?.value)
        XCTAssertEqual("9❤️", deck.takeCard()?.value)
        XCTAssertEqual("10❤️", deck.takeCard()?.value)
        XCTAssertEqual("J❤️", deck.takeCard()?.value)
        XCTAssertEqual("Q❤️", deck.takeCard()?.value)
        XCTAssertEqual("K❤️", deck.takeCard()?.value)
    }

}
