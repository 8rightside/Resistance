
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
    
    var fiveBandExponent: Double {
        self < 1 ? floor(log10(self)) - 1 : floor(log10(self)) - 2
    }
    
    var roundedForFourBand: Double {
        var sigFigs = self / pow(10, self.fourBandExponent)
        sigFigs.round()
        return sigFigs * pow(10, self.fourBandExponent)
    }
    
    var roundedForFiveBand: Double {
        var sigFigs = self / pow(10, self.fiveBandExponent)
        sigFigs.round()
        return sigFigs * pow(10, self.fiveBandExponent)
    }
}
