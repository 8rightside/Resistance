/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

//MARK:- Four Band
public struct FourBandResistor: ResistorProtocol {
    let digit1: Digit
    let digit2: Digit
    public let multiplier: Multiplier
    public let tolerance: Tolerance
        
    public var value: Double {
        0
    }
    
    public var digits: [Digit] {
        [digit1, digit2]
    }
}

// MARK:- Five Band
public struct FiveBandResistor: ResistorProtocol {
    let digit1: Digit
    let digit2: Digit
    let digit3: Digit
    public let multiplier: Multiplier
    public let tolerance: Tolerance
        
    public var value: Double {
        0
    }
    
    public var digits: [Digit] {
        [digit1, digit2, digit3]
    }
}

// MARK:- Six Band
public struct SixBandResistor: ResistorProtocol {
    let digit1: Digit
    let digit2: Digit
    let digit3: Digit
    public let multiplier: Multiplier
    public let tolerance: Tolerance
    public let coefficient: Coefficient
        
    public var value: Double {
        0
    }
    
    public var digits: [Digit] {
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
