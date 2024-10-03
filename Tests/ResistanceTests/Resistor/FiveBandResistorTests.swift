/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Testing
import Resistance

@Suite("Five Band Resistor Tests")
struct FiveBandResistorTests {
    
    // MARK: Resistance Value
    @Suite("Resistance Value")
    struct ResistanceValue {
        @Test("Minimum value")
        static func value_min() {
            let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold)
            #expect(resistor.value == 1)
        }
        
        @Test("Maximum value")
        static func value_max() {
            let resistor = FiveBandResistor(digit1: .white, digit2: .white, digit3: .white, multiplier: .white, tolerance: .gold)
            #expect(resistor.value == 999_000_000_000)
        }
        
        @Test("Fractional value")
        static func value_fractional() {
            let resistor = FiveBandResistor(digit1: .blue, digit2: .grey, digit3: .red, multiplier: .silver, tolerance: .gold)
            #expect(resistor.value == 6.82)
        }
        
        @Test("3 digit value")
        static func value_3digits() {
            let resistor = FiveBandResistor(digit1: .white, digit2: .black, digit3: .brown, multiplier: .black, tolerance: .gold)
            #expect(resistor.value == 901)
        }
        
        @Test("5 digit value")
        static func value_5digits() {
            let resistor = FiveBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .red, tolerance: .gold)
            #expect(resistor.value == 33000)
        }
    }
    
    // MARK: Descripion
    @Suite("Description")
    struct Description {
        
        @Test("Description with 1 digit")
        static func description_1digit() {
            let resistor = FiveBandResistor(digit1: .grey, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold)
            #expect(resistor.description == "8 Ω")
        }
        
        @Test("Description with 4 digits")
        static func description_4digit() {
            let resistor = FiveBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold)
            #expect(resistor.description == "5.6 KΩ")
        }
        
        @Test("Description with 6 digits")
        static func description_6digit() {
            let resistor = FiveBandResistor(digit1: .yellow, digit2: .black, digit3: .black, multiplier: .orange, tolerance: .gold)
            #expect(resistor.description == "400 KΩ")
        }
        
        @Test("Description with 7 digits")
        static func description_7digit() {
            let resistor = FiveBandResistor(digit1: .orange, digit2: .white, digit3: .black, multiplier: .yellow, tolerance: .gold)
            #expect(resistor.description == "3.9 MΩ")
        }
        
        @Test("Description with 10 digits")
        static func description_10digit() {
            let resistor = FiveBandResistor(digit1: .red, digit2: .black, digit3: .black, multiplier: .violet, tolerance: .gold)
            #expect(resistor.description == "2 GΩ")
        }
    }
    
    // MARK: Tolerance Value Range
    @Suite("Tolerance Value Range")
    struct ToleranceValueRange {
        
        @Test("toleranceValueRange with gold band")
        static func toleranceValueRange_gold() {
            let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1050)
            #expect(result.lowerBound == 950)
        }
        
        @Test("toleranceValueRange with silver band")
        static func toleranceValueRange_silver() {
            let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .silver)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1100)
            #expect(result.lowerBound == 900)
        }
        
        @Test("toleranceValueRange with brown band")
        static func toleranceValueRange_brown() {
            let resistor = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .brown)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1010)
            #expect(result.lowerBound == 990)
        }
    }
    
    // MARK: Init Value Tolerance
    @Suite("Init Value Tolerance")
    struct InitValueTolerance {
        
        @Test("Init with value below min")
        static func init_value_belowMin() {
            let resistor = FiveBandResistor(value: 0.5)
            #expect(resistor.digits == [.brown, .black, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance  == .gold)
        }
        
        @Test("Init with fractional value")
        static func init_value_fractional() {
            let resistor = FiveBandResistor(value: 3.3, tolerance: .green)
            #expect(resistor.digits == [.orange, .orange, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .green)
        }
        
        @Test("Init with 5 digits")
        static func init_value_5digits() {
            let resistor = FiveBandResistor(value: 12345)
            #expect(resistor.digits == [.brown, .red, .orange])
            #expect(resistor.multiplier == .red)
            #expect(resistor.tolerance == .gold)
        }
        
        @Test("Init with 8 digits")
        static func init_value_8digits() {
            let resistor = FiveBandResistor(value: 98765432, tolerance: .silver)
            #expect(resistor.digits == [.white, .grey, .grey])
            #expect(resistor.multiplier == .green)
            #expect(resistor.tolerance == .silver)
        }
        
        @Test("Init with value above max")
        static func init_value_aboveMax() {
            let resistor = FiveBandResistor(value: 9_999_999_999_999)
            #expect(resistor.digits == [.white, .white, .white])
            #expect(resistor.multiplier == .white)
            #expect(resistor.tolerance == .gold)
        }
    }
    
    // MARK: Init Resistor Tolerance
    @Suite("Init Resistor Tolerance")
    struct InitResistorTolerance {
        
        @Test("Init from 4 band resistor`")
        static func init_resistor_4Band() {
            let resistor = FourBandResistor(value: 3300)
            let sut = FiveBandResistor(resistor: resistor)
            #expect(sut.digits == [.orange, .orange, .black])
            #expect(sut.multiplier == .brown)
            #expect(sut.tolerance == .gold)
        }
        
        @Test("Init from 5 band resistor")
        static func init_resistor_5Band() {
            let resistor = FiveBandResistor(value: 47000)
            let sut = FiveBandResistor(resistor: resistor, tolerance: .yellow)
            #expect(sut.digits == [.yellow, .violet, .black])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .yellow)
        }
        
        @Test("Init from 5 band resistor with 3 sig figs")
        static func init_resistor_5Band3SigFigs() {
            let resistor = FiveBandResistor(value: 67800)
            let sut = FiveBandResistor(resistor: resistor)
            #expect(sut.digits == [.blue, .violet, .grey])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .gold)
        }
        
        @Test("Init from 6 band resistor")
        static func init_resistor_6Band() {
            let resistor = SixBandResistor(value: 5.6)
            let sut = FiveBandResistor(resistor: resistor, tolerance: .green)
            #expect(sut.digits == [.green, .blue, .black])
            #expect(sut.multiplier == .silver)
            #expect(sut.tolerance == .green)
        }
        
        @Test("Init from 6 band resistor with 3 sig figs")
        static func init_resistor_6Band3SigFigs() {
            let resistor = SixBandResistor(value: 4.23)
            let sut = FiveBandResistor(resistor: resistor)
            #expect(sut.digits == [.yellow, .red, .orange])
            #expect(sut.multiplier == .silver)
            #expect(sut.tolerance == .gold)
        }
    }
    
    // MARK: Init Exact Value Tolerance
    @Suite("Init Exact Value Tolerance")
    struct InitExactValueTolerance {
        
        @Test("exactValue throws error for below min")
        static func init_exactValue_belowMin() throws {
            #expect(throws: (any Error).self) { try FiveBandResistor(exactValue: 0.05) }
        }
        
        @Test("Init exactValue with fractional")
        static func init_exactValue_fractional() throws {
            let resistor = try FiveBandResistor(exactValue: 4.7, tolerance: .silver)
            #expect(resistor.digits == [.yellow, .violet, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .silver)
        }
        
        @Test("Init exactValue with 5 digits throws error")
        static func init_exactValue_5digits() {
            #expect(throws: (any Error).self) { try FiveBandResistor(exactValue: 56789) }
        }
        
        @Test("Init exactValue with 8 digits")
        static func init_exactValue_8digits() throws {
            let resistor = try FiveBandResistor(exactValue: 12_200_000, tolerance: .blue)
            #expect(resistor.digits == [.brown, .red, .red])
            #expect(resistor.multiplier == .green)
            #expect(resistor.tolerance == .blue)
        }
        
        @Test("Init exactValue throws error for above max")
        static func init_exactValue_aboveMax() {
            #expect(throws: (any Error).self) { try FourBandResistor(exactValue: 999_999_999_999) }
        }
    }
    
    // MARK: Decade Functions
    @Suite("Decade Functions")
    struct DecadeFunctions {
        
        @Test("decadeUp")
        static func decadeUp() {
            let sut = FiveBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .orange, tolerance: .gold)
            #expect(sut.decadeUp().multiplier == .yellow)
        }
        
        @Test("decadeUp max value")
        static func decadeUp_Max() {
            let sut = FiveBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .white, tolerance: .gold)
            #expect(sut.decadeUp().multiplier == .white)
        }
        
        @Test("decadeDown")
        static func decadeDown() {
            let sut = FiveBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .orange, tolerance: .gold)
            #expect(sut.decadeDown().multiplier == .red)
        }
        
        @Test("decadeDown min value")
        static func decadeDown_Min() {
            let sut = FiveBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .silver, tolerance: .gold)
            #expect(sut.decadeDown().multiplier == .silver)
        }
    }
    
    // MARK: Conversion Functions
    @Suite("Conversion Functions")
    struct ConversionFunctions {
        
        @Test("convertToFourBand")
        static func convertToFourBand() {
            let sut = FiveBandResistor(value: 2200, tolerance: .orange)
            let result = sut.convertToFourBand()
            #expect(result.value == 2200)
            #expect(result.tolerance == .orange)
        }
        
        @Test("convertToFiveBand")
        static func convertToFiveBand() {
            let sut = FiveBandResistor(value: 2200, tolerance: .orange)
            let result = sut.convertToFiveBand()
            #expect(result.value == 2200)
            #expect(result.tolerance == .orange)
        }
        
        @Test("convertToSixBand")
        static func convertToSixBand() {
            let sut = FiveBandResistor(value: 2200, tolerance: .orange)
            let result = sut.convertToSixBand(addingCoefficient: .red)
            #expect(result.value == 2200)
            #expect(result.tolerance == .orange)
            #expect(result.coefficient == .red)
        }
    }
    
    // MARK: Next Value Functions
    @Suite("Next Value Functions")
    struct NextValueFunctions {
        
        @Test("nextValueUp")
        static func nextValueUp() {
            let sut = FiveBandResistor(value: 5500)
            #expect(sut.nextValueUp(inSeries: E24Series()) == 5600)
        }
        
        @Test("nextValueDown")
        static func nextValueDown() {
            let sut = FiveBandResistor(value: 5500)
            #expect(sut.nextValueDown(inSeries: E24Series()) == 5100)
        }
    }
}
