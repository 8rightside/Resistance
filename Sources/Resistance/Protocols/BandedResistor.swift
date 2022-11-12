/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Foundation

public protocol BandedResistor: ValueCalculable, CustomStringConvertible {
    /// The `Tolerance` rating of the `Resistor` represented as a decimal
    var tolerance: Tolerance { get }
    /// A new resistor with the value multiplied by 10
    func decadeUp() -> Self
    /// A new resistor withe value divided by 10
    func decadeDown() -> Self
}

extension BandedResistor {
    /// `Range` representing the values the `Resistor` covers
    public var toleranceValueRange: Range<Double> {
        let lowerBound = value - value * tolerance.rawValue
        let upperBound = value + value * tolerance.rawValue
        return lowerBound..<upperBound
    }
    
    /// Creates a `FourBandResistor` with the same value and `tolerance` as self.
    /// - Returns: `FourBandResistor` with the same value and `tolerance` as self.
    public func convertToFourBand() -> FourBandResistor {
        if let fourBand = self as? FourBandResistor {
            return fourBand
        }
        return FourBandResistor(resistor: self, tolerance: self.tolerance)
    }
    
    /// Creates a `FiveBandResistor` with the same value and `tolerance` as self.
    /// - Returns: `FiveBandResistor` with the same value and `tolerance` as self.
    public func convertToFiveBand() -> FiveBandResistor {
        if let fiveBand = self as? FiveBandResistor {
            return fiveBand
        }
        return FiveBandResistor(resistor: self, tolerance: self.tolerance)
    }
    
    /// Creates a `SixBandResistor` with the same value, `tolerance`, and `coefficient` as self.
    /// - Returns: `SixBandResistor` with the same value, `tolerance`, and `coefficient` as self.
    public func convertToSixBand(addingCoefficient coefficient: Coefficient = .brown) -> SixBandResistor {
        if let sixBand = self as? SixBandResistor {
            return sixBand
        }
        return SixBandResistor(resistor: self, tolerance: self.tolerance, coefficient: coefficient)
    }
    
    /// Returns the value of the next resistor up from the passed E Series
    /// - Parameter eSeries: E Series from which to get next value
    /// - Returns: `Double` representing next value up
    public func nextValueUp(inSeries eSeries: ESeriesProtocol) -> Double {
        return eSeries.nextValueUp(from: self)
    }
    
    /// Returns the value of the next resistor down from the pass E Series
    /// - Parameter eSeries: E Series from which to get next value
    /// - Returns: `Double` representing next value down
    public func nextValueDown(inSeries eSeries: ESeriesProtocol) -> Double {
        return eSeries.nextValueDown(from: self)
    }
}

// MARK: Custom String Convertible
extension BandedResistor {
    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert a
    /// `Resistor` instance to a string by using the `String(describing:)`
    /// initialiser.
    ///
    ///     let resistor = FourBandResistor(value: 4700)
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
