import Foundation
import Resistance

extension Double {
    var sigFigsCount: Int {
        guard self >= 1 else { return 0 }
        guard self != 1 else { return 1 }
        let digits = ceil(log10(self))
        var value = self
        var trailingZeros = 0
        while value.truncatingRemainder(dividingBy: 10) == 0 {
            value /= 10
            trailingZeros += 1
        }
        
        return Int(digits) - trailingZeros
    }
    
    var sigFigs: Double {
        let digits = floor(log10(self))
        return self / pow(10, digits)
    }
    
    var powerOfTen: Double {
        floor(log10(self))
    }
    
    var hundredsDecade: Double {
        let sigfigs = self.sigFigs
        let decade100To1000 = sigfigs * pow(10, 2)
        return decade100To1000.rounded()
    }
    
    func sigFigsRounded(by sigFigCount: Int) -> Self {
        let roundedSigFigs = (self.sigFigs * pow(10, Double(sigFigCount) - 1)).rounded()
        return roundedSigFigs / pow(10, Double(sigFigCount) - 1) * pow(10, self.powerOfTen)
    }
}

let preferedValues = [100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820]

func containsPreferedValue(_ value: Double) -> Bool {
    guard value.sigFigsCount < 4 else { return false }
    let sigfigs = value.hundredsDecade
    return preferedValues.contains(Int(sigfigs))
}



func nextValueUp(from value: Double) -> Double {
    let sigFigs = value.hundredsDecade
    var pv = preferedValues
    if !containsPreferedValue(sigFigs) {
        pv.append(Int(sigFigs))
        pv.sort()
    }
    let index = pv.firstIndex(of: Int(sigFigs))!
    let nextIndex = (index + 1) % pv.count
    let nextUpSigFigs = pv[nextIndex]
    let exp = index + 1 >= pv.count ? value.powerOfTen - 1 : value.powerOfTen - 2
    return Double(nextUpSigFigs) * pow(10, exp)
}

let value: Double = 110
let e12 = E12Series()
let result1 = e12.nextValueDown(from: value)
let result2 = e12.nearestPreferedValue(to: value)

let result3 = nextValueUp(from: value)
