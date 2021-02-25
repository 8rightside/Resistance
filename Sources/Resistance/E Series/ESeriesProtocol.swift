/**
*  Resistance
*  Copyright (c) Matt Malenko 2021
*  MIT license, see LICENSE file for details
*/

// MARK:- API
import Foundation

public protocol ESeriesProtocol {
    /// The preferred values for this `Resistor` from the 100–1000 decade
    var preferredValues: Set<Int> { get }
}

extension ESeriesProtocol {
    /// Returns a `Boolean` indicating whether the value is in this `ESeries`
    /// - Complexity: O(1)
    /// - Parameters:
    ///     - value: The value to test
    /// - Returns: `true` if the value is in the `ESeries`; otherwise `false`
    public func containsPreferredValue(_ value: Double) -> Bool {
        guard value.sigFigsCount < 4 else { return false }
        let sigfigs = value.hundredsDecade
        return preferredValues.contains(Int(sigfigs))
    }
    
    /// Returns a `Boolean` indicating whether the resistors value is in this `ESeries`
    /// - Complexity: O(1)
    /// - Parameters:
    ///     - resistor: The resistor to test
    /// - Returns: `true` if the resistors value is in the `ESeries`; otherwise `false`
    public func containsPreferredValue<T: BandedResistor>(_ resistor: T) -> Bool {
        containsPreferredValue(resistor.value)
    }
     
    /// Returns a `Double` representing the next `ESeries` value up from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value up
    public func nextValueUp(from value: Double) -> Double {
        calculateNextValue(from: value)
    }
    
    /// Returns a `Double` representing the next `ESeries` value up from the one passed
    /// - Parameters:
    ///     - from: Resistor to test
    /// - Returns: Next `ESeries` value up
    public func nextValueUp<T: BandedResistor>(from resistor: T) -> Double {
        calculateNextValue(from: resistor.value)
    }
    
    /// Returns a `Double` representing the next `ESeries` value down from the one passed
    /// - Parameters:
    ///     - from: Value to test
    /// - Returns: Next `ESeries` value down
    public func nextValueDown(from value: Double) -> Double {
        calculateNextValue(from: value, reverseSorted: true)
    }
    
    /// Returns a `Double` representing the next `ESeries` value down from the one passed
    /// - Parameters:
    ///     - from: Resistor to test
    /// - Returns: Next `ESeries` value down
    public func nextValueDown<T: BandedResistor>(from resistor: T) -> Double {
        calculateNextValue(from: resistor.value, reverseSorted: true)
    }
}

// MARK:- Internal
extension ESeriesProtocol {
    private func calculateNextValue(from value: Double, reverseSorted: Bool = false) -> Double {
        let sigFigs = value.hundredsDecade
        var prefValues = preferredValues
        prefValues.insert(Int(sigFigs))
        let pvSorted = prefValues.sorted(by: reverseSorted ? { $0 > $1 } : { $0 < $1 } )
        
        let index: Int
        if reverseSorted {
            index = pvSorted.binarySearchReverse(element: Int(sigFigs))!
        } else {
            index = pvSorted.binarySearchForward(element: Int(sigFigs))!
        }
        
        let nextIndex = (index + 1) % pvSorted.count
        let nextUpSigFigs = pvSorted[nextIndex]
        let exp = index + 1 >= pvSorted.count ? value.powerOfTen - 1 : value.powerOfTen - 2
        return Double(nextUpSigFigs) * pow(10, exp)
    }
}
