//
//  OtherTest.swift
//  UnitTestTests
//
//  Created by admin on 29/4/23.
//

import UIKit
import XCTest
@testable import UnitTest


class OtherTest: XCTestCase {
    
    func testAddStuff() {
        let math = MathStuff()
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
//        XCTAssertTrue(true)
//        XCTAssertFalse(false)
//        XCTAssertNil(0)
//        XCTAssertNotNil(6)
    }
}
