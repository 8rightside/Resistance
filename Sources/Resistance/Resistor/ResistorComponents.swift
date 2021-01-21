
import Foundation

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
    public enum Coefficient: Double {
        case brown  = 100
        case red    = 50
        case orange = 15
        case yellow = 25
        case blue   = 10
        case violet = 5
    }
}
