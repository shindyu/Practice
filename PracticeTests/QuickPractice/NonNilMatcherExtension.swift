import Nimble
@testable import Practice

// write own matcher
public func equal<T: Equatable>(expectedValue: T?) -> MatcherFunc<T?> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "equal <\(expectedValue)>"
        if let actualValue = try actualExpression.evaluate() {
            return actualValue == expectedValue
        } else {
            return false
        }
    }
}
