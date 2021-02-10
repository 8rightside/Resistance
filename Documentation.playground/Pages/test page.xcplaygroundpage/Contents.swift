import Resistance


let factory = ResistorFactory()

let roundedUpFourBand = factory.makeFourBand(value: 456, tolerance: .silver)
let sixBand = factory.makeSixBand(value: 454, tolerance: .silver, coefficient: .yellow)

print(roundedUpFourBand)                        // 460 Ω
print(sixBand)                                  // 450 Ω

do {
    let failedFiveBand = try factory.makeFiveBandOrFail(value: 1234, tolerance: .silver)
} catch {
    print(error)                                // invalidValueError
}
