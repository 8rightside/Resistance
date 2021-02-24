<p align="center">
    <img src="logo.png" width="100%" alt=“Resistance” />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.3-blue.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-blue.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-mac+linux-blue.svg?style=flat" alt="Mac + Linux" />
</p>

**Resistance** is a Swift library for creating and manipulating resistors and their values. It was designed to be easy to use whilst still providing plenty of features including:

- An easy to use API
- Support for four, five, and six band resistors
- E-Series standards functionality
- Tolerance and temperature coefficient calculations
- Swift Playground documentation

## Usage
### Banded Resistor Types
 The most basic, and thing you'll probably want to do most often, is to create a resistor. A `BandedResistor` is represented using a struct with properties for the `Digit`, `Multiplier` and `Tolerance` bands. These properties are each represented by an enum and passed in during initialisation. The following demonstrates how simple it is to create a new resistor type.
```swift
let fourBand1 = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .gold)

let fiveBand1 = FiveBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold)

let sixBand1 = SixBandResistor(digit1: .brown, digit2: .black, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)
```

### Banded Resistor Properties
The banded resistor types all adopt the `BandedResistor` protocol meaning they all expose properties for their `multiplier` and `tolerance` values as well as an array containing their significant `digit`'s. Additionally there is a computed property for the resistance value.
```swift
let fourBand = FourBandResistor(digit1: .green, digit2: .blue, multiplier: .red, tolerance: .gold)

let resistanceValue = fourBand.value            // 5600
print(fourBand.digits)                          // [green, blue]
print(fourBand.multiplier)                      // red
print(fourBand.tolerance)                       // gold

let sixBand = SixBandResistor(digit1: .blue, digit2: .grey, digit3: .red, multiplier: .red, tolerance: .gold, coefficient: .brown)

print(sixBand.coefficient)                     // brown

print(fourBand.digits.map(\.rawValue))          // [5.0, 6.0]
print(fourBand.multiplier.rawValue)             // 100.0
print(fourBand.tolerance.rawValue)              // 0.05
print(sixBand.coefficient.rawValue)            // 100.0
```

### Calculating Tolerance and Temperature Coefficient Ranges
The banded resistor types also contain a property for calculating the tolerance range. And in the case of `SixBandResistor`, a function for calculating the resistance flux range for a given temperature change. Both return a `Range<Double>` meaning you can make use of all the functions `Range` provides.
```swift
let fourBand = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .orange, tolerance: .gold)

let sixBand = SixBandResistor(digit1: .yellow, digit2: .violet, digit3: .black, multiplier: .brown, tolerance: .gold, coefficient: .brown)

let toleranceValueRange = fourBand.toleranceValueRange
print(toleranceValueRange.upperBound)           // 10500.0
print(toleranceValueRange.lowerBound)           // 9500.0

let coefficientValueRange = sixBand.coefficientValueRange(tempChange: 5)
print(coefficientValueRange.upperBound)         // 4702.35
print(coefficientValueRange.lowerBound)         // 4697.65
```

### Turning a Value into a Resistor
Sometimes you'll want to create a resistor from a value rather than coloured bands. When this is the case, you can use the use various other initialisers of the resistor types..

Because not all values can be represented by the bands of a resistor, when using the `init(value:)` initialisers you have the choice to either, round the value, or throw and error, if such a value is encountered.
```swift
let roundedUpFourBand = FourBandResistor(value: 456, tolerance: .silver)
let sixBand = SixBandResistor(value: 454, tolerance: .silver, coefficient: .yellow)

print(roundedUpFourBand)                        // 460 Ω
print(sixBand)                                  // 454 Ω

do {
    let tooManyDigits = try FiveBandResistor(value: 1234, tolerance: .silver)
} catch {
    print(error)                                // invalidValueError
}
```

### Converting Resistors
For converting between the different resistor types, you can use the `init(resistor:)` initialisers. These initialisers take another resistor as their first parameter and use the value of it to create a new one with the default tolerance of `.gold` and coefficient default of `.brown`. These defaults can be overridden by passing them along with the resistor.

```swift
let fourBand = FourBandResistor(digit1: .brown, digit2: .black, multiplier: .red, tolerance: .gold)

let fiveBand = FiveBandResistor(resistor: fourBandResistor)
let sixBand = SixBandResistor(resistor: fiveBandResistor, coefficient: .yellow)

print(fourBand)                         // 1 KΩ
print(fiveBand)                         // 1 KΩ
print(sixBand)                          // 1 KΩ
```

### E-Series functionality
`Resistance` provides support for the use of the [E-Series standard set of preferred values][1]. This functionality comes in the form of the `ESeriesProtocol`.
There are already implementations for all the common sets of preferred values and using them if fairly straightforward.
```swift
let fiveBand = FiveBandResistor(digit1: .blue, digit2: .green, digit3: .black, multiplier: .brown, tolerance: .gold)

let value = fiveBandResistor.value
print(value)                                    // 6500.0

let e6 = E6Series()
print(e6.preferredValues.sorted())              // [100, 150, 220, 330, 470, 680]

let valueInSeries = e6.containsPreferredValue(value)
print(valueInSeries)                            // false

let nextUp = e6.nextValueUp(from: value)
let nextDown = e6.nextValueDown(from: value)
    
print(nextUp)                                   // 6800.0
print(nextDown)                                 // 4700.0
```


## Swift Playground Documentation
If you'd like a more comprehensive overview of the API, `Resistance` includes a Swift Playground file in the Package with detailed instructions and runnable example code to make it easy to learn. 

## Installing
`Resistance` is distributed using the [Swift Package Manager][2]. To import it using Xcode, follow 
this [guide][3].
Or add it as a dependency within your Package.swift manifest:
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/8rightside/resistance.git", from: "1.0.0")
    ],
    targets: [
        .target( name: "YourTarget", dependencies: ["Resistance"]),
    ]
    ...
)
```
Don't forget to import it where needed.
```swift
import Resistance
```

## Requirements
* Swift 5.3

## License
Resistance is released under the MIT license. See LICENCE for details.

[1]:	https://en.wikipedia.org/wiki/E_series_of_preferred_numbers
[2]:	https://swift.org/package-manager/
[3]:	https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
