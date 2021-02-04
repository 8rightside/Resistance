<p align="center">
    <img src="logo.png" width="100%" alt=“Ink” />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.3-blue.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-blue.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-mac+linux-blue.svg?style=flat" alt="Mac + Linux" />
</p>

**Resistance** is a Swift library for creating and manipulating resistors and their values. It was designed to be easy to use whilst still providing plenty of features including:

- Easy to use API for creating resistors
- E-Series standards functionality
- Tolerance and temperature coefficient calculations
- Swift Playground full of example code

## Usage
### Creating a resistor
Likely the most common thing you'll want to do is create a `Resistor`. Whether that be from specifiying the bands or by passing a value it couldn't be easier.
```swift
import Resistance

// To create using bands
let fourBand = Resistor.fourBand(.brown, .black, .red, .gold)
let fiveBand = Resistor.fiveBand(.brown, .black, .black, .brown, .gold)
let sixBand = Resistor.sixBand(.brown, .black, .black, .brown, .gold, .brown)
```


## Installing


## Requirements
* Swift 5.3

## License
Resistance is released under the MIT license. See LICENCE for details.
