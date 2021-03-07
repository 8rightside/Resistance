//: [Banded Resistor Conversion Inits](@previous)
import Resistance
/*:
 # Conversion Functions
 
 The `BandedResistor` types all provide functions for converting to and from each other.
 The newly created resistor will have the same `tolerance` value as the resistor it was
 converted from.
 */
let fourBand = FourBandResistor(value: 3300, tolerance: .green)
let fiveBand = fourBand.convertToFiveBand()

let greenTolerance = fiveBand.tolerance
/*
 When converting to a `SixBandResistor` you can specify a temperature coefficient value
 to add to the newly created resistor or a default of `.brown` will be used.
 */
let sixBandDefaultTempCo = fiveBand.convertToSixBand()
let sixBandNewTempCo = fourBand.convertToSixBand(addingCoefficient: .yellow)

let brownTempCo = sixBandDefaultTempCo.coefficient
let yellowTempCo = sixBandNewTempCo.coefficient
//: [ESeriesProtocol](@next)
