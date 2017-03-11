import Foundation

class Animal {
    var name: String = ""
}

class Cat: Animal {
    override init() {
        super.init()
        name = "cat"
    }
}

class Dog: Animal {
    override init() {
        super.init()
        name = "dog"
    }
}

class Bird: Animal {
    override init() {
        super.init()
        name = "bird"
    }
}
