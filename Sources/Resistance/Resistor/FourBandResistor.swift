/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Foundation

// MARK:- Properties
public struct FourBandResistor: ResistorProtocol {
    let digit1: Digit
    let digit2: Digit
    public let multiplier: Multiplier
    public let tolerance: Tolerance
    
    public var digits: [Digit] {
        [digit1, digit2]
    }
    
    public init(digit1: Digit, digit2: Digit, multiplier: Multiplier, tolerance: Tolerance) {
        self.digit1 = digit1
        self.digit2 = digit2
        self.multiplier = multiplier
        self.tolerance = tolerance
    }
}

// MARK:- Convenience Inits
extension FourBandResistor {
    public init(value: Double, tolerance: Tolerance = .gold) {
        let colors = BandsCalculator.fourBandColors(value: value)
        self.init(digit1: colors.digit1, digit2: colors.digit2, multiplier: colors.multiplier, tolerance: tolerance)
    }
    
    public init(resistor: ResistorProtocol, tolerance: Tolerance = .gold) {
        self.init(value: resistor.value, tolerance: .silver)
    }
}

// MARK:- Failable Inits
extension FourBandResistor {
    public init(exactValue: Double, tolerance: Tolerance = .gold) throws {
        let colors = try BandsCalculator.fourBandColorsOrFail(value: exactValue)
        self.init(digit1: colors.digit1, digit2: colors.digit2, multiplier: colors.multiplier, tolerance: tolerance)
    }
    
    public init(exactResistor: ResistorProtocol, tolerance: Tolerance = .gold) throws {
        try self.init(exactValue: exactResistor.value, tolerance: tolerance)
    }
}
