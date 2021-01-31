/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

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

// MARK:- Resistor Tolerance



// MARK: Four Band
extension ResistorTests {
    func test_fourBand_tolerance_withBrownBand() {
        let resistor = Resistor.fourBand(.black, .green, .silver, .brown)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.01)
    }
    
    func test_fourBand_tolerance_withRedBand() {
        let resistor = Resistor.fourBand(.green, .blue, .gold, .red)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.02)
    }
    
    func test_fourBand_tolerance_withOrangeBand() {
        let resistor = Resistor.fourBand(.yellow, .violet, .red, .orange)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.03)
    }
    
    func test_fourBand_tolerance_withYellowBand() {
        let resistor = Resistor.fourBand(.orange, .white, .yellow, .yellow)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.04)
    }
    
    func test_fourBand_tolerance_withGreenBand() {
        let resistor = Resistor.fourBand(.orange, .yellow, .green, .green)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.005)
    }
    
    func test_fourBand_tolerance_withBlueBand() {
        let resistor = Resistor.fourBand(.yellow, .black, .blue, .blue)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0025)
    }
    
    func test_fourBand_tolerance_withVioletBand() {
        let resistor = Resistor.fourBand(.violet, .black, .white, .violet)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.001)
    }
    
    func test_fourBand_tolerance_withGreyBand() {
        let resistor = Resistor.fourBand(.black, .green, .silver, .grey)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0005)
    }
    
    func test_fourBand_tolerance_withGoldBand() {
        let resistor = Resistor.fourBand(.orange, .white, .yellow, .gold)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.05)
    }
    
    func test_fourBand_tolerance_withSilverBand() {
        let resistor = Resistor.fourBand(.green, .blue, .gold, .silver)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.1)
    }
}

// MARK: Five Band
extension ResistorTests {
    func test_fiveBand_tolerance_withBrownBand() {
        let resistor = Resistor.fiveBand(.black, .brown, .brown, .silver, .brown)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.01)
    }
    
    func test_fiveBand_tolerance_withRedBand() {
        let resistor = Resistor.fiveBand(.green, .orange, .brown, .red, .red)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.02)
    }
    
    func test_fiveBand_tolerance_withOrangeBand() {
        let resistor = Resistor.fiveBand(.black, .brown, .yellow, .orange, .orange)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.03)
    }
    
    func test_fiveBand_tolerance_withYellowBand() {
        let resistor = Resistor.fiveBand(.blue, .green, .grey, .brown, .yellow)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.04)
    }
    
    func test_fiveBand_tolerance_withGreenBand() {
        let resistor = Resistor.fiveBand(.black, .orange, .white, .gold, .green)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.005)
    }
    
    func test_fiveBand_tolerance_withBlueBand() {
        let resistor = Resistor.fiveBand(.blue, .green, .red, .gold, .blue)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0025)
    }
    
    func test_fiveBand_tolerance_withVioletBand() {
        let resistor = Resistor.fiveBand(.orange, .black, .green, .black, .violet)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.001)
    }
    
    func test_fiveBand_tolerance_withGreyBand() {
        let resistor = Resistor.fiveBand(.white, .blue, .blue, .brown, .grey)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0005)
    }
    
    func test_fiveBand_tolerance_withGoldBand() {
        let resistor = Resistor.fiveBand(.yellow, .brown, .green, .black, .gold)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.05)
    }
    
    func test_fiveBand_tolerance_withSilverBand() {
        let resistor = Resistor.fiveBand(.brown, .black, .green, .green, .silver)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.1)
    }
}

