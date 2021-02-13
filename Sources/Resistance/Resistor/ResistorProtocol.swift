/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Foundation

public protocol ResistorProtocol: CustomStringConvertible {
    /// The resistance value of the represented `Resistor`
    var value: Double { get }
    /// A `Digit` array containing the digit bands of the `Resistor`
    var digits: [Digit] { get }
    /// The `Multiplier` band of the `Resistor`
    var multiplier: Multiplier { get }
    /// The `Tolerance` rating of the `Resistor` represented as a decimal
    var tolerance: Tolerance { get }
}

extension ResistorProtocol {
    /// `Range` representing the values the `Resistor` covers
    public var toleranceValueRange: Range<Double> {
        let lowerBound = value - value * tolerance.rawValue
        let upperBound = value + value * tolerance.rawValue
        return lowerBound..<upperBound
    }
    
    // MARK: Custom String Convertible
    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert a
    /// `Resistor` instance to a string by using the `String(describing:)`
    /// initialiser.
    ///
    ///     let resistor = Resistor.fiveBand(.brown, .green, .yellow, .brown, .gold)
    ///     let string = String(describing: resistor)
    ///     print(string)
    ///     // prints 1.54 KΩ
    public var description: String {
        let thousand = value / 1000
        let million = value / 1_000_000
        let billion = value / 1_000_000_000
        
        if      billion >= 1.0  { return String(format: "%g GΩ", billion) }
        else if million >= 1.0  { return String(format: "%g MΩ", million) }
        else if thousand >= 1.0 { return String(format: "%g KΩ", thousand) }
        else                    { return String(format: "%g Ω", value) }
    }
}
