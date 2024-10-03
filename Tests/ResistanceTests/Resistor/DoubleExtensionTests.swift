/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2024
 *  MIT license, see LICENSE file for details
 */

import Testing

@testable import Resistance

@Suite("Double Extention Tests")
struct DoubleExtentionTests {
    
    // MARK: Sig Figs Count
    @Suite("Sig Figs Count")
    struct SigFigsCount {
        
        @Test("sigFigs count with decimal")
        static func sigFigsCount_decimal() {
            #expect(4.23.sigFigsCount == 3)
        }
        
        @Test("sigFigs count with integer")
        static func sigFigsCount_integer() {
            #expect(400.0.sigFigsCount == 1)
            #expect(46_000.0.sigFigsCount == 2)
            #expect(432.0.sigFigsCount == 3)
            #expect(7071.0.sigFigsCount == 4)
            #expect(40_001.0.sigFigsCount == 5)
            #expect(40_0001.0.sigFigsCount == 6)
            #expect(47_856_010.0.sigFigsCount == 7)
        }
    }
    
    // MARK: Sig Figs Value
    @Suite("Sig Figs Value")
    struct SigFigs {
        
        @Test("sigFigs value with 1 digit")
        static func sigFigsValue_1Digit() {
            #expect(4.sigFigs == 4.0)
        }
        
        @Test("sigFigs value with 5 digits")
        static func sigFigsValue_5Digits() {
            #expect(12345.sigFigs == 1.2345)
        }
        
        @Test("sigFigs value with 5 digits and trailing zeros")
        static func sigFigsValue_5DigitsTrailingZeros() {
            #expect(54000.sigFigs == 5.4)
        }
        
        @Test("sigFigs value with 5 digits containing zeros")
        static func sigFigsValue_5DigitsContainingZeros() {
            #expect(44002.sigFigs == 4.4002)
        }
        
        @Test("sigFigs value with decimal numeber")
        static func sigFigsValue_decimal() {
            #expect(45.35.sigFigs == 4.535)
        }
        
        @Test("sigFigs value with decimal number containing zeros")
        static func sigFigsValue_decimalContainingZeros() {
            #expect(602.303.sigFigs == 6.02303)
        }
    }
    
    // MARK: Power Of Ten
    @Suite("Power Of Ten")
    struct PowerOfTen {
        
        @Test("powerOfTen with 1 digit")
        static func powerOfTen_1Digit() {
            #expect(4.powerOfTen == 0)
        }
        
        @Test("powerOfTen with 5 digits")
        static func powerOfTen_5Digits() {
            #expect(65485.powerOfTen == 4)
        }
        
        @Test("powerOfTen with fractional number")
        static func powerOfTen_fraction() {
            #expect(0.03.powerOfTen == -2)
        }
        
        @Test("powerOfTen with a decimal number")
        static func powerOfTen_decimal() {
            #expect(453.1.powerOfTen == 2)
        }
    }
    
    // MARK: Hundreds Decade
    @Suite("Hundreds Decade")
    struct HundredsDecade {
        
        @Test("hundredsDecade with 1 digit")
        static func hundredsDecade_1Digit() {
            #expect(4.hundredsDecade == 400)
        }
        
        @Test("hundredsDecade with 3 digits")
        static func hundredsDecade_3Digits() {
            #expect(423.hundredsDecade == 423)
        }
        
        @Test("hundredsDecade with 5 digits")
        static func hundredsDecade_5Digits() {
            #expect(44560.hundredsDecade == 446)
        }
        
        @Test("hundredsDecade with fractional number")
        static func hundredsDecade_fraction() {
            #expect(0.52.hundredsDecade == 520)
        }
        
        @Test("hundredsDecade with decimal number")
        static func hundredsDecade_decimal() {
            #expect(4.56.hundredsDecade == 456)
        }
    }
    
    // MARK: Sig Figs Rounded
    @Suite("Sig Figs Rounded")
    struct SigFigsRounded {
        
        @Test("sigFigsRounded by 1 with a 5 digit number")
        static func sigFigsRounded_by1_5Digits() {
            #expect(12457.sigFigsRounded(by: 1) == 10000)
            #expect(15234.sigFigsRounded(by: 1) == 20000)
        }
        
        @Test("sigFigsRounded by 2 with a 5 digit number")
        static func sigFigsRounded_by2_5Digits() {
            #expect(12457.sigFigsRounded(by: 2) == 12000)
            #expect(15234.sigFigsRounded(by: 2) == 15000)
        }
        
        @Test("sigFigsRounded by 3 with a 5 digit number")
        static func sigFigsRounded_by3_5Digits() {
            #expect(12457.sigFigsRounded(by: 3) == 12500)
            #expect(15234.sigFigsRounded(by: 3) == 15200)
        }
        
        @Test("sigFigsRounded by 2 with a 5 digit decimal number")
        static func sigFigsRounded_by2_5DigitDecimal() {
            #expect(124.57.sigFigsRounded(by: 2) == 120)
            #expect(152.34.sigFigsRounded(by: 2) == 150)
        }
        
        @Test("sigFigsRounded by 2 with a fractional number")
        static func sigFigsRounded_by2_Fractional() {
            #expect(0.2457.sigFigsRounded(by: 2) == 0.25)
            #expect(0.5234.sigFigsRounded(by: 2) == 0.52)
        }
    }
}
