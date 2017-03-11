import Quick
import Nimble
@testable import Practice

class SuitEnumTests: QuickSpec {
    override func spec() {
        describe("Enum collection?") {
            it("gets suit from suit enum") {
                for suit in Suit.allValues {
                    print(suit.hashValue)
                    print(suit.rawValue)
                }
            }
        }
    }
}
