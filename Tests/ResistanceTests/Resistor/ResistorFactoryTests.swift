// MARK: Four Band Failable Create



// MARK: Valid Input
extension ResistorFactoryTests {
    func test_makeFourBandOrFail_withMinValue() throws {
        let result = try sut.makeFourBandOrFail(value: 0.1)
        XCTAssertEqual(result.value, 0.1)
    }
    
    func test_makeFourBandOrFail_with1DigitValue() throws {
        let result = try sut.makeFourBandOrFail(value: 5)
        XCTAssertEqual(result.value, 5)
    }
    
    func test_makeFourBandOrFail_with2DigitValue() throws {
        let result = try sut.makeFourBandOrFail(value: 23)
        XCTAssertEqual(result.value, 23)
    }
    
    func test_makeFourBandOrFail_with3DigitValue() throws {
        let result = try sut.makeFourBandOrFail(value: 540)
        XCTAssertEqual(result.value, 540)
    }
    
    func test_makeFourBandOrFail_with5DigitValue() throws {
        let result = try sut.makeFourBandOrFail(value: 37_000)
        XCTAssertEqual(result.value, 37_000)
    }
    
    func test_makeFourBandOrFail_withMaxValue() throws {
        let result = try sut.makeFourBandOrFail(value: 99_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorFactoryTests {
    func test_makeFourBandOrFail_withLowValue() {
        let lowValue = 0.01
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: lowValue))
    }
    
    func test_makeFourBandOrFail_withHighValue() {
        let highValue = 100_000_000_000.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: highValue))
    }
    
    func test_makeFourBandOrFail_withInvalidValue() {
        let invalidValue = 234.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: invalidValue))
    }
}

// MARK:- Five Band Failable Create



// MARK: Valid Input
extension ResistorFactoryTests {
    func test_makeFiveBandOrFail_withMinValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 1)
        XCTAssertEqual(result.value, 1)
    }
    
    func test_makeFiveBandOrFail_with1DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 3)
        XCTAssertEqual(result.value, 3)
    }
    
    func test_makeFiveBandOrFail_with2DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 45)
        XCTAssertEqual(result.value, 45)
    }
    
    func test_makeFiveBandOrFail_with3DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 540)
        XCTAssertEqual(result.value, 540)
    }
    
    func test_makeFiveBandOrFail_with5DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 37_500)
        XCTAssertEqual(result.value, 37_500)
    }
    
    func test_makeFiveBandOrFail_withMaxValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorFactoryTests {
    func test_makeFiveBandOrFail_withLowValue() {
        let lowValue = 0.01
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: lowValue))
    }
    
    func test_makeFiveBandOrFail_withHighValue() {
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: highValue))
    }
    
    func test_makeFiveBandOrFail_withInvalidValue() {
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: invalidValue))
    }
}

// MARK:- Six Band Failable Create



// MARK: Valid Input
extension ResistorFactoryTests {
    func test_makeSixBandOrFail_withMinValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 1)
        XCTAssertEqual(result.value, 1)
    }
    
    func test_makeSixBandOrFail_with1DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 5)
        XCTAssertEqual(result.value, 5)
    }
    
    func test_makeSixBandOrFail_with2DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 23)
        XCTAssertEqual(result.value, 23)
    }
    
    func test_makeSixBandOrFail_with3DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 545)
        XCTAssertEqual(result.value, 545)
    }
    
    func test_makeSixBandOrFail_with5DigitValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 37_500)
        XCTAssertEqual(result.value, 37_500)
    }
    
    func test_makeSixBandOrFail_withMaxValue() throws {
        let result = try sut.makeFiveBandOrFail(value: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorFactoryTests {
    func test_makeSixBandOrFail_withLowValue() {
        let lowValue = 0.01
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: lowValue))
    }
    
    func test_makeSixBandOrFail_withHighValue() {
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: highValue))
    }
    
    func test_makeSixBandOrFail_withInvalidValue() {
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.makeFourBandOrFail(value: invalidValue))
    }
}

// MARK:- Nearest Resistor Creation



// MARK: OK Value
extension ResistorFactoryTests {
    func test_makeFourBand_withOkValue() {
        let result = sut.makeFourBand(value: 470)
        XCTAssertEqual(result.value, 470)
    }
    
