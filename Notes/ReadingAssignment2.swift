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
 
 === Methods:  Mutating, Instance Methods, Type Methods ===
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
 
 Type Methods
 Definition:  Instance methods are methods that are called on an instance of a particular type. You can also define methods that are called on the type itself. These kinds of methods are called type methods. You indicate type methods by writing the static keyword before the func keyword.
 
 
 Example:
 struct LevelTracker {
 static var highestUnlockedLevel = 1
 var currentLevel = 1
 
 static func unlock(_ level: Int) {
 if level > highestUnlockedLevel { highestUnlockedLevel = level }
 }
 
 static func isUnlocked(_ level: Int) -> Bool {
 return level <= highestUnlockedLevel
 }
 }
 
 ===Subscripts===
 
 Struct w/subscript & associated value
 
 struct TimesTable {
 let multiplier: Int
 subscript(index: Int) -> Int {
 return multiplier * index
 }
 }
 let threeTimesTable = TimesTable(multiplier: 3)
 print("six times three is \(threeTimesTable[6])")
 // Prints "six times three is 18"

 
 
 ===@IBDesignable @ IBInspectable===
 
 @IBDesignable
 @ IBDesignable - Lets you see updated view in storyboard
 @IBInspectable - Modify variables in  Attribute Inspector
 (RHS panel in .storyboard)
 import UIKit
 
 @IBDesignable
 class FaceView: UIView {
 
 @IBInspectable
 var scale: CGFloat = 0.9
 
 @IBInspectable
 var lineWidth: CGFloat = 5.0
 
 @IBInspectable
 var color: UIColor = UIColor.blue
 
 @IBInspectable
 var eyesOpen: Bool = true
 
 ===Type Casting===

 as? keyword
 Downcast to a subType (if let book as? Fiction { … })
 
 
 is keyword
 Checks if item is of a certain Type (if book is Fiction { … })
 
 
 Example
 //Fiction & NonFiction are subclasses of Book
 for book in bookLibrary {
 
 //Check Type using "is" keyword
 if book is Fiction {fictionCount += 1}
 if book is NonFiction {nonFictionCount += 1}
 
 //Downcast each book from its superclass (Book) to its true type
 if let fiction = book as? Fiction {print("Fiction. Title = \(fiction.title)")}
 if let nonFiction = book as? NonFiction {print("NonFiction. Title = \(nonFiction.title)")}
 }
 
 ===Gesture Recognizers===
 Gestures
 Obvious but ONLY VIEWS CAN RECOGNIZE A GESTURE
 
 
 Two parts to setting up a gesture recognizer
 Add a gesture recognizer to a UIView
 Provide a method that gets run when the gesture recognizer detects a gesture.  This method is called “the handler”.  Handler gets 2 arguments
 target:
 “who gets notified?” (often self/the view controller)
 target gets notified when gesture is recognized
 
 
 action:
 “what method gets invoked when gesture is recognized”
 can pass the recognizer to this method as an argument
 
 
 Gesture recognizers have methods & properties to give handler additional information
 For example, UIPanGestureREcognizer has 3 methods
 translation 	- how far has this pan moved since it started
 velocity	- how fast is this finger/pan moving?
 setTranslation - resets start point of pan/incremental panning
 
 
 Abstract superclass UIGestureRecognizer also has methods/properties.  Importantly, one property gives access to gesture’s state
 var state: UIGestureRecognizerState { get }
 for continuous pan, goes from .possible, .began, .ended
 Careful of states .failed & .cancelled
 .failed: 		was not a pan.  It was a swipe
 .cancelled:	phone call interrupts a pan


 
*/
