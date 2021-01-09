// MARK: Resistor Value



// MARK: Four Band
extension ResistorTests {
    func test_fourBand_value_withLessThanZero() {
        let resistor = Resistor.fourBand(.black, .blue, .silver, .gold)
        XCTAssertEqual(resistor.value, 0.06)
    }
    
    func test_fourBand_value_with1DigitFractional() {
        let resistor = Resistor.fourBand(.red, .blue, .gold, .silver)
        XCTAssertEqual(resistor.value, 2.6)
    }
    
    func test_fourBand_value_with3Digits() {
        let resistor = Resistor.fourBand(.green, .orange, .brown, .blue)
        XCTAssertEqual(resistor.value, 530)
    }
    
    func test_fourBand_value_with4Digits() {
        let resistor = Resistor.fourBand(.brown, .yellow, .red, .brown)
        XCTAssertEqual(resistor.value, 1400)
    }
    
    func test_fourBand_value_with7Digits() {
        let resistor = Resistor.fourBand(.violet, .yellow, .green, .green)
        XCTAssertEqual(resistor.value, 7_400_000)
    }
}

// MARK: Five Band
extension ResistorTests {
    func test_fiveBand_value_withLessThanZero() {
        let resistor = Resistor.fiveBand(.black, .brown, .brown, .silver, .silver)
        XCTAssertEqual(resistor.value, 0.11)
    }
    
    func test_fiveBand_value_withFractional() {
        let resistor = Resistor.fiveBand(.orange, .yellow, .red, .gold, .gold)
        XCTAssertEqual(resistor.value, 34.2)
    }
    
    func test_fiveBand_value_with4Digits() {
        let resistor = Resistor.fiveBand(.violet, .green, .white, .brown, .yellow)
        XCTAssertEqual(resistor.value, 7590)
    }
    
    func test_fiveBand_value_with5Digits() {
        let resistor = Resistor.fiveBand(.yellow, .orange, .grey, .red, .silver)
        XCTAssertEqual(resistor.value, 43_800)
    }
    
    func test_fiveBand_value_with6Digits() {
        let resistor = Resistor.fiveBand(.orange, .black, .black, .orange, .blue)
        XCTAssertEqual(resistor.value, 300_000)
    }
    
    func test_fiveBand_value_with7Digits() {
        let resistor = Resistor.fiveBand(.red, .blue, .violet, .yellow, .orange)
        XCTAssertEqual(resistor.value, 2_670_000)
    }
    
    func test_fiveBand_value_with9Digits() {
        let resistor = Resistor.fiveBand(.orange, .green, .black, .blue, .violet)
        XCTAssertEqual(resistor.value, 350_000_000)
    }
    
    func test_fiveBand_value_with11Digits() {
        let resistor = Resistor.fiveBand(.blue, .violet, .black, .grey, .grey)
        XCTAssertEqual(resistor.value, 67_000_000_000)
    }
}

// MARK: Six Band
extension ResistorTests {
    func test_sixBand_value_withLessThanZero() {
        let resistor = Resistor.sixBand(.black, .brown, .brown, .silver, .silver, .blue)
        XCTAssertEqual(resistor.value, 0.11)
    }
    
    func test_sixBand_value_withFractional() {
        let resistor = Resistor.sixBand(.orange, .yellow, .red, .gold, .gold, .brown)
        XCTAssertEqual(resistor.value, 34.2)
    }
    
    func test_sixBand_value_with4Digits() {
        let resistor = Resistor.sixBand(.violet, .green, .white, .brown, .yellow, .orange)
        XCTAssertEqual(resistor.value, 7590)
    }
    
    func test_sixBand_value_with5Digits() {
        let resistor = Resistor.sixBand(.yellow, .orange, .grey, .red, .silver, .red)
        XCTAssertEqual(resistor.value, 43_800)
    }
    
    func test_sixBand_value_with6Digits() {
        let resistor = Resistor.sixBand(.orange, .black, .black, .orange, .blue, .violet)
        XCTAssertEqual(resistor.value, 300_000)
    }
    
    func test_sixBand_value_with7Digits() {
        let resistor = Resistor.sixBand(.red, .blue, .violet, .yellow, .orange, .yellow)
        XCTAssertEqual(resistor.value, 2_670_000)
    }
    
    func test_sixBand_value_with9Digits() {
        let resistor = Resistor.sixBand(.orange, .green, .black, .blue, .violet, .blue)
        XCTAssertEqual(resistor.value, 350_000_000)
    }
    
    func test_sixBand_value_with11Digits() {
        let resistor = Resistor.sixBand(.blue, .violet, .black, .grey, .grey, .brown)
        XCTAssertEqual(resistor.value, 67_000_000_000)
    }
}

