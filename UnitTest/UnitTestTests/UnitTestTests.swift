//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by admin on 29/4/23.
//

import XCTest
@testable import UnitTest

final class UnitTestTests: XCTestCase {

    func testAddStuff() {
        let math = MathStuff()
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
//        XCTAssertTrue(true)
//        XCTAssertFalse(false)
//        XCTAssertNil(0)
//        XCTAssertNotNil(6)
    }
    
    func testMultiplyStuff() {
        let math = MathStuff()
        let result = math.multipleNumbers(x: 2, y: 2)
        XCTAssertEqual(result, 4)
    }
    
    func testDevideStuff() {
        let math = MathStuff()
        let result = math.devideNumbers(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }

}
