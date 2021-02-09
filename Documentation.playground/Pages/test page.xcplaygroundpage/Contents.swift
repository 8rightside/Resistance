import Resistance

let fourBand = Resistor.fourBand(.green, .blue, .red, .gold)

let resistanceValue = fourBand.value                        // 5600
let digitBands = fourBand.digits                            // [green, blue]
let multiplierBand = fourBand.multiplier                    // red
let toleranceBand = fourBand.tolerance                      // gold

let sixBand = Resistor.sixBand(.blue, .grey, .black, .black, .gold, .brown)
let coefficientBand = sixBand.coefficient!                  // brown

let digitsRawValues = digitBands.map(\.rawValue)            //
let multiplierRawValue = multiplierBand.rawValue
let toleranceRawValue = toleranceBand.rawValue
let coefficientRawValue = coefficientBand.rawValue
