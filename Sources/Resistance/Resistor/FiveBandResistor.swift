/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

public struct FiveBandResistor: BandedResistor {
    let digit1: Digit
    let digit2: Digit
    let digit3: Digit
    public let multiplier: Multiplier
    public let tolerance: Tolerance
    
    public var digits: [Digit] {
        [digit1, digit2, digit3]
    }
    
    public init(digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier, tolerance: Tolerance) {
        self.digit1 = digit1
        self.digit2 = digit2
        self.digit3 = digit3
        self.multiplier = multiplier
        self.tolerance = tolerance
    }
}

// MARK:- Convenience Inits
extension FiveBandResistor {
    public init(value: Double, tolerance: Tolerance = .gold) {
        let colors = BandsCalculator.fiveBandColors(value: value)
        self.init(digit1: colors.digit1, digit2: colors.digit2, digit3: colors.digit3, multiplier: colors.multiplier, tolerance: tolerance)
    }
    
    public init<T: BandedResistor>(resistor: T, tolerance: Tolerance = .gold) {
        self.init(value: resistor.value, tolerance: tolerance)
    }
}

// MARK:- Failable Inits
extension FiveBandResistor {
    public init(exactValue: Double, tolerance: Tolerance = .gold) throws {
        let colors = try BandsCalculator.fiveBandColorsOrFail(value: exactValue)
        self.init(digit1: colors.digit1, digit2: colors.digit2, digit3: colors.digit3, multiplier: colors.multiplier, tolerance: tolerance)
    }
}

// MARK:- Multiplier Functions
extension FiveBandResistor {
    public func decadeUp() -> FiveBandResistor {
        guard multiplier != .white else { return self }
        return .init(value: value * 10, tolerance: tolerance)
    }
    
    public func decadeDown() -> FiveBandResistor {
        guard multiplier != .silver else { return self }
        return .init(value: value / 10, tolerance: tolerance)
    }
}
