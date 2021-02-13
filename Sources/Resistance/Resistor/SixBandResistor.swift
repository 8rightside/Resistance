/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

public struct SixBandResistor: NewResistor {
    let digit1: Resistor.Digit
    let digit2: Resistor.Digit
    let digit3: Resistor.Digit
    public let multiplier: Resistor.Multiplier
    public let tolerance: Resistor.Tolerance
    public let coefficient: Resistor.Coefficient
        
    public var value: Double {
        0
    }
    
    public var digits: [Resistor.Digit] {
        [digit1, digit2]
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
