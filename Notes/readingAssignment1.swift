//
//  readingAssignment1.swift
//  

/*
 
 Optionals:
 Optionals have value “set” & “not set”
 if “set”, has an associated value
 
 
 Example
 Swift’s Int type has an initializer which tries to convert a String value into an Int value. However, not every string can be converted into an integer.
 let possibleNumber = "123"
 let convertedNumber = Int(possibleNumber)
 // convertedNumber is inferred to be of type "Int?", or "optional Int"
 
 Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int.
 
 
 You set an optional variable to a valueless state (“unset”) by assigning it the special value nil:
 var serverResponseCode: Int? = 404
 // serverResponseCode contains an actual Int value of 404
 serverResponseCode = nil
 // serverResponseCode now contains no value
 
 NOTE:  nil cannot be used with nonoptional constants and variables. If it needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.
 
 
 If you define an optional variable without providing a default value, the variable is automatically set to nil for you:
 var surveyAnswer: String?
 // surveyAnswer is automatically set to nil
 
 If an optional has a value, it is considered to be “not equal to” nil:
 if convertedNumber != nil { … }
 
 Force unwrapping of the optional’s value
 Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional’s name. The exclamation mark effectively says, “I know that this optional definitely has a value; please use it.”
 if convertedNumber != nil {
 print("convertedNumber = \(convertedNumber!).")
 }
 
 Optional binding ( if let     or     if var)
 find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
 You can use both constants and variables with optional binding.
 Constants and variables created with optional binding in an if statement are available only within the body of the if statement.
 Example
 “If the optional Int returned by Int(possibleNumber) contains a value, set a new constant called actualNumber to the value contained in the optional.”
 
 
 if let actualNumber = Int(possibleNumber) {
 print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
 } else {
 print("\"\(possibleNumber)\" could not be converted to an integer")
 }
 // Prints ""123" has an integer value of 123"
 or	// Prints “”Hello World!” could not be converted to an integeger”
 
 
 
 You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false.
 
 
 if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
 print("\(firstNumber) < \(secondNumber) < 100")
 }
 // Prints "4 < 42 < 100"
 
 Implicitly Unwrapped Optionals
 Sometimes it is clear from a program’s structure that an optional will always have a value, after that value is first set.
 You write an implicitly unwrapped optional by placing an exclamation mark (String!) rather than a question mark (String?) after the type
 Primary use of implicitly unwrapped optionals is during class initialization
 You can think of an implicitly unwrapped optional as giving permission for the optional to be unwrapped automatically whenever it is used.
 
 
 Examples
 Constants
 let possibleString: String? = "An optional string."
 let forcedString: String = possibleString! // requires an exclamation mark
 
 let assumedString: String! = "An implicitly unwrapped optional string."
 let implicitString: String = assumedString // no need for an exclamation mark
 
 Classes
 @IBOutlet weak var display UILabel! (instead of ?)

 
*/
