/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/



// MARK: - Internal
import Testing
import Resistance

@Suite("Six Band Resistor Tests")
struct SixBandResistorTests {
    
    // MARK: - Resistance Value
    @Suite("Resistance Value")
    struct ResistanceValue {
        
        @Test("Value Min")
        static func value_min() {
            let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
            #expect(resistor.value == 1)
        }
        
        @Test("Value Max")
        static func value_max() {
            let resistor = SixBandResistor(digit1: .white, digit2: .white, digit3: .white, multiplier: .white, tolerance: .gold, coefficient: .brown)
            #expect(resistor.value == 999_000_000_000)
        }
        
        @Test("Value Fractional")
        static func value_fractional() {
            let resistor = SixBandResistor(digit1: .violet, digit2: .red, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
            #expect(resistor.value == 7.2)
        }
        
        @Test("Value with 3 Digits")
        static func value_3digits() {
            let resistor = SixBandResistor(digit1: .green, digit2: .grey, digit3: .white, multiplier: .black, tolerance: .gold, coefficient: .brown)
            #expect(resistor.value == 589)
        }
        
        @Test("Value with 5 Digits")
        static func value_5digits() {
            let resistor = SixBandResistor(digit1: .yellow, digit2: .brown, digit3: .red, multiplier: .red, tolerance: .gold, coefficient: .brown)
            #expect(resistor.value == 41200)
        }
    }
    
    // MARK: - Description
    @Suite("Description")
    struct Description {
        
        @Test("Description 1 Digit")
        static func description_1digit() {
            let resistor = SixBandResistor(digit1: .grey, digit2: .black, digit3: .black, multiplier: .silver, tolerance: .gold, coefficient: .brown)
            #expect(resistor.description == "8 Ω")
        }
        
        @Test("Description 4 Digit")
        static func description_4digit() {
            let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
            #expect(resistor.description == "5.6 KΩ")
        }
        
        @Test("Description 6 Digit")
        static func description_6digit() {
            let resistor = SixBandResistor(digit1: .yellow, digit2: .black, digit3: .black, multiplier: .orange, tolerance: .gold, coefficient: .brown)
            #expect(resistor.description == "400 KΩ")
        }
        
        @Test("Description 7 Digit")
        static func description_7digit() {
            let resistor = SixBandResistor(digit1: .orange, digit2: .white, digit3: .black, multiplier: .yellow, tolerance: .gold, coefficient: .brown)
            #expect(resistor.description == "3.9 MΩ")
        }
        
        @Test("Description 10 Digit")
        static func description_10digit() {
            let resistor = SixBandResistor(digit1: .red, digit2: .black, digit3: .black, multiplier: .violet, tolerance: .gold, coefficient: .brown)
            #expect(resistor.description == "2 GΩ")
        }
    }
    
    // MARK: - Tolerance Value Range
    @Suite("Tolerance Value Range")
    struct ToleranceValueRange {
        
        @Test("Tolerance Value Range - Gold")
        static func toleranceValueRange_gold() {
            let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1050)
            #expect(result.lowerBound == 950)
        }
        
