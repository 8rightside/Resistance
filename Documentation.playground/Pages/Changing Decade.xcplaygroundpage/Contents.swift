//: [Banded Resistor Properties](@previous)
import Resistance
/*:
 # Changing Decade
 Because the `Multiplier` band of a resistor represents a power of ten
 to multiply the significant figures with, it's essentially just a way to move
 the decimal point forward or back. So by changing it you can change the decade
 of the resistors value.
 ### decadeUp and decadeDown
 */
let fourBand = FourBandResistor(digit1: .green, digit2: .orange, multiplier: .gold, tolerance: .gold)

let tens = fourBand.decadeUp()
let hundreds = tens.decadeUp()
let thousands = hundreds.decadeUp()

let fractions = fourBand.decadeDown()
//: [Tolerance and TempCo Ranges](@next)
