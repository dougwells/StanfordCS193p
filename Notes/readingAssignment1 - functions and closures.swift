//
//  readingAssignment1 - functions and closures.swift
//  
//
//  Created by Doug Wells on 3/10/17.
//
//

/*
 
 Functions
 Self-contained chunks of code that perform a specific task
 Arguments & Parameter
 Arguments - External.  What you call the function with
 Params - Internal.  Use inside context for calculations
 Parameters matter.  The func greet (person: String) is DIFFERENT from a function with same name but different params. Ex:  func greet (“Bob, true)
 
 
 Arguments - use External to function, Params - use inside/Internal	func
 func someFunction(argumentLabel parameterName: Int) { … }
 If argument is not given, it is same as param name
 Can avoid having to use argName w/_ in func declaration
 func greeting (name person: String) { print(person)}
 greeting(name: "Doug")	// external
 vs -
 func greeting (_ person: String) {print(person)}
 greeting("Doug")
 
 
 Default Parameter Values
 define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type.
 If a default value is defined, you can omit that parameter when calling the function.
 
 
 func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
 // If you omit the second argument when calling this function, then
 // the value of parameterWithDefault is 12 inside the function body.
 }
 someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
 someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
 
 
 
 Return Type - must specify type if have return (Double, Int, String, etc)
 Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().
 
 
 //simple function w/return
 func hello(name:String) -> String {	//-> designates type of return
 let greeting = "Hello " + name + ". Welcome to the Show!"
 return greeting
 }
 print(hello(name: "Doug"))
 
 //simple function w/o return
 func hi(name:String) {
 print("Hi \(name) How goes the Executive search?")
 }
 
 print(hello(name: "Doug"))
 hi(name: "Linda")
 
 Function Types
 Every function has a specific function type, made up of the parameter types and the return type of the function.
 Both func below are type (Int, Int) -> Int
 “A function type that has two parameters, both of type Int, and that returns a value of type Int.”
 
 func addTwoInts(_ a: Int, _ b: Int) -> Int {
 return a + b
 }
 func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
 return a * b
 }
 
 
 Func below:  () -> Void. “Function w/no params and returns void”
 
 func printHelloWorld() {
 print("hello, world")
 }
 
 Using function types
 use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
 
 var mathFunction: (Int, Int) -> Int = addTwoInts
 
 The addTwoInts(_:_:) function has the same type as the mathFunction variable, so this is allowed by Swift’s type-checker
 
 
 Function Types as Parameter Types
 You can use a function type such as (Int, Int) -> Int as a parameter type for another function.
 
 func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
 print("Result: \(mathFunction(a, b))")
 }
 printMathResult(addTwoInts, 3, 5)
 // Prints "Result: 8"
 
 
 Function Types as Return Types
 You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
 
 
 func stepForward(_ input: Int) -> Int {
 return input + 1
 }
 func stepBackward(_ input: Int) -> Int {
 return input - 1
 }
 func chooseStepFunction(backward: Bool) -> (Int) -> Int {
 return backward ? stepBackward : stepForward
 }
 Example (w/above function)
 var currentValue = 3
 let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
 // moveNearerToZero now refers to the stepBackward() function
 print("Counting to zero:")
 // Counting to zero:
 while currentValue != 0 {
 print("\(currentValue)... ")
 currentValue = moveNearerToZero(currentValue)
 }
 print("zero!")
 // 3...
 // 2...
 // 1...
 // zero!
 Nested Functions
 All of the sbove functions are examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.
 Nested functions are hidden from the outside world but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
 func chooseStepFunction(backward: Bool) -> (Int) -> Int {
 func stepForward(input: Int) -> Int { return input + 1 }
 func stepBackward(input: Int) -> Int { return input - 1 }
 return backward ? stepBackward : stepForward
 }
 var currentValue = -4
 let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
 // moveNearerToZero now refers to the nested stepForward() function
 while currentValue != 0 {
 print("\(currentValue)... ")
 currentValue = moveNearerToZero(currentValue)
 }
 print("zero!")
 // -4...
 // -3...
 // -2...
 // -1...
 // zero!
 
 
 
 
 
 
 
 Tuples - Multiple Return Items
 //multiple return items
 func minMax(arr:[Int]) -> (min: Int, max: Int)? {
 if arr.isEmpty {return nil}
 var arrMin = arr[0]
 var arrMax = arr[0]
 for element in arr {
 if element < arrMin {arrMin = element}
 if element > arrMax {arrMax = element}
 }
 return (arrMin, arrMax)
 }
 if let bounds = minMax(arr: [-1,0,2,3]){
 print("Min is \(bounds.min) & Max is \(bounds.max)")
 }
 print(minMax(arr: [-1,2,3]))
 
 Because the tuple’s member values are named as part of the function’s return type, they can be accessed with dot syntax.  They do not need to be named at the point that the tuple is returned b/c they are specified as part of the function’s return type. (see pink font in function above)
 
 
 Variable Params -  NOT constant (use inout and &).  IE, “Swap” Function
 //Swapping param values so must classify as “inout”
 func swapInt(_ a:inout Int, _ b:inout Int){
 print("before swap", a, b)
 let temp = a
 a = b
 b = temp
 print("after swap:",a,b)
 }
 var val1 = 3
 var val2 = 2
 swapInt(&val1,&val2)
 
 //bankBal param is a variable, purchPrice is not
 var beginBal = 500.00
 var nikeShoes = 65.00
 
 func purchItem(bankBal: inout Double, purchPrice: Double) -> Double {
 bankBal = bankBal - purchPrice
 return bankBal
 }
 
 purchItem(bankBal: &beginBal, purchPrice: nikeShoes)
 
 & Call by reference vs value
 use “&” if calling by reference (vs calling by value)
 
 
 Generic parameter types <T>
 //"Generics" allow functions w/params of any type
 func swapAnything<T>(_ a:inout T, _ b:inout T){
 print("before swap", a, b)
 let temp = a
 a = b
 b = temp
 print("after swap:",a,b)
 }
 //Int
 var int1 = 3
 var int2 = 2
 swapAnything(&int1, &int2)
 
 //Stings
 var string1 = "Doug"
 var string2 = "Linda"
 swapAnything(&string1, &string2)
 
 //Double
 var float1 = 3.2
 var float2 = 2.3
 swapAnything(&float1, &float2)
 
 Unknown # of parameters (note …)
 func manyParams (_ nums: Double…) -> Double {
	var total = 0
	for num in nums {
 total += num
	}
	return total/Double(nums.count)
 }
 
 
 Closures
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 
 
 Closures capture and store references to constants and variables from the context in which they are defined. This is known as closing over those constants & variables.
 
 
 Closure Expressions
 used w/Inline closures (when a fn has a closure as one of its args)
 
 
 expressions allow briefer function syntax.  Note: the inline closure’s params and return type are written inside the curly braces.
 
 
 The start of closure’s body is introduced by the in keyword. Indicates that closure’s params and return type is finished. Body of the closure begins.
 
 
 { (parameters) -> return type in
 statements
 }
 //Normal function
 func greeting(name: String) -> String {
 return "Hello " + name
 }
 /* Convert to inline closure
 1) remove func and the name of the function
 2) move curly brace to beginning
 3) add keyword "in"
 
 { (name: String) -> String in
 return "Hello " + name
 }
 */
 
 Example 2
 let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
 reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
 return s1 > s2
 })
 Shortening Syntax for Closure Expressions
 Inferring Type From Context
 Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted:
 
 reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
 
 Implicit Returns from Single-Expression Closures
 implicitly return the result and omit the return
 reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
 
 Shorthand Argument Names
 Swift automatically provides shorthand argument names to inline closures, $0, $1, $2, and so on.
 
 The in keyword can also be omitted, because the closure expression is made up entirely of its body:
 
 reversedNames = names.sorted(by: { $0 > $1 } )
 
 Trailing Closure
 Trailing closures are syntactically cleaner way to call a function whose only or last argument is a closure.
 
 
 Written after the function call’s parentheses, even though it is still an argument to the function.
 
 reversedNames = names.sorted() { $0 > $1 }
 
 Example
 
 func someFunctionThatTakesAClosure(closure: () -> Void) {
 // function body goes here
 }
 
 // Here's how you call this function without using a trailing closure:
 someFunctionThatTakesAClosure(closure: {
 // closure's body goes here
 })
 
 // Here's how you call this function with a trailing closure instead:
 someFunctionThatTakesAClosure() {
 // trailing closure's body goes here
 }
 Capturing values
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

 
*/
