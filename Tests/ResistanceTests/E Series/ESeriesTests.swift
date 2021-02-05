/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

// MARK: Contains Preferred Value
extension ESeriesTests {
    func test_containsPreferredValue_returnsTrue_withFractional() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(4.7)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferredValue_returnsTrue_with2Digits() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(33)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferredValue_returnsTrue_with5Digits() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(68000)
        XCTAssertTrue(result)
    }
    
    func test_containsPreferredValue_returnsFalse_withFractional() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(4.6)
        XCTAssertFalse(result)
    }
    
    func test_containsPreferredValue_returnsFalse_with2Digits() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(23)
        XCTAssertFalse(result)
    }
    
    func test_containsPreferredValue_returnsFalse_with5Digits() {
        let sut = E12Series()
        let result = sut.containsPreferredValue(12345)
        XCTAssertFalse(result)
    }
}

// MARK:- Next Value Up
extension ESeriesTests {
    func test_nextValueUp_with2Digits_notInSeries() {
        let sut = E24Series()
        let result = sut.nextValueUp(from: 53)
        XCTAssertEqual(result, 56)
    }
    
    func test_nextValueUp_with5Digits_notInSeries() {
        let sut = E24Series()
        let result = sut.nextValueUp(from: 45000)
        XCTAssertEqual(result, 47000)
    }
    
    func test_nextValueUp_with2Digits_inSeries() {
        let sut = E24Series()
        let result = sut.nextValueUp(from: 33)
        XCTAssertEqual(result, 36)
    }
    
    func test_nextValueUp_with5Digits_inSeries() {
        let sut = E24Series()
        let result = sut.nextValueUp(from: 62000)
        XCTAssertEqual(result, 68000)
    }
}

// MARK:- Next Value Down
extension ESeriesTests {
    func test_nextValueDown_with2Digits_notInSeries() {
        let sut = E24Series()
        let result = sut.nextValueDown(from: 53)
        XCTAssertEqual(result, 51)
    }
    
    func test_nextValueDown_with5Digits_notInSeries() {
        let sut = E24Series()
        let result = sut.nextValueDown(from: 45000)
        XCTAssertEqual(result, 43000)
    }
    
    func test_nextValueDown_with2Digits_inSeries() {
        let sut = E24Series()
        let result = sut.nextValueDown(from: 33)
        XCTAssertEqual(result, 30)
    }
    
    func test_nextValueDown_with5Digits_inSeries() {
        let sut = E24Series()
        let result = sut.nextValueDown(from: 62000)
        XCTAssertEqual(result, 56000)
    }
}

// MARK:- Internal
import XCTest
@testable import Resistance

final class ESeriesTests: XCTestCase {
    
    static var allTests = [
        ("test_containsPreferredValue_returnsTrue_withFractional",   test_containsPreferredValue_returnsTrue_withFractional),
        ("test_containsPreferredValue_returnsTrue_with2Digits",      test_containsPreferredValue_returnsTrue_with2Digits),
        ("test_containsPreferredValue_returnsTrue_with5Digits",      test_containsPreferredValue_returnsTrue_with5Digits),
        ("test_containsPreferredValue_returnsFalse_withFractional",  test_containsPreferredValue_returnsFalse_withFractional),
        ("test_containsPreferredValue_returnsFalse_with2Digits",     test_containsPreferredValue_returnsFalse_with2Digits),
        ("test_containsPreferredValue_returnsFalse_with5Digits",     test_containsPreferredValue_returnsFalse_with5Digits),
        
        ("test_nextValueUp_with2Digits_notInSeries",    test_nextValueUp_with2Digits_notInSeries),
        ("test_nextValueUp_with5Digits_notInSeries",    test_nextValueUp_with5Digits_notInSeries),
        ("test_nextValueDown_with2Digits_inSeries",     test_nextValueDown_with2Digits_inSeries),
        ("test_nextValueUp_with2Digits_inSeries",       test_nextValueUp_with2Digits_inSeries),
        
        ("test_nextValueDown_with2Digits_notInSeries",  test_nextValueDown_with2Digits_notInSeries),
        ("test_nextValueDown_with5Digits_notInSeries",  test_nextValueDown_with5Digits_notInSeries),
        ("test_nextValueDown_with2Digits_inSeries",     test_nextValueDown_with2Digits_inSeries),
        ("test_nextValueDown_with5Digits_inSeries",     test_nextValueDown_with5Digits_inSeries),
    ]
}
