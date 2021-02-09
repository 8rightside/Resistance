import Resistance

let fourBand = Resistor.fourBand(.green, .blue, .red, .gold)

let resistanceValue = fourBand.value            // 5600
print(fourBand.digits)                          // [green, blue]
print(fourBand.multiplier)                      // red
print(fourBand.tolerance)                       // gold

let sixBand = Resistor.sixBand(.blue, .grey, .black, .black, .gold, .brown)
print(sixBand.coefficient!)                     // brown

print(fourBand.digits.map(\.rawValue))               // [5, 6]
print(fourBand.multiplier.rawValue)                  // 100
print(fourBand.tolerance.rawValue)                   // 0.05
print(sixBand.coefficient!.rawValue)                 // 100
