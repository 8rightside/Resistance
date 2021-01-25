
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
    
    var sigFigs: Double {
        let digits = floor(log10(self))
        return self / pow(10, digits)
    }
    
    var powerOfTen: Double {
        floor(log10(self))
    }
    
    func sigFigsRounded(by sigFigs: Int) -> Self {
        let roundedSigFigs = (self.sigFigs * pow(10, Double(sigFigs) - 1)).rounded()
        return roundedSigFigs / pow(10, Double(sigFigs) - 1) * pow(10, self.powerOfTen)
    }
}
