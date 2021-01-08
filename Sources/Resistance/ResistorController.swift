
// MARK: Resistor Creation
extension ResistorController {
    /// Creates a four banded resistor from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    /// - Returns: A four banded resistor type representing the given resistance and tolerance
    /// - Throws: ResistorError
    public func createFourBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        guard value >= 0.01 else { throw ResistorError.lowValueError }
        guard value <= 99_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 3 else { throw ResistorError.inValidValueError }

        return try calculateFourBand(from: value, tolerance: tolerance)
    }
    
    /// Creates a five banded resistor from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    /// - Returns: A five banded resistor type representing the given resistance and tolerance
    /// - Throws: ResistorError
    public func createFiveBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        guard value >= 0.01 else { throw ResistorError.lowValueError }
        guard value <= 999_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 4 else { throw ResistorError.inValidValueError }
        
        return try calculateFiveBand(from: value, tolerance: tolerance)
    }
    
    /// Creates a six banded resistor from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the resistor will represent
    ///     - tolerance: Tolerance rating of the resistor
    ///     - coefficient: Temperature coefficient rating of the resistor
    /// - Returns: A six banded resistor type representing the given resistance and tolerance
    /// - Throws: ResistorError
    public func createSixBandOrFail(from value: Double, tolerance: Resistor.Tolerance = .gold, coefficient: Resistor.TempCoef = .brown) throws -> Resistor {
        guard value >= 0.01 else { throw ResistorError.lowValueError }
        guard value <= 999_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 4 else { throw ResistorError.inValidValueError }
        
        return try calculateFiveBand(from: value, tolerance: tolerance, coefficient: coefficient)
    }
}

// MARK:- Nested Types
extension ResistorController {
    public enum ResistorError: Error {
        case lowValueError, highValueError, inValidValueError
    }
}

import Foundation

/// Struct for creating and manipulating `Resistor` types
public struct ResistorController {
    public init() { }
}

// MARK:- Internal Methods
extension ResistorController {
    private func calculateFourBand(from value: Double, tolerance: Resistor.Tolerance) throws -> Resistor {
        let sigfigs = value / pow(10, value.fourBandExponent)
        
        let band1 = Double(Int(sigfigs / 10))
        let band2 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band3 = pow(10, value.fourBandExponent)
        
        guard let digit1 = Resistor.Digit(rawValue: band1) else { throw ResistorError.inValidValueError }
        guard let digit2 = Resistor.Digit(rawValue: band2) else { throw ResistorError.inValidValueError }
        guard let multiplier = Resistor.Multiplier(rawValue: band3) else { throw ResistorError.inValidValueError }

        return .fourBand(digit1, digit2, multiplier, tolerance)
    }
    
    private func calculateFiveBand(from value: Double, tolerance: Resistor.Tolerance, coefficient: Resistor.TempCoef? = nil) throws -> Resistor {
        var sigfigs = value / pow(10, value.fiveBandExponent)
        
        let band1 = Double(Int(sigfigs / 100))
        sigfigs.formTruncatingRemainder(dividingBy: 100)
        let band2 = Double(Int(sigfigs / 10))
        let band3 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band4 = pow(10, value.fiveBandExponent)
        
        guard let digit1 = Resistor.Digit(rawValue: band1) else { throw ResistorError.inValidValueError }
        guard let digit2 = Resistor.Digit(rawValue: band2) else { throw ResistorError.inValidValueError }
        guard let digit3 = Resistor.Digit(rawValue: band3) else { throw ResistorError.inValidValueError }
        guard let multiplier = Resistor.Multiplier(rawValue: band4) else { throw ResistorError.inValidValueError }

        if let coefficient = coefficient {
            return .sixBand(digit1, digit2, digit3, multiplier, tolerance, coefficient)
        } else {
            return .fiveBand(digit1, digit2, digit3, multiplier, tolerance)
        }
    }
}
