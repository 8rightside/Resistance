//: [< Tolerance and TempCo Ranges](@previous)
import Resistance
/*:
 # Banded Resistor Round Inits
 
 Sometimes you'll want to create a resistor from a value rather than coloured bands.
 When this is the case, you can use the use various other initialisers of the resistor types.
 
 As you'll likely already know, the first two bands on a four band resistor, and the first
 three on a five or six band resistor represent the significant digits of the resistance
 value. Because of this not all values can be represented by a resistor. Only values
 that contain either two or three significant digits, depending on whether a four band or
 five/six band resistor is used.
 
 The following banded resistor initialisers will first round the value passed to them,
 and then return a resistor that represents this value.
 */
let roundedUpFourBand = FourBandResistor(value: 456)
let roundedDownFourBand = FourBandResistor(value: 454)
/*:
 There are also initialisers for four and five band resistors that account for the extra
 significant digit.
 */
let roundedUpFiveBand = FiveBandResistor(value: 4567)
let roundedDownSixBand = SixBandResistor(value: 9654)
/*:
 There is also an optional parameter for the above functions that allows you to specify
 a tolerance rating for the returned `Resistor` with the default being `.gold`.
 */
let fourBandDefaultTolerance = FourBandResistor(value: 4500)
let goldTolerance = fourBandDefaultTolerance.tolerance

let fourBandLowTolerance = FourBandResistor(value: 4500, tolerance: .blue)
let blueTolerance = fourBandLowTolerance.tolerance
/*:
  And the `SixBandResistor` type has another optional parameter for specifying the
 temperature coefficient rating with the default being `.brown`.
 */
let sixBandDefaultTempCo = SixBandResistor(value: 321)
let brownCoefficient = sixBandDefaultTempCo.coefficient

let sixBandLowToleranceAndTempCo = SixBandResistor(value: 321, tolerance: .blue, coefficient: .yellow)
let yellowCoefficient = sixBandLowToleranceAndTempCo.coefficient
//:[Banded Resistor Failable Inits >](@next)