// MARK:- Resistor String
extension ResistorTests {
    func test_fourBand_description_withLessThanZero() {
        let resistor = Resistor.fourBand(.black, .green, .silver, .grey)
        XCTAssertEqual(String(describing: resistor), "0.05 Ω")
    }
    
    func test_fourBand_description_withFractional() {
        let resistor = Resistor.fourBand(.green, .blue, .gold, .violet)
        XCTAssertEqual(String(describing: resistor), "5.6 Ω")
    }
    
    func test_fourBand_description_withKiloFractional() {
        let resistor = Resistor.fourBand(.yellow, .violet, .red, .silver)
        XCTAssertEqual(String(describing: resistor), "4.7 KΩ")
    }
    
    func test_fourBand_description_withKilo3Digits() {
        let resistor = Resistor.fourBand(.orange, .white, .yellow, .yellow)
        XCTAssertEqual(String(describing: resistor), "390 KΩ")
    }
    
    func test_fourBand_description_withMegaFractional() {
        let resistor = Resistor.fourBand(.orange, .yellow, .green, .brown)
        XCTAssertEqual(String(describing: resistor), "3.4 MΩ")
    }
    
    func test_fourBand_description_withMega2Digits() {
        let resistor = Resistor.fourBand(.yellow, .black, .blue, .green)
        XCTAssertEqual(String(describing: resistor), "40 MΩ")
    }
    
    func test_fourBand_description_withGiga2Digits() {
        let resistor = Resistor.fourBand(.violet, .black, .white, .orange)
        XCTAssertEqual(String(describing: resistor), "70 GΩ")
    }
}

// MARK: Five Band
extension ResistorTests {
    func test_fiveBand_description_withLessThanZero() {
        let resistor = Resistor.fiveBand(.black, .brown, .brown, .silver, .silver)
        XCTAssertEqual(String(describing: resistor), "0.11 Ω")
    }
    
    func test_fiveBand_description_withFractional() {
        let resistor = Resistor.fiveBand(.orange, .yellow, .red, .gold, .gold)
        XCTAssertEqual(String(describing: resistor), "34.2 Ω")
    }
    
    func test_fiveBand_description_withKiloFractional() {
        let resistor = Resistor.fiveBand(.yellow, .orange, .grey, .red, .silver)
        XCTAssertEqual(String(describing: resistor), "43.8 KΩ")
    }
    
    func test_fiveBand_description_withKilo3Digits() {
        let resistor = Resistor.fiveBand(.orange, .black, .black, .orange, .blue)
        XCTAssertEqual(String(describing: resistor), "300 KΩ")
    }
    
    func test_fiveBand_description_withMegaFractional() {
        let resistor = Resistor.fiveBand(.red, .blue, .violet, .yellow, .orange)
        XCTAssertEqual(String(describing: resistor), "2.67 MΩ")
    }
    
    func test_fiveBand_description_withMega3Digits() {
        let resistor = Resistor.fiveBand(.orange, .green, .black, .blue, .violet)
        XCTAssertEqual(String(describing: resistor), "350 MΩ")
    }
    
    func test_fiveBand_description_withGiga2Digits() {
        let resistor = Resistor.fiveBand(.blue, .violet, .black, .grey, .grey)
        XCTAssertEqual(String(describing: resistor), "67 GΩ")
    }
}

// MARK: Six Band
extension ResistorTests {
    func test_sixBand_description_withLessThanZero() {
        let resistor = Resistor.sixBand(.black, .brown, .brown, .silver, .silver, .blue)
        XCTAssertEqual(String(describing: resistor), "0.11 Ω")
    }
    
    func test_sixBand_description_withFractional() {
        let resistor = Resistor.sixBand(.orange, .yellow, .red, .gold, .gold, .brown)
        XCTAssertEqual(String(describing: resistor), "34.2 Ω")
    }
    
    func test_sixBand_description_withKiloFractional() {
        let resistor = Resistor.sixBand(.yellow, .orange, .grey, .red, .silver, .orange)
        XCTAssertEqual(String(describing: resistor), "43.8 KΩ")
    }
    
    func test_sixBand_description_withKilo3Digits() {
        let resistor = Resistor.sixBand(.orange, .black, .black, .orange, .blue, .red)
        XCTAssertEqual(String(describing: resistor), "300 KΩ")
    }
    
    func test_sixBand_description_withMegaFractional() {
        let resistor = Resistor.sixBand(.red, .blue, .violet, .yellow, .orange, .violet)
        XCTAssertEqual(String(describing: resistor), "2.67 MΩ")
    }
    
