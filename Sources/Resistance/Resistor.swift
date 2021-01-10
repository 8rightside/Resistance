
// MARK: Resistor Types
import Foundation

/// Type representing a four, five, or six banded `Resistor`
public enum Resistor {
    /// Four banded resistor type
    case fourBand(Digit, Digit, Multiplier, Tolerance)
    /// Five banded resistor type
    case fiveBand(Digit, Digit, Digit, Multiplier, Tolerance)
    /// Six banded resistor type
    case sixBand(Digit, Digit, Digit, Multiplier, Tolerance, TempCoef)
    
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
    
    /// The tolerance rating of the `Resistor` represented as a decimal
    public var tolerance: Tolerance {
        switch self {
            case .fourBand(_, _, _, let tolerance): return tolerance
            case .fiveBand(_, _, _, _, let tolerance): return tolerance
            case .sixBand(_, _, _, _, let tolerance, _): return tolerance
        }
    }
}

// MARK:- Resistor Components
extension Resistor {
    /// Type representing one of the significant digit bands of a `Resistor`
    ///
    /// The associated value of each case is the appropriate value for the colour band it
    /// represents.
    public enum Digit: Double {
        case black, brown, red, orange, yellow, green, blue, violet, grey, white
    }
    
    /// Type representing the multiplier band of a `Resistor`
    ///
    /// The associated value of each case is the appropriate value for the colour band it
    /// represents.
    public enum Multiplier: Double {
        case black  = 1
        case brown  = 10
        case red    = 100
        case orange = 1000
        case yellow = 10_000
        case green  = 100_000
        case blue   = 1_000_000
        case violet = 10_000_000
        case grey   = 100_000_000
        case white  = 1_000_000_000
        case gold   = 0.1
        case silver = 0.01
    }
    
    /// Type representing the tolerance rating band of a `Resistor`
    ///
    /// The associated value of each case is the appropriate value for the colour band it
    /// represents.
    public enum Tolerance: Double {
        case brown  = 0.01
        case red    = 0.02
        case orange = 0.03
        case yellow = 0.04
        case green  = 0.005
        case blue   = 0.0025
        case violet = 0.001
        case grey   = 0.0005
        case gold   = 0.05
        case silver = 0.1
    }
    
    /// Type representing the temperature coefficient rating of a `Resistor`
    ///
    /// The associated value of each case is the appropriate value for the colour band it
    /// represents.
    public enum TempCoef: Double {
        case brown  = 100
        case red    = 50
        case orange = 15
        case yellow = 25
        case blue   = 10
        case violet = 5
    }
    
    /// Options for use with `Resistor` creation functions
    public enum CreateOption {
        case exactOrFail
        case nearestRoundUp
        case nearestRoundDown
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
