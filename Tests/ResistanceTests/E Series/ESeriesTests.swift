/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Testing
@testable import Resistance

@Suite("E Series Tests")
struct ESeriesTests {
    
    // MARK: Contains Preferred Value
    @Suite("Contains Preferred Value")
    struct ContainsPreferredValue {
        
        @Test("Returns True with Fractional")
        static func returnsTrue_withFractional() {
            let sut = E12Series()
            let resistor = FourBandResistor(value: 4.7)
            let result1 = sut.containsPreferredValue(4.7)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(result1)
            #expect(result2)
        }
        
        @Test("Returns True with 2 Digits")
        static func returnsTrue_with2Digits() {
            let sut = E12Series()
            let resistor = FiveBandResistor(value: 33)
            let result1 = sut.containsPreferredValue(33)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(result1)
            #expect(result2)
        }
        
        @Test("Returns True with 5 Digits")
        static func returnsTrue_with5Digits() {
            let sut = E12Series()
            let resistor = SixBandResistor(value: 68000)
            let result1 = sut.containsPreferredValue(68000)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(result1)
            #expect(result2)
        }
        
        @Test("Returns False with Fractional")
        static func returnsFalse_withFractional() {
            let sut = E12Series()
            let resistor = FourBandResistor(value: 4.6)
            let result1 = sut.containsPreferredValue(4.6)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(!result1)
            #expect(!result2)
        }
        
        @Test("Returns False with 2 Digits")
        static func returnsFalse_with2Digits() {
            let sut = E12Series()
            let resistor = FiveBandResistor(value: 23)
            let result1 = sut.containsPreferredValue(23)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(!result1)
            #expect(!result2)
        }
        
        @Test("Returns False with 5 Digits")
        static func returnsFalse_with5Digits() {
            let sut = E12Series()
            let resistor = SixBandResistor(value: 12345)
            let result1 = sut.containsPreferredValue(12345)
            let result2 = sut.containsPreferredValue(resistor)
            #expect(!result1)
            #expect(!result2)
        }
    }
    
    // MARK: - Next Value Up
    @Suite("Next Value Up")
    struct NextValueUp {
        
        @Test("2 Digits Not In Series")
        static func with2Digits_notInSeries() {
            let sut = E24Series()
            let resistor = FourBandResistor(value: 53)
            let result1 = sut.nextValueUp(from: 53)
            let result2 = sut.nextValueUp(from: resistor)
            #expect(result1 == 56)
            #expect(result2 == 56)
        }
        
        @Test("5 Digits Not In Series")
        static func with5Digits_notInSeries() {
            let sut = E24Series()
            let resistor = FiveBandResistor(value: 45000)
            let result1 = sut.nextValueUp(from: 45000)
            let result2 = sut.nextValueUp(from: resistor)
            #expect(result1 == 47000)
            #expect(result2 == 47000)
        }
        
        @Test("2 Digits In Series")
        static func with2Digits_inSeries() {
            let sut = E24Series()
            let resistor = SixBandResistor(value: 33)
            let result1 = sut.nextValueUp(from: 33)
            let result2 = sut.nextValueUp(from: resistor)
            #expect(result1 == 36)
            #expect(result2 == 36)
        }
        
        @Test("5 Digits In Series")
        static func with5Digits_inSeries() {
            let sut = E24Series()
            let resistor = FourBandResistor(value: 62000)
            let result1 = sut.nextValueUp(from: 62000)
            let result2 = sut.nextValueUp(from: resistor)
            #expect(result1 == 68000)
            #expect(result2 == 68000)
        }
    }
    
    // MARK: - Next Value Down
    @Suite("Next Value Down")
    struct NextValueDown {
        
        @Test("2 Digits Not In Series")
        static func with2Digits_notInSeries() {
            let sut = E24Series()
            let resistor = FourBandResistor(value: 53)
            let result1 = sut.nextValueDown(from: 53)
            let result2 = sut.nextValueDown(from: resistor)
            #expect(result1 == 51)
            #expect(result2 == 51)
        }
        
        @Test("5 Digits Not In Series")
        static func with5Digits_notInSeries() {
            let sut = E24Series()
            let resistor = FiveBandResistor(value: 45000)
            let result1 = sut.nextValueDown(from: 45000)
            let result2 = sut.nextValueDown(from: resistor)
            #expect(result1 == 43000)
            #expect(result2 == 43000)
        }
        
        @Test("2 Digits In Series")
        static func with2Digits_inSeries() {
            let sut = E24Series()
            let resistor = SixBandResistor(value: 33)
            let result1 = sut.nextValueDown(from: 33)
            let result2 = sut.nextValueDown(from: resistor)
            #expect(result1 == 30)
            #expect(result2 == 30)
        }
        
        @Test("5 Digits In Series")
        static func with5Digits_inSeries() {
            let sut = E24Series()
            let resistor = FourBandResistor(value: 62000)
            let result1 = sut.nextValueDown(from: 62000)
            let result2 = sut.nextValueDown(from: resistor)
            #expect(result1 == 56000)
            #expect(result2 == 56000)
        }
    }
}
