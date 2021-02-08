//: [< Tolerance and TempCo Ranges](@previous)
import Resistance
/*:
 # ResistorFactory Round Functions
 
 Sometimes you'll want to create a `Resistor` from a value rather than coloured bands.
 When this is the case, you're going to want to use `ResistorFactory`.
 
 As you'll likely already know, the first two bands on a four band resistor, and the first
 three on a five or six band resistor represent the significant digits of the resistance
 value. Because of this not all values can be represented by a resistor. Only values
 that contain either two or three significant digits, depending on whether a four band or
 five/six band resistor is used.
 
 The following `ResistorFactory` functions will first round the value passed to them,
 and then return a `Resistor` that represents this value.
 */
let factory = ResistorFactory()

let roundedUpFourBand = factory.makeFourBand(value: 456)
let roundedDownFourBand = factory.makeFourBand(value: 454)
/*:
 There are separate functions for creating five and six band resistors
 as they can contain an extra significant figure.
 */
let roundedUpFiveBand = factory.makeFiveBand(value: 4567)
let roundedDownSixBand  = factory.makeSixBand(value: 9654)
/*:
 There is also an optional parameter for the above functions that allows you to specify
 a tolerance rating for the returned `Resistor` with the default being `.gold`.
 */
let fourBandDefaultTolerance = factory.makeFourBand(value: 4500)
let goldTolerance = fourBandDefaultTolerance.tolerance

let fourBandLowTolerance = factory.makeFourBand(value: 4500, tolerance: .blue)
let blueTolerance = fourBandLowTolerance.tolerance
/*:
 And when using the makeSixBand function there is another optional parameter for
 specifying the temperature coefficient rating with the
 default being `.brown`.
 */
let sixBandDefaultTempCo = factory.makeSixBand(value: 321)
let brownCoefficient = sixBandDefaultTempCo.coefficient

let sixBandLowToleranceAndTempCo = factory.makeSixBand(value: 321, tolerance: .blue, coefficient: .yellow)
let yellowCoefficient = sixBandLowToleranceAndTempCo.coefficient
//:[ResistorFactory Failable Functions >](@next)
