//
//  PracticeTests.swift
//  PracticeTests
//
//  Created by shindyu on 2017/03/11.
//  Copyright © 2017年 shindyu.com. All rights reserved.
//

import XCTest
@testable import Practice

class PracticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

import Quick
import Nimble

class PracticeTests2: QuickSpec {
    override func spec() {
        describe("test") {
            it("sample") {
                expect(false).to(beAKindOf(Bool.self))
            }
        }
    }
}
