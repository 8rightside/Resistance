import Foundation
import Resistance

let value1: Double = 47_000
let value2: Double = 1
let value3: Double = 0.1

func test(value: Double) -> Double {
    let exp = floor(log10(value))
    let sigfig = value / pow(10, exp)
    return sigfig
}

func getBand1(from: Double) -> Resistor.Digit {
    let sigfig = test(value: from)
    return Resistor.Digit(rawValue: Double(Int(sigfig))) ?? .brown
}

func getBand2(from: Double) -> Resistor.Digit {
    let sigfig = test(value: from)
    return Resistor.Digit(rawValue: round(sigfig.truncatingRemainder(dividingBy: 1) * 10)) ?? .black
}

func getBand3(from: Double) -> Resistor.Multiplier {
    let exp = floor(log10(from))
    return Resistor.Multiplier(rawValue: pow(10, exp - 1)) ?? .black
}

getBand1(from: value1)
getBand1(from: value2)
getBand1(from: value3)

getBand2(from: value1)
getBand2(from: value2)
getBand2(from: value3)

getBand3(from: value1)
getBand3(from: value2)
getBand3(from: value3)

let res = try! ResistorController().createFourBandOrFail(from: 47_000)
res.digits
res.multiplier

let res2 = try! ResistorController().createFourBandOrFail(from: 1)
res2.digits
res2.multiplier

let res3 = try! ResistorController().createFiveBandOrFail(from: 1)
res3.digits
res3.multiplier 

let res4 = try! ResistorController().createFiveBandOrFail(from: 0.1)
res4.digits
res4.multiplier
res4.tolerance


// let controller = ResistorController()
// let resistor = controller.createFourBandOrFail(from: 45_000)
// let e6 = ESeriesController(using: .e6)
//
// let e6Res = e6.nearestValue(to: resistor)
// let e6Res = e6.nearestValue(to: 45_000)
//
// let isESeries = e6.
//
// let preferedValues = e6.preferedValues(for:

