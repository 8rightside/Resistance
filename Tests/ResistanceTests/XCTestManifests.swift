import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ResistorTests.allTests),
        testCase(ResistorControllerTests.allTests),
    ]
}
#endif
