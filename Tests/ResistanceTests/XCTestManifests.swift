import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DoubleExtensionTests.allTests),
        testCase(ESeriesTests.allTests),
        testCase(FourBandResistorTests.allTests),
        testCase(FiveBandResistorTests.allTests),
        testCase(SixBandResistorTests.allTests),
    ]
}
#endif
