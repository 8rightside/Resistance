/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Testing
import Resistance

@Suite("Four Band Resistor Tests")
struct FourBandResistorTests {
    
    // MARK: - Resistance Value
    @Suite("Resistance Value")
    struct Resistancevalue {
        
        @Test("Value - Min")
        static func value_min() {
            let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .silver, tolerance: .silver)
            #expect(resistor.value == 0.1)
        }
        
        @Test("Value - Max")
        static func value_max() {
            let resistor = FourBandResistor(digit1: .white, digit2: .white, multiplier: .white, tolerance: .silver)
            #expect(resistor.value == 99_000_000_000)
        }
        
        @Test("Value - Fractional")
        static func value_fractional() {
            let resistor = FourBandResistor(digit1: .orange, digit2: .red, multiplier: .gold, tolerance: .silver)
            #expect(resistor.value == 3.2)
        }
        
        @Test("Value - 3 Digits")
        static func value_3digits() {
            let resistor = FourBandResistor(digit1: .green, digit2: .blue, multiplier: .brown, tolerance: .silver)
            #expect(resistor.value == 560)
        }
        
        @Test("Value - 5 Digits")
        static func value_5digits() {
            let resistor = FourBandResistor(digit1: .yellow, digit2: .violet, multiplier: .orange, tolerance: .silver)
            #expect(resistor.value == 47000)
        }
    }
    
    // MARK: - Description
    @Suite("Description")
    struct Description {
        
        @Test("Description - 1 Digit")
        static func description_1digit() {
            let resistor = FourBandResistor(digit1: .grey, digit2: .black, multiplier: .gold, tolerance: .silver)
            #expect(resistor.description == "8 Ω")
        }
        
        @Test("Description - 4 Digits")
        static func description_4digit() {
            let resistor = FourBandResistor(digit1: .green, digit2: .blue, multiplier: .red, tolerance: .silver)
            #expect(resistor.description == "5.6 KΩ")
        }
        
        @Test("Description - 6 Digits")
        static func description_6digit() {
            let resistor = FourBandResistor(digit1: .yellow, digit2: .black, multiplier: .yellow, tolerance: .silver)
            #expect(resistor.description == "400 KΩ")
        }
        
        @Test("Description - 7 Digits")
        static func description_7digit() {
            let resistor = FourBandResistor(digit1: .orange, digit2: .white, multiplier: .green, tolerance: .silver)
            #expect(resistor.description == "3.9 MΩ")
        }
        
        @Test("Description - 10 Digits")
        static func description_10digit() {
            let resistor = FourBandResistor(digit1: .red, digit2: .black, multiplier: .grey, tolerance: .silver)
            #expect(resistor.description == "2 GΩ")
        }
    }
    
    // MARK: - Tolerance Value Range
    @Suite("Tolerance Value Range")
    struct ToleranceValueRange {
        
        @Test("Tolerance Value Range - Gold")
        static func toleranceValueRange_gold() {
            let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .gold)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1050)
            #expect(result.lowerBound == 950)
        }
        
        @Test("Tolerance Value Range - Silver")
        static func toleranceValueRange_silver() {
            let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .silver)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1100)
            #expect(result.lowerBound == 900)
        }
        
        @Test("Tolerance Value Range - Brown")
        static func toleranceValueRange_brown() {
            let resistor = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .brown)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1010)
            #expect(result.lowerBound == 990)
        }
    }
    
    // MARK: - Init Value and Tolerance
    @Suite("Init Value and Tolerance")
    struct InitValueAndTolerance {
        
        @Test("Init Value Below Min")
        static func init_value_belowMin() {
            let resistor = FourBandResistor(value: 0.05)
            #expect(resistor.digits == [.brown, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .gold)
        }
        
        @Test("Init Value Fractional")
        static func init_value_fractional() {
            let resistor = FourBandResistor(value: 4.7, tolerance: .silver)
            #expect(resistor.digits == [.yellow, .violet])
            #expect(resistor.multiplier == .gold)
            #expect(resistor.tolerance == .silver)
        }
        
        @Test("Init Value with 5 Digits")
        static func init_value_5digits() {
            let resistor = FourBandResistor(value: 56789)
            #expect(resistor.digits == [.green, .violet])
            #expect(resistor.multiplier == .orange)
            #expect(resistor.tolerance == .gold)
        }
        
        @Test("Init Value with 8 Digits")
        static func init_value_8digits() {
            let resistor = FourBandResistor(value: 12345678, tolerance: .blue)
            #expect(resistor.digits == [.brown, .red])
            #expect(resistor.multiplier == .blue)
            #expect(resistor.tolerance == .blue)
        }
        
        @Test("Init Value Above Max")
        static func init_value_aboveMax() {
            let resistor = FourBandResistor(value: 999_999_999_999)
            #expect(resistor.digits == [.white, .white])
            #expect(resistor.multiplier == .white)
            #expect(resistor.tolerance == .gold)
        }
    }
    
    // MARK: - Init Resistor Tolerance
    @Suite("Init Resistor and Tolerance")
    struct InitResistorAndTolerance {
        
        @Test("Init Resistor with 4 Bands")
        static func init_resistor_4Band() {
            let resistor = FourBandResistor(value: 3300)
            let sut = FourBandResistor(resistor: resistor)
            #expect(sut.digits == [.orange, .orange])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .gold)
        }
        
        @Test("Init Resistor with 5 Bands")
        static func init_resistor_5Band() {
            let resistor = FiveBandResistor(value: 47000)
            let sut = FourBandResistor(resistor: resistor, tolerance: .yellow)
            #expect(sut.digits == [.yellow, .violet])
            #expect(sut.multiplier == .orange)
            #expect(sut.tolerance == .yellow)
        }
        
        @Test("Init Resistor with 5 Bands and 3 Sig Figs")
        static func init_resistor_5Band3SigFigs() {
            let resistor = FiveBandResistor(value: 67800)
            let sut = FourBandResistor(resistor: resistor)
            #expect(sut.digits == [.blue, .grey])
            #expect(sut.multiplier == .orange)
            #expect(sut.tolerance == .gold)
        }
        
        @Test("Init Resistor with 6 Bands")
        static func init_resistor_6Band() {
            let resistor = SixBandResistor(value: 5.6)
            let sut = FourBandResistor(resistor: resistor, tolerance: .green)
            #expect(sut.digits == [.green, .blue])
            #expect(sut.multiplier == .gold)
            #expect(sut.tolerance == .green)
        }
        
        @Test("Init Resistor with 6 Bands and 3 Sig Figs")
        static func init_resistor_6Band3SigFigs() {
            let resistor = SixBandResistor(value: 4.23)
            let sut = FourBandResistor(resistor: resistor)
            #expect(sut.digits == [.yellow, .red])
            #expect(sut.multiplier == .gold)
            #expect(sut.tolerance == .gold)
        }
    }
    
    // MARK: - Init Exact Value Tolerance
    @Suite("Init Exact Value and Tolerance")
    struct InitExactValueAndTolerance {
        
        @Test("Init Exact Value Below Min Throws")
        static func init_exactValue_belowMin() throws {
            #expect(throws: (any Error).self) { try FourBandResistor(exactValue: 0.05) }
        }
        
        @Test("Init Exact Value with Frational")
        static func init_exactValue_fractional() throws {
            let resistor = try FourBandResistor(exactValue: 4.7, tolerance: .silver)
            #expect(resistor.digits == [.yellow, .violet])
            #expect(resistor.multiplier == .gold)
            #expect(resistor.tolerance == .silver)
        }
        
        @Test("Init Exact Value with 5 Digits Throws")
        static func init_exactValue_5digits() {
            #expect(throws: (any Error).self) { try FourBandResistor(exactValue: 56789) }
        }
        
        @Test("Init Exact Value with 8 Digits")
        static func init_exactValue_8digits() throws {
            let resistor = try FourBandResistor(exactValue: 12000000, tolerance: .blue)
            #expect(resistor.digits == [.brown, .red])
            #expect(resistor.multiplier == .blue)
            #expect(resistor.tolerance == .blue)
        }
        
        @Test("Init Exact Value with Above Max Throws")
        static func init_exactValue_aboveMax() {
            #expect(throws: (any Error).self) { try FourBandResistor(exactValue: 999_999_999_999) }
        }
    }
    
    // MARK: - Init Exact Resistor Tolerance
    @Suite("Init Exact Resistor Tolerance")
    struct InitExactResistorTolerance {
        
        @Test("Init Exact Resistor 4 Band")
        static func init_exactResistor_4Band() throws {
            let resistor = FourBandResistor(value: 3300)
            let sut = try FourBandResistor(exactResistor: resistor)
            #expect(sut.digits == [.orange, .orange])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .gold)
        }
        
        @Test("Init Exact Resistor 5 Band")
        static func init_exactResistor_5Band() throws {
            let resistor = FiveBandResistor(value: 47000)
            let sut = try FourBandResistor(exactResistor: resistor, tolerance: .yellow)
            #expect(sut.digits == [.yellow, .violet])
            #expect(sut.multiplier == .orange)
            #expect(sut.tolerance == .yellow)
        }
        
        @Test("Init Exact Resistor 5 Band 3 Sig Figs")
        static func init_exactResistor_5Band3SigFigs() {
            let resistor = FiveBandResistor(value: 67800)
            #expect(throws: (any Error).self) { try FourBandResistor(exactResistor: resistor) }
            
        }
        
        @Test("Init Exact Resistor 6 Band")
        static func init_exactResistor_6Band() throws {
            let resistor = SixBandResistor(value: 5.6)
            let sut = try FourBandResistor(exactResistor: resistor, tolerance: .green)
            #expect(sut.digits == [.green, .blue])
            #expect(sut.multiplier == .gold)
            #expect(sut.tolerance == .green)
        }
        
        @Test("Init Exact Resistor 6 Band 3 Sig Figs")
        static func init_exactResistor_6Band3SigFigs() {
            let resistor = SixBandResistor(value: 4.23)
            #expect(throws: (any Error).self) { try FourBandResistor(exactResistor: resistor) }
            
        }
    }
    
    // MARK: - Decade Functions
    @Suite("Decade Functions")
    struct DecadeFunctions {
        
        @Test("Decade Up")
        static func decadeUp() {
            let sut = FourBandResistor(digit1: .brown, digit2: .red, multiplier: .orange, tolerance: .gold)
            let result = sut.decadeUp()
            #expect(result.multiplier == .yellow)
        }
        
        @Test("Decade Up Max")
        static func decadeUp_Max() {
            let sut = FourBandResistor(digit1: .brown, digit2: .red, multiplier: .white, tolerance: .gold)
            let result = sut.decadeUp()
            #expect(result.multiplier == .white)
        }
        
        @Test("Decade Down")
        static func decadeDown() {
            let sut = FourBandResistor(digit1: .brown, digit2: .red, multiplier: .orange, tolerance: .gold)
            let result = sut.decadeDown()
            #expect(result.multiplier == .red)
        }
        
        @Test("Decade Down Min")
        static func decadeDown_Min() {
            let sut = FourBandResistor(digit1: .brown, digit2: .red, multiplier: .silver, tolerance: .gold)
            let result = sut.decadeDown()
            #expect(result.multiplier == .silver)
        }
    }
    
    // MARK: - Conversion Functions
    @Suite("Conversion Functions")
    struct ConversionFunctions {
        
        @Test("Convert to Four Band")
        static func convertToFourBand() {
            let sut = FourBandResistor(value: 3300, tolerance: .yellow)
            let result = sut.convertToFourBand()
            #expect(result.value == 3300)
            #expect(result.tolerance == .yellow)
        }
        
        @Test("Convert to Five Band")
        static func convertToFiveBand() {
            let sut = FourBandResistor(value: 3300, tolerance: .yellow)
            let result = sut.convertToFiveBand()
            #expect(result.value == 3300)
            #expect(result.tolerance == .yellow)
        }
        
        @Test("Convert to Six Band")
        static func convertToSixBand() {
            let sut = FourBandResistor(value: 3300, tolerance: .yellow)
            let result = sut.convertToSixBand()
            #expect(result.value == 3300)
            #expect(result.tolerance == .yellow)
            #expect(result.coefficient == .brown)
        }
    }
    
    // MARK: - Next Value Functions
    @Suite("Next Value Functions")
    struct NextValueFunctions {
        
        @Test("Next Value Up")
        static func nextValueUp() {
            let sut = FourBandResistor(value: 3100)
            let result = sut.nextValueUp(inSeries: E12Series())
            #expect(result == 3300)
        }
        
        @Test("Next Value Down")
        static func nextValueDown() {
            let sut = FourBandResistor(value: 3100)
            let result = sut.nextValueDown(inSeries: E12Series())
            #expect(result == 2700)
        }
    }
}
