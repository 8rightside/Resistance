//: [< Banded Resistor Properties](@previous)
import Resistance
/*:
 # Tolerance and TempCo Ranges
 The banded resistor types also contain two members for working out common resistance calculations. Both
 return a `Range<Double>` meaning you can make use of all the functions `Range` provides.
 
 The banded resistor types also contain a property for calculating the tolerance range. And in the case
 of `SixBandResistor`, a function for calculating the resistance flux range for a given temperature change.
 */
let fourBand = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .orange, tolerance: .gold)
let fiveBand = FiveBandResistor(digit1: .white, digit2: .green, digit3: .orange, multiplier: .brown, tolerance: .brown)
let sixBand = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
/*:
 ### toleranceValueRange
 The `toleranceValueRange` property of a resistor returns a `Range<Double>` representing
 all the values this resistor covers, calculated using its `tolerance` rating.
 */
let toleranceValueRange = fourBand.toleranceValueRange
let resistanceUpperBound = toleranceValueRange.upperBound
let resistanceLowerBound = toleranceValueRange.lowerBound
let valuesOverlap = toleranceValueRange.overlaps(fiveBand.toleranceValueRange)
/*:
 ### coefficientValueRange(tempChange:)
 The `coefficientValueRange` property of a resistor returns a `Range<Double>` representing
 the change in resistance from the specified `tempChange` using this resistor's `coefficient` rating.
 */
let coefficientValueRange = sixBand.coefficientValueRange(tempChange: 5)
let resistanceFluxUpperBound = coefficientValueRange.upperBound
let resistanceFluxLowerBound = coefficientValueRange.lowerBound
let withinResistanceFluxRange = coefficientValueRange.contains(4701)
//: [Banded Resistor Round Inits >](@next)