    func test_makeFiveBand_withOkValue() {
        let result = sut.makeFiveBand(value: 4720)
        XCTAssertEqual(result.value, 4720)
    }
    
    func test_makeSixBand_withOkValue() {
        let result = sut.makeSixBand(value: 4720)
        XCTAssertEqual(result.value, 4720)
    }
}

// MARK: Low Value
extension ResistorFactoryTests {
    func test_makeFourBand_withLowValue() {
        let result = sut.makeFourBand(value: 0.09)
        XCTAssertEqual(result.value, 0.1)
    }
    
    func test_makeFiveBand_withLowValue() {
        let result = sut.makeFiveBand(value: 0.09)
        XCTAssertEqual(result.value, 1)
    }
    
    func test_makeSixBand_withLowValue() {
        let result = sut.makeSixBand(value: 0.09)
        XCTAssertEqual(result.value, 1)
    }
}

// MARK: High Value
extension ResistorFactoryTests {
    func test_makeFourBand_withHighValue() {
        let result = sut.makeFourBand(value: 100_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
    
    func test_makeFiveBand_withHighValue() {
        let result = sut.makeFiveBand(value: 1_000_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
    
    func test_makeSixBand_withHighValue() {
        let result = sut.makeSixBand(value: 1_000_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Too Precise Value
extension ResistorFactoryTests {
    func test_makeFourBand_withTooPreciseValueHigh() {
        let result = sut.makeFourBand(value: 47_500)
        XCTAssertEqual(result.value, 48_000)
    }
    
    func test_makeFourBand_withTooPreciseValueLow() {
        let result = sut.makeFourBand(value: 47_400)
        XCTAssertEqual(result.value, 47_000)
    }
    
    func test_makeFiveBand_withTooPreciseValueHigh() {
        let result = sut.makeFiveBand(value: 47_560)
        XCTAssertEqual(result.value, 47_600)
    }
    
    func test_makeFiveBand_withTooPreciseValueLow() {
        let result = sut.makeFiveBand(value: 47_540)
        XCTAssertEqual(result.value, 47_500)
    }
    
    func test_makeSixBand_withTooPreciseValueHigh() {
        let result = sut.makeSixBand(value: 47_560)
        XCTAssertEqual(result.value, 47_600)
    }
    
    func test_makeSixBand_withTooPreciseValueLow() {
        let result = sut.makeSixBand(value: 47_540)
        XCTAssertEqual(result.value, 47_500)
    }
}

// MARK:- Resistor Conversion



// MARK: Four Band
extension ResistorFactoryTests {
    func test_makeFourBandOrFail_fromFiveBand_valid_toleranceNil() throws {
        let resistor = Resistor.fiveBand(.brown, .grey, .black, .red, .blue)
        let result = try sut.makeFourBandOrFail(resistor: resistor)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .blue)
    }
    
    func test_makeFourBandOrFail_fromFiveBand_valid_toleranceNotNil() throws {
        let resistor = Resistor.fiveBand(.brown, .grey, .black, .red, .gold)
        let result = try sut.makeFourBandOrFail(resistor: resistor, tolerance: .green)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .green)
    }
    
    func test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .yellow, .red, .violet)
        XCTAssertThrowsError(try sut.makeFourBandOrFail(resistor: resistor))
    }
    
    func test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNotNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .yellow, .red, .violet)
        XCTAssertThrowsError(try sut.makeFourBandOrFail(resistor: resistor, tolerance: .brown))
    }
    
    func test_makeFourBandOrFail_fromSixBand_valid_toleranceNil() throws {
        let resistor = Resistor.sixBand(.brown, .grey, .black, .red, .gold, .orange)
        let result = try sut.makeFourBandOrFail(resistor: resistor)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .gold)
    }
    
