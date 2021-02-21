//: [< Overview](@previous)
import Resistance
/*:
 # Banded Resistor Types
 The most basic, and thing you'll probably want to do most often, is to create a resistor.
 A `BandedResistor` is represented using a struct with properties for the `Digit`, `Multiplier` and
 `Tolerance` bands. These properties are each represented by an enum and passed in during
 initialisation. The following demonstrates how simple it is to create a new resistor type.
 
 ### Four Band Resistor
 To create a four band `resistor` just pass the two digit bands followed by the
 multiplier and tolerance bands
 */
let fourBand1 = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .gold)
let fourBand2 = FourBandResistor(digit1: .yellow, digit2: .violet, multiplier: .orange, tolerance: .gold)
let fourBand3 = FourBandResistor(digit1: .blue, digit2: .grey, multiplier: .brown, tolerance: .gold)
/*:
 ### Five Band Resistor
 Creating a five band `resistor` is similar to a four band except with the addition
 of a third digit band before the multiplier and tolerance bands
 */
let fiveBand1 = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold)
let fiveBand2 = FiveBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .red, tolerance: .gold)
let fiveBand3 = FiveBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .black, tolerance: .gold)
/*:
 ### Six Band Resistor
 Creating a six band `resistor` is the same as creating a five band with an extra
 band at the end for the temperature coefficient value
 */
let sixBand1 = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
let sixBand2 = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .red, tolerance: .gold, coefficient: .brown)
let sixBand3 = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .black, multiplier: .black, tolerance: .gold, coefficient: .brown)
//:[Banded Resistor Properties >](@next)

