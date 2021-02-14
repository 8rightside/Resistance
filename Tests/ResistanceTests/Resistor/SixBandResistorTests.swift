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
    
    func test_value_max() {
        let resistor = SixBandResistor(digit1: .white, digit2: .white, digit3: .white, multiplier: .white, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.value, 999_000_000_000)
    }
    
    func test_value_fractional() {
        let resistor = SixBandResistor(digit1: .violet, digit2: .red, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.value, 7.2)
    }
    
    func test_value_3digits() {
        let resistor = SixBandResistor(digit1: .green, digit2: .grey, digit3: .white, multiplier: .black, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.value, 589)
    }
    
    func test_value_5digits() {
        let resistor = SixBandResistor(digit1: .yellow, digit2: .brown, digit3: .red, multiplier: .red, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.value, 41200)
    }
}

// MARK:- Description
extension SixBandResistorTests {
    func test_description_1digit() {
        let resistor = SixBandResistor(digit1: .grey, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.description, "8 Ω")
    }
    
    func test_description_4digit() {
        let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.description, "5.6 KΩ")
    }
    
    func test_description_6digit() {
        let resistor = SixBandResistor(digit1: .yellow, digit2: .black, digit3: .black, multiplier: .orange, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.description, "400 KΩ")
    }
    
    func test_description_7digit() {
        let resistor = SixBandResistor(digit1: .orange, digit2: .white, digit3: .black, multiplier: .yellow, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.description, "3.9 MΩ")
    }
    
    func test_description_10digit() {
        let resistor = SixBandResistor(digit1: .red, digit2: .black, digit3: .black, multiplier: .violet, tolerance: .gold, coefficient: .brown)
        XCTAssertEqual(resistor.description, "2 GΩ")
    }
}

// MARK:- Internal
import XCTest
import Resistance

final class SixBandResistorTests: XCTestCase {
    static var allTests = [
        ("test_value_min",          test_value_min),
        ("test_value_max",          test_value_max),
        ("test_value_fractional",   test_value_fractional),
        ("test_value_3digits",      test_value_3digits),
        ("test_value_5digits",      test_value_5digits),
        
        ("test_description_1digit",     test_description_1digit),
        ("test_description_4digit",     test_description_4digit),
        ("test_description_6digit",     test_description_6digit),
        ("test_description_7digit",     test_description_7digit),
        ("test_description_10digit",    test_description_10digit),
    ]
}
