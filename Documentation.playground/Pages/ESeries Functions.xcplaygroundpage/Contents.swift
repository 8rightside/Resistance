//: [< ESeriesProtocol](@previous)
import Resistance
/*:
 # ESeries Functions
 There are only a few ESeries functions, so using them if fairly straight forward.
 Firstly create an instance conforming to the ESeriesProtocol. This can be one
 of the already implemented types or one of your own.
 */
let e12 = E12Series()
/*:
 ### preferredValues
 If you read the previous page you'll already know this property returns a `Set<Int>`
 containing all the preferred values from this E-Series set represented as a
 three figure integer.
 */
let preferredValues = e12.preferredValues
let sortedPreferredValues = preferredValues.sorted()
/*:
 ### containsPreferredValue(_:)
 This function takes a resistance value and returns `true` if the value is present
 in this E-Series' list of preferred values. There is also an overloaded version that
 accepts a resistor
 */
let validPreferredValue = e12.containsPreferredValue(4.7)
let invalidPreferredValue = e12.containsPreferredValue(23)
/*:
 ### nextValueUp(from:)
 This function takes a resistance value and returns the next value up from it
 from this E-Series' list of preferred values. There is also an overloaded version that
 accepts a resistor
 */
let preferredValue: Double = 6800
let nonPreferredValue: Double = 6700

let nextUp1 = e12.nextValueUp(from: preferredValue)
let nextUp2 = e12.nextValueUp(from: nonPreferredValue)
/*:
 ### nextValueDown(from:)
 This function takes a resistance value and returns the next value down from it
 from this E-Series' list of preferred values. There is also an overloaded version that
 accepts a resistor
 */
let nextDown1 = e12.nextValueDown(from: preferredValue)
let nextDown2 = e12.nextValueDown(from: nonPreferredValue)
//: [Example Use Case >](@next)  
