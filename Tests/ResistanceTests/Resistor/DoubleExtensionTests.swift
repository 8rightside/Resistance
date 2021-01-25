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
        
    ]
}
