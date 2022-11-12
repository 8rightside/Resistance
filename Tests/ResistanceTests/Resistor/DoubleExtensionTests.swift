/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

// MARK: Sig Figs Count
extension DoubleExtensionTests {
    func test_sigFigsCount_decimalWith3SigFig() {
        let result = 4.23.sigFigsCount
        XCTAssertEqual(result, 3)
    }
    
    func test_sigFigsCount_with1SigFig() {
        let result = 400.0.sigFigsCount
        XCTAssertEqual(result, 1)
    }
    
    func test_sigFigsCount_with2SigFig() {
        let result = 46_000.0.sigFigsCount
        XCTAssertEqual(result, 2)    }
    
    func test_sigFigsCount_with3SigFig() {
        let result = 432.0.sigFigsCount
        XCTAssertEqual(result, 3)    }
    
    func test_sigFigsCount_with4SigFig() {
        let result = 7071.0.sigFigsCount
        XCTAssertEqual(result, 4)    }
    
    func test_sigFigsCount_with5SigFig() {
        let result = 40_001.0.sigFigsCount
        XCTAssertEqual(result, 5)
    }
    
    func test_sigFigsCount_with6SigFig() {
        let result = 40_0001.0.sigFigsCount
        XCTAssertEqual(result, 6)
    }
    
    func test_sigFigsCount_with7SigFig() {
        let result = 47_856_010.0.sigFigsCount
        XCTAssertEqual(result, 7)
    }
}

// MARK: - Sig Figs
extension DoubleExtensionTests {
    func test_sigFigs_1Digit() {
        let value: Double = 4
        XCTAssertEqual(value.sigFigs, 4.0)
    }
    
    func test_sigFigs_5Digits() {
        let value: Double = 12345
        XCTAssertEqual(value.sigFigs, 1.2345)
    }
    
    func test_sigFigs_5DigitsWithTrailingZeros() {
        let value: Double = 54000
        XCTAssertEqual(value.sigFigs, 5.4)
    }
    
    func test_sigFigs_5DigitsWithMidZeros() {
        let value: Double = 44002
        XCTAssertEqual(value.sigFigs, 4.4002)
    }
    
    func test_sigFigs_DecimalNumber() {
        let value: Double = 45.35
        XCTAssertEqual(value.sigFigs, 4.535)
    }
    
    func test_sigFigs_DecimalNumberMidZeros() {
        let value: Double = 602.303
        XCTAssertEqual(value.sigFigs, 6.02303)
    }
}

// MARK: - Power Of Ten
extension DoubleExtensionTests {
    func test_powerOfTen_1Digit() {
        let value: Double = 4
        XCTAssertEqual(value.powerOfTen, 0)
    }
    
    func test_powerOfTen_5Digits() {
        let value: Double = 65485
        XCTAssertEqual(value.powerOfTen, 4)
    }
    
    func test_powerOfTen_Fractional() {
        let value: Double = 0.03
        XCTAssertEqual(value.powerOfTen, -2)
    }
    
    func test_powerOfTen_DecimalNumber() {
        let value: Double = 453.1
        XCTAssertEqual(value.powerOfTen, 2)
    }
}

// MARK: - Hundreds Decade
extension DoubleExtensionTests {
    func test_hundredsDecade_1Digit() {
        let value: Double = 4
        XCTAssertEqual(value.hundredsDecade, 400)
    }
    
    func test_hundredsDecade_3Digits() {
        let value: Double = 423
        XCTAssertEqual(value.hundredsDecade, 423)
    }
    
    func test_hundredsDecade_5Digits() {
        let value: Double = 44560
        XCTAssertEqual(value.hundredsDecade, 446)
    }
    
    func test_hundredsDecade_Fractional() {
        let value: Double = 0.52
        XCTAssertEqual(value.hundredsDecade, 520)
    }
    
    func test_hundredsDecade_DecimalNumber() {
        let value: Double = 4.56
        XCTAssertEqual(value.hundredsDecade, 456)
    }
}

// MARK: - Sig Figs Rounded
extension DoubleExtensionTests {
    func test_sigFigsRounded_by1_5Digits() {
        let value1: Double = 12457
        let value2: Double = 15234
        XCTAssertEqual(value1.sigFigsRounded(by: 1), 10000)
        XCTAssertEqual(value2.sigFigsRounded(by: 1), 20000)
    }
    
