import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ResistorTests.allTests),
        testCase(ResistorFactoryTests.allTests),
        testCase(DoubleExtensionTests.allTests),
        testCase(ESeriesTests.allTests),
    ]
}
#endif
