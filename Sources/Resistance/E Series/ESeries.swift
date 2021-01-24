// MARK: API
extension ESeries {
    public static let e6 = ESeries(series: E6())
    public static let e12 = ESeries(series: E12())
    public static let e24 = ESeries(series: E24())
    public static let e96 = ESeries(series: E96())
    
    /// The prefered values for this `Resistor` from the 100–1000 decade
    public var preferedValues: [Int] {
        series.preferedValues
    }
    
    public func containsPreferedValue(_ value: Double) -> Bool {
        false
    }
    
    public func nearestPreferedValue(to value: Double) -> Double {
        0
    }
}

import Foundation

/// Type for 
public struct ESeries {
    let series: ESeriesProtocol
}
