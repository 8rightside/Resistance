
// MARK: Resistor Creation
extension ResistorController {
    /// Create a four banded resistor from a given resistance value with the given tolerance rating
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    /// - Returns: A four banded resistor type representing the given resistance and tolerance
    /// - Throws: ResistorError
    public func createFourBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        guard value >= 0.01 else { throw ResistorError.lowValueError }
        guard value <= 99_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 3 else { throw ResistorError.inValidValueError }
        
        guard let digit1 = Resistor.Digit(rawValue: value.fourBandDigit1) else { throw ResistorError.inValidValueError }
        guard let digit2 = Resistor.Digit(rawValue: value.fourBandDigit2) else { throw ResistorError.inValidValueError }
        guard let digit3 = Resistor.Multiplier(rawValue: value.fourBandMultiplier) else { throw ResistorError.inValidValueError }

        return Resistor.fourBand(digit1, digit2, digit3, tolerance)
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

