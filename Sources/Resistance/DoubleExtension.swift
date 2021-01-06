
import Foundation

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

    var fourBandExponent: Double {
        self < 0.1 ? floor(log10(self)) : floor(log10(self)) - 1
    }
    
    var fourBandSigFigs: Double {
        self / pow(10, self.fourBandExponent)
    }
    
    var fourBandDigit1: Double {
        Double(Int(self.fourBandSigFigs / 10))
    }
    
    var fourBandDigit2: Double {
        self.fourBandSigFigs.truncatingRemainder(dividingBy: 10)
    }
    
    var fourBandMultiplier: Double {
        pow(10, self.fourBandExponent)
    }
}
