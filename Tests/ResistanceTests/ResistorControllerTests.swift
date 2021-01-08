// MARK: Resistor creation



// MARK: Valid Input
extension ResistorControllerTests {
    func testCreateFourBandOrFail_withValidInput() throws {
        var result: Resistor
        
        result = try sut.createFourBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
        
        result = try sut.createFourBandOrFail(from: 5)
        XCTAssertEqual(result.value, 5)
        
        result = try sut.createFourBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
        
        result = try sut.createFourBandOrFail(from: 540)
        XCTAssertEqual(result.value, 540)
        
        result = try sut.createFourBandOrFail(from: 37_000)
        XCTAssertEqual(result.value, 37_000)
        
        result = try sut.createFourBandOrFail(from: 99_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
    
    func testCreateFiveBandOrFail_withValidInput() throws {
        var result: Resistor
        
        result = try sut.createFiveBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
        
        result = try sut.createFourBandOrFail(from: 5)
        XCTAssertEqual(result.value, 5)
        
        result = try sut.createFiveBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
        
        result = try sut.createFiveBandOrFail(from: 545)
        XCTAssertEqual(result.value, 545)
        
        result = try sut.createFiveBandOrFail(from: 37_500)
        XCTAssertEqual(result.value, 37_500)
        
        result = try sut.createFiveBandOrFail(from: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)
    }
    
    func testCreateSixBandOrFail_withValidInput() throws {
        var result: Resistor
        
        result = try sut.createFiveBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
        
        result = try sut.createFiveBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
        
        result = try sut.createFiveBandOrFail(from: 545)
        XCTAssertEqual(result.value, 545)
        
        result = try sut.createFiveBandOrFail(from: 37_500)
        XCTAssertEqual(result.value, 37_500)
        
        result = try sut.createFiveBandOrFail(from: 999_000_000_000)
        XCTAssertEqual(result.value, 999_000_000_000)    }
}

// MARK: Invalid Input
extension ResistorControllerTests {
    func testCreateFourBandOrFail_withInvalidInput() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
        
        let highValue = 100_000_000_000.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
        
        let invalidValue = 234.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))
    }
        
    func testCreateFiveBandOrFail_withInvalidInput() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
        
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
        
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))
    }
    
    func testCreateSixBandOrFail_withInvalidInput() {
        let lowValue = 0.001
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: lowValue))
        
        let highValue = 999_000_000_001.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: highValue))
        
        let invalidValue = 2341.0
        XCTAssertThrowsError(try sut.createFourBandOrFail(from: invalidValue))    }
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
        ("testCreateFourBandOrFail_withValidInput", testCreateFourBandOrFail_withValidInput),
        ("testCreateFiveBandOrFail_withValidInput", testCreateFiveBandOrFail_withValidInput),
        ("testCreateSixBandOrFail_withValidInput", testCreateSixBandOrFail_withValidInput),
        
        ("testCreateFourBandOrFail_withInvalidInput", testCreateFourBandOrFail_withInvalidInput),
        ("testCreateFiveBandOrFail_withInvalidInput", testCreateFiveBandOrFail_withInvalidInput),
        ("testCreateSixBandOrFail_withInvalidInput", testCreateSixBandOrFail_withInvalidInput),
    ]
}
