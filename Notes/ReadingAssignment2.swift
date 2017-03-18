//
//  ReadingAssignment2.swift
//  Calculator
//
//  Created by Doug Wells on 3/16/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

/*
 
 Type Aliases
 Type aliases define an alternative name for an existing type.
 refer to an existing type by a name that is descriptive
 typealias AudioSample = UInt16
 var maxAmplitudeFound = AudioSample.min
 Because it is an alias, the call to AudioSample.minactually calls UInt16.min

 Numeric Literals
 Represent numbers in different ways (1.25e2, binary, hexidec, etc)
 Numbers can contain extra formatting to make them easier to read
 padded with extra zeros and underscores for readability
 let paddedDouble = 000123.456
 let oneMillion = 1_000_000
 let justOverOneMillion = 1_000_000.000_000_1
 
 Converting number types
 Float/Double to Integer
 Int is simply truncated
 4.75 becomes 4, and -3.9 becomes -3
 Int(Double.pi)  // 3
 
 Functions w/Optional Tuple Return Types
 If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return with a question mark such as (Int, Int)? or (String, Int, Bool)?

 Closures & Capturing values
 A closure can capture constants and variables from the surrounding context/scope in which it was defined. The closure can then refer to and modify those values from within its body, even if the original scope no longer exists.
 
 func makeIncrementer(forIncrement amount: Int) -> () -> Int {
 var runningTotal = 0
 func incrementer() -> Int {
 runningTotal += amount
 return runningTotal
 }
 return incrementer
 }
 let plus10 = makeIncrementer(forIncrement: 10)
 plus10()	//10
 plus10()	//20
 Closures Are Reference Types
 We used “let” to define plus10.  How can a constant change?
 it is the choice of closure that plus10 refers to that is constant, and not the contents of the closure itself.
 What is constant is the reference to the function or closure.
 
 ===
 “Mutating” & value types (copy not ref)
 Structures and enums are value types. By default, the properties of a value type cannot be modified from within its instance methods.
 If you need to modify the properties of your structure or enumeration, you can opt in to mutating behavior for that method.
 struct Point {
 var x = 0.0, y = 0.0
 mutating func moveBy(x deltaX: Double, y deltaY: Double) {
 x += deltaX
 y += deltaY
 }
 }
 var somePoint = Point(x: 1.0, y: 1.0)
 somePoint.moveBy(x: 2.0, y: 3.0)
 print("The point is now at (\(somePoint.x), \(somePoint.y))")
 // Prints "The point is now at (3.0, 4.0)"
 
*/