        @Test("Tolerance Value Range - Silver")
        static func toleranceValueRange_silver() {
            let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .silver, coefficient: .brown)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1100)
            #expect(result.lowerBound == 900)
        }
        
        @Test("Tolerance Value Range - Brown")
        static func toleranceValueRange_brown() {
            let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .brown, coefficient: .brown)
            let result = resistor.toleranceValueRange
            #expect(result.upperBound == 1010)
            #expect(result.lowerBound == 990)
        }
    }
    
    // MARK: - Coefficient Value Range
    @Suite("Coefficient Value Range")
    struct CoefficientValueRange {
        
        // MARK: 100 TempCo
        @Suite("Temp Coefficient 100")
        struct TempCoefficient100 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 997.5)
                #expect(result.upperBound == 1002.5)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 995)
                #expect(result.upperBound == 1005)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 990)
                #expect(result.upperBound == 1010)
            }
        }
        
        // MARK: 50 TempCo
        @Suite("Temp coefficient 50")
        struct TempCoefficient50 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 2197.25)
                #expect(result.upperBound == 2202.75)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 2194.5)
                #expect(result.upperBound == 2205.5)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .red, digit2: .red, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .red)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 2189)
                #expect(result.upperBound == 2211)
            }
        }
        
        // MARK: 25 TempCo
        @Suite("Temp Coefficient 25")
        struct TempCoefficient25 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 4697.0625)
                #expect(result.upperBound == 4702.9375)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 4694.125)
                #expect(result.upperBound == 4705.875)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .yellow)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 4688.25)
                #expect(result.upperBound == 4711.75)
            }
        }
        
        // MARK: 15 TempCo
        @Suite("Temp Coefficient 15")
        struct TempCoefficient15 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 3298.7625)
                #expect(result.upperBound == 3301.2375)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 3297.525)
                #expect(result.upperBound == 3302.475)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .orange, digit2: .orange, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .orange)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 3295.05)
                #expect(result.upperBound == 3304.95)
            }
        }
        
        // MARK: 10 TempCo
        @Suite("Temp Coefficient 10")
        struct TempCoefficient10 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 6798.3)
                #expect(result.upperBound == 6801.7)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 6796.6)
                #expect(result.upperBound == 6803.4)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .blue)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 6793.2)
                #expect(result.upperBound == 6806.8)
            }
        }
        
        // MARK: 5 TempCo
        @Suite("Temp Coefficient 5")
        struct TempCoefficient5 {
            
            @Test("Temp Change 25")
            static func tempChange25() {
                let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
                let result = resistor.coefficientValueRange(tempChange: 25)
                #expect(result.lowerBound == 5599.3)
                #expect(result.upperBound == 5600.7)
            }
            
            @Test("Temp Change 50")
            static func tempChange50() {
                let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
                let result = resistor.coefficientValueRange(tempChange: 50)
                #expect(result.lowerBound == 5598.6)
                #expect(result.upperBound == 5601.4)
            }
            
            @Test("Temp Change 100")
            static func tempChange100() {
                let resistor = SixBandResistor(digit1: .green, digit2: .blue, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .violet)
                let result = resistor.coefficientValueRange(tempChange: 100)
                #expect(result.lowerBound == 5597.2)
                #expect(result.upperBound == 5602.8)
            }
        }
    }
    
    // MARK: - Init Value Tolerance
    @Suite("Init Value and Tolerance")
    struct InitValueAndTolerance {
        
        @Test("Init Value Below Min")
        static func init_value_belowMin() {
            let resistor = SixBandResistor(value: 0.5)
            #expect(resistor.digits == [.brown, .black, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .gold)
        }
        
        @Test("Init Value with Fractional")
        static func init_value_fractional() {
            let resistor = SixBandResistor(value: 6.781, tolerance: .yellow)
            #expect(resistor.digits == [.blue, .violet, .grey])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .yellow)
        }
        
        @Test("Init Value with 5 Digits")
        static func init_value_5digits() {
            let resistor = SixBandResistor(value: 12300)
            #expect(resistor.digits == [.brown, .red, .orange])
            #expect(resistor.multiplier == .red)
            #expect(resistor.tolerance == .gold)
        }
        
        @Test("Init Value with 8 Digits")
        static func init_value_8digits() {
            let resistor = SixBandResistor(value: 98765412, tolerance: .violet)
            #expect(resistor.digits == [.white, .grey, .grey])
            #expect(resistor.multiplier == .green)
            #expect(resistor.tolerance == .violet)
        }
        
        @Test("Init Value with Above Max")
        static func init_value_aboveMax() {
            let resistor = SixBandResistor(value: 999_999_999_999)
            #expect(resistor.digits == [.white, .white, .white])
            #expect(resistor.multiplier == .white)
            #expect(resistor.tolerance == .gold)
        }
    }
    
    // MARK: - Init Resistor Tolerance
    @Suite("Init Resistor and Tolerance")
    struct InitResistorAndTolerance {
        
        @Test("Init Resistor with 4 Bands")
        static func init_resistor_4Band() {
            let resistor = FourBandResistor(value: 3300)
            let sut = SixBandResistor(resistor: resistor)
            #expect(sut.digits == [.orange, .orange, .black])
            #expect(sut.multiplier == .brown)
            #expect(sut.tolerance == .gold)
            #expect(sut.coefficient == .brown)
        }
        
        @Test("Init Resistor with 5 Bands")
        static func init_resistor_5Band() {
            let resistor = FiveBandResistor(value: 47000)
            let sut = SixBandResistor(resistor: resistor, tolerance: .yellow, coefficient: .yellow)
            #expect(sut.digits == [.yellow, .violet, .black])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .yellow)
            #expect(sut.coefficient == .yellow)
        }
        
        @Test("Init Resistor with 5 Bands 3 Sig Figs")
        static func init_resistor_5Band3SigFigs() {
            let resistor = FiveBandResistor(value: 67800)
            let sut = SixBandResistor(resistor: resistor)
            #expect(sut.digits == [.blue, .violet, .grey])
            #expect(sut.multiplier == .red)
            #expect(sut.tolerance == .gold)
            #expect(sut.coefficient == .brown)
        }
        
        @Test("Init Resistor with 6 Bands")
        static func init_resistor_6Band() {
            let resistor = SixBandResistor(value: 5.6)
            let sut = SixBandResistor(resistor: resistor, tolerance: .green, coefficient: .orange)
            #expect(sut.digits == [.green, .blue, .black])
            #expect(sut.multiplier == .silver)
            #expect(sut.tolerance == .green)
            #expect(sut.coefficient == .orange)
        }
        
        @Test("Init Resistor with 6 Bands 3 Sig Figs")
        static func init_resistor_6Band3SigFigs() {
            let resistor = SixBandResistor(value: 4.23)
            let sut = SixBandResistor(resistor: resistor)
            #expect(sut.digits == [.yellow, .red, .orange])
            #expect(sut.multiplier == .silver)
            #expect(sut.tolerance == .gold)
            #expect(sut.coefficient == .brown)
        }
    }
    
    // MARK: - Init Exact Value Tolerance
    @Suite("Init Exact Value and Tolerance")
    struct InitExactValueAndTolerance {
        
        @Test("Init Exact Value Below Min Throws")
        static func init_exactValue_belowMin() throws {
            #expect(throws: (any Error).self) { try SixBandResistor(exactValue: 0.05) }
        }
        
        @Test("Init Exact Value with Fractional")
        static func init_exactValue_fractional() throws {
            let resistor = try SixBandResistor(exactValue: 4.7, tolerance: .silver, coefficient: .orange)
            #expect(resistor.digits == [.yellow, .violet, .black])
            #expect(resistor.multiplier == .silver)
            #expect(resistor.tolerance == .silver)
            #expect(resistor.coefficient == .orange)
        }
        
        @Test("Init Exact Value with 5 Digits Throws")
        static func init_exactValue_5digits() {
            #expect(throws: (any Error).self) { try SixBandResistor(exactValue: 56789) }
        }
        
        @Test("Init Exact Value with 8 Digits")
        static func init_exactValue_8digits() throws {
            let resistor = try SixBandResistor(exactValue: 12_200_000, tolerance: .blue)
            #expect(resistor.digits == [.brown, .red, .red])
            #expect(resistor.multiplier == .green)
            #expect(resistor.tolerance == .blue)
            #expect(resistor.coefficient == .brown)
        }
        
        @Test("Init Exact Value with Above Max Throws")
        static func init_exactValue_aboveMax() {
            #expect(throws: (any Error).self) {try SixBandResistor(exactValue: 999_999_999_999) }
        }
    }
    
    // MARK: - Decade functions
    @Suite("Decade Functions")
    struct DecadeFunctions {
        
        @Test("Decade Up")
        static func decadeUp() {
            let sut = SixBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .orange, tolerance: .gold, coefficient: .brown)
            let result = sut.decadeUp()
            #expect(result.multiplier == .yellow)
        }
        
        @Test("Decade Up Max")
        static func decadeUp_Max() {
            let sut = SixBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .white, tolerance: .gold, coefficient: .brown)
            let result = sut.decadeUp()
            #expect(result.multiplier == .white)
        }
        
        @Test("Decade Down")
        static func decadeDown() {
            let sut = SixBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .orange, tolerance: .gold, coefficient: .brown)
            let result = sut.decadeDown()
            #expect(result.multiplier == .red)
        }
        
        @Test("Decade Down Min")
        static func decadeDown_Min() {
            let sut = SixBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .silver, tolerance: .gold, coefficient: .brown)
            let result = sut.decadeDown()
            #expect(result.multiplier == .silver)
        }
    }
    
    // MARK: - Conversion functions
    @Suite("Converstion Functions")
    struct ConversionFunctions {
        
        @Test("Convert To Four Band")
        static func convertToFourBand() {
            let sut = SixBandResistor(value: 6800, tolerance: .green, coefficient: .yellow)
            let result = sut.convertToFourBand()
            #expect(result.value == 6800)
            #expect(result.tolerance == .green)
        }
        
        @Test("Convert To Five Band")
        static func convertToFiveBand() {
            let sut = SixBandResistor(value: 6800, tolerance: .green, coefficient: .yellow)
            let result = sut.convertToFiveBand()
            #expect(result.value == 6800)
            #expect(result.tolerance == .green)
        }
        
        @Test("Convert To Six Band")
        static func convertToSixBand() {
            let sut = SixBandResistor(value: 6800, tolerance: .green, coefficient: .yellow)
            let result = sut.convertToSixBand()
            #expect(result.value == 6800)
            #expect(result.tolerance == .green)
            #expect(result.coefficient == .yellow)
        }
    }
    
    // MARK: - Next Value functions
    @Suite("Next Value Functions")
    struct NextValueFunctions {
        
        @Test("Next Value Up")
        static func nextValueUp() {
            let sut = SixBandResistor(value: 79)
            let result = sut.nextValueUp(inSeries: E48Series())
            #expect(result == 82.5)
        }
        
        @Test("Next Value Down")
        static func nextValueDown() {
            let sut = SixBandResistor(value: 79)
            let result = sut.nextValueDown(inSeries: E48Series())
            #expect(result == 78.7)
        }
    }
}
