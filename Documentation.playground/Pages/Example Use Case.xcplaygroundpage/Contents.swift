//: [ESeries Functions](@previous)
import Resistance
/*:
 # Example Use Case
 On this final page, I've provided an example of how you might use
 `Resistance`.
 \
 \
 \
 You want to calculate the value of two resistors.
 */
let fourBand1 = FourBandResistor(digit1: .orange, digit2: .orange, multiplier: .red, tolerance: .silver)
let fourBand2 = FourBandResistor(digit1: .orange, digit2: .red, multiplier: .red, tolerance: .silver)

let resistor1Value = fourBand1.value
let resistor2Value = fourBand2.value
//: You want to create a new resistor with the combined resistance from the previous two.
let combinedResistance = resistor1Value + resistor2Value

var fourBand3 = FourBandResistor(value: combinedResistance, tolerance: .silver)
let resistor3Value = fourBand3.value
//: You want to make sure it's in the E24 standard set.
let e24 = E24Series()

if !e24.containsPreferredValue(fourBand3) {
    let preferredValue = e24.nextValueUp(from: fourBand3)
    fourBand3 = FourBandResistor(value: preferredValue, tolerance: .silver)
}
//: You want it as a five band resistor but with a tighter tolerance.
let fiveBand = FiveBandResistor(resistor: fourBand3, tolerance: .gold)
//: You want to know what coloured bands it has.
let digitBands = fiveBand.digits
let multiplierBand = fiveBand.multiplier
let toleranceBand = fiveBand.tolerance
//: [[ Overview ]](Overview)
