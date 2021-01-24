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
    
    var fiveBandExponent: Double {
        self < 1 ? floor(log10(self)) - 1 : floor(log10(self)) - 2
    }
}

let value: Double = 0.1
let e6 = ESeries.e6
let inSeries = e6.containsPreferedValue(value)

func testfunc(value: Double) -> Bool {
    guard value > 0.1 else { return false }
    guard value < 999_000_000_000 else { return false }
    guard value.sigFigsCount <= 3 else { return false }
    
    let x = value.sigFigs
    let y = Int((x * pow(10, 2)).rounded())
    return ESeries.e6.preferedValues.contains(y)
}

let test = testfunc(value: value)

let pot = floor(log10(value))
