/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

// MARK:- Resistance Value
extension SixBandResistorTests {
    func test_value_min() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.value, 1)
    }
}

// MARK:- Internal
import XCTest
import Resistance

final class SixBandResistorTests: XCTestCase {
    static var allTests = [
        ("test_value_min", test_value_min),
    ]
}
