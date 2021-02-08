//: [< ResistorFactory Round Functions](@previous)
import Resistance
/*:
 # ResistorFactory Failable Functions
 
 Whilst you'll probably use the functions from the previous page for most tasks, there may be
 situations where you don't want rounding, You may either want a resistor representing the value you
 specified or for the function to just fail. As you've no doubt guessed from the page title there
 are also failable functions that will either return a `Resistor` or throw an error if the passed
 value couldn't be represented.
 */
let factory = ResistorFactory()
//: This value can be represented so will return a `Resistor`.
let fourBand = try? factory.makeFourBandOrFail(value: 4500)
//: - Note: These function calls will throw errors.
do { _ = try factory.makeFourBandOrFail(value: 4560) }
catch { _ = error }

do { _ = try factory.makeFourBandOrFail(value: 0.002) }
catch { _ = error }

do { _ = try factory.makeFourBandOrFail(value: 999_999_999_999) }
catch { _ = error }
/*:
 Because five and six band `Resistor`s allow an extra significant figure, there are separate functions
 for making them.
 */
let fiveBand = try? factory.makeFiveBandOrFail(value: 123)
let sixBand = try? factory.makeSixBandOrFail(value: 321)
/*:
 There is also an optional parameter for the above functions that allows you to specify
 a tolerance rating for the returned `Resistor` with the default being `.gold`.
 */
let fourBandDefaultTolerance = try? factory.makeFourBandOrFail(value: 4500)
let goldTolerance = fourBandDefaultTolerance?.tolerance

let fourBandLowTolerance = try? factory.makeFourBandOrFail(value: 4500, tolerance: .blue)
let blueTolerance = fourBandLowTolerance?.tolerance
/*:
 And when using the makeSixBandOrFail function there is another optional parameter for
 specifying the temperature coefficient rating with the
 default being `.brown`.
 */
let sixBandDefaultToleranceAndCoefficient = try? factory.makeSixBandOrFail(value: 321)
let brownCoefficient = sixBandDefaultToleranceAndCoefficient?.coefficient

let sixBandLowToleranceAndCoefficient = try? factory.makeSixBandOrFail(value: 321, tolerance: .blue, coefficient: .yellow)
let yellowCoefficient = sixBandLowToleranceAndCoefficient?.coefficient
//: [ResistorFactory Conversion Functions >](@next)