    func test_sixBand_description_withMega3Digits() {
        let resistor = Resistor.sixBand(.orange, .green, .black, .blue, .violet, .yellow)
        XCTAssertEqual(String(describing: resistor), "350 MΩ")
    }
    
    func test_sixBand_description_withGiga2Digits() {
        let resistor = Resistor.sixBand(.blue, .violet, .black, .grey, .grey, .blue)
        XCTAssertEqual(String(describing: resistor), "67 GΩ")
    }
}

// MARK:- Internal
import XCTest
@testable import Resistance

final class ResistorTests: XCTestCase {
    
    static var allTests = [
        ("test_fourBand_value_withLessThanZero",        test_fourBand_value_withLessThanZero),
        ("test_fourBand_value_with1DigitFractional",    test_fourBand_value_with1DigitFractional),
        ("test_fourBand_value_with3Digits",             test_fourBand_value_with3Digits),
        ("test_fourBand_value_with4Digits",             test_fourBand_value_with4Digits),
        ("test_fourBand_value_with7Digits",             test_fourBand_value_with7Digits),
        
        ("test_fiveBand_value_withLessThanZero",    test_fiveBand_value_withLessThanZero),
        ("test_fiveBand_value_withFractional",      test_fiveBand_value_withFractional),
        ("test_fiveBand_value_with4Digits",         test_fiveBand_value_with4Digits),
        ("test_fiveBand_value_with5Digits",         test_fiveBand_value_with5Digits),
        ("test_fiveBand_value_with6Digits",         test_fiveBand_value_with6Digits),
        ("test_fiveBand_value_with7Digits",         test_fiveBand_value_with7Digits),
        ("test_fiveBand_value_with9Digits",         test_fiveBand_value_with9Digits),
        ("test_fiveBand_value_with11Digits",        test_fiveBand_value_with11Digits),
        
        ("test_sixBand_value_withLessThanZero", test_sixBand_value_withLessThanZero),
        ("test_sixBand_value_withFractional",   test_sixBand_value_withFractional),
        ("test_sixBand_value_with4Digits",      test_sixBand_value_with4Digits),
        ("test_sixBand_value_with5Digits",      test_sixBand_value_with5Digits),
        ("test_sixBand_value_with6Digits",      test_sixBand_value_with6Digits),
        ("test_sixBand_value_with7Digits",      test_sixBand_value_with7Digits),
        ("test_sixBand_value_with9Digits",      test_sixBand_value_with9Digits),
        ("test_sixBand_value_with9Digits",      test_sixBand_value_with9Digits),
        
        ("test_fourBand_description_withLessThanZero",      test_fourBand_description_withLessThanZero),
        ("test_fourBand_description_withFractional",        test_fourBand_description_withFractional),
        ("test_fourBand_description_withKiloFractional",    test_fourBand_description_withKiloFractional),
        ("test_fourBand_description_withKilo3Digits",       test_fourBand_description_withKilo3Digits),
        ("test_fourBand_description_withMegaFractional",    test_fourBand_description_withMegaFractional),
        ("test_fourBand_description_withMega2Digits",       test_fourBand_description_withMega2Digits),
        ("test_fourBand_description_withGiga2Digits",       test_fourBand_description_withGiga2Digits),
        
        ("test_fiveBand_description_withLessThanZero",      test_fiveBand_description_withLessThanZero),
        ("test_fiveBand_description_withFractional",        test_fiveBand_description_withFractional),
        ("test_fiveBand_description_withKiloFractional",    test_fiveBand_description_withKiloFractional),
        ("test_fiveBand_description_withKilo3Digits",       test_fiveBand_description_withKilo3Digits),
        ("test_fiveBand_description_withMegaFractional",    test_fiveBand_description_withMegaFractional),
        ("test_fiveBand_description_withMega3Digits",       test_fiveBand_description_withMega3Digits),
        ("test_fiveBand_description_withGiga2Digits",       test_fiveBand_description_withGiga2Digits),
        
        ("test_sixBand_description_withLessThanZero",   test_sixBand_description_withLessThanZero),
        ("test_sixBand_description_withFractional",     test_sixBand_description_withFractional),
        ("test_sixBand_description_withKiloFractional", test_sixBand_description_withKiloFractional),
        ("test_sixBand_description_withKilo3Digits",    test_sixBand_description_withKilo3Digits),
        ("test_sixBand_description_withMegaFractional", test_sixBand_description_withMegaFractional),
        ("test_sixBand_description_withMega3Digits",    test_sixBand_description_withMega3Digits),
        ("test_sixBand_description_withGiga2Digits",    test_sixBand_description_withGiga2Digits),
    ]
}
