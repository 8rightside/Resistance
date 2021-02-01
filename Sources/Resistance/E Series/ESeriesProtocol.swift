/**
*  Resistance
*  Copyright (c) Matt Malenko 2021
*  MIT license, see LICENSE file for details
*/

import Foundation

public protocol ESeriesProtocol {
    /// The prefered values for this `Resistor` from the 100–1000 decade
    var preferedValues: Set<Int> { get }
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
        if containsPreferedValue(value) { return value }
        switch rounding {
            case .up:
                return nextValueUp(from: value)
            case .down:
                return nextValueDown(from: value)
            case .auto:
                let nextUp = nextValueUp(from: value)
                let nextDown = nextValueDown(from: value)
                let diffUp = abs(value - nextUp)
                let diffDown = abs(value - nextDown)
                if diffUp <= diffDown {
                    return nextUp
                } else {
                    return nextDown
                }
        }
    }
    
    /// Returns a `Double` representing the next `ESeries` value up from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value up
    public func nextValueUp(from value: Double) -> Double {
        let sigFigs = value.hundredsDecade
        var pv = preferedValues
        pv.insert(Int(sigFigs))
        let pvSorted = pv.sorted()
        
        let index = pvSorted.firstIndex(of: Int(sigFigs))!
        let nextIndex = (index + 1) % pvSorted.count
        let nextUpSigFigs = pvSorted[nextIndex]
        let exp = index + 1 >= pvSorted.count ? value.powerOfTen - 1 : value.powerOfTen - 2
        return Double(nextUpSigFigs) * pow(10, exp)
    }
    
    /// Returns a `Double` representing the next `ESeries` value down from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value down
    public func nextValueDown(from value: Double) -> Double {
        let sigFigs = value.hundredsDecade
        var pv = preferedValues
        pv.insert(Int(sigFigs))
        let pvSorted: [Int] = pv.sorted().reversed()
        
        let index = pvSorted.firstIndex(of: Int(sigFigs))!
        let nextIndex = (index + 1) % pvSorted.count
        let nextUpSigFigs = pvSorted[nextIndex]
        let exp = index + 1 >= pvSorted.count ? value.powerOfTen - 1 : value.powerOfTen - 2
        return Double(nextUpSigFigs) * pow(10, exp)
    }
}