// MARK: Six Band
extension ResistorTests {
    func test_sixBand_tolerance_withBrownBand() {
        let resistor = Resistor.sixBand(.black, .brown, .brown, .silver, .brown, .blue)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.01)
    }
    
    func test_sixBand_tolerance_withRedBand() {
        let resistor = Resistor.sixBand(.green, .orange, .brown, .red, .red, .brown)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.02)
    }
    
    func test_sixBand_tolerance_withOrangeBand() {
        let resistor = Resistor.sixBand(.black, .brown, .yellow, .orange, .orange, .orange)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.03)
    }
    
    func test_sixBand_tolerance_withYellowBand() {
        let resistor = Resistor.sixBand(.blue, .green, .grey, .brown, .yellow, .red)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.04)
    }
    
    func test_sixBand_tolerance_withGreenBand() {
        let resistor = Resistor.sixBand(.black, .orange, .white, .gold, .green, .violet)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.005)
    }
    
    func test_sixBand_tolerance_withBlueBand() {
        let resistor = Resistor.sixBand(.blue, .green, .red, .gold, .blue, .yellow)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0025)
    }
    
    func test_sixBand_tolerance_withVioletBand() {
        let resistor = Resistor.sixBand(.orange, .black, .green, .black, .violet, .blue)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.001)
    }
    
    func test_sixBand_tolerance_withGreyBand() {
        let resistor = Resistor.sixBand(.white, .blue, .blue, .brown, .grey, .brown)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.0005)
    }
    
    func test_sixBand_tolerance_withGoldBand() {
        let resistor = Resistor.sixBand(.yellow, .brown, .green, .black, .gold, .orange)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.05)
    }
    
    func test_sixBand_tolerance_withSilverBand() {
        let resistor = Resistor.sixBand(.brown, .black, .green, .green, .silver, .red)
        XCTAssertEqual(resistor.tolerance.rawValue, 0.1)
    }
}

// MARK:- Resistor String



// MARK: Four Band
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

// MARK:- Tolerance Value Range



// MARK: Four Band
extension ResistorTests {
    func test_fourBand_toleranceValueRange_gold() {
        let resistor = Resistor.fourBand(.brown, .black, .red, .gold)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 950)
        XCTAssertEqual(result.upperBound, 1050)
    }
    
    func test_fourBand_toleranceValueRange_silver() {
        let resistor = Resistor.fourBand(.brown, .black, .red, .silver)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 900)
        XCTAssertEqual(result.upperBound, 1100)
    }
    
    func test_fourBand_toleranceValueRange_brown() {
        let resistor = Resistor.fourBand(.brown, .black, .red, .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 990)
        XCTAssertEqual(result.upperBound, 1010)
    }
}

// MARK: Five Band
extension ResistorTests {
    func test_fiveBand_toleranceValueRange_gold() {
        let resistor = Resistor.fiveBand(.brown, .black, .black, .brown, .gold)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 950)
        XCTAssertEqual(result.upperBound, 1050)
    }
    
    func test_fiveBand_toleranceValueRange_silver() {
        let resistor = Resistor.fiveBand(.brown, .black, .black, .brown, .silver)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 900)
        XCTAssertEqual(result.upperBound, 1100)
    }
    
    func test_fiveBand_toleranceValueRange_brown() {
        let resistor = Resistor.fiveBand(.brown, .black, .black, .brown, .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 990)
        XCTAssertEqual(result.upperBound, 1010)
    }
}

// MARK: Six Band
extension ResistorTests {
    func test_sixBand_toleranceValueRange_gold() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 950)
        XCTAssertEqual(result.upperBound, 1050)
    }
    
    func test_sixBand_toleranceValueRange_silver() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .silver, .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 900)
        XCTAssertEqual(result.upperBound, 1100)
    }
    
    func test_sixBand_toleranceValueRange_brown() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .brown, .brown)
        let result = resistor.toleranceValueRange
        XCTAssertEqual(result.lowerBound, 990)
        XCTAssertEqual(result.upperBound, 1010)
    }
}

// MARK: - Coefficient Value Range



// MARK: 100 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR100() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown) // 1K
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 997.5)
        XCTAssertEqual(result.upperBound, 1002.5)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR100() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown) // 1K
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 995)
        XCTAssertEqual(result.upperBound, 1005)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR100() {
        let resistor = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown) // 1K
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 990)
        XCTAssertEqual(result.upperBound, 1010)
    }
}

// MARK: 50 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR50() {
        let resistor = Resistor.sixBand(.red, .red, .black, .brown, .gold, .red) // 2K2
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 2197.25)
        XCTAssertEqual(result.upperBound, 2202.75)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR50() {
        let resistor = Resistor.sixBand(.red, .red, .black, .brown, .gold, .red) // 2K2
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 2194.5)
        XCTAssertEqual(result.upperBound, 2205.5)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR50() {
        let resistor = Resistor.sixBand(.red, .red, .black, .brown, .gold, .red) // 2K2
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 2189)
        XCTAssertEqual(result.upperBound, 2211)
    }
}

