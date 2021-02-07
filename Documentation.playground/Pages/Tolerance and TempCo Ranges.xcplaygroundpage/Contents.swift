//: [< Resistor Properties](@previous)
import Resistance
/*:
 # Tolerance and TempCo Ranges
 The `Resistor` type also contains two members for working out common resistance calculations. Both
 return a `Range<Double>` meaning you can make use of all the functions `Range` provides.
 */
let fourBand = Resistor.fourBand(.brown, .black, .orange, .gold)
let fiveBand = Resistor.fiveBand(.white, .green, .orange, .brown, .brown)
let sixBand = Resistor.sixBand(.yellow, .violet, .black, .brown, .gold, .brown)
/*:
 ### toleranceValueRange
 The `toleranceValueRange` property of a `Resistor` returns a `Range<Double>` representing
 all the values this `Resistor` covers, calculated using its `tolerance` rating.
 */
let toleranceValueRange = fourBand.toleranceValueRange
let resistanceUpperBound = toleranceValueRange.upperBound
let resistanceLowerBound = toleranceValueRange.lowerBound
let valuesOverlap = toleranceValueRange.overlaps(fiveBand.toleranceValueRange)
/*:
 ### coefficientValueRange(tempChange:)
 The `coefficientValueRange` property of a `Resistor` returns a `Range<Double>` representing
 the change in resistance from the specified `tempChange` using this `Resistor`'s `coefficient` rating.
 */
let coefficientValueRange = sixBand.coefficientValueRange(tempChange: 5)
let resistanceFluxUpperBound = coefficientValueRange.upperBound
let resistanceFluxLowerBound = coefficientValueRange.lowerBound
let withinResistanceFluxRange = coefficientValueRange.contains(4701)
/*:
 - Note:
 Because four and five band `Resistor`s don't have a `coefficient` rating this function will assume
 a rating of 0, and as such will just return a `Range<Double>` with an upper and lower bound the same
 as the `Resistor`s nominal `value`.
 */
let noResistanceFlux = fourBand.coefficientValueRange(tempChange: 5)
let isSameResistance = noResistanceFlux.upperBound == fourBand.value && noResistanceFlux.lowerBound == fourBand.value
//: [The ResistorFactory >](@next)
