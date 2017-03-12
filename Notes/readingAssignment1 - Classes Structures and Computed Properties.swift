//
//  readingAssignment1 - Classes Structures and Computed Properties.swift
//  Calculator
//
//  Created by Doug Wells on 3/12/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

/*
 
 Classes & Structures
 An instance of a class is traditionally known as an object. However, Swift classes and structures are much closer in functionality than in other languages, Because of this, the more general term instance is used.
 
 
 Similarities between classes & structures
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to values using subscripts
 Define initializers to set up their initial state
 Be extended to expand functionality beyond default
 Conform to protocols to provide standard functionality
 
 
 Differences. Classes have additional capabilities that structures do not:
 Inheritance enables one class to inherit characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Referencing - more than one reference to a class instance.
 Structures are copied not referenced (value Typed)
 enum CompassPoint {
 case north, south, east, west
 }
 var currentDirection = CompassPoint.west
 let rememberedDirection = currentDirection
 currentDirection = .east
 if rememberedDirection == .west {
 print("The remembered direction is still .west")
 }
 // Prints "The remembered direction is still .west"
 
 Classes  are reference typed.  “Pointer”/reference to value
 Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the sameVideoMode instance. Effectively, they are just two different names for the same single instance
 
 let tenEighty = VideoMode()
 tenEighty.frameRate = 25.0
 let alsoTenEighty = tenEighty
 alsoTenEighty.frameRate = 30.0
 print(tenEighty.frameRate)
 // Prints 30.0
 
 
 Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the sameVideoMode instance. Effectively, they are just two different names for the same single instance
 
 
 tenEighty and alsoTenEighty are declared as constants. You can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves do not actually change. tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It is the frameRate property of the underlying VideoMode instance that is changed, not the values of the constant references to that VideoMode instance.
 
 
 How tell if 2 constants/vars refer to the same class instance?
 Identity Operators (=== & !==)
 Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):
 “Identical to” means that two constants or variables of class type refer to exactly the same class instance.
 “Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.
 
 if tenEighty === alsoTenEighty {
 print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
 }
 // Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
 
 
 
 
 Choosing between Classes & Structures
 structure instances are always passed by value, and class instances are always passed by reference. This means that they are suited to different kinds of tasks.
 
 
 Think about structures when …
 encapsulate a few relatively simple data values.
 encapsulated values will be copied not referenced
 properties stored by the structure are themselves value types
 The structure does not need to inherit properties or methods
 Examples of when to think of using Structure instead of Class
 geometric shape with width/height property, of type Double.
 ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
 A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.
 In all other cases, define a class, and create instances of it to be managed and passed by reference. In practice, this means most custom data constructs should be classes, not structures.
 
 
 Syntax
 Create class or structure
 class SomeClass {
 // class definition goes here
 }
 struct SomeStructure {
 // structure definition goes here
 }
 Class/Structure name is a new Swift type so use uppercase camelback just like String, Bool, Int
 properties & methods should use lowercase camelback
 Example: frameRate or incrementCount
 
 Properties: Stored & Computed
 Properties associate values with a particular class, structure, or enumeration.
 Stored properties: store constant and var values in instance
 Stored properties - Classes and structures only.
 
 Computed properties: calculate (rather than store) a value.
 classes, structures, and enumerations.
 
 
 Property observers to monitor changes in a property’s value, which you can respond to with custom actions.
 
 
 Stored Properties
 You can provide a default value for a stored property as part of its definition. You can also set and modify the initial value for a stored property during initialization, even for constant stored properties
 struct FixedLengthRange {
 var firstValue: Int
 let length: Int
 }
 var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
 // the range represents integer values 0, 1, and 2
 rangeOfThreeItems.firstValue = 6
 // the range now represents integer values 6, 7, and 8
 length is initialized when the new range is created and cannot be changed thereafter, because it is a constant property.
 
 
 If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties:
 B/C structure is value typed (makes its own copy). If instance of a value type is marked constant, so are its properties.
 
 
 Not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
 let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
 // this range represents integer values 0, 1, 2, and 3
 rangeOfFourItems.firstValue = 6
 // this will report an error, even though firstValue is a variable property because rangeOfFourItems declared as a CONSTANT
 Computed Properties
 classes, structures, and enumerations can have comp. props
 provides a getter and an optional setter to retrieve and set values
 must declare computed properties—including read-only computed properties—as variable properties because their value is not fixed
 
 
 struct Point {
 var x = 0.0, y = 0.0
 }
 struct Size {
 var width = 0.0, height = 0.0
 }
 struct Rect {
 var origin = Point()
 var size = Size()
 var center: Point {
 get {
 let centerX = origin.x + (size.width / 2)
 let centerY = origin.y + (size.height / 2)
 return Point(x: centerX, y: centerY)
 }
 set(newCenter) {
 origin.x = newCenter.x - (size.width / 2)
 origin.y = newCenter.y - (size.height / 2)
 }
 }
 }
 
 Shorthand Setter Declaration
 If setter does not define a name for the new value to be set, a default name of newValue is used.
 set {
 origin.x = newValue.x - (size.width / 2)
 origin.y = newValue.y - (size.height / 2)
 }
 Read only Computed Property
 Just use a getter with no setter (setter is optional)
 always returns a value
 can be accessed through dot syntax
 cannot be set to a different value.
 You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:
 
 struct Cuboid {
 var width = 0.0, height = 0.0, depth = 0.0
 var volume: Double {
 return width * height * depth
 }
 }
 let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
 print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
 // Prints "the volume of fourByFiveByTwo is 40.0"
 
 
 Property Observers
 Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.
 willSet is called just before the value is stored.
 didSet is called immediately after the new value is stored.
 
 class StepCounter {
 var totalSteps: Int = 0 {
 willSet(newTotalSteps) {
 print("About to set totalSteps to \(newTotalSteps)")
 }
 didSet {
 if totalSteps > oldValue  {
 print("Added \(totalSteps - oldValue) steps")
 }
 }
 }
 }
 let stepCounter = StepCounter()
 stepCounter.totalSteps = 200
 // About to set totalSteps to 200
 // Added 200 steps
 stepCounter.totalSteps = 360
 // About to set totalSteps to 360
 // Added 160 steps
 stepCounter.totalSteps = 896
 // About to set totalSteps to 896
 // Added 536 steps

 
*/
