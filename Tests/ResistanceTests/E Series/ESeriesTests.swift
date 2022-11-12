/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

// MARK: Contains Preferred Value
extension ESeriesTests {
    func test_containsPreferredValue_returnsTrue_withFractional() {
        let sut = E12Series()
        let resistor = FourBandResistor(value: 4.7)
        let result1 = sut.containsPreferredValue(4.7)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
    }
    
    func test_containsPreferredValue_returnsTrue_with2Digits() {
        let sut = E12Series()
        let resistor = FiveBandResistor(value: 33)
        let result1 = sut.containsPreferredValue(33)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
    }
    
    func test_containsPreferredValue_returnsTrue_with5Digits() {
        let sut = E12Series()
        let resistor = SixBandResistor(value: 68000)
        let result1 = sut.containsPreferredValue(68000)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
    }
    
    func test_containsPreferredValue_returnsFalse_withFractional() {
        let sut = E12Series()
        let resistor = FourBandResistor(value: 4.6)
        let result1 = sut.containsPreferredValue(4.6)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
    }
    
    func test_containsPreferredValue_returnsFalse_with2Digits() {
        let sut = E12Series()
        let resistor = FiveBandResistor(value: 23)
        let result1 = sut.containsPreferredValue(23)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
    }
    
    func test_containsPreferredValue_returnsFalse_with5Digits() {
        let sut = E12Series()
        let resistor = SixBandResistor(value: 12345)
        let result1 = sut.containsPreferredValue(12345)
        let result2 = sut.containsPreferredValue(resistor)
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
    }
}

// MARK: - Next Value Up
extension ESeriesTests {
    func test_nextValueUp_with2Digits_notInSeries() {
        let sut = E24Series()
        let resistor = FourBandResistor(value: 53)
        let result1 = sut.nextValueUp(from: 53)
        let result2 = sut.nextValueUp(from: resistor)
        XCTAssertEqual(result1, 56)
        XCTAssertEqual(result2, 56)
    }
    
    func test_nextValueUp_with5Digits_notInSeries() {
        let sut = E24Series()
        let resistor = FiveBandResistor(value: 45000)
        let result1 = sut.nextValueUp(from: 45000)
        let result2 = sut.nextValueUp(from: resistor)
        XCTAssertEqual(result1, 47000)
        XCTAssertEqual(result2, 47000)
    }
    
    func test_nextValueUp_with2Digits_inSeries() {
        let sut = E24Series()
        let resistor = SixBandResistor(value: 33)
        let result1 = sut.nextValueUp(from: 33)
        let result2 = sut.nextValueUp(from: resistor)
        XCTAssertEqual(result1, 36)
        XCTAssertEqual(result2, 36)
    }
    
    func test_nextValueUp_with5Digits_inSeries() {
        let sut = E24Series()
        let resistor = FourBandResistor(value: 62000)
        let result1 = sut.nextValueUp(from: 62000)
        let result2 = sut.nextValueUp(from: resistor)
        XCTAssertEqual(result1, 68000)
        XCTAssertEqual(result2, 68000)
    }
}

// MARK: - Next Value Down
extension ESeriesTests {
    func test_nextValueDown_with2Digits_notInSeries() {
        let sut = E24Series()
        let resistor = FourBandResistor(value: 53)
        let result1 = sut.nextValueDown(from: 53)
        let result2 = sut.nextValueDown(from: resistor)
        XCTAssertEqual(result1, 51)
        XCTAssertEqual(result2, 51)
    }
    
    func test_nextValueDown_with5Digits_notInSeries() {
        let sut = E24Series()
        let resistor = FiveBandResistor(value: 45000)
        let result1 = sut.nextValueDown(from: 45000)
        let result2 = sut.nextValueDown(from: resistor)
        XCTAssertEqual(result1, 43000)
        XCTAssertEqual(result2, 43000)
    }
    
    func test_nextValueDown_with2Digits_inSeries() {
        let sut = E24Series()
        let resistor = SixBandResistor(value: 33)
        let result1 = sut.nextValueDown(from: 33)
        let result2 = sut.nextValueDown(from: resistor)
        XCTAssertEqual(result1, 30)
        XCTAssertEqual(result2, 30)
    }
    
    func test_nextValueDown_with5Digits_inSeries() {
        let sut = E24Series()
        let resistor = FourBandResistor(value: 62000)
        let result1 = sut.nextValueDown(from: 62000)
        let result2 = sut.nextValueDown(from: resistor)
        XCTAssertEqual(result1, 56000)
        XCTAssertEqual(result2, 56000)
    }
}

// MARK: - Internal
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
