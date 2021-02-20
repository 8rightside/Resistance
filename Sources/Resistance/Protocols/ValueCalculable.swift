/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

public protocol ValueCalculable {
    associatedtype Digit: RawRepresentable where Digit.RawValue == Double
    associatedtype Multiplier: RawRepresentable where Multiplier.RawValue == Double
    
    /// Collection containing significant `Digit`(s) for value calculation.
    var digits: [Digit] { get }
    /// Used as the `Multiplier` in the value calculation.
    var multiplier: Multiplier { get }
}

extension ValueCalculable {
    /// Product of `Digit`(s) and `Multiplier`.
    public var value: Double {
        var count = 0.0
        let base = digits.reversed().reduce(0.0) { result, digit in
            defer { count += 1 }
            return pow(10, count) * digit.rawValue + result
        }
        return base * multiplier.rawValue
    }
}
