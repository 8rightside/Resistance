/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

public struct SixBandResistor: BandedResistor {
    let digit1: Digit
    let digit2: Digit
    let digit3: Digit
    
    public let multiplier: Multiplier
    public let tolerance: Tolerance
    /// The temperature coefficient rating of the `Resistor`
    public let coefficient: Coefficient
    
    public var digits: [Digit] {
        [digit1, digit2, digit3]
    }
    
    public init(digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier, tolerance: Tolerance, coefficient: Coefficient) {
        self.digit1 = digit1
        self.digit2 = digit2
        self.digit3 = digit3
        self.multiplier = multiplier
        self.tolerance = tolerance
        self.coefficient = coefficient
    }
    
    /// Calculates the `Range` of values a resistor covers depending on its `Coefficient` rating
    /// and the given temperature difference
    /// - Parameters:
    ///     - tempChange: Temperature delta from the nominal value
    /// - Returns: `Range` representing the values the `Resistor` covers
    public func coefficientValueRange(tempChange: Double) -> Range<Double> {
        let lowerBound = value - value / 1_000_000 * coefficient.rawValue * tempChange
        let upperBound = value + value / 1_000_000 * coefficient.rawValue * tempChange
        return lowerBound..<upperBound
    }
}

// MARK:- Convenience Inits
extension SixBandResistor {
    public init(value: Double, tolerance: Tolerance = .gold, coefficient: Coefficient = .brown) {
        let colors = BandsCalculator.fiveBandColors(value: value)
        self.init(digit1: colors.digit1, digit2: colors.digit2, digit3: colors.digit3, multiplier: colors.multiplier, tolerance: tolerance, coefficient: coefficient)
    }
    
    public init<T: BandedResistor>(resistor: T, tolerance: Tolerance = .gold, coefficient: Coefficient = .brown) {
        self.init(value: resistor.value, tolerance: tolerance, coefficient: coefficient)
    }
}

// MARK:- Failable Inits
extension SixBandResistor {
    public init(exactValue: Double, tolerance: Tolerance = .gold, coefficient: Coefficient = .brown) throws {
        let colors = try BandsCalculator.fiveBandColorsOrFail(value: exactValue)
        self.init(digit1: colors.digit1, digit2: colors.digit2, digit3: colors.digit3, multiplier: colors.multiplier, tolerance: tolerance, coefficient: coefficient)
    }
}
