/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

// MARK:- Resistance Value
extension FourBandResistorTests {
    func test_value_min() {
        let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .silver, tolerance: .silver)
        XCTAssertEqual(resistor.value, 0.1)
    }
}

// MARK:- Internal
import XCTest
import Resistance

final class FourBandResistorTests: XCTestCase {
    static var allTests = [
        ("test_value_min", test_value_min),
    ]
}
