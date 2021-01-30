import Foundation

public protocol ESeriesProtocol {
    /// The prefered values for this `Resistor` from the 100–1000 decade
    var preferedValues: [Int] { get }
}

public enum ESeriesRoundingType {
    case up, down, auto
}

extension ESeriesProtocol {
    /// Returns a `Boolean` indicating whether the value is in this `ESeries`
    /// - Parameters:
    ///     - value: The value to test
    /// - Returns: `true` if the value is in the `ESeries`; otherwise `false`
    public func containsPreferedValue(_ value: Double) -> Bool {
        guard value.sigFigsCount < 4 else { return false }
        let sigfigs = value.hundredsDecade
        return preferedValues.contains(Int(sigfigs))
    }
    
    /// Returns a `Double` representing the closest `ESeries` value to the passed value
    /// - Parameters:
    ///     - to: Value to test
    ///     - rounding: Rounding method to use
    /// - Returns: Nearest `ESeries` value
    public func nearestPreferedValue(to value: Double, rounding: ESeriesRoundingType = .auto) -> Double {
        0
    }
    
    /// Returns a `Double` representing the next `ESeries` value up from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value up
    public func nextValueUp(from value: Double) -> Double {
        let sigFigs = Int(value.hundredsDecade)
        if let index = preferedValues.firstIndex(of: sigFigs) {
            let nextIndex = (index + 1) % preferedValues.count
            let nextUpSigFigs = preferedValues[nextIndex]
            let exp = index + 1 >= preferedValues.count ? value.powerOfTen - 1 : value.powerOfTen - 2
            return Double(nextUpSigFigs) * pow(10, exp)
        } else {
            var preferedValuesCopy = preferedValues
            preferedValuesCopy.append(sigFigs)
            preferedValuesCopy.sort()
            let index = preferedValuesCopy.firstIndex(of: sigFigs)!
            let nextIndex = (index + 1) % preferedValuesCopy.count
            let nextUpSigFigs = preferedValuesCopy[nextIndex]
            let exp = index + 1 >= preferedValuesCopy.count ? value.powerOfTen - 1 : value.powerOfTen - 2
            return Double(nextUpSigFigs) * pow(10, exp)
        }
    }
    
    /// Returns a `Double` representing the next `ESeries` value down from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value down
    public func nextValueDown(from value: Double) -> Double {
        0
    }
}