    func test_makeFourBandOrFail_fromSixBand_valid_toleranceNotNil() throws {
        let resistor = Resistor.sixBand(.brown, .grey, .black, .red, .gold, .orange)
        let result = try sut.makeFourBandOrFail(resistor: resistor, tolerance: .red)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .red)
    }
    
    func test_makeFourBandOrFail_fromSixBand_invalid_toleranceNil() {
        let resistor = Resistor.sixBand(.brown, .grey, .yellow, .red, .violet, .violet)
        XCTAssertThrowsError(try sut.makeFourBandOrFail(resistor: resistor))
    }
    
    func test_makeFourBandOrFail_fromSixBand_invalid_toleranceNotNil() {
        let resistor = Resistor.sixBand(.brown, .grey, .yellow, .red, .violet, .blue)
        XCTAssertThrowsError(try sut.makeFourBandOrFail(resistor: resistor, tolerance: .brown))
    }
}

// MARK: Five Band
extension ResistorFactoryTests {
    func test_makeFiveBand_fromFourBand_toleranceNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .blue)
        let result = sut.makeFiveBand(resistor: resistor)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .blue)
    }
    
    func test_makeFiveBand_fromFourBand_toleranceNotNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .gold)
        let result = sut.makeFiveBand(resistor: resistor, tolerance: .green)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .green)
    }
    
    func test_makeFiveBand_fromSixBand_toleranceNil() {
        let resistor = Resistor.sixBand(.brown, .grey, .black, .red, .gold, .orange)
        let result = sut.makeFiveBand(resistor: resistor)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .gold)
    }
    
    func test_makeFiveBand_fromSixBand_toleranceNotNil() {
        let resistor = Resistor.sixBand(.brown, .grey, .black, .red, .gold, .orange)
        let result = sut.makeFiveBand(resistor: resistor, tolerance: .red)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .red)
    }
}

// MARK: Six Band
extension ResistorFactoryTests {
    func test_makeSixBand_fromFourBand_toleranceNil_coefficientNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .blue)
        let result = sut.makeSixBand(resistor: resistor)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .blue)
        XCTAssertEqual(result.coefficient!, .brown)
    }
    
    func test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .blue)
        let result = sut.makeSixBand(resistor: resistor, tolerance: .green)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .green)
        XCTAssertEqual(result.coefficient!, .brown)
    }
    
    func test_makeSixBand_fromFourBand_toleranceNil_coefficientNotNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .blue)
        let result = sut.makeSixBand(resistor: resistor, coefficient: .red)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .blue)
        XCTAssertEqual(result.coefficient, .red)
    }
    
    func test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNotNil() {
        let resistor = Resistor.fourBand(.brown, .grey, .orange, .blue)
        let result = sut.makeSixBand(resistor: resistor, tolerance: .green, coefficient: .yellow)
        XCTAssertEqual(result.value, 18_000)
        XCTAssertEqual(result.tolerance, .green)
        XCTAssertEqual(result.coefficient!, .yellow)
    }
    
    func test_makeSixBand_fromFiveBand_toleranceNil_coefficientNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .violet, .orange, .yellow)
        let result = sut.makeSixBand(resistor: resistor)
        XCTAssertEqual(result.value, 187_000)
        XCTAssertEqual(result.tolerance, .yellow)
        XCTAssertEqual(result.coefficient!, .brown)
    }
    
    func test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .violet, .orange, .yellow)
        let result = sut.makeSixBand(resistor: resistor, tolerance: .orange)
        XCTAssertEqual(result.value, 187_000)
        XCTAssertEqual(result.tolerance, .orange)
        XCTAssertEqual(result.coefficient!, .brown)
    }
    
    func test_makeSixBand_fromFiveBand_toleranceNil_coefficientNotNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .violet, .orange, .yellow)
        let result = sut.makeSixBand(resistor: resistor, coefficient: .violet)
        XCTAssertEqual(result.value, 187_000)
        XCTAssertEqual(result.tolerance, .yellow)
        XCTAssertEqual(result.coefficient!, .violet)
    }
    
    func test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNotNil() {
        let resistor = Resistor.fiveBand(.brown, .grey, .violet, .orange, .yellow)
        let result = sut.makeSixBand(resistor: resistor, tolerance: .green, coefficient: .blue)
        XCTAssertEqual(result.value, 187_000)
        XCTAssertEqual(result.tolerance, .green)
        XCTAssertEqual(result.coefficient!, .blue)
    }
    
    func test_convertSixBand_fromSixBand_toleranceNil_coefficientNil() {
        let resistor = Resistor.sixBand(.brown, .grey, .violet, .orange, .yellow, .yellow)
        let result = sut.makeSixBand(resistor: resistor)
        XCTAssertEqual(result.value, 187_000)
        XCTAssertEqual(result.tolerance, .yellow)
        XCTAssertEqual(result.coefficient!, .yellow)
    }
}

