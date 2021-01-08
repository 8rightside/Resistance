import Foundation
import Resistance

let num: Double = 3
let test = num < 0.1 ? floor(log10(num)) : floor(log10(num)) - 1
