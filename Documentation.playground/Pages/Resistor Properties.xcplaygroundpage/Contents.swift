//: [< Resistor Type](@previous)
import Resistance
/*:
 # Resistor Properties
 The `Resistor` type is implemented using an enum with associated values for the digit,
 multiplier and tolerance rating. These associated values can be pulled out in the usual
 way with a switch statement, but – as will be shown – it's much easier to use the built
 in properties to do so.
 */
let fourBand = Resistor.fourBand(.brown, .black, .red, .gold)
let fiveBand = Resistor.fiveBand(.yellow, .violet, .black, .brown, .brown)
let sixBand = Resistor.sixBand(.blue, .grey, .black, .black, .red, .brown)
/*:
 ### digits
 Access to the significant figure bands is gained through the `digits` property which
 returns an array containing either two or three `digit`'s depending on whether a four,
 five or six band resistor was used.
 */
let fourBandDigits = fourBand.digits
let fiveBandDigits = fiveBand.digits
let sixBandDigits = sixBand.digits
/*:
 ### multiplier
 To get the multiplier simply call `multiplier`.
 */
let fourBandMultiplier = fourBand.multiplier
let fiveBandMultiplier = fiveBand.multiplier
let sixBandMultiplier = sixBand.multiplier
/*:
 ### tolerance
 And to get the tolerance rating just call `tolerance`.
 */
let fourBandTolerance = fourBand.tolerance
let fiveBandTolerance = fiveBand.tolerance
let sixBandTolerance = sixBand.tolerance
/*:
 ### coefficient
 To get the temperature coefficient rating call `coefficient` but because only a six band
 resistor can have a temp co rating this property returns an optional.
 */
let fourBandCoefficient = fourBand.coefficient
let fiveBandCoefficient = fiveBand.coefficient
let sixBandCoefficient = sixBand.coefficient
/*:
 ### rawValues
 All of the above properties are defined using enums, with each having a `rawValue` for
 its represented value. This makes it easy to get access to these values.
 */
let fourBandDigitValues = fourBandDigits.map(\.rawValue)
let fiveBandDigitValues = fiveBandDigits.map(\.rawValue)
let sixBandDigitValues = sixBandDigits.map(\.rawValue)

let fourBandMultiplierValue = fourBandMultiplier.rawValue
let fiveBandMultiplierValue = fiveBandMultiplier.rawValue
let sixBandMultiplierValue = sixBandMultiplier.rawValue

let fourBandToleranceValue = fourBandTolerance.rawValue
let fiveBandToleranceValue = fiveBandTolerance.rawValue
let sixBandToleranceValue = sixBandTolerance.rawValue

let fourBandCoefficientValue = fourBandCoefficient?.rawValue
let fiveBandCoefficientValue = fiveBandCoefficient?.rawValue
let sixBandCoefficientValue = sixBandCoefficient?.rawValue
/*:
 ### value
 To get the resistance value the `Resistor` represents just call `value` on any `Resistor`.
 */
let fourBandResistance = fourBand.value
let fiveBandResistance = fiveBand.value
let sixBandResistance = sixBand.value
/*:
### toleranceValueRange
 The `toleranceValueRange` property of a `Resistor` returns a `Range<Double>` representing
 all the values this `Resistor` covers, calculated using its `tolerance` rating.
 */
let fourBandToleranceValueRange = fourBand.toleranceValueRange
let fiveBandToleranceValueRange = fiveBand.toleranceValueRange
let sixBandToleranceValueRange = sixBand.toleranceValueRange
/*:
### coefficientValueRange(tempChange:)
 The `coefficientValueRange` property of a `Resistor` returns a `Range<Double>` representing
 the change in resistance from the specified `tempChange` using this `Resistor`'s `coefficient` rating.
 
 - Note:
 Because four and five band `Resistor`s don't have a `coefficient` rating this function will assume
 a rating of 0, and as such will just return a `Range<Double>` with an upper and lower bound the same
 as the `Resistor`s nominal `value`.
 */
let fourBandCoefficientValueRange = fourBand.coefficientValueRange(tempChange: 5)
let fiveBandCoefficientValueRange = fiveBand.coefficientValueRange(tempChange: 5)
let sixBandCoefficientValueRange = sixBand.coefficientValueRange(tempChange: 5)
//: [Using ResistorFactory >](@next)
