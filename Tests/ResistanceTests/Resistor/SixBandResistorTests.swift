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

// MARK:- Tolerance Value Range
extension SixBandResistorTests {
    func test_toleranceValueRange_gold() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1050)
        XCTAssertEqual(result.lowerBound, 950)
    }
    
    func test_toleranceValueRange_silver() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .silver, coefficient: .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1100)
        XCTAssertEqual(result.lowerBound, 900)
    }
    
    func test_toleranceValueRange_brown() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .brown, coefficient: .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.upperBound, 1010)
        XCTAssertEqual(result.lowerBound, 990)
    }
}

// MARK: - Coefficient Value Range


// MARK: 100 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR100() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 997.5)
        XCTAssertEqual(result.upperBound, 1002.5)
    }
    
    func test_coefficientValueRange_tempChange50_TCR100() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 995)
        XCTAssertEqual(result.upperBound, 1005)
    }
    
    func test_coefficientValueRange_tempChange100_TCR100() {
        let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 990)
        XCTAssertEqual(result.upperBound, 1010)
    }
}

// MARK: 50 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR50() {
        let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 2197.25)
        XCTAssertEqual(result.upperBound, 2202.75)
    }
    
    func test_coefficientValueRange_tempChange50_TCR50() {
        let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 2194.5)
        XCTAssertEqual(result.upperBound, 2205.5)
    }
    
    func test_coefficientValueRange_tempChange100_TCR50() {
        let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 2189)
        XCTAssertEqual(result.upperBound, 2211)
    }
}

// MARK: 25 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR25() {
        let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 4697.0625)
        XCTAssertEqual(result.upperBound, 4702.9375)
    }
    
    func test_coefficientValueRange_tempChange50_TCR25() {
        let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 4694.125)
        XCTAssertEqual(result.upperBound, 4705.875)
    }
    
    func test_coefficientValueRange_tempChange100_TCR25() {
        let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 4688.25)
        XCTAssertEqual(result.upperBound, 4711.75)
    }
}

// MARK: 15 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR15() {
        let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 3298.7625)
        XCTAssertEqual(result.upperBound, 3301.2375)
    }
    
    func test_coefficientValueRange_tempChange50_TCR15() {
        let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 3297.525)
        XCTAssertEqual(result.upperBound, 3302.475)
    }
    
    func test_coefficientValueRange_tempChange100_TCR15() {
        let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 3295.05)
        XCTAssertEqual(result.upperBound, 3304.95)
    }
}

// MARK: 10 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR10() {
        let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 6798.3)
        XCTAssertEqual(result.upperBound, 6801.7)
    }
    
    func test_coefficientValueRange_tempChange50_TCR10() {
        let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 6796.6)
        XCTAssertEqual(result.upperBound, 6803.4)
    }
    
    func test_coefficientValueRange_tempChange100_TCR10() {
        let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 6793.2)
        XCTAssertEqual(result.upperBound, 6806.8)
    }
}

// MARK: 5 TempCo
extension SixBandResistorTests {
    func test_coefficientValueRange_tempChange25_TCR5() {
        let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 5599.3)
        XCTAssertEqual(result.upperBound, 5600.7)
    }
    
    func test_coefficientValueRange_tempChange50_TCR5() {
        let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 5598.6)
        XCTAssertEqual(result.upperBound, 5601.4)
    }
    
    func test_coefficientValueRange_tempChange100_TCR5() {
        let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 5597.2)
        XCTAssertEqual(result.upperBound, 5602.8)
    }
}

// MARK:- Init Value Tolerance
extension SixBandResistorTests {
    func test_init_value_belowMin() {
        let resistor = SixBandResistor(value: 0.5)
        XCTAssertEqual(resistor.digits, [.brown, .black, .black])
        XCTAssertEqual(resistor.multiplier, .silver)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_fractional() {
        let resistor = SixBandResistor(value: 6.781, tolerance: .yellow)
        XCTAssertEqual(resistor.digits, [.blue, .violet, .grey])
        XCTAssertEqual(resistor.multiplier, .silver)
        XCTAssertEqual(resistor.tolerance, .yellow)
    }
    
    func test_init_value_5digits() {
        let resistor = SixBandResistor(value: 12300)
        XCTAssertEqual(resistor.digits, [.brown, .red, .orange])
        XCTAssertEqual(resistor.multiplier, .red)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
    
    func test_init_value_8digits() {
        let resistor = SixBandResistor(value: 98765412, tolerance: .violet)
        XCTAssertEqual(resistor.digits, [.white, .grey, .grey])
        XCTAssertEqual(resistor.multiplier, .green)
        XCTAssertEqual(resistor.tolerance, .violet)
    }
    
    func test_init_value_aboveMax() {
        let resistor = SixBandResistor(value: 999_999_999_999)
        XCTAssertEqual(resistor.digits, [.white, .white, .white])
        XCTAssertEqual(resistor.multiplier, .white)
        XCTAssertEqual(resistor.tolerance, .gold)
    }
}

// MARK:- Init Resistor Tolerance
extension SixBandResistorTests {
    func test_init_resistor_4Band() {
        let resistor = FourBandResistor(value: 3300)
        let sut = SixBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.orange, .orange, .black])
        XCTAssertEqual(sut.multiplier, .brown)
        XCTAssertEqual(sut.tolerance, .gold)
        XCTAssertEqual(sut.coefficient, .brown)
    }
    
