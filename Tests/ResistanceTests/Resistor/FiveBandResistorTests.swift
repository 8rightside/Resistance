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
    
    func test_value_max() {
        let resistor = FiveBandResistor(digit1: .white, digit2: .white, digit3: .white, multiplier: .white, tolerance: .gold)
        XCTAssertEqual(resistor.value, 999_000_000_000)
    }
    
    func test_value_fractional() {
        let resistor = FiveBandResistor(digit1: .blue, digit2: .grey, digit3: .red, multiplier: .silver, tolerance: .gold)
        XCTAssertEqual(resistor.value, 6.82)
    }
    
    func test_value_3digits() {
        let resistor = FiveBandResistor(digit1: .white, digit2: .black, digit3: .brown, multiplier: .black, tolerance: .gold)
        XCTAssertEqual(resistor.value, 901)
    }
    
    func test_value_5digits() {
        let resistor = FiveBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .red, tolerance: .gold)
        XCTAssertEqual(resistor.value, 33000)
    }
}

// MARK:- Description
extension FiveBandResistorTests {
    func test_description_1digit() {
        let resistor = FiveBandResistor(digit1: .grey, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold)
        XCTAssertEqual(resistor.description, "8 Ω")
    }
    
    func test_description_4digit() {
        let resistor = FiveBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold)
        XCTAssertEqual(resistor.description, "5.6 KΩ")
    }
    
    func test_description_6digit() {
        let resistor = FiveBandResistor(digit1: .yellow, digit2: .black, digit3: .black, multiplier: .orange, tolerance: .gold)
        XCTAssertEqual(resistor.description, "400 KΩ")
    }
    
    func test_description_7digit() {
        let resistor = FiveBandResistor(digit1: .orange, digit2: .white, digit3: .black, multiplier: .yellow, tolerance: .gold)
        XCTAssertEqual(resistor.description, "3.9 MΩ")
    }
    
    func test_description_10digit() {
        let resistor = FiveBandResistor(digit1: .red, digit2: .black, digit3: .black, multiplier: .violet, tolerance: .gold)
        XCTAssertEqual(resistor.description, "2 GΩ")
    }
}

// MARK:- Tolerance Value Range
extension FiveBandResistorTests {
    func test_toleranceValueRange_gold() {
        let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1050)
        XCTAssertEqual(result.lowerBound, 950)
    }
    
    func test_toleranceValueRange_silver() {
        let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .silver)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1100)
        XCTAssertEqual(result.lowerBound, 900)
    }
    
    func test_toleranceValueRange_brown() {
        let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1010)
        XCTAssertEqual(result.lowerBound, 990)
    }
}

// MARK:- Init Value Tolerance
extension FiveBandResistorTests {
    func test_init_value_belowMin() {
        let resistor = FiveBandResistor(value: 0.5)
        XCTAssertEqual(resistor.digits, [.brown, .black, .black])
        XCTAssertEqual(resistor.multiplier, .silver)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_fractional() {
        let resistor = FiveBandResistor(value: 3.3, tolerance: .green)
        XCTAssertEqual(resistor.digits, [.orange, .orange, .black])
        XCTAssertEqual(resistor.multiplier, .silver)
        XCTAssertEqual(resistor.tolerance, .green)
    }
    
    func test_init_value_5digits() {
        let resistor = FiveBandResistor(value: 12345)
        XCTAssertEqual(resistor.digits, [.brown, .red, .orange])
        XCTAssertEqual(resistor.multiplier, .red)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_8digits() {
        let resistor = FiveBandResistor(value: 98765432, tolerance: .silver)
        XCTAssertEqual(resistor.digits, [.white, .grey, .grey])
        XCTAssertEqual(resistor.multiplier, .green)
        XCTAssertEqual(resistor.tolerance, .silver)
    }
    
    func test_init_value_aboveMax() {
        let resistor = FiveBandResistor(value: 9_999_999_999_999)
        XCTAssertEqual(resistor.digits, [.white, .white, .white])
        XCTAssertEqual(resistor.multiplier, .white)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
}

// MARK:- Init Resistor Tolerance
extension FourBandResistorTests {
    
}

// MARK:- Init Exact Value Tolerance
extension FourBandResistorTests {
    
}

// MARK:- Internal
import XCTest
import Resistance

final class FiveBandResistorTests: XCTestCase {
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
        
        ("test_init_value_belowMin",    test_init_value_belowMin),
        ("test_init_value_fractional",  test_init_value_fractional),
        ("test_init_value_5digits",     test_init_value_5digits),
        ("test_init_value_8digits",     test_init_value_8digits),
        ("test_init_value_aboveMax",    test_init_value_aboveMax),
    ]
}
