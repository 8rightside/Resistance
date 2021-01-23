import Foundation

/// Type representing a four, five, or six banded `Resistor`
public enum Resistor {
    /// Four banded resistor type
    case fourBand(Digit, Digit, Multiplier, Tolerance)
    /// Five banded resistor type
    case fiveBand(Digit, Digit, Digit, Multiplier, Tolerance)
    /// Six banded resistor type
    case sixBand(Digit, Digit, Digit, Multiplier, Tolerance, Coefficient)
    
    /// The resistance value of the represented `Resistor`
    public var value: Double {
        switch self {
            case .fourBand(let digit1, let digit2, let multiplier, _):
                return (digit1.rawValue * 10 + digit2.rawValue) * multiplier.rawValue
            
            case .fiveBand(let digit1, let digit2, let digit3, let multiplier, _),
                 .sixBand(let digit1, let digit2, let digit3, let multiplier, _, _):
                return (digit1.rawValue * 100 + digit2.rawValue * 10 + digit3.rawValue) * multiplier.rawValue
        }
    }
    
    /// A `Resistor.Digit` array containing the digit bands of the `Resistor`
    public var digits: [Digit] {
        switch self {
            case .fourBand(let digit1, let digit2, _, _):
                return [digit1, digit2]
                
            case .fiveBand(let digit1, let digit2, let digit3, _, _),
                 .sixBand(let digit1, let digit2, let digit3, _, _, _):
                return [digit1, digit2, digit3]
        }
    }
    
    /// The multiplier band of the `Resistor`
    public var multiplier: Multiplier {
        switch self {
            case .fourBand(_, _, let multiplier, _): return multiplier
            case .fiveBand(_, _, _, let multiplier, _): return multiplier
            case .sixBand(_, _, _, let multiplier, _, _): return multiplier
        }
    }
    
    /// The tolerance rating of the `Resistor` represented as a decimal
    public var tolerance: Tolerance {
        switch self {
            case .fourBand(_, _, _, let tolerance): return tolerance
            case .fiveBand(_, _, _, _, let tolerance): return tolerance
            case .sixBand(_, _, _, _, let tolerance, _): return tolerance
        }
    }
    
    /// The optional cooefficient rating of the `Resistor` if it has one
    public var coefficient: Coefficient? {
        if case .sixBand(_, _, _, _, _, let tempCo) = self {
            return tempCo
        } else {
            return nil
        }        
    }
    
    /// `Range` representing the values the `Resistor` covers
    public var toleranceValueRange: Range<Double> {
        let lowerBound = value - value * tolerance.rawValue
        let upperBound = value + value * tolerance.rawValue
        return lowerBound..<upperBound
    }
    
    /// Calculates the `Range` of values a resistor covers depending on its `Coefficient` rating
    /// and the given temperature difference
    /// - Parameters:
    ///     - tempChange: Temperature delta from the nominal value
    /// - Returns: `Range` representing the values the `Resistor` covers
    public func coefficientValueRange(tempChange: Double) -> Range<Double> {
        let lowerBound = value - value / 1_000_000 * (coefficient?.rawValue ?? 0) * tempChange
        let upperBound = value + value / 1_000_000 * (coefficient?.rawValue ?? 0) * tempChange
        return lowerBound..<upperBound
    }
}

// MARK:- Custom String Convertible
extension Resistor: CustomStringConvertible {
    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert a
    /// `Resistor` instance to a string by using the `String(describing:)`
    /// initializer.
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
