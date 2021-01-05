import Foundation

// MARK: API

/// Type representing a four, five, or six banded resistor.
public enum Resistor {
    /// Four banded resistor type
    case fourBand(Digit, Digit, Multiplier, Tolerance)
    /// Five banded resistor type
    case fiveBand(Digit, Digit, Digit, Multiplier, Tolerance)
    /// Six banded resistor type
    case sixBand(Digit, Digit, Digit, Multiplier, Tolerance, TempCoef)
    
    /// The resistance value of the represented resistor
    public var value: Double {
        switch self {
            case .fourBand(let digit1, let digit2, let multiplier, _):
                return (digit1.rawValue * 10 + digit2.rawValue) * multiplier.rawValue
            
            case .fiveBand(let digit1, let digit2, let digit3, let multiplier, _),
                 .sixBand(let digit1, let digit2, let digit3, let multiplier, _, _):
                return (digit1.rawValue * 100 + digit2.rawValue * 10 + digit3.rawValue) * multiplier.rawValue
        }
    }
    
    /// Create a four banded resistor from a given resistance value with the given tolerance rating
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    /// - Returns: A four banded resistor type representing the given resistance and tolerance
    /// - Note: Because a four banded resistor can only represent **two significant figures** of
    /// a value the returned type will be rounded if necessary.
    public static func createFourBand(from value: Double, tolerance: Tolerance = .gold) -> Resistor {
        let exp = value < 0.1 ? floor(log10(value)) : floor(log10(value)) - 1
        let sigfigs = value / pow(10, exp)
        
        let band1 = Double(Int(sigfigs / 10))
        let band2 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band3 = pow(10, exp)
        
        let digit1 = Resistor.Digit(rawValue: band1)!
        let digit2 = Resistor.Digit(rawValue: band2)!
        let digit3 = Resistor.Multiplier(rawValue: band3)!

        return Resistor.fourBand(digit1, digit2, digit3, tolerance)
    }
    
    /// Create a five banded resistor from a given resistance value with the given tolerance rating
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    /// - Returns: A five banded resistor type representing the given resistance and tolerance
    /// - Note: Because a five banded resistor can only represent **three significant figures** of
    /// a value the returned type will be rounded if necessary.
    public static func createFiveBand(from value: Double, tolerance: Tolerance = .gold) -> Resistor {
        return .fiveBand(.black, .black, .black, .black, tolerance)
    }
    
    /// Create a six banded resistor from a given resistance value with the given tolerance rating and
    /// temperature coefficient
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    ///     - coefficient: Temperature coefficient of the resistor
    /// - Returns: A six banded resistor type representing the given resistance, tolerance, and temperature
    /// coefficient
    /// - Note: Because a six banded resistor can only represent **three significant figures** of
    /// a value the returned type will be rounded if necessary.
    public static func createSixBand(from value: Double, tolerance: Tolerance, coefficient: TempCoef = .brown) -> Resistor {
        return .sixBand(.black, .black, .black, .black, tolerance, coefficient)
    }
}

// MARK:- Nested Types
extension Resistor {
    /// Type representing one of the significant digit bands of a resistor
    ///
    /// The associated value of each case is the appropriate value for the colour band it
    /// represents.
    public enum Digit: Double {
        case black, brown, red, orange, yellow, green, blue, violet, grey, white
    }
    
    /// Type representing the multiplier band of a resistor
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
    
    /// Type representing the tolerance rating band of a resistor
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
    
    /// Type representing the temperature coefficient rating of a resistor
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
}

// MARK:- Custom String Convertible
extension Resistor: CustomStringConvertible {
    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert a
    /// Resistor instance to a string by using the `String(describing:)`
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
