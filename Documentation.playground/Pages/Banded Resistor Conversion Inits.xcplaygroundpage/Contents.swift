//: [< Banded Resistor Failable Inits](@previous)
import Resistance
/*:
 # Banded Resistor Conversion Inits
 
 The banded resistor types have an initialiser variant that takes another banded resistor
 as its first parameter. This allows you to to convert to and from the various resistor
 types and, with the exception of `FourBandResistors`, will not throw an error because
 they already contain a valid value.
 */
let fourBand = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .blue)

let fiveBand = FiveBandResistor(resistor: fourBand)
let sixBand = SixBandResistor(resistor: fiveBand)
/*:
 By default, the conversion initialisers will use `.gold` as the tolerance rating. You
 can however, override this by specifying a new rating to use.
 */
let fiveBandWithSameTolerance = FiveBandResistor(resistor: fourBand)
let sameTolerance = fiveBandWithSameTolerance.tolerance

let fiveBandWithDifferentTolerance = FiveBandResistor(resistor: fourBand, tolerance: .yellow)
let differentTolerance = fiveBandWithDifferentTolerance.tolerance
/*:
 The `SixBandResistor` conversion initialiser will by default, create a six band resistor with a
 temperature coefficient rating of `.brown`. As with the tolerance rating this can be overridden
 by specifying a new rating to use.
 */
let sixBandDefaultCoefficient = SixBandResistor(resistor: fiveBand)
let brownCoefficient = sixBandDefaultCoefficient.coefficient

let sixBandNewCoefficient = SixBandResistor(resistor: fiveBand, coefficient: .yellow)
let yellowCoefficient = sixBandNewCoefficient.coefficient
/*:
 - Note:
 Because a five or six band resistor have three significant digits they can potentially
 represent a value that cannot be represented by a `FourBandResistor`. Because of this
 there are two conversion initialisers in `FourBandResistor`. One that throws an error
 if it can't represent the value and one that rounds the value to one that can be represented.
 */
let threeSigFigResistor = FiveBandResistor(digit1: .brown, digit2: .red, digit3: .orange, multiplier: .black, tolerance: .gold)
let threeSigFigResistorRounded = FourBandResistor(resistor: threeSigFigResistor)
//: - Note: This will throw an `invalidValueError`
do { _ = try FourBandResistor(exactResistor: threeSigFigResistor) }
catch { _ = error }
//: [ESeriesProtocol >](@next)
