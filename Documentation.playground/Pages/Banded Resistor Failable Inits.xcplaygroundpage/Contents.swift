//: [< Banded Resistor Round Inits](@previous)
import Resistance
/*:
 # Banded Resistor Failable Inits
 
 Whilst you'll probably use the functions from the previous page for most tasks, there may be
 situations where you don't want rounding, You may either want a resistor representing the value you
 specified or for initialisation to just fail. As you've no doubt guessed from the page title there
 are also failable initialisers that will either return a resistor or throw an error if the passed
 value couldn't be represented.
 \
 \
 \
 This value can be represented so will return a `FourBandResistor`.
 */
//let fourBand = try? factory.makeFourBandOrFail(value: 4500)
let fourBand = try? FourBandResistor(exactValue: 4500)
//: - Note: These function calls will throw errors.
do { _ = try FourBandResistor(exactValue: 4560) }
catch { _ = error }

do { _ = try FourBandResistor(exactValue: 0.002) }
catch { _ = error }

do { _ = try FourBandResistor(exactValue: 999_999_999_999) }
catch { _ = error}
/*:
 Five and six band resistors initialisers allow for an extra significant figure.
 */
let fiveBand = try? FiveBandResistor(exactValue: 123)
let sixBand = try? SixBandResistor(exactValue: 321)
/*:
 There is also an optional parameter for the above initialisers that allows you to specify
 a tolerance rating for the returned resistor with the default being `.gold`.
 */
let fourBandDefaultTolerance = try? FourBandResistor(exactValue: 4500)
let goldTolerance = fourBandDefaultTolerance?.tolerance

let fourBandLowTolerance = try? FourBandResistor(exactValue: 4500, tolerance: .blue)
let blueTolerance = fourBandLowTolerance?.tolerance
/*:
 And when initialising a `SixBandResistor` there is another optional parameter for
 specifying the temperature coefficient rating with the default being `.brown`.
 */
let sixBandDefaultToleranceAndCoefficient = try? SixBandResistor(exactValue: 321)
let brownCoefficient = sixBandDefaultToleranceAndCoefficient?.coefficient

let sixBandLowToleranceAndCoefficient = try? SixBandResistor(exactValue: 321, tolerance: .blue, coefficient: .yellow)
let yellowCoefficient = sixBandLowToleranceAndCoefficient?.coefficient
//: [Banded Resistor Conversion Inits >](@next)
