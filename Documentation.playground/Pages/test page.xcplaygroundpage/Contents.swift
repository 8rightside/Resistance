import Resistance


let fourBand = Resistor.fourBand(.brown, .black, .orange, .gold)
let sixBand = Resistor.sixBand(.yellow, .violet, .black, .brown, .gold, .brown)

let toleranceValueRange = fourBand.toleranceValueRange
print(toleranceValueRange.upperBound)           // 10500.0
print(toleranceValueRange.lowerBound)           // 9500.0

let coefficientValueRange = sixBand.coefficientValueRange(tempChange: 5)
print(coefficientValueRange.upperBound)         // 4702.35
print(coefficientValueRange.lowerBound)         // 4697.65