// MARK: 25 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR25() {
        let resistor = Resistor.sixBand(.yellow, .violet, .black, .brown, .gold, .yellow) // 4K7
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 4697.0625)
        XCTAssertEqual(result.upperBound, 4702.9375)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR25() {
        let resistor = Resistor.sixBand(.yellow, .violet, .black, .brown, .gold, .yellow) // 4K7
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 4694.125)
        XCTAssertEqual(result.upperBound, 4705.875)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR25() {
        let resistor = Resistor.sixBand(.yellow, .violet, .black, .brown, .gold, .yellow) // 4K7
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 4688.25)
        XCTAssertEqual(result.upperBound, 4711.75)
    }
}

// MARK: 15 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR15() {
        let resistor = Resistor.sixBand(.orange, .orange, .black, .brown, .gold, .orange) // 3K3
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 3298.7625)
        XCTAssertEqual(result.upperBound, 3301.2375)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR15() {
        let resistor = Resistor.sixBand(.orange, .orange, .black, .brown, .gold, .orange) // 3K3
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 3297.525)
        XCTAssertEqual(result.upperBound, 3302.475)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR15() {
        let resistor = Resistor.sixBand(.orange, .orange, .black, .brown, .gold, .orange) // 3K3
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 3295.05)
        XCTAssertEqual(result.upperBound, 3304.95)
    }
}

// MARK: 10 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR10() {
        let resistor = Resistor.sixBand(.blue, .grey, .black, .brown, .gold, .blue) // 6K8
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 6798.3)
        XCTAssertEqual(result.upperBound, 6801.7)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR10() {
        let resistor = Resistor.sixBand(.blue, .grey, .black, .brown, .gold, .blue) // 6K8
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 6796.6)
        XCTAssertEqual(result.upperBound, 6803.4)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR10() {
        let resistor = Resistor.sixBand(.blue, .grey, .black, .brown, .gold, .blue) // 6K8
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 6793.2)
        XCTAssertEqual(result.upperBound, 6806.8)
    }
}

// MARK: 5 TempCo
extension ResistorTests {
    func test_sixBand_coefficientValueRange_tempChange25_TCR5() {
        let resistor = Resistor.sixBand(.green, .blue, .black, .brown, .gold, .violet) // 5K6
        let result = resistor.coefficientValueRange(tempChange: 25)
        XCTAssertEqual(result.lowerBound, 5599.3)
        XCTAssertEqual(result.upperBound, 5600.7)
    }
    
    func test_sixBand_coefficientValueRange_tempChange50_TCR5() {
        let resistor = Resistor.sixBand(.green, .blue, .black, .brown, .gold, .violet) // 5K6
        let result = resistor.coefficientValueRange(tempChange: 50)
        XCTAssertEqual(result.lowerBound, 5598.6)
        XCTAssertEqual(result.upperBound, 5601.4)
    }
    
