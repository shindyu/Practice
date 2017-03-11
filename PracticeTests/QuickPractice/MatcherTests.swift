import Quick
import Nimble
@testable import Practice

class MatcherTests: QuickSpec {
    override func spec() {
        describe("Asynchronous expectaions") {
            it("confirms toEventually: case 1") {
                var ocean: [String] = []

                DispatchQueue.main.async {
                    ocean.append("dolphins")
                    ocean.append("whales")
                }

                expect(ocean).toEventually(contain("dolphins", "whales"))
            }

            it("confirms toEventually: case 2") {
                var ocean: [String] = []

                DispatchQueue.main.async {
                    ocean.append("dolphins")
                    ocean.append("whales")
                    ocean.append("jellyfish")
                }

                expect(ocean).toEventually(contain("dolphins", "whales"))
                expect(ocean).toEventually(contain("dolphins", "whales", "jellyfish"))
            }

            it("confirms toEventually: case 3") {
                var ocean: [String] = []

                DispatchQueue.main.async {
                    sleep(2)
                    ocean.append("dolphins")
                    ocean.append("whales")
                    ocean.append("jellyfish")
                }

                // default. toEventually wait 1 second
                // so this test is failure by timed out
                // expect(ocean).toEventually(contain("dolphins", "whales", "jellyfish"))
                expect(ocean).toEventually(contain("dolphins", "whales", "jellyfish"), timeout: 3.0)

                // In some cases (e.g. when running on slower machines) 
                // it can be useful to modify the default timeout and poll interval values.
                // ex: Nimble.AsyncDefaults.Timeout = 5.0
                // ex: Nimble.AsyncDefaults.PollInterval = 0.1
                print("Nimble.AsyncDefaults.Timeout is \(Nimble.AsyncDefaults.Timeout)")
                print("Nimble.AsyncDefaults.PollInterval is \(Nimble.AsyncDefaults.PollInterval)")
            }
        }

        describe("Notification expectation") {
            it("counts method call by notification") {
                let generator = SampleNotificationGenerator()
                let reciever = FakeNotificationReciever()

                expect(reciever.recieveCallCount).to(equal(0))

                generator.post()

                expect(reciever.recieveCallCount).toEventually(equal(1))
            }
        }

        describe("confirmation of nimble matcher") {
            it("confirms contain matcher for String") {
                let string = "abcde"

                // contain
                expect(string).to(contain("bc"))

                // beginWith
                expect(string).to(beginWith("a"))
                
                // endWith
                expect(string).to(endWith("e"))
            }

            it("confirms contain matcher for Array") {
                let stringArray: [String] = ["a","b","c","d","e"]
                let emptyArray: [String] = []

                // contain
                expect(stringArray).to(contain("a"))
                expect(stringArray).to(contain(["b","c"]))
                expect(stringArray).to(contain(["d","a"]))
                expect(stringArray).toNot(contain("f"))

                // beginWith
                expect(stringArray).to(beginWith("a"))
                expect(stringArray).toNot(beginWith("b"))

                // endWith
                expect(stringArray).to(endWith("e"))
                expect(stringArray).toNot(endWith("d"))

                // haveCount
                expect(stringArray).to(haveCount(5))
                expect(stringArray).toNot(haveCount(6))
                expect(emptyArray).to(haveCount(0))

                // isEmpty
                expect(emptyArray).to(beEmpty())
            }

            it("confirms contain matcher for Array") {
                let animalArray: Array<Animal> = [Cat(), Dog(), Bird()]


                expect(animalArray).toNot(beEmpty())
                expect(animalArray).to(haveCount(3))

                // もうちょっといい方法がありそう・・
                expect(animalArray).to(containElementSatisfying({ animal in
                    if let _ = animal as? Dog {
                        return true
                    }
                    if let _ = animal as? Cat {
                        return true
                    }
                    return false
                }))

//                expect(animalArray).to(contains(expectedValue: Cat))
            }

            it("confirms beAKindOf matcher") {
                let animal = Animal()
                let cat = Cat()

                // beAKindOf
                expect(animal).to(beAKindOf(Animal.self))
                expect(cat).to(beAKindOf(Animal.self))
            }

            it("confirms beAInstaceOf matcher") {
                let animal = Animal()
                let cat = Cat()
                
                // beAnInstanceOf
                expect(animal).to(beAnInstanceOf(Animal.self))
                expect(cat).toNot(beAnInstanceOf(Animal.self))
            }

            it("confirms group matcher") {
                var actual = 9
                expect(actual).to(satisfyAnyOf(beLessThan(10), beGreaterThan(20)))
                
                actual = 21
                expect(actual).to(satisfyAnyOf(beLessThan(10), beGreaterThan(20)))
            }
        }
    }
}
