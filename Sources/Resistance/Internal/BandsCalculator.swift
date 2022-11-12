/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

// MARK: - Four Band
extension BandsCalculator {
    static func fourBandColors(value: Double) -> (digit1: Digit, digit2: Digit, multiplier: Multiplier) {
        guard value >= fourBandMin else { return calculateFourBandColors(value: fourBandMin) }
        guard value <= fourBandMax else { return calculateFourBandColors(value: fourBandMax) }
        let rounded = value.sigFigsRounded(by: 2)

        return calculateFourBandColors(value: rounded)
    }
    
    static func fourBandColorsOrFail(value: Double) throws -> (digit1: Digit, digit2: Digit, multiplier: Multiplier) {
        guard value >= fourBandMin else { throw ResistorError.lowValueError }
        guard value <= fourBandMax else { throw ResistorError.highValueError }
        guard value.sigFigsCount <= 2 else { throw ResistorError.invalidValueError }
        
        return calculateFourBandColors(value: value)
    }
}

// MARK: - Five Band
extension BandsCalculator {
    static func fiveBandColors(value: Double) -> (digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier) {
        guard value >= fiveBandMin else { return calculateFiveBandColors(value: fiveBandMin) }
        guard value <= fiveBandMax else { return calculateFiveBandColors(value: fiveBandMax) }
        let rounded = value.sigFigsRounded(by: 3)

        return calculateFiveBandColors(value: rounded)
    }
    
    static func fiveBandColorsOrFail(value: Double) throws -> (digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier) {
        guard value >= fiveBandMin else { throw ResistorError.lowValueError }
        guard value <= fiveBandMax else { throw ResistorError.highValueError }
        guard value.sigFigsCount <= 3 else { throw ResistorError.invalidValueError }
        
        return calculateFiveBandColors(value: value)
    }
}

// MARK: - Internal
import Foundation

enum BandsCalculator {
// MARK: - Constants
    static let fourBandMin: Double = 0.1
    static let fourBandMax: Double = 99_000_000_000
    static let fiveBandMin: Double = 1
    static let fiveBandMax: Double = 999_000_000_000
}

// MARK: - Functions
extension BandsCalculator {
    private static func calculateFourBandColors(value: Double) -> (digit1: Digit, digit2: Digit, multiplier: Multiplier) {
        var sigfigs = value.hundredsDecade
        
        let band1 = Double(Int(sigfigs / 100))
        sigfigs.formTruncatingRemainder(dividingBy: 100)
        let band2 = Double(Int(sigfigs / 10))
        let band3 = pow(10, value.powerOfTen - 1)
        
        guard let digit1 = Digit(rawValue: band1) else { fatalError("Value passed to digit 1 incorrect") }
        guard let digit2 = Digit(rawValue: band2) else { fatalError("Value passed to digit 2 incorrect") }
        guard let multiplier = Multiplier(rawValue: band3) else { fatalError("Value passed to multiplier incorrect") }
        
        return (digit1, digit2, multiplier)
    }
    
    private static func calculateFiveBandColors(value: Double) -> (digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier) {
        var sigfigs = value.hundredsDecade
        
        let band1 = Double(Int(sigfigs / 100))
        sigfigs.formTruncatingRemainder(dividingBy: 100)
        let band2 = Double(Int(sigfigs / 10))
        let band3 = sigfigs.truncatingRemainder(dividingBy: 10)
        let band4 = pow(10, value.powerOfTen - 2)
        
        guard let digit1 = Digit(rawValue: band1) else { fatalError("Value passed to digit 1 incorrect") }
        guard let digit2 = Digit(rawValue: band2) else { fatalError("Value passed to digit 2 incorrect") }
        guard let digit3 = Digit(rawValue: band3) else { fatalError("Value passed to digit 3 incorrect") }
        guard let multiplier = Multiplier(rawValue: band4) else { fatalError("Value passed to multiplier incorrect") }
        
        return (digit1, digit2, digit3, multiplier)
    }
}
