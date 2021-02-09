//: [ESeries Functions](@previous)
import Resistance
/*:
 # Example Use Cases
 On this final page, I've provided an example of how you might use
 `Resistance`.
 \
 \
 \
 You want to calculate the value of two resistors.
 */
let fourBandResistor1 = Resistor.fourBand(.orange, .orange, .red, .silver)
let fourBandResistor2 = Resistor.fourBand(.orange, .red, .red, .silver)

let resistor1Value = fourBandResistor1.value
let resistor2Value = fourBandResistor2.value
//: You want to create a new `Resistor` with the combined resistance from the previous two.
let factory = ResistorFactory()
let combinedResistance = resistor1Value + resistor2Value

var fourBandResistor3 = factory.makeFourBand(value: combinedResistance, tolerance: .silver)
let resistor3Value = fourBandResistor3.value
//: You want to make sure it's in the E24 standard set.
let e24 = E24Series()

if !e24.containsPreferredValue(resistor3Value) {
    let preferredValue = e24.nextValueUp(from: fourBandResistor3.value)
    fourBandResistor3 = factory.makeFourBand(value: preferredValue)
}
//: You want it as a five band `Resistor` but with a tighter tolerance.
let fiveBand = factory.makeFiveBand(resistor: fourBandResistor3, tolerance: .gold)
//: You want to know what coloured bands it has.
let digitBands = fiveBand.digits
let multiplierBand = fiveBand.multiplier
let toleranceBand = fiveBand.tolerance
//: [[ Overview ]](Overview)
