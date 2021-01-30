
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
        self / pow(10, self.powerOfTen)
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
