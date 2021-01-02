import XCTest
@testable import Resistance

final class ResistanceTests: XCTestCase {
    
    func testFourBandResistorValue() {
        let resistor = Resistor.fourBand(.brown, .yellow, .red, .gold)
        XCTAssertEqual(resistor.value, 1400)
    }
    
    func testFourBandResistorDescription() {
        var resistor: Resistor
        
        resistor = .fourBand(.black, .green, .silver, .gold)
        XCTAssertEqual(resistor.description, "0.05 Ω")
        
        resistor = .fourBand(.green, .blue, .gold, .gold)
        XCTAssertEqual(resistor.description, "5.6 Ω")
        
        resistor = .fourBand(.blue, .grey, .brown, .gold)
        XCTAssertEqual(resistor.description, "680 Ω")
        
        resistor = .fourBand(.yellow, .violet, .red, .gold)
        XCTAssertEqual(resistor.description, "4.7 KΩ")
        
        resistor = .fourBand(.orange, .white, .yellow, .gold)
        XCTAssertEqual(resistor.description, "390 KΩ")
        
        resistor = .fourBand(.orange, .black, .green, .gold)
        XCTAssertEqual(resistor.description, "3 MΩ")
        
        resistor = .fourBand(.yellow, .black, .blue, .gold)
        XCTAssertEqual(resistor.description, "40 MΩ")
        
        resistor = .fourBand(.red, .yellow, .grey, .gold)
        XCTAssertEqual(resistor.description, "2.4 GΩ")
        
        resistor = .fourBand(.violet, .black, .white, .gold)
        XCTAssertEqual(resistor.description, "70 GΩ")
    }

//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
