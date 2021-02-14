/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

// MARK:- Resistance Value
extension FiveBandResistorTests {
    func test_value_min() {
        let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold)
        XCTAssertEqual(resistor.value, 1)
    }
}

// MARK:- Internal
import XCTest
import Resistance

final class FiveBandResistorTests: XCTestCase {
    static var allTests = [
        ("test_value_min", test_value_min),
    ]
}
