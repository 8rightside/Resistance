//: [< Resistor Properties](@previous)
import Resistance
/*:
 # Using ResistorFactory
 
 Sometimes you'll want to create a `Resistor` from a value rather than coloured bands.
 When this is the case, you're going to want to use `ResistorFactory`.
 
 As you'll likely already know, the first two bands on a four band resistor, and the first
 three on a five or six band resistor represent the significant digits of the resistance
 value. Because of this not all values can be represented by a resistor. Only values
 that contain either two or three significant digits, depending on whether a four band or
 five/six band resistor is used.
 
 When using `ResistorFactory` you have the choice to either, round the value, or throw an
 error, depending on your use case if the value cannot be represented.
 
 ### Failable Functions
 As the name suggests, the failable functions will either return a `Resistor` or throw an error
 depending on whether the passed value could be represented or not.
 */
let factory = ResistorFactory()
let fourBand = try? factory.makeFourBandOrFail(value: 4500)

// invalidValueError, too many significant figures
do { _ = try factory.makeFourBandOrFail(value: 4560) }
catch { _ = error }

// lowValueError, value too low
do { _ = try factory.makeFourBandOrFail(value: 0.002) }
catch { _ = error }

// highValueError, value too high
do { _ = try factory.makeFourBandOrFail(value: 999_999_999_999) }
catch { _ = error }
/*:
 There are separate functions for making five band and six band resistors with these
 allowing for an extra significant figure.
 */
let fiveBand = try? factory.makeFiveBandOrFail(value: 123)
let sixBand = try? factory.makeSixBandOrFail(value: 321)
/*:
 There is also an optional parameter for the above functions that allows you to specify
 a tolerance rating for the returned `Resistor` with the default being `.gold`.
 */
let fourBandLowTolerance = try? factory.makeFourBandOrFail(value: 4500, tolerance: .blue)
/*:
 And when using the makeSixBandOrFail function there is another optional parameter for
 specifying the temperature coefficient rating with the
 default being `.brown`.
 */
let sixBandLowTempCo = try? factory.makeSixBandOrFail(value: 321, coefficient: .yellow)
let sixBandLowToleranceAndTempCo = try? factory.makeSixBandOrFail(value: 321, tolerance: .blue, coefficient: .yellow)
/*:
 ---
 ### Round Functions
 The round functions work the same way as the failable ones except that when given a value
 that can't be represented, they will round the value to something that can be represented
 and create a `Resistor` using that rather than throw an error.
 */
let roundedUpFourBand = factory.makeFourBand(value: 456)
let roundedDownFourBand = factory.makeFourBand(value: 454)
/*:
 Again there are separate functions for five and six band resistors that can use an extra significant figure
 */
let roundedUpFiveBand = factory.makeFiveBand(value: 4567)
let roundedDownSixBand  = factory.makeSixBand(value: 9654)
/*:
 There is also an optional parameter for the above functions that allows you to specify
 a tolerance rating for the returned `Resistor` with the default being `.gold`.
 */
let roundedFourBandLowTolerance = factory.makeFourBand(value: 4500, tolerance: .blue)
/*:
 And when using the makeSixBandOrFail function there is another optional parameter for
 specifying the temperature coefficient rating with the
 default being `.brown`.
 */
let roundedSixBandLowTempCo = factory.makeSixBand(value: 321, coefficient: .yellow)
let roundedSixBandLowToleranceAndTempCo = factory.makeSixBand(value: 321, tolerance: .blue, coefficient: .yellow)
/*:
 ---
 ### Conversion Functions
 All of the `ResistorFactory` functions have a variant that takes a `Resistor` as their
 first parameter instead of a `Double` that enables conversion between the different resistor types.
 */
let fourBandResistor = Resistor.fourBand(.brown, .black, .red, .gold)

let fiveBandResistor = factory.makeFiveBand(resistor: fourBandResistor)
let sixBandResistor = factory.makeSixBand(resistor: fiveBandResistor)
/*:
 By default, the conversion functions will take the tolerance rating from the passed in
 `Resistor` and use that for the tolerance rating of the newly created `Resistor`. You
 can however, override this by specifying a new rating to use.
 */
let fiveBandWithDifferentTolerance = factory.makeFiveBand(resistor: fourBandResistor, tolerance: .yellow)
/*:
 The makeSixBand conversion function will by default, create a six band `Resistor` with a
 temperature coefficient rating of `.brown` if a four or five band `Resistor` is passed in.
 If a six band `Resistor` is passed in then it's temperature coefficient will be used as the
 default instead. As with the tolerance rating this can be overridden by specifying a new
 rating to use.
 */

//:[Tolerance and TempCo Ranges >](@next)
