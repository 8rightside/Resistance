
// MARK: Resistor Creation
extension ResistorController {
    
    public func createFourBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        throw ResistorError.lowValueError
    }
    
    public func createFiveBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        throw ResistorError.lowValueError
    }
    
    public func createSixBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold, coefficient: Resistor.TempCoef = .brown) throws -> Resistor {
        throw ResistorError.lowValueError
    }
}

// MARK:- Nested Types
extension ResistorController {
    enum ResistorError: Error {
        case lowValueError, highValueError, inValidValueError
    }
}

import Foundation

public struct ResistorController {
    public init() { }
}
