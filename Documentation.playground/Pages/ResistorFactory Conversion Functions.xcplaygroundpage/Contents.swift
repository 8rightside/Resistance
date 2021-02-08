//: [< ResistorFactory Failable Functions](@previous)
import Resistance
/*:
 # ResistorFactory Conversion Functions
 
 The `ResistorFactory` functions have a variant that takes a `Resistor` as their
 first parameter instead of a `Double` as with the calls from the previous pages.
 This allows you to use them to perform various conversions and, with the exception
 of making a four band `Resistor` – shown at the bottom of the page – will not throw
 an error because they already contain a valid value.
 */
let factory = ResistorFactory()

let fourBandResistor = Resistor.fourBand(.brown, .black, .red, .gold)

let fiveBandResistor = factory.makeFiveBand(resistor: fourBandResistor)
let sixBandResistor = factory.makeSixBand(resistor: fiveBandResistor)
/*:
 By default, the conversion functions will take the tolerance rating from the passed in
 `Resistor` and use that for the tolerance rating of the newly created `Resistor`. You
 can however, override this by specifying a new rating to use.
 */
let fiveBandWithSameTolerance = factory.makeFiveBand(resistor: fourBandResistor)
let sameTolerance = fiveBandWithSameTolerance.tolerance

let fiveBandWithDifferentTolerance = factory.makeFiveBand(resistor: fourBandResistor, tolerance: .yellow)
let differentTolerance = fiveBandWithDifferentTolerance.tolerance
/*:
 The makeSixBand conversion function will by default, create a six band `Resistor` with a
 temperature coefficient rating of `.brown` if a four or five band `Resistor` is passed in.
 If a six band `Resistor` is passed in then it's temperature coefficient will be used as the
 default instead. As with the tolerance rating this can be overridden by specifying a new
 rating to use.
 */
let fourBandNoCoefficient = Resistor.fourBand(.green, .blue, .red, .gold)
let sixBandYellowCoefficient = Resistor.sixBand(.orange, .orange, .black, .brown, .gold, .yellow)

let sixBandDefaultCoefficient = factory.makeSixBand(resistor: fourBandNoCoefficient)
let brownCoefficient = sixBandDefaultCoefficient.coefficient

let sixBandSameCoefficient = factory.makeSixBand(resistor: sixBandYellowCoefficient)
let yellowCoefficient = sixBandSameCoefficient.coefficient

let sixBandNewCoefficient = factory.makeSixBand(resistor: sixBandYellowCoefficient, coefficient: .blue)
let blueCoefficient = sixBandNewCoefficient.coefficient
/*:
 - Note:
 Because a five or six band `Resistor` have three significant digits they can potentially
 represent a value that cannot be represented by a four band `Resistor`. Because of this
 the conversion functions offer two variants for creating four band `Resistor`'s. One
 that throws an error if it can't represent the value and one that rounds the value to one
 that can be represented.
 */
let threeSigFigResistor = Resistor.fiveBand(.brown, .red, .orange, .black, .gold)

let threeSigFigResistorRounded = factory.makeFourBand(resistor: threeSigFigResistor)
//: - Note: This will throw an `invalidValueError`
do { _ = try factory.makeFourBandOrFail(resistor: threeSigFigResistor) }
catch { _ = error }
//: [ESeriesProtocol >](@next)
