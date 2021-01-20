
// MARK: Four Band
extension ResistorFactory {
    /// Creates a four banded `Resistor` from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Returns: A four banded `Resistor` type representing the given resistance and tolerance
    /// - Throws: `ResistorError`
    public func makeFourBandOrFail(value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        guard value >= 0.1 else { throw ResistorError.lowValueError }
        guard value <= 99_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 3 else { throw ResistorError.inValidValueError }
        
        return calculateFourBand(from: value, tolerance: tolerance)
    }
    
    /// Creates a four banded `Resistor` with the resistance value of the input `Resistor` or throws an
    /// error if the value can't be represented
    /// - Parameters:
    ///     - resistor: The `Resistor` to convert from
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Note: If the tolerance parameter is omitted the tolerance rating of the passed
    /// `Resistor` will be used
    /// - Returns: A four banded `Resistor` representing the conversion
    /// - Throws: `ResistorError`
    public func makeFourBandOrFail(resistor: Resistor, tolerance: Resistor.Tolerance? = nil) throws -> Resistor {
        try makeFourBandOrFail(value: resistor.value, tolerance: tolerance ?? resistor.tolerance)
    }
    
    /// Creates a four banded `Resistor` from a given resistance value with the given tolerance rating
    /// or one with the nearest value possible
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Returns: A four banded `Resistor` type representing the given resistance and tolerance
    public func makeFourBand(value: Double, tolerance: Resistor.Tolerance = .gold) -> Resistor {
        guard value >= 0.1 else { return calculateFourBand(from: 0.1, tolerance: tolerance) }
        guard value <= 99_000_000_000 else { return calculateFourBand(from: 99_000_000_000, tolerance: tolerance) }
        
        let rounded = value.roundedForFourBand
        return calculateFourBand(from: rounded, tolerance: tolerance)
    }
        
    /// Creates a four banded `Resistor` with the resistance value of the input `Resistor` or one with
    /// the nearest value possible
    /// - Parameters:
    ///     - resistor: The `Resistor` to convert from
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Note: If the tolerance parameter is omitted the tolerance rating of the passed
    /// `Resistor` will be used
    /// - Returns: A four banded `Resistor` representing the conversion
    public func makeFourBand(resistor: Resistor, tolerance: Resistor.Tolerance? = nil) -> Resistor {
        makeFourBand(value: resistor.value, tolerance: tolerance ?? resistor.tolerance)
    }
}

// MARK:- Five Band
extension ResistorFactory {
    /// Creates a five banded `Resistor` from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Returns: A five banded `Resistor` type representing the given resistance and tolerance
    /// - Throws: `ResistorError`
    public func makeFiveBandOrFail(value: Double, tolerance: Resistor.Tolerance = .gold) throws -> Resistor {
        guard value >= 0.1 else { throw ResistorError.lowValueError }
        guard value <= 999_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 4 else { throw ResistorError.inValidValueError }
        
        return calculateFiveBand(from: value, tolerance: tolerance)
    }
    
    /// Creates a five banded `Resistor` from a given resistance value with the given tolerance rating
    /// or one with the nearest value possible
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Returns: A four banded `Resistor` type representing the given resistance and tolerance
    public func makeFiveBand(value: Double, tolerance: Resistor.Tolerance = .gold) -> Resistor {
        guard value >= 0.1 else { return calculateFiveBand(from: 0.1, tolerance: tolerance) }
        guard value <= 999_000_000_000 else { return calculateFiveBand(from: 999_000_000_000, tolerance: tolerance) }
        
        let rounded = value.roundedForFiveBand
        return calculateFiveBand(from: rounded, tolerance: tolerance)
    }
    
    /// Creates a five banded `Resistor` with the resistance value of the input `Resistor`
    /// - Parameters:
    ///     - resistor: The `Resistor` to convert from
    ///     - tolerance: Tolerance rating of the `Resistor`
    /// - Note: If the tolerance parameter is omitted the tolerance rating of the passed
    /// `Resistor` will be used
    /// - Returns: A five banded `Resistor` representing the conversion
    public func makeFiveBand(resistor: Resistor, tolerance: Resistor.Tolerance? = nil) -> Resistor {
        do {
            return try makeFiveBandOrFail(value: resistor.value, tolerance: tolerance ?? resistor.tolerance)
        } catch {
            fatalError("Should not be able to fail to convert to a five band resistor")
        }
    }
}

// MARK:- Six Band
extension ResistorFactory {
    /// Creates a six banded `Resistor` from a given resistance value with the given tolerance rating
    /// or fails throwing an Error
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    ///     - coefficient: Temperature coefficient rating of the `Resistor`
    /// - Returns: A six banded `Resistor` type representing the given resistance and tolerance
    /// - Throws: `ResistorError`
    public func makeSixBandOrFail(value: Double, tolerance: Resistor.Tolerance = .gold, coefficient: Resistor.Coefficient = .brown) throws -> Resistor {
        guard value >= 0.1 else { throw ResistorError.lowValueError }
        guard value <= 999_000_000_000 else { throw ResistorError.highValueError }
        guard value.sigFigsCount < 4 else { throw ResistorError.inValidValueError }
        
        return calculateFiveBand(from: value, tolerance: tolerance, coefficient: coefficient)
    }
    
