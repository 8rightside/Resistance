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

// MARK:- Init Value Tolerance
extension FourBandResistorTests {
    func test_init_value_belowMin() {
        let resistor = FourBandResistor(value: 0.05)
        XCTAssertEqual(resistor.digits, [.brown, .black])
        XCTAssertEqual(resistor.multiplier, .silver)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_fractional() {
        let resistor = FourBandResistor(value: 4.7, tolerance: .silver)
        XCTAssertEqual(resistor.digits, [.yellow, .violet])
        XCTAssertEqual(resistor.multiplier, .gold)
        XCTAssertEqual(resistor.tolerance, .silver)
    }
    
    func test_init_value_5digits() {
        let resistor = FourBandResistor(value: 56789)
        XCTAssertEqual(resistor.digits, [.green, .violet])
        XCTAssertEqual(resistor.multiplier, .orange)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_8digits() {
        let resistor = FourBandResistor(value: 12345678, tolerance: .blue)
        XCTAssertEqual(resistor.digits, [.brown, .red])
        XCTAssertEqual(resistor.multiplier, .blue)
        XCTAssertEqual(resistor.tolerance, .blue)
    }
    
    func test_init_value_aboveMax() {
        let resistor = FourBandResistor(value: 999_999_999_999)
        XCTAssertEqual(resistor.digits, [.white, .white])
        XCTAssertEqual(resistor.multiplier, .white)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
}

// MARK:- Init Resistor Tolerance
extension FourBandResistorTests {
    func test_init_resistor_4Band() {
        let resistor = FourBandResistor(value: 3300)
        let sut = FourBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.orange, .orange])
        XCTAssertEqual(sut.multiplier, .red)
        XCTAssertEqual(sut.tolerance, .gold)
    }
    
    func test_init_resistor_5Band() {
        let resistor = FiveBandResistor(value: 47000)
        let sut = FourBandResistor(resistor: resistor, tolerance: .yellow)
        XCTAssertEqual(sut.digits, [.yellow, .violet])
        XCTAssertEqual(sut.multiplier, .orange)
        XCTAssertEqual(sut.tolerance, .yellow)
    }
    
    func test_init_resistor_5Band3SigFigs() {
        let resistor = FiveBandResistor(value: 67800)
        let sut = FourBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.blue, .grey])
        XCTAssertEqual(sut.multiplier, .orange)
        XCTAssertEqual(sut.tolerance, .gold)
    }
    
    func test_init_resistor_6Band() {
        let resistor = SixBandResistor(value: 5.6)
        let sut = FourBandResistor(resistor: resistor, tolerance: .green)
        XCTAssertEqual(sut.digits, [.green, .blue])
        XCTAssertEqual(sut.multiplier, .gold)
        XCTAssertEqual(sut.tolerance, .green)
    }
    
    func test_init_resistor_6Band3SigFigs() {
        let resistor = SixBandResistor(value: 4.23)
        let sut = FourBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.yellow, .red])
        XCTAssertEqual(sut.multiplier, .gold)
        XCTAssertEqual(sut.tolerance, .gold)
    }
}

// MARK:- Init Exact Value Tolerance
extension FourBandResistorTests {
    func test_init_exactValue_belowMin() throws {
        XCTAssertThrowsError(try FourBandResistor(exactValue: 0.05))
    }
    
    func test_init_exactValue_fractional() throws {
        let resistor = try FourBandResistor(exactValue: 4.7, tolerance: .silver)
        XCTAssertEqual(resistor.digits, [.yellow, .violet])
        XCTAssertEqual(resistor.multiplier, .gold)
        XCTAssertEqual(resistor.tolerance, .silver)
    }
    
    func test_init_exactValue_5digits() {
        XCTAssertThrowsError(try FourBandResistor(exactValue: 56789))
    }
    
    func test_init_exactValue_8digits() throws {
        let resistor = try FourBandResistor(exactValue: 12000000, tolerance: .blue)
        XCTAssertEqual(resistor.digits, [.brown, .red])
        XCTAssertEqual(resistor.multiplier, .blue)
        XCTAssertEqual(resistor.tolerance, .blue)
    }
    
    func test_init_exactValue_aboveMax() {
        XCTAssertThrowsError(try FourBandResistor(exactValue: 999_999_999_999))
    }
}

// MARK:- Init Exact Resistor Tolerance
extension FourBandResistorTests {
    func test_init_exactResistor_4Band() throws {
        let resistor = FourBandResistor(value: 3300)
        let sut = try FourBandResistor(exactResistor: resistor)
        XCTAssertEqual(sut.digits, [.orange, .orange])
        XCTAssertEqual(sut.multiplier, .red)
        XCTAssertEqual(sut.tolerance, .gold)
    }
    
    func test_init_exactResistor_5Band() throws {
        let resistor = FiveBandResistor(value: 47000)
        let sut = try FourBandResistor(exactResistor: resistor, tolerance: .yellow)
        XCTAssertEqual(sut.digits, [.yellow, .violet])
        XCTAssertEqual(sut.multiplier, .orange)
        XCTAssertEqual(sut.tolerance, .yellow)
    }
    
    func test_init_exactResistor_5Band3SigFigs() {
        let resistor = FiveBandResistor(value: 67800)
        XCTAssertThrowsError(try FourBandResistor(exactResistor: resistor))
        
    }
    
    func test_init_exactResistor_6Band() throws {
        let resistor = SixBandResistor(value: 5.6)
        let sut = try FourBandResistor(exactResistor: resistor, tolerance: .green)
        XCTAssertEqual(sut.digits, [.green, .blue])
        XCTAssertEqual(sut.multiplier, .gold)
        XCTAssertEqual(sut.tolerance, .green)
    }
    
    func test_init_exactResistor_6Band3SigFigs() {
        let resistor = SixBandResistor(value: 4.23)
        XCTAssertThrowsError(try FourBandResistor(exactResistor: resistor))
        
    }
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
        
        ("test_init_value_belowMin",    test_init_value_belowMin),
        ("test_init_value_fractional",  test_init_value_fractional),
        ("test_init_value_5digits",     test_init_value_5digits),
        ("test_init_value_8digits",     test_init_value_8digits),
        ("test_init_value_aboveMax",    test_init_value_aboveMax),
        
        ("test_init_resistor_4Band",            test_init_resistor_4Band),
        ("test_init_resistor_5Band",            test_init_resistor_5Band),
        ("test_init_resistor_5Band3SigFigs",    test_init_resistor_5Band3SigFigs),
        ("test_init_resistor_6Band",            test_init_resistor_6Band),
        ("test_init_resistor_6Band3SigFigs",    test_init_resistor_6Band3SigFigs),
        
        ("test_init_exactValue_belowMin",   test_init_exactValue_belowMin),
        ("test_init_exactValue_fractional", test_init_exactValue_fractional),
        ("test_init_exactValue_5digits",    test_init_exactValue_5digits),
        ("test_init_exactValue_8digits",    test_init_exactValue_8digits),
        ("test_init_exactValue_aboveMax",   test_init_exactValue_aboveMax),
        
    ]
}
