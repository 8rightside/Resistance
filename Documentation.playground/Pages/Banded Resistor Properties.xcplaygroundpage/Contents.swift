//: [< Banded Resistor Types](@previous)
import Resistance
/*:
 # Banded Resistor Properties
 The banded resistor types all adopt the `BandedResistor` protocol meaning they all expose
 properties for their `multiplier` and `tolerance` values as well as an array containing
 their significant `digit`'s. Additionally there is a computed property for the resistance
 value.
 */
let fourBand = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .brown, tolerance: .gold)
let fiveBand = FiveBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold)
let sixBand = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .red, multiplier: .red, tolerance: .gold, coefficient: .brown)
/*:
 ### value
 To get the resistance value the resistor represents just use the `value` computed property on any resistor.
 */
let fourBandResistance = fourBand.value
let fiveBandResistance = fiveBand.value
let sixBandResistance = sixBand.value
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
 To get the multiplier simply use the `multiplier` property.
 */
let fourBandMultiplier = fourBand.multiplier
let fiveBandMultiplier = fiveBand.multiplier
let sixBandMultiplier = sixBand.multiplier
/*:
 ### tolerance
 And to get the tolerance rating use the `tolerance` property.
 */
let fourBandTolerance = fourBand.tolerance
let fiveBandTolerance = fiveBand.tolerance
let sixBandTolerance = sixBand.tolerance
/*:
 ### coefficient
 When using a `SixBandResistor` you'll have access to the additional `coefficient` property.
 */
let sixBandCoefficient = sixBand.coefficient
/*:
 ### rawValues
 With the exception of `value`, all of the above properties are defined using enums,
 each having a `rawValue` property for its represented value. This makes it easy
 to gain access to these values.
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

let sixBandCoefficientValue = sixBandCoefficient.rawValue
//: [Changing Decade >](@next)
