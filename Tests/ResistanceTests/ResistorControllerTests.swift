// MARK: Four Band Failable Create



// MARK: Valid Input
extension ResistorControllerTests {
    func test_createFourBandOrFail_withMinValue() throws {
        let result = try sut.createFourBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
    }
    
    func test_createFourBandOrFail_with1DigitValue() throws {
        let result = try sut.createFourBandOrFail(from: 5)
        XCTAssertEqual(result.value, 5)
    }
    
    func test_createFourBandOrFail_with2DigitValue() throws {
        let result = try sut.createFourBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
    }
    
    func test_createFourBandOrFail_with3DigitValue() throws {
        let result = try sut.createFourBandOrFail(from: 540)
        XCTAssertEqual(result.value, 540)
    }
    
    func test_createFourBandOrFail_with5DigitValue() throws {
        let result = try sut.createFourBandOrFail(from: 37_000)
        XCTAssertEqual(result.value, 37_000)
    }
    
    func test_createFourBandOrFail_withMaxValue() throws {
        let result = try sut.createFourBandOrFail(from: 99_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorControllerTests {
    func test_createFourBandOrFail_withLowValue() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
    }
    
    func test_createFourBandOrFail_withHighValue() {
        let highValue = 100_000_000_000.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
    }
    
    func test_createFourBandOrFail_withInvalidValue() {
        let invalidValue = 234.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))
    }
}

// MARK:- Five Band Failable Create



// MARK: Valid Input
extension ResistorControllerTests {
    func test_createFiveBandOrFail_withMinValue() throws {
        let result = try sut.createFourBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
    }
    
    func test_createFiveBandOrFail_with1DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 3)
        XCTAssertEqual(result.value, 3)
    }
    
    func test_createFiveBandOrFail_with2DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 45)
        XCTAssertEqual(result.value, 45)
    }
    
    func test_createFiveBandOrFail_with3DigitValue() throws {
        let result = try sut.createFourBandOrFail(from: 540)
        XCTAssertEqual(result.value, 540)
    }
    
    func test_createFiveBandOrFail_with5DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 37_500)
        XCTAssertEqual(result.value, 37_500)
    }
    
    func test_createFiveBandOrFail_withMaxValue() throws {
        let result = try sut.createFiveBandOrFail(from: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorControllerTests {
    func test_createFiveBandOrFail_withLowValue() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
    }
    
    func test_createFiveBandOrFail_withHighValue() {
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
    }
    
    func test_createFiveBandOrFail_withInvalidValue() {
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))
    }
}

// MARK:- Six Band Failable Create



// MARK: Valid Input
extension ResistorControllerTests {
    func test_createSixBandOrFail_withMinValue() throws {
        let result = try sut.createFiveBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
    }
    
    func test_createSixBandOrFail_with1DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 5)
        XCTAssertEqual(result.value, 5)
    }
    
    func test_createSixBandOrFail_with2DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
    }
    
    func test_createSixBandOrFail_with3DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 545)
        XCTAssertEqual(result.value, 545)
    }
    
    func test_createSixBandOrFail_with5DigitValue() throws {
        let result = try sut.createFiveBandOrFail(from: 37_500)
        XCTAssertEqual(result.value, 37_500)
    }
    
    func test_createSixBandOrFail_withMaxValue() throws {
        let result = try sut.createFiveBandOrFail(from: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Invalid Input
extension ResistorControllerTests {
    func test_createSixBandOrFail_withLowValue() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
    }
    
    func test_createSixBandOrFail_withHighValue() {
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
    }
    
    func test_createSixBandOrFail_withInvalidValue() {
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))
    }
}

// MARK:- Nearest Resistor Creation



// MARK: OK Value
extension ResistorControllerTests {
    func test_createFourBandOrNearest_withOkValue() {
        let result = sut.createFourBandOrNearest(from: 470)
        XCTAssertEqual(result.value, 470)
    }
    