    /// Creates a six banded `Resistor` from a given resistance value with the given tolerance rating
    /// or one with the nearest value possible
    /// - Parameters:
    ///     - value: Resistance value the `Resistor` will represent
    ///     - tolerance: Tolerance rating of the `Resistor`
    ///     - coefficient: Temperature coefficient rating of the `Resistor`
    /// - Returns: A four banded `Resistor` type representing the given resistance and tolerance
    public func makeSixBand(value: Double, tolerance: Resistor.Tolerance = .gold, coefficient: Resistor.Coefficient = .brown) -> Resistor {
        guard value >= 0.1 else { return calculateFiveBand(from: 0.1, tolerance: tolerance, coefficient: coefficient) }
        guard value <= 999_000_000_000 else { return calculateFiveBand(from: 999_000_000_000, tolerance: tolerance, coefficient: coefficient) }
        
        let rounded = value.roundedForFiveBand
        return calculateFiveBand(from: rounded, tolerance: tolerance, coefficient: coefficient)
    }
    
    /// Creates a six banded `Resistor` with the resistance value of the input `Resistor`
    /// - Parameters:
    ///     - resistor: The `Resistor` to convert from
    ///     - tolerance: Tolerance rating of the `Resistor`
    ///     - coefficient: Temperature coefficient rating of the `Resistor`
    /// - Note: If the tolerance parameter is omitted the tolerance rating of the passeed
    /// `Resistor` will be used. If the coefficient parameter is omitted either the coefficient
    /// rating of the passed `Resistor` or a default of Brown will be used
    /// - Returns: A six banded `Resistor` representing the conversion
    public func makeSixBand(resistor: Resistor, tolerance: Resistor.Tolerance? = nil, coefficient: Resistor.Coefficient? = nil) -> Resistor {
        var tempCo = Resistor.Coefficient.brown
        if case .sixBand(_, _, _, _, _, let tc) = resistor { tempCo = tc }
        do {
            return try makeSixBandOrFail(value: resistor.value, tolerance: tolerance ?? resistor.tolerance, coefficient: coefficient ?? tempCo)
        } catch {
            fatalError("Should not be able to fail to convert to a six band resistor")
        }
    }
}

// MARK:- Nested Types
extension ResistorFactory {
    public enum ResistorError: Error {
        case lowValueError, highValueError, inValidValueError
    }
    
    public enum ESeries {
        case e6, e12, e24, e48, e192
    }
    
    public enum RoundingType {
        case up, down, auto
    }
}

import Foundation

/// Struct for creating and manipulating `Resistor` types
public struct ResistorFactory {
    public init() { }
}

// MARK:- Internal Methods
extension ResistorFactory {
    private func calculateFourBand(from value: Double, tolerance: Resistor.Tolerance) -> Resistor {
        let sigfigs = value / pow(10, value.fourBandExponent)
        
        let band1 = Double(Int(sigfigs / 10))
        let band2 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band3 = pow(10, value.fourBandExponent)
        
        guard let digit1 = Resistor.Digit(rawValue: band1) else { fatalError("Value passed to digit 1 incorrect") }
        guard let digit2 = Resistor.Digit(rawValue: band2) else { fatalError("Value passed to digit 2 incorrect") }
        guard let multiplier = Resistor.Multiplier(rawValue: band3) else { fatalError("Value passed to multiplier incorrect") }
        
        return .fourBand(digit1, digit2, multiplier, tolerance)
    }
    
    private func calculateFiveBand(from value: Double, tolerance: Resistor.Tolerance, coefficient: Resistor.Coefficient? = nil) -> Resistor {
        var sigfigs = value / pow(10, value.fiveBandExponent)
        
        let band1 = Double(Int(sigfigs / 100))
        sigfigs.formTruncatingRemainder(dividingBy: 100)
        let band2 = Double(Int(sigfigs / 10))
        let band3 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band4 = pow(10, value.fiveBandExponent)
        
        guard let digit1 = Resistor.Digit(rawValue: band1) else { fatalError("Value passed to digit 1 incorrect") }
        guard let digit2 = Resistor.Digit(rawValue: band2) else { fatalError("Value passed to digit 2 incorrect") }
        guard let digit3 = Resistor.Digit(rawValue: band3) else { fatalError("Value passed to digit 3 incorrect") }
        guard let multiplier = Resistor.Multiplier(rawValue: band4) else { fatalError("Value passed to multiplier incorrect") }
        
        if let coefficient = coefficient {
            return .sixBand(digit1, digit2, digit3, multiplier, tolerance, coefficient)
        } else {
            return .fiveBand(digit1, digit2, digit3, multiplier, tolerance)
        }
    }
}
