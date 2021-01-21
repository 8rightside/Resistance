import Foundation
import Resistance

let value1: Double = 47_000
let value2: Double = 1
let value3: Double = 0.1

// let controller = ResistorController()
// let resistor = controller.createFourBandOrFail(from: 45_000)
// let e6 = ESeriesController(using: .e6)
//
// let e6Res = e6.nearestValue(to: resistor)
// let e6Res = e6.nearestValue(to: 45_000)
//
// let isESeries = e6.inSeries(resistor)
// let isESeries = e6.inSeries(47_000)
//
// let preferedValues = e6.preferedValues

let resistor = ResistorFactory().makeFourBand(value: 1000)

let range = resistor.valueRange
