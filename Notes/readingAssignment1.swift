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
 
 Operators
 Compound assignment operators.  Combine assignment (=) with another operation. One example is the addition assignment operator (+=)
 The expression a += 2 is shorthand for a = a + 2.
 Other compound operations
	// compound operations
 var any = 2
 any += 3
 any -= 1
 any *= 5
 
 
 Unary, binary & tertiary operators
 Ternary.  A special operator with three parts, which takes the form question ? answer1 : answer2. It is a shortcut for:
 if question {
 answer1
 } else {
 answer2
 }
 
 let contentHeight = 40
 let hasHeader = true
 let rowHeight = contentHeight + (hasHeader ? 50 : 20)
 // rowHeight is equal to 90
 
 nil-coalescing operator: ??
 (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. Shorthand for the code below:
 a != nil ? a! : b
 
 let defaultColorName = "red"
 var userDefinedColorName: String?   // defaults to nil
 
 var colorNameToUse = userDefinedColorName ?? defaultColorName
 // userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
 
 Range Operator
 for index in 1...5 {
 print("\(index) times 5 is \(index * 5)")
 }
 
 
 Half-open range operator
 let names = ["Anna", "Alex", "Brian", "Jack"]
 let count = names.count
 for i in 0..<count {
 print("Person \(i + 1) is called \(names[i])")
 }
 
 Unary & Binary operators
 
 var score = 10
 
 //unary operator (needs just 1 param)
 ‘-’
 var myScore = -score
 ‘!’  aka ‘not’ operator
	if !allowedAccess { print(“You cannot enter”) }
 
 //binary operator (needs 2 params)
 let (a,b) = (9,2)
 a+b
 a/b
 a%b
 a*b
 
 // compound operations
 var any = 2
 any += 3
 any -= 1
 any *= 5
 
 Range
 inclusive range:	1...6		(1,2,3,4,5,6)
 non-inclusive:		1..<6		(1,2,3,4,5)

 
 Strings
 myString = “Hello”
 Creating an empty string
 newString = “”
 newString: String
 newString = String()
 Checking for an empty string
 newString.isEmpty	→ boolean
 Iterating over characters in a string
 var longWord = "Hello"
 for char in longWord.characters {
 print(char)
 }
 Concatenation.
 var phrase = firstWord + " World"
 var phrase2 = String(firstWord) + “ Word”)
 var phrase 3 = “\(firstWord) Word”
 var age = 52
 print(phrase, "I am \(age) years old")
 
 
 methods on strings
 .append(“III”)
 .capitalized
 .isEmpty
 .contains(“heck”)
 .replacingOccurences(of: “heck”, with: “hell”)
 
 
 Working with Characters
 access the individual Character by iterating over its characters property with a for-in loop:
 
 for character in "Dog!🐶".characters {
 print(character)
 }
 // D
 // o
 // g
 // !
 // 🐶
 
 
 string.characters.count
 use count property of the string’s characters property:
 
 let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
 print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
 // Prints "unusualMenagerie has 40 characters"
 
 
 Index.  different characters require different amounts of memory to store, For this reason, Swift strings cannot be indexed by integer values.
 
 
 Contains.
 To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.

 
*/
