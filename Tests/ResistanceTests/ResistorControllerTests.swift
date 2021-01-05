
extension ResistorControllerTests {
    func testCreateFourBandOrFail_withValidInput() throws {
        var result: Resistor
        
        result = try sut.createFourBandOrFail(from: 0.01)
        XCTAssertEqual(result.value, 0.01)
        
        result = try sut.createFourBandOrFail(from: 23)
        XCTAssertEqual(result.value, 23)
        
        result = try sut.createFourBandOrFail(from: 540)
        XCTAssertEqual(result.value, 540)
        
        result = try sut.createFourBandOrFail(from: 37_000)
        XCTAssertEqual(result.value, 37_000)
        
        result = try sut.createFourBandOrFail(from: 99_000_000_000)
        XCTAssertEqual(result.value, 99_000_000_000)
    }
    
    func testCreateFourBandOrFail_withInvalidInput() {
        
    }
    
    func testCreateFiveBandOrFail_withValidInput() {
        
    }
    
    func testCreateFiveBandOrFail_withInvalidInput() {
        
    }
    
    func testCreateSixBandOrFail_withValidInput() {
        
    }
    
    func testCreateSixBandOrFail_withInvalidInput() {
        
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
        ("testCreateFourBandOrFail_withValidInput", testCreateFourBandOrFail_withValidInput),
        ("testCreateFourBandOrFail_withInvalidInput", testCreateFourBandOrFail_withInvalidInput),
        ("testCreateFiveBandOrFail_withValidInput", testCreateFiveBandOrFail_withValidInput),
        ("testCreateFiveBandOrFail_withInvalidInput", testCreateFiveBandOrFail_withInvalidInput),
        ("testCreateSixBandOrFail_withValidInput", testCreateSixBandOrFail_withValidInput),
        ("testCreateSixBandOrFail_withInvalidInput", testCreateSixBandOrFail_withInvalidInput),
    ]
}
