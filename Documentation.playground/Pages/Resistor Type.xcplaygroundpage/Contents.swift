/*
 * This playground is best viewed using the Render Documention
 * option found in Playground Settings in the file inspector
*/

import Resistance
/*:
 # The Resistor type
 The most basic, and likely the thing you'll want to do most often, is to create a resistor. A `Resistor` is represented using an enum with associated values for the digit, multiplier and tolerance bands, themselves represented by an enums. The following demonstates how simple it is to create a new resistor variable.
 
 ### Four Band Resistor
 To create a four band `resistor` just pass the two digit bands followed by the multiplier and tolerance bands
 */
let fourBand1 = Resistor.fourBand(.brown, .black, .red, .gold)
let fourBand2 = Resistor.fourBand(.yellow, .violet, .orange, .gold)
let fourBand3 = Resistor.fourBand(.blue, .grey, .brown, .gold)
/*:
 ### Five Band Resistor
 Creating a five band `resistor` is similar to a four band except with the addition of a third digit band before the multiplier and tolerance bands
 */
let fiveBand1 = Resistor.fiveBand(.brown, .black, .black, .brown, .gold)
let fiveBand2 = Resistor.fiveBand(.yellow, .violet, .black, .red, .gold)
let fiveBand3 = Resistor.fiveBand(.blue, .grey, .black, .black, .gold)
/*:
 ### Six Band Resistor
 Creating a six band `resistor` is the same as creating a five band with an extra band at the end for the temparature coefficient value
 */
let sixBand1 = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown)
let sixBand2 = Resistor.sixBand(.yellow, .violet, .blue, .red, .gold, .brown)
let sixBand3 = Resistor.sixBand(.blue, .grey, .black, .black, .gold, .brown)
