import UIKit
import Resistance

func testValue(value: Double, tolerance: Resistor.Tolerance) -> Resistor {
    let exp = value < 0.1 ? floor(log10(value)) : floor(log10(value)) - 1
    let sigfigs = value / pow(10, exp)
    
    let band1 = Double(Int(sigfigs / 10))
    let band2 = sigfigs.truncatingRemainder(dividingBy: 10)
    let band3 = pow(10, exp)
    
    let digit1 = Resistor.Digit(rawValue: band1)!
    let digit2 = Resistor.Digit(rawValue: band2)!
    let digit3 = Resistor.Multiplier(rawValue: band3)!

    return Resistor.fourBand(digit1, digit2, digit3, tolerance)
}

let value = 0.01
let testResistor = testValue(value: value, tolerance: .gold)