    func test_createFiveBandOrNearest_withOkValue() {
        let result = sut.createFiveBandOrNearest(from: 4720)
        XCTAssertEqual(result.value, 4720)
    }
    
    func test_createSixBandOrNearest_withOkValue() {
        let result = sut.createSixBandOrNearest(from: 4720)
        XCTAssertEqual(result.value, 4720)
    }
}

// MARK: Low Value
extension ResistorControllerTests {
    func test_createFourBandOrNearest_withLowValue() {
        let result = sut.createFourBandOrNearest(from: 0.009)
        XCTAssertEqual(result.value, 0.01)
    }
    
    func test_createFiveBandOrNearest_withLowValue() {
        let result = sut.createFiveBandOrNearest(from: 0.009)
        XCTAssertEqual(result.value, 0.01)
    }
    
    func test_createSixBandOrNearest_withLowValue() {
        let result = sut.createSixBandOrNearest(from: 0.009)
        XCTAssertEqual(result.value, 0.01)
    }
}

// MARK: High Value
extension ResistorControllerTests {
    func test_createFourBandOrNearest_withHighValue() {
        let result = sut.createFourBandOrNearest(from: 100_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
    
    func test_createFiveBandOrNearest_withHighValue() {
        let result = sut.createFiveBandOrNearest(from: 1_000_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
    
    func test_createSixBandOrNearest_withHighValue() {
        let result = sut.createSixBandOrNearest(from: 1_000_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
}

// MARK: Too Precise Value
extension ResistorControllerTests {
    func test_createFourBandOrNearest_withTooPreciseValueHigh() {
        let result = sut.createFourBandOrNearest(from: 47_500)
        XCTAssertEqual(result.value, 48_000)
    }
    
    func test_createFourBandOrNearest_withTooPreciseValueLow() {
        let result = sut.createFourBandOrNearest(from: 47_400)
        XCTAssertEqual(result.value, 47_000)
    }
    
    func test_createFiveBandOrNearest_withTooPreciseValueHigh() {
        let result = sut.createFiveBandOrNearest(from: 47_560)
        XCTAssertEqual(result.value, 47_600)
    }
    
    func test_createFiveBandOrNearest_withTooPreciseValueLow() {
        let result = sut.createFiveBandOrNearest(from: 47_540)
        XCTAssertEqual(result.value, 47_500)
    }
    
    func test_createSixBandOrNearest_withTooPreciseValueHigh() {
        let result = sut.createSixBandOrNearest(from: 47_560)
        XCTAssertEqual(result.value, 47_600)
    }
    
    func test_createSixBandOrNearest_withTooPreciseValueLow() {
        let result = sut.createSixBandOrNearest(from: 47_540)
        XCTAssertEqual(result.value, 47_500)
    }
}

// MARK:- Internal
import XCTest
@testable import Resistance

final class ResistorControllerTests: XCTestCase {
    var sut: ResistorController!
    
    override func setUp() {
        sut = ResistorController()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    static var allTests = [
        ("test_createFourBandOrFail_withMinValue",      test_createFourBandOrFail_withMinValue),
        ("test_createFourBandOrFail_with1DigitValue",   test_createFourBandOrFail_with1DigitValue),
        ("test_createFourBandOrFail_with2DigitValue",   test_createFourBandOrFail_with2DigitValue),
        ("test_createFourBandOrFail_with3DigitValue",   test_createFourBandOrFail_with3DigitValue),
        ("test_createFourBandOrFail_with5DigitValue",   test_createFourBandOrFail_with5DigitValue),
        ("test_createFourBandOrFail_withMaxValue",      test_createFourBandOrFail_withMaxValue),
        
        ("test_createFourBandOrFail_withLowValue",      test_createFourBandOrFail_withLowValue),
        ("test_createFourBandOrFail_withHighValue",     test_createFourBandOrFail_withHighValue),
        ("test_createFourBandOrFail_withInvalidValue",  test_createFourBandOrFail_withInvalidValue),
        
        ("test_createFiveBandOrFail_withMinValue",      test_createFiveBandOrFail_withMinValue),
        ("test_createFiveBandOrFail_with1DigitValue",   test_createFiveBandOrFail_with1DigitValue),
        ("test_createFiveBandOrFail_with2DigitValue",   test_createFiveBandOrFail_with2DigitValue),
        ("test_createFiveBandOrFail_with3DigitValue",   test_createFiveBandOrFail_with3DigitValue),
        ("test_createFiveBandOrFail_with5DigitValue",   test_createFiveBandOrFail_with5DigitValue),
        ("test_createFiveBandOrFail_withMaxValue",      test_createFiveBandOrFail_withMaxValue),
        
        ("test_createFiveBandOrFail_withLowValue",      test_createFiveBandOrFail_withLowValue),
        ("test_createFiveBandOrFail_withHighValue",     test_createFiveBandOrFail_withHighValue),
        ("test_createFiveBandOrFail_withInvalidValue",  test_createFiveBandOrFail_withInvalidValue),
        
        ("test_createSixBandOrFail_withMinValue",       test_createSixBandOrFail_withMinValue),
        ("test_createSixBandOrFail_with1DigitValue",    test_createSixBandOrFail_with1DigitValue),
        ("test_createSixBandOrFail_with2DigitValue",    test_createSixBandOrFail_with2DigitValue),
        ("test_createSixBandOrFail_with3DigitValue",    test_createSixBandOrFail_with3DigitValue),
        ("test_createSixBandOrFail_with5DigitValue",    test_createSixBandOrFail_with5DigitValue),
        ("test_createSixBandOrFail_withMaxValue",       test_createSixBandOrFail_withMaxValue),
        
        ("test_createSixBandOrFail_withLowValue",       test_createSixBandOrFail_withLowValue),
        ("test_createSixBandOrFail_withHighValue",      test_createSixBandOrFail_withHighValue),
        ("test_createSixBandOrFail_withInvalidValue",   test_createSixBandOrFail_withInvalidValue),
        
        ("test_createFourBandOrNearest_withOkValue",    test_createFourBandOrNearest_withOkValue),
        ("test_createFiveBandOrNearest_withOkValue",    test_createFiveBandOrNearest_withOkValue),
        ("test_createSixBandOrNearest_withOkValue",     test_createSixBandOrNearest_withOkValue),
        
        ("test_createFourBandOrNearest_withLowValue",   test_createFourBandOrNearest_withLowValue),
        ("test_createFiveBandOrNearest_withLowValue",   test_createFiveBandOrNearest_withLowValue),
        ("test_createSixBandOrNearest_withLowValue",    test_createSixBandOrNearest_withLowValue),
        
        ("test_createFourBandOrNearest_withHighValue",  test_createFourBandOrNearest_withHighValue),
        ("test_createFiveBandOrNearest_withHighValue",  test_createFiveBandOrNearest_withHighValue),
        ("test_createSixBandOrNearest_withHighValue",   test_createSixBandOrNearest_withHighValue),
        
        ("test_createFourBandOrNearest_withTooPreciseValueHigh",    test_createFourBandOrNearest_withTooPreciseValueHigh),
        ("test_createFourBandOrNearest_withTooPreciseValueLow",    test_createFourBandOrNearest_withTooPreciseValueLow),
        ("test_createFiveBandOrNearest_withTooPreciseValueHigh",    test_createFiveBandOrNearest_withTooPreciseValueHigh),
        ("test_createFiveBandOrNearest_withTooPreciseValueLow",    test_createFiveBandOrNearest_withTooPreciseValueLow),
        ("test_createSixBandOrNearest_withTooPreciseValueHigh",     test_createSixBandOrNearest_withTooPreciseValueHigh),
        ("test_createSixBandOrNearest_withTooPreciseValueLow",     test_createSixBandOrNearest_withTooPreciseValueLow),
    ]
}
