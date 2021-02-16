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
    
    func test_value_max() {
        let resistor = FourBandResistor(digit1: .white, digit2: .white, multiplier: .white, tolerance: .silver)
        XCTAssertEqual(resistor.value, 99_000_000_000)
    }
    
    func test_value_fractional() {
        let resistor = FourBandResistor(digit1: .orange, digit2: .red, multiplier: .gold, tolerance: .silver)
        XCTAssertEqual(resistor.value, 3.2)
    }
    
    func test_value_3digits() {
        let resistor = FourBandResistor(digit1: .green, digit2: .blue, multiplier: .brown, tolerance: .silver)
        XCTAssertEqual(resistor.value, 560)
    }
    
    func test_value_5digits() {
        let resistor = FourBandResistor(digit1: .yellow, digit2: .violet, multiplier: .orange, tolerance: .silver)
        XCTAssertEqual(resistor.value, 47000)
    }
}

// MARK:- Description
extension FourBandResistorTests {
    func test_description_1digit() {
        let resistor = FourBandResistor(digit1: .grey, digit2: .black, multiplier: .gold, tolerance: .silver)
        XCTAssertEqual(resistor.description, "8 Ω")
    }
    
    func test_description_4digit() {
        let resistor = FourBandResistor(digit1: .green, digit2: .blue, multiplier: .red, tolerance: .silver)
        XCTAssertEqual(resistor.description, "5.6 KΩ")
    }
    
    func test_description_6digit() {
        let resistor = FourBandResistor(digit1: .yellow, digit2: .black, multiplier: .yellow, tolerance: .silver)
        XCTAssertEqual(resistor.description, "400 KΩ")
    }
    
    func test_description_7digit() {
        let resistor = FourBandResistor(digit1: .orange, digit2: .white, multiplier: .green, tolerance: .silver)
        XCTAssertEqual(resistor.description, "3.9 MΩ")
    }
    
    func test_description_10digit() {
        let resistor = FourBandResistor(digit1: .red, digit2: .black, multiplier: .grey, tolerance: .silver)
        XCTAssertEqual(resistor.description, "2 GΩ")
    }
}

// MARK:- Tolerance Value Range
extension FourBandResistorTests {
    func test_toleranceValueRange_gold() {
        let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .gold)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1050)
        XCTAssertEqual(result.lowerBound, 950)
    }
    
    func test_toleranceValueRange_silver() {
        let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .silver)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1100)
        XCTAssertEqual(result.lowerBound, 900)
    }
    
    func test_toleranceValueRange_brown() {
        let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1010)
        XCTAssertEqual(result.lowerBound, 990)
    }
}

// MARK:- Convenience Inits
extension FourBandResistorTests {
    
}

// MARK:- Failable Inits
extension FourBandResistorTests {
    
}

// MARK:- Internal
import XCTest
import Resistance

final class FourBandResistorTests: XCTestCase {
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
        
        ("test_toleranceValueRange_gold",   test_toleranceValueRange_gold),
        ("test_toleranceValueRange_silver", test_toleranceValueRange_silver),
        ("test_toleranceValueRange_brown",  test_toleranceValueRange_brown),
    ]
}
