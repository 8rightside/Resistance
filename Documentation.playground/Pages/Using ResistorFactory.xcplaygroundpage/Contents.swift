//: [< Resistor Type](@previous)
import Resistance
/*:
 # Using ResistorFactory
 
 Sometimes you'll want to create a `Resistor` from a value rather than coloured bands.
 When this is the case, you're going to want to use `ResistorFactory`.
 
 As you'll likely already know, the first two bands on a four band resistor, and the first
 three on a five or six band resistor represent the significant digits of the resistance
 value. Because of this not all values can be represented by a resistor. Only values
 that contain either two or three significant digits, depending on whether a four band or
 five/six band resistor is used.
 
 When using `ResistorFactory` you have the choice to either, round the value, or throw an
 error, depending on your use case if the value cannot be represented.
 
 ### Failable Functions
 The failable functions as the name suggests
 */

//:[Resistor Properties >](@next)
