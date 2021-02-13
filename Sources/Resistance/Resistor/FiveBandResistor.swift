/*
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
*/

import Foundation

public struct FiveBandResistor: NewResistor {
    let digit1: Resistor.Digit
    let digit2: Resistor.Digit
    let digit3: Resistor.Digit
    public let multiplier: Resistor.Multiplier
    public let tolerance: Resistor.Tolerance
        
    public var value: Double {
        0
    }
    
    public var digits: [Resistor.Digit] {
        [digit1, digit2, digit3]
    }
}
