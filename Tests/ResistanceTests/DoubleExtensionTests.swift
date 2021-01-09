// MARK: Sig Figs Count
extension DoubleExtensionTests {
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

// MARK:- Resistor Band Exps



// MARK: Four Band
extension DoubleExtensionTests {
    func test_fourBandExponent_withMinus2Exp() {
        let result1 = 0.01.fourBandExponent
        let result2 = 0.1.fourBandExponent
        XCTAssertEqual(result1, -2)
        XCTAssertEqual(result2, -2)
    }
    
    func test_fourBandExponent_withMinus1Exp() {
        let result = 5.0.fourBandExponent
        XCTAssertEqual(result, -1)
    }
    
    func test_fourBandExponent_withZeroExp() {
        let result = 10.0.fourBandExponent
        XCTAssertEqual(result, 0)
    }
    
    func test_fourBandExponent_with1Exp() {
        let result = 309.fourBandExponent
        XCTAssertEqual(result, 1)
    }
    
    func test_fourBandExponent_with2Exp() {
        let result = 4500.fourBandExponent
        XCTAssertEqual(result, 2)
    }
    
    func test_fourBandExponent_with3Exp() {
        let result = 78400.fourBandExponent
        XCTAssertEqual(result, 3)
    }
}

// MARK: Five Band
extension DoubleExtensionTests {
    func test_fiveBandExponent_withMinus2Exp() {
        let result1 = 0.01.fiveBandExponent
        let result2 = 5.0.fiveBandExponent
        XCTAssertEqual(result1, -2)
        XCTAssertEqual(result2, -2)
    }
    
    func test_fiveBandExponent_withMinus1Exp() {
        let result = 15.0.fiveBandExponent
        XCTAssertEqual(result, -1)
    }
    
    func test_fiveBandExponent_withZeroExp() {
        let result = 101.0.fiveBandExponent
        XCTAssertEqual(result, 0)
    }
    
    func test_fiveBandExponent_with1Exp() {
        let result = 3095.fiveBandExponent
        XCTAssertEqual(result, 1)
    }
    
    func test_fiveBandExponent_with2Exp() {
        let result = 45005.fiveBandExponent
        XCTAssertEqual(result, 2)
    }
    
    func test_fiveBandExponent_with3Exp() {
        let result = 784040.fiveBandExponent
        XCTAssertEqual(result, 3)
    }
}

// MARK: - Rounded



// MARK: Four Band
extension DoubleExtensionTests {
    func test_roundedForFourBand_withValueToNotRound() {
        let result = 37_000.0.roundedForFourBand
        XCTAssertEqual(result, 37_000)
    }
    
    func test_roundedForFourBand_withValueToRoundUp() {
        let result = 37_500.0.roundedForFourBand
        XCTAssertEqual(result, 38_000)
    }
    
    func test_roundedForFourBand_withValueToRoundDown() {
        let result = 37_400.0.roundedForFourBand
        XCTAssertEqual(result, 37_000)
    }
}

// MARK: Five Band
extension DoubleExtensionTests {
    func test_roundedForFiveBand_withValueToNotRound() {
        let result = 37_500.0.roundedForFiveBand
        XCTAssertEqual(result, 37_500)
    }

    func test_roundedForFiveBand_withValueToRoundUp() {
        let result = 37_550.0.roundedForFiveBand
        XCTAssertEqual(result, 37_600)
    }
    
    func test_roundedForFiveBand_withValueToRoundDown() {
        let result = 37_540.0.roundedForFiveBand
        XCTAssertEqual(result, 37_500)
    }
}

// MARK:- Internal
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
        
        ("test_fourBandExponent_withMinus2Exp", test_fourBandExponent_withMinus2Exp),
        ("test_fourBandExponent_withMinus1Exp", test_fourBandExponent_withMinus1Exp),
        ("test_fourBandExponent_withZeroExp",   test_fourBandExponent_withZeroExp),
        ("test_fiveBandExponent_with1Exp",      test_fiveBandExponent_with1Exp),
        ("test_fiveBandExponent_with3Exp",      test_fiveBandExponent_with3Exp),
        ("test_fourBandExponent_with3Exp",      test_fourBandExponent_with3Exp),
        
        ("test_fiveBandExponent_withMinus2Exp", test_fiveBandExponent_withMinus2Exp),
        ("test_fiveBandExponent_withMinus1Exp", test_fiveBandExponent_withMinus1Exp),
        ("test_fiveBandExponent_withZeroExp",   test_fiveBandExponent_withZeroExp),
        ("test_fiveBandExponent_with1Exp",      test_fiveBandExponent_with1Exp),
        ("test_fiveBandExponent_with2Exp",      test_fiveBandExponent_with2Exp),
        ("test_fiveBandExponent_with3Exp",      test_fiveBandExponent_with3Exp),
        
        ("test_roundedForFourBand_withValueToNotRound", test_roundedForFourBand_withValueToNotRound),
        ("test_roundedForFourBand_withValueToRoundUp", test_roundedForFourBand_withValueToRoundUp),
        ("test_roundedForFourBand_withValueToRoundUp", test_roundedForFourBand_withValueToRoundUp),
        
        ("test_roundedForFiveBand_withValueToNotRound", test_roundedForFiveBand_withValueToNotRound),
        ("test_roundedForFiveBand_withValueToRoundUp", test_roundedForFiveBand_withValueToRoundUp),
        ("test_roundedForFiveBand_withValueToRoundDown", test_roundedForFiveBand_withValueToRoundDown),
    ]
}
