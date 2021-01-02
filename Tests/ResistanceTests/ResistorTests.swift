import XCTest
@testable import Resistance

final class ResistorTests: XCTestCase {
    
    func testFourBandResistorValue() {
        var resistor: Resistor
        
        resistor = .fourBand(.black, .blue, .silver, .gold)
        XCTAssertEqual(resistor.value, 0.06)
        
        resistor = .fourBand(.red, .blue, .gold, .silver)
        XCTAssertEqual(resistor.value, 2.6)
        
        resistor = .fourBand(.green, .orange, .brown, .blue)
        XCTAssertEqual(resistor.value, 530)
        
        resistor = .fourBand(.brown, .yellow, .red, .brown)
        XCTAssertEqual(resistor.value, 1400)
        
        resistor = .fourBand(.violet, .yellow, .green, .green)
        XCTAssertEqual(resistor.value, 7_400_000)
    }
    
    func testFourBandResistorDescription() {
        var resistor: Resistor
        
        resistor = .fourBand(.black, .green, .silver, .grey)
        XCTAssertEqual(resistor.description, "0.05 Ω")
        
        resistor = .fourBand(.green, .blue, .gold, .violet)
        XCTAssertEqual(resistor.description, "5.6 Ω")
        
        resistor = .fourBand(.blue, .grey, .brown, .red)
        XCTAssertEqual(resistor.description, "680 Ω")
        
        resistor = .fourBand(.yellow, .violet, .red, .silver)
        XCTAssertEqual(resistor.description, "4.7 KΩ")
        
        resistor = .fourBand(.orange, .white, .yellow, .yellow)
        XCTAssertEqual(resistor.description, "390 KΩ")
        
        resistor = .fourBand(.orange, .black, .green, .brown)
        XCTAssertEqual(resistor.description, "3 MΩ")
        
        resistor = .fourBand(.yellow, .black, .blue, .green)
        XCTAssertEqual(resistor.description, "40 MΩ")
        
        resistor = .fourBand(.red, .yellow, .grey, .blue)
        XCTAssertEqual(resistor.description, "2.4 GΩ")
        
        resistor = .fourBand(.violet, .black, .white, .orange)
        XCTAssertEqual(resistor.description, "70 GΩ")
    }
    
    func testFiveBandResistorValue() {
        var resistor: Resistor
        
        resistor = .fiveBand(.black, .brown, .brown, .silver, .silver)
        XCTAssertEqual(resistor.value, 0.11)
        
        resistor = .fiveBand(.orange, .yellow, .red, .gold, .gold)
        XCTAssertEqual(resistor.value, 34.2)
        
        resistor = .fiveBand(.violet, .green, .white, .brown, .yellow)
        XCTAssertEqual(resistor.value, 7590)
        
        resistor = .fiveBand(.yellow, .orange, .grey, .red, .silver)
        XCTAssertEqual(resistor.value, 43_800)
        
        resistor = .fiveBand(.orange, .black, .black, .orange, .blue)
        XCTAssertEqual(resistor.value, 300_000)
        
        resistor = .fiveBand(.red, .blue, .violet, .yellow, .orange)
        XCTAssertEqual(resistor.value, 2_670_000)
        
        resistor = .fiveBand(.orange, .green, .black, .blue, .violet)
        XCTAssertEqual(resistor.value, 350_000_000)
        
        resistor = .fiveBand(.blue, .violet, .black, .grey, .grey)
        XCTAssertEqual(resistor.value, 67_000_000_000)
    }
    
    func testFiveBandResistorDescripton() {
        var resistor: Resistor
        
        resistor = .fiveBand(.black, .brown, .brown, .silver, .silver)
        XCTAssertEqual(resistor.description, "0.11 Ω")
        
        resistor = .fiveBand(.orange, .yellow, .red, .gold, .gold)
        XCTAssertEqual(resistor.description, "34.2 Ω")
        
        resistor = .fiveBand(.violet, .green, .white, .brown, .yellow)
        XCTAssertEqual(resistor.description, "7.59 KΩ")
        
        resistor = .fiveBand(.yellow, .orange, .grey, .red, .silver)
        XCTAssertEqual(resistor.description, "43.8 KΩ")
        
        resistor = .fiveBand(.orange, .black, .black, .orange, .blue)
        XCTAssertEqual(resistor.description, "300 KΩ")
        
        resistor = .fiveBand(.red, .blue, .violet, .yellow, .orange)
        XCTAssertEqual(resistor.description, "2.67 MΩ")
        
        resistor = .fiveBand(.orange, .green, .black, .blue, .violet)
        XCTAssertEqual(resistor.description, "350 MΩ")
        
        resistor = .fiveBand(.blue, .violet, .black, .grey, .grey)
        XCTAssertEqual(resistor.description, "67 GΩ")
    }

    static var allTests = [
        ("testFourBandResistorValue", testFourBandResistorValue),
        ("testFourBandResistorDescription", testFourBandResistorDescription),
        ("testFiveBandResistorValue", testFiveBandResistorValue),
        ("testFiveBandResistorDescripton", testFiveBandResistorDescripton),
    ]
}