// MARK:- Internal
import XCTest
@testable import Resistance

final class ResistorFactoryTests: XCTestCase {
    var sut: ResistorFactory!
    
    override func setUp() {
        sut = ResistorFactory()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    static var allTests = [
        ("test_makeFourBandOrFail_withMinValue",      test_makeFourBandOrFail_withMinValue),
        ("test_makeFourBandOrFail_with1DigitValue",   test_makeFourBandOrFail_with1DigitValue),
        ("test_makeFourBandOrFail_with2DigitValue",   test_makeFourBandOrFail_with2DigitValue),
        ("test_makeFourBandOrFail_with3DigitValue",   test_makeFourBandOrFail_with3DigitValue),
        ("test_makeFourBandOrFail_with5DigitValue",   test_makeFourBandOrFail_with5DigitValue),
        ("test_makeFourBandOrFail_withMaxValue",      test_makeFourBandOrFail_withMaxValue),
        
        ("test_makeFourBandOrFail_withLowValue",      test_makeFourBandOrFail_withLowValue),
        ("test_makeFourBandOrFail_withHighValue",     test_makeFourBandOrFail_withHighValue),
        ("test_makeFourBandOrFail_withInvalidValue",  test_makeFourBandOrFail_withInvalidValue),
        
        ("test_makeFiveBandOrFail_withMinValue",      test_makeFiveBandOrFail_withMinValue),
        ("test_makeFiveBandOrFail_with1DigitValue",   test_makeFiveBandOrFail_with1DigitValue),
        ("test_makeFiveBandOrFail_with2DigitValue",   test_makeFiveBandOrFail_with2DigitValue),
        ("test_makeFiveBandOrFail_with3DigitValue",   test_makeFiveBandOrFail_with3DigitValue),
        ("test_makeFiveBandOrFail_with5DigitValue",   test_makeFiveBandOrFail_with5DigitValue),
        ("test_makeFiveBandOrFail_withMaxValue",      test_makeFiveBandOrFail_withMaxValue),
        
        ("test_makeFiveBandOrFail_withLowValue",      test_makeFiveBandOrFail_withLowValue),
        ("test_makeFiveBandOrFail_withHighValue",     test_makeFiveBandOrFail_withHighValue),
        ("test_makeFiveBandOrFail_withInvalidValue",  test_makeFiveBandOrFail_withInvalidValue),
        
        ("test_makeSixBandOrFail_withMinValue",       test_makeSixBandOrFail_withMinValue),
        ("test_makeSixBandOrFail_with1DigitValue",    test_makeSixBandOrFail_with1DigitValue),
        ("test_makeSixBandOrFail_with2DigitValue",    test_makeSixBandOrFail_with2DigitValue),
        ("test_makeSixBandOrFail_with3DigitValue",    test_makeSixBandOrFail_with3DigitValue),
        ("test_makeSixBandOrFail_with5DigitValue",    test_makeSixBandOrFail_with5DigitValue),
        ("test_makeSixBandOrFail_withMaxValue",       test_makeSixBandOrFail_withMaxValue),
        
        ("test_makeSixBandOrFail_withLowValue",       test_makeSixBandOrFail_withLowValue),
        ("test_makeSixBandOrFail_withHighValue",      test_makeSixBandOrFail_withHighValue),
        ("test_makeSixBandOrFail_withInvalidValue",   test_makeSixBandOrFail_withInvalidValue),
        
        ("test_makeFourBand_withOkValue",    test_makeFourBand_withOkValue),
        ("test_makeFiveBand_withOkValue",    test_makeFiveBand_withOkValue),
        ("test_makeSixBand_withOkValue",     test_makeSixBand_withOkValue),
        
        ("test_makeFourBand_withLowValue",   test_makeFourBand_withLowValue),
        ("test_makeFiveBand_withLowValue",   test_makeFiveBand_withLowValue),
        ("test_makeSixBand_withLowValue",    test_makeSixBand_withLowValue),
        
        ("test_makeFourBand_withHighValue",  test_makeFourBand_withHighValue),
        ("test_makeFiveBand_withHighValue",  test_makeFiveBand_withHighValue),
        ("test_makeSixBand_withHighValue",   test_makeSixBand_withHighValue),
        
        ("test_makeFourBand_withTooPreciseValueHigh",    test_makeFourBand_withTooPreciseValueHigh),
        ("test_makeFourBand_withTooPreciseValueLow",    test_makeFourBand_withTooPreciseValueLow),
        ("test_makeFiveBand_withTooPreciseValueHigh",    test_makeFiveBand_withTooPreciseValueHigh),
        ("test_makeFiveBand_withTooPreciseValueLow",    test_makeFiveBand_withTooPreciseValueLow),
        ("test_makeSixBand_withTooPreciseValueHigh",     test_makeSixBand_withTooPreciseValueHigh),
        ("test_makeSixBand_withTooPreciseValueLow",     test_makeSixBand_withTooPreciseValueLow),
        
        ("test_makeFourBandOrFail_fromFiveBand_valid_toleranceNil",        test_makeFourBandOrFail_fromFiveBand_valid_toleranceNil),
        ("test_makeFourBandOrFail_fromFiveBand_valid_toleranceNotNil",     test_makeFourBandOrFail_fromFiveBand_valid_toleranceNotNil),
        ("test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNil",      test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNil),
        ("test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNotNil",   test_makeFourBandOrFail_fromFiveBand_invalid_toleranceNotNil),
        ("test_makeFourBandOrFail_fromSixBand_valid_toleranceNil",         test_makeFourBandOrFail_fromSixBand_valid_toleranceNil),
        ("test_makeFourBandOrFail_fromSixBand_valid_toleranceNotNil",      test_makeFourBandOrFail_fromSixBand_valid_toleranceNotNil),
        ("test_makeFourBandOrFail_fromSixBand_invalid_toleranceNil",       test_makeFourBandOrFail_fromSixBand_invalid_toleranceNil),
        ("test_makeFourBandOrFail_fromSixBand_invalid_toleranceNotNil",    test_makeFourBandOrFail_fromSixBand_invalid_toleranceNotNil),
        
        ("test_makeFiveBand_fromFourBand_toleranceNil",    test_makeFiveBand_fromFourBand_toleranceNil),
        ("test_makeFiveBand_fromFourBand_toleranceNotNil", test_makeFiveBand_fromFourBand_toleranceNotNil),
        ("test_makeFiveBand_fromSixBand_toleranceNil",     test_makeFiveBand_fromSixBand_toleranceNil),
        ("test_makeFiveBand_fromSixBand_toleranceNotNil",   test_makeFiveBand_fromSixBand_toleranceNotNil),
        
        ("test_makeSixBand_fromFourBand_toleranceNil_coefficientNil",          test_makeSixBand_fromFourBand_toleranceNil_coefficientNil),
        ("test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNil",       test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNil),
        ("test_makeSixBand_fromFourBand_toleranceNil_coefficientNotNil",       test_makeSixBand_fromFourBand_toleranceNil_coefficientNotNil),
        ("test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNotNil",    test_makeSixBand_fromFourBand_toleranceNotNil_coefficientNotNil),
        ("test_makeSixBand_fromFiveBand_toleranceNil_coefficientNil",          test_makeSixBand_fromFiveBand_toleranceNil_coefficientNil),
        ("test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNil",       test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNil),
        ("test_makeSixBand_fromFiveBand_toleranceNil_coefficientNotNil",       test_makeSixBand_fromFiveBand_toleranceNil_coefficientNotNil),
        ("test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNotNil",    test_makeSixBand_fromFiveBand_toleranceNotNil_coefficientNotNil),
        ("test_convertSixBand_fromSixBand_toleranceNil_coefficientNil",             test_convertSixBand_fromSixBand_toleranceNil_coefficientNil),
    ]
}