    func test_sixBand_coefficientValueRange_tempChange100_TCR5() {
        let resistor = Resistor.sixBand(.green, .blue, .black, .brown, .gold, .violet) // 5K6
        let result = resistor.coefficientValueRange(tempChange: 100)
        XCTAssertEqual(result.lowerBound, 5597.2)
        XCTAssertEqual(result.upperBound, 5602.8)
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
        
        ("test_fourBand_tolerance_withBrownBand",   test_fourBand_tolerance_withBrownBand),
        ("test_fourBand_tolerance_withRedBand",     test_fourBand_tolerance_withRedBand),
        ("test_fourBand_tolerance_withOrangeBand",  test_fourBand_tolerance_withOrangeBand),
        ("test_fourBand_tolerance_withYellowBand",  test_fourBand_tolerance_withYellowBand),
        ("test_fourBand_tolerance_withGreenBand",   test_fourBand_tolerance_withGreenBand),
        ("test_fourBand_tolerance_withBlueBand",    test_fourBand_tolerance_withBlueBand),
        ("test_fourBand_tolerance_withVioletBand",  test_fourBand_tolerance_withVioletBand),
        ("test_fourBand_tolerance_withGreyBand",    test_fourBand_tolerance_withGreyBand),
        ("test_fourBand_tolerance_withGoldBand",    test_fourBand_tolerance_withGoldBand),
        ("test_fourBand_tolerance_withSilverBand",  test_fourBand_tolerance_withSilverBand),
        
        ("test_fiveBand_tolerance_withBrownBand",   test_fiveBand_tolerance_withBrownBand),
        ("test_fiveBand_tolerance_withRedBand",     test_fiveBand_tolerance_withRedBand),
        ("test_fiveBand_tolerance_withOrangeBand",  test_fiveBand_tolerance_withOrangeBand),
        ("test_fiveBand_tolerance_withYellowBand",  test_fiveBand_tolerance_withYellowBand),
        ("test_fiveBand_tolerance_withGreenBand",   test_fiveBand_tolerance_withGreenBand),
        ("test_fiveBand_tolerance_withBlueBand",    test_fiveBand_tolerance_withBlueBand),
        ("test_fiveBand_tolerance_withVioletBand",  test_fiveBand_tolerance_withVioletBand),
        ("test_fiveBand_tolerance_withGreyBand",    test_fiveBand_tolerance_withGreyBand),
        ("test_fiveBand_tolerance_withGoldBand",    test_fiveBand_tolerance_withGoldBand),
        ("test_fiveBand_tolerance_withSilverBand",  test_fiveBand_tolerance_withSilverBand),
        
        ("test_sixBand_tolerance_withBrownBand",    test_sixBand_tolerance_withBrownBand),
        ("test_sixBand_tolerance_withRedBand",      test_sixBand_tolerance_withRedBand),
        ("test_sixBand_tolerance_withOrangeBand",   test_sixBand_tolerance_withOrangeBand),
        ("test_sixBand_tolerance_withYellowBand",   test_sixBand_tolerance_withYellowBand),
        ("test_sixBand_tolerance_withGreenBand",    test_sixBand_tolerance_withGreenBand),
        ("test_sixBand_tolerance_withBlueBand",     test_sixBand_tolerance_withBlueBand),
        ("test_sixBand_tolerance_withVioletBand",   test_sixBand_tolerance_withVioletBand),
        ("test_sixBand_tolerance_withGreyBand",     test_sixBand_tolerance_withGreyBand),
        ("test_sixBand_tolerance_withGoldBand",     test_sixBand_tolerance_withGoldBand),
        ("test_sixBand_tolerance_withSilverBand",   test_sixBand_tolerance_withSilverBand),
        
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
        
        ("test_fourBand_toleranceValueRange_gold",   test_fourBand_toleranceValueRange_gold),
        ("test_fourBand_toleranceValueRange_silver", test_fourBand_toleranceValueRange_silver),
        ("test_fourBand_toleranceValueRange_brown",  test_fourBand_toleranceValueRange_brown),
        
        ("test_fiveBand_toleranceValueRange_gold",   test_fiveBand_toleranceValueRange_gold),
        ("test_fiveBand_toleranceValueRange_silver", test_fiveBand_toleranceValueRange_silver),
        ("test_fiveBand_toleranceValueRange_brown",  test_fiveBand_toleranceValueRange_brown),
        
        ("test_sixBand_toleranceValueRange_gold",    test_sixBand_toleranceValueRange_gold),
        ("test_sixBand_toleranceValueRange_silver",  test_sixBand_toleranceValueRange_silver),
        ("test_sixBand_toleranceValueRange_brown",   test_sixBand_toleranceValueRange_brown),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR100",  test_sixBand_coefficientValueRange_tempChange25_TCR100),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR100",  test_sixBand_coefficientValueRange_tempChange50_TCR100),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR100", test_sixBand_coefficientValueRange_tempChange100_TCR100),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR50",   test_sixBand_coefficientValueRange_tempChange25_TCR50),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR50",   test_sixBand_coefficientValueRange_tempChange50_TCR50),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR50",  test_sixBand_coefficientValueRange_tempChange100_TCR50),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR25",   test_sixBand_coefficientValueRange_tempChange25_TCR25),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR25",   test_sixBand_coefficientValueRange_tempChange50_TCR25),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR25",  test_sixBand_coefficientValueRange_tempChange100_TCR25),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR15",   test_sixBand_coefficientValueRange_tempChange25_TCR15),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR15",   test_sixBand_coefficientValueRange_tempChange50_TCR15),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR15",  test_sixBand_coefficientValueRange_tempChange100_TCR15),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR10",   test_sixBand_coefficientValueRange_tempChange25_TCR10),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR10",   test_sixBand_coefficientValueRange_tempChange50_TCR10),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR10",  test_sixBand_coefficientValueRange_tempChange100_TCR10),
        
        ("test_sixBand_coefficientValueRange_tempChange25_TCR5",    test_sixBand_coefficientValueRange_tempChange25_TCR5),
        ("test_sixBand_coefficientValueRange_tempChange50_TCR5",    test_sixBand_coefficientValueRange_tempChange50_TCR5),
        ("test_sixBand_coefficientValueRange_tempChange100_TCR5",   test_sixBand_coefficientValueRange_tempChange100_TCR5),
    ]
}
