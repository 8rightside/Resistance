/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Foundation

extension Double {
    // can only count up to 14 sig figs reliably due to double limitations
    var sigFigsCount: Int {
        guard self != 1 else { return 1 }
        var value = self * pow(10, 3)       // allow checking of values to 3 decimal places
        value = trunc(value)                // get rid of the floating point garbage
        let digits = ceil(log10(value))
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
