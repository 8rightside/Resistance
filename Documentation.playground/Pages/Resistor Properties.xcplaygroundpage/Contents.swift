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
//: [Using ResistorFactory >](@next)
