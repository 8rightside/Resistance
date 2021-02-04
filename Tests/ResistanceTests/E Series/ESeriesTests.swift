/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

// MARK: Contains Prefered Value
extension ESeriesTests {
    func test_containsPreferedValue_returnsTrue_withFractional() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(4.7)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferedValue_returnsTrue_with2Digits() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(33)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferedValue_returnsTrue_with5Digits() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(68000)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferedValue_returnsFalse_withFractional() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(4.6)
        XCTAssertFalse(result)
    }
    
    func test_containsPreferedValue_returnsFalse_with2Digits() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(23)
        XCTAssertFalse(result)
    }
    
    func test_containsPreferedValue_returnsFalse_with5Digits() {
        let sut = E12Series()
        let result = sut.containsPreferedValue(12345)
        XCTAssertFalse(result)
    }
}

// MARK:- Next Value Up
extension ESeriesTests {
    func test_nextValueUp_() {
        
    }
}

// MARK:- Next Value Down
extension ESeriesTests {
    func test_nextValueDown_() {
        
    }
}

// MARK:- Internal
import XCTest
@testable import Resistance

final class ESeriesTests: XCTestCase {
    
    static var allTests = [
        ("test_containsPreferedValue_returnsTrue_withFractional",   test_containsPreferedValue_returnsTrue_withFractional),
        ("test_containsPreferedValue_returnsTrue_with2Digits",      test_containsPreferedValue_returnsTrue_with2Digits),
        ("test_containsPreferedValue_returnsTrue_with5Digits",      test_containsPreferedValue_returnsTrue_with5Digits),
        ("test_containsPreferedValue_returnsFalse_withFractional",  test_containsPreferedValue_returnsFalse_withFractional),
        ("test_containsPreferedValue_returnsFalse_with2Digits",     test_containsPreferedValue_returnsFalse_with2Digits),
        ("test_containsPreferedValue_returnsFalse_with5Digits",     test_containsPreferedValue_returnsFalse_with5Digits),
    ]
}