    func test_sigFigsRounded_by2_5Digits() {
        let value1: Double = 12457
        let value2: Double = 15234
        XCTAssertEqual(value1.sigFigsRounded(by: 2), 12000)
        XCTAssertEqual(value2.sigFigsRounded(by: 2), 15000)
    }
    
    func test_sigFigsRounded_by3_5Digits() {
        let value1: Double = 12457
        let value2: Double = 15234
        XCTAssertEqual(value1.sigFigsRounded(by: 3), 12500)
        XCTAssertEqual(value2.sigFigsRounded(by: 3), 15200)
    }
    
    func test_sigFigsRounded_by2_5DigitDecimal() {
        let value1: Double = 124.57
        let value2: Double = 152.34
        XCTAssertEqual(value1.sigFigsRounded(by: 2), 120)
        XCTAssertEqual(value2.sigFigsRounded(by: 2), 150)
    }
    
    func test_sigFigsRounded_by2_Fractional() {
        let value1: Double = 0.2457
        let value2: Double = 0.5234
        XCTAssertEqual(value1.sigFigsRounded(by: 2), 0.25)
        XCTAssertEqual(value2.sigFigsRounded(by: 2), 0.52)
    }
}

// MARK: - Internal
import XCTest
@testable import Resistance

final class DoubleExtensionTests: XCTestCase {
    
    static var allTests = [
        ("test_sigFigsCount_with1SigFig", test_sigFigsCount_with1SigFig),
        ("test_sigFigsCount_with2SigFig", test_sigFigsCount_with2SigFig),
        ("test_sigFigsCount_with3SigFig", test_sigFigsCount_with3SigFig),
        ("test_sigFigsCount_with4SigFig", test_sigFigsCount_with4SigFig),
        ("test_sigFigsCount_with5SigFig", test_sigFigsCount_with5SigFig),
        ("test_sigFigsCount_with6SigFig", test_sigFigsCount_with6SigFig),
        ("test_sigFigsCount_with7SigFig", test_sigFigsCount_with7SigFig),
        
        ("test_sigFigs_1Digit",                     test_sigFigs_1Digit),
        ("test_sigFigs_5Digits",                    test_sigFigs_5Digits),
        ("test_sigFigs_5DigitsWithTrailingZeros",   test_sigFigs_5DigitsWithTrailingZeros),
        ("test_sigFigs_5DigitsWithMidZeros",        test_sigFigs_5DigitsWithMidZeros),
        ("test_sigFigs_DecimalNumber",              test_sigFigs_DecimalNumber),
        ("test_sigFigs_DecimalNumberMidZeros",      test_sigFigs_DecimalNumberMidZeros),
        
        ("test_powerOfTen_1Digit",          test_powerOfTen_1Digit),
        ("test_powerOfTen_5Digits",         test_powerOfTen_5Digits),
        ("test_powerOfTen_Fractional",      test_powerOfTen_Fractional),
        ("test_powerOfTen_DecimalNumber",   test_powerOfTen_DecimalNumber),
        
        ("test_hundredsDecade_1Digit",          test_hundredsDecade_1Digit),
        ("test_hundredsDecade_3Digits",         test_hundredsDecade_3Digits),
        ("test_hundredsDecade_5Digits",         test_hundredsDecade_5Digits),
        ("test_hundredsDecade_Fractional",      test_hundredsDecade_Fractional),
        ("test_hundredsDecade_DecimalNumber",   test_hundredsDecade_DecimalNumber),
        
        ("test_sigFigsRounded_by1_5Digits",         test_sigFigsRounded_by1_5Digits),
        ("test_sigFigsRounded_by2_5Digits",         test_sigFigsRounded_by2_5Digits),
        ("test_sigFigsRounded_by3_5Digits",         test_sigFigsRounded_by3_5Digits),
        ("test_sigFigsRounded_by2_5DigitDecimal",   test_sigFigsRounded_by2_5DigitDecimal),
        ("test_sigFigsRounded_by2_Fractional",      test_sigFigsRounded_by2_Fractional),
    ]
}
