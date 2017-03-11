import Quick
import Nimble
import Result
import BrightFutures
@testable import Practice

class RepositoryTests: QuickSpec {
    override func spec() {
        describe("get method") {
            it("gets animal data") {
                let repo = DefaultGetRepository()

                var name = "hoge"
                repo.get()
                    .onSuccess { data in
                        name = data.name
                    }

                expect(name).toEventually(equal("cat"))
            }
        }
    }
}