    func test_init_resistor_5Band() {
        let resistor = FiveBandResistor(value: 47000)
        let sut = SixBandResistor(resistor: resistor, tolerance: .yellow, coefficient: .yellow)
        XCTAssertEqual(sut.digits, [.yellow, .violet, .black])
        XCTAssertEqual(sut.multiplier, .red)
        XCTAssertEqual(sut.tolerance, .yellow)
        XCTAssertEqual(sut.coefficient, .yellow)
    }
    
    func test_init_resistor_5Band3SigFigs() {
        let resistor = FiveBandResistor(value: 67800)
        let sut = SixBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.blue, .violet, .grey])
        XCTAssertEqual(sut.multiplier, .red)
        XCTAssertEqual(sut.tolerance, .gold)
        XCTAssertEqual(sut.coefficient, .brown)
    }
    
    func test_init_resistor_6Band() {
        let resistor = SixBandResistor(value: 5.6)
        let sut = SixBandResistor(resistor: resistor, tolerance: .green, coefficient: .orange)
        XCTAssertEqual(sut.digits, [.green, .blue, .black])
        XCTAssertEqual(sut.multiplier, .silver)
        XCTAssertEqual(sut.tolerance, .green)
        XCTAssertEqual(sut.coefficient, .orange)
    }
    
    func test_init_resistor_6Band3SigFigs() {
        let resistor = SixBandResistor(value: 4.23)
        let sut = SixBandResistor(resistor: resistor)
        XCTAssertEqual(sut.digits, [.yellow, .red, .orange])
        XCTAssertEqual(sut.multiplier, .silver)
        XCTAssertEqual(sut.tolerance, .gold)
        XCTAssertEqual(sut.coefficient, .brown)
    }
}

// MARK:- Init Exact Value Tolerance
extension SixBandResistorTests {
    func test_init_exactValue_belowMin() throws {
            XCTAssertThrowsError(try SixBandResistor(exactValue: 0.05))
        }
        
        func test_init_exactValue_fractional() throws {
            let resistor = try SixBandResistor(exactValue: 4.7, tolerance: .silver, coefficient: .orange)
            XCTAssertEqual(resistor.digits, [.yellow, .violet, .black])
            XCTAssertEqual(resistor.multiplier, .silver)
            XCTAssertEqual(resistor.tolerance, .silver)
            XCTAssertEqual(resistor.coefficient, .orange)
        }
        
        func test_init_exactValue_5digits() {
            XCTAssertThrowsError(try SixBandResistor(exactValue: 56789))
        }
        
        func test_init_exactValue_8digits() throws {
            let resistor = try SixBandResistor(exactValue: 12_200_000, tolerance: .blue)
            XCTAssertEqual(resistor.digits, [.brown, .red, .red])
            XCTAssertEqual(resistor.multiplier, .green)
            XCTAssertEqual(resistor.tolerance, .blue)
            XCTAssertEqual(resistor.coefficient, .brown)
        }
        
        func test_init_exactValue_aboveMax() {
            XCTAssertThrowsError(try SixBandResistor(exactValue: 999_999_999_999))
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
        
        ("test_toleranceValueRange_gold",   test_toleranceValueRange_gold),
        ("test_toleranceValueRange_silver", test_toleranceValueRange_silver),
        ("test_toleranceValueRange_brown",  test_toleranceValueRange_brown),
        
        ("test_coefficientValueRange_tempChange25_TCR100",  test_coefficientValueRange_tempChange25_TCR100),
        ("test_coefficientValueRange_tempChange50_TCR100",  test_coefficientValueRange_tempChange50_TCR100),
        ("test_coefficientValueRange_tempChange100_TCR100", test_coefficientValueRange_tempChange100_TCR100),
                
        ("test_coefficientValueRange_tempChange25_TCR50",   test_coefficientValueRange_tempChange25_TCR50),
        ("test_coefficientValueRange_tempChange50_TCR50",   test_coefficientValueRange_tempChange50_TCR50),
        ("test_coefficientValueRange_tempChange100_TCR50",  test_coefficientValueRange_tempChange100_TCR50),
                
        ("test_coefficientValueRange_tempChange25_TCR25",   test_coefficientValueRange_tempChange25_TCR25),
        ("test_coefficientValueRange_tempChange50_TCR25",   test_coefficientValueRange_tempChange50_TCR25),
        ("test_coefficientValueRange_tempChange100_TCR25",  test_coefficientValueRange_tempChange100_TCR25),
                
        ("test_coefficientValueRange_tempChange25_TCR15",   test_coefficientValueRange_tempChange25_TCR15),
        ("test_coefficientValueRange_tempChange50_TCR15",   test_coefficientValueRange_tempChange50_TCR15),
        ("test_coefficientValueRange_tempChange100_TCR15",  test_coefficientValueRange_tempChange100_TCR15),
                
        ("test_coefficientValueRange_tempChange25_TCR10",   test_coefficientValueRange_tempChange25_TCR10),
        ("test_coefficientValueRange_tempChange50_TCR10",   test_coefficientValueRange_tempChange50_TCR10),
        ("test_coefficientValueRange_tempChange100_TCR10",  test_coefficientValueRange_tempChange100_TCR10),
                
        ("test_coefficientValueRange_tempChange25_TCR5",    test_coefficientValueRange_tempChange25_TCR5),
        ("test_coefficientValueRange_tempChange50_TCR5",    test_coefficientValueRange_tempChange50_TCR5),
        ("test_coefficientValueRange_tempChange100_TCR5",   test_coefficientValueRange_tempChange100_TCR5),
        
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
