//: [< Conversion Functions](@previous)
import Resistance
/*:
 # ESeriesProtocol
 `Resistance` provides support for the use of the
 [E-Series standard set of preferred values](https://en.wikipedia.org/wiki/E_series_of_preferred_numbers).
 This functionality comes in the form of the `ESeriesProtocol`.
 This protocols only requirement is a property called `preferredValues`
 that returns a `Set<Int>`. This property should contain all the preferred
 values from the desired E-Series set represented as a three figure integer.
 
 All of the common E-Series sets have already been implemented for you. As a result
 you'll probably never have to conform to this protocol in practice, but on
 the off chance you do, below is how you would implement the now rarely used
 E3 series of preferred values.
 */
struct E3Series: ESeriesProtocol {
    var preferredValues: Set<Int> = [100, 220, 470]
}
/*:
 As mentioned above, all the common E-Series sets have been implemented for you.
 */
let e6 = E6Series()
let e12 = E12Series()
let e24 = E24Series()
let e48 = E48Series()
let e96 = E96Series()
let e192 = E192Series()
//: And the E3 set we implemented above:
let e3 = E3Series()
//: [ESeries Functions >](@next)
