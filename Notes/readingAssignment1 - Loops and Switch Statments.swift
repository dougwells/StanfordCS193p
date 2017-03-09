//
//  readingAssignment1 - Loops and Switch Statments.swift
//  
//
//  Created by Doug Wells on 3/9/17.
//

/*
 Control Flow
 for in loops (only type of “for” loop in Swift)
 //"For In" Loops		(if not using element name, Apple recommends _)
 for planet in planetArr {
 print(planet)
 }
 // Set variables
 var names = ["Doug", "Kevin", "Eric", "Jay", "Erik"]
 var arr = [8, 10, 15, 30, -2]
 // For In
 print("For In Loops")
 for name in names {
 print(name)
 }
 
 for _ in 1...5 {
 print("Needed to print this 5 times")
 }
 
 for i in arr {
 print(i+1)
 }
 
 for (index, value) in arr.enumerated() {		//change values in array
 arr[index] += 1
 }
 print("New array: ", arr)
 
 Iterate Dictionaries
 Each item in the dictionary is returned as a (key, value)
 The contents of a Dictionary are inherently unordered, and iterating over them does not guarantee the order in which they will be retrieved.
 
 let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
 for (animalName, legCount) in numberOfLegs {
 print("\(animalName)s have \(legCount) legs")
 }
 // ants have 6 legs
 // spiders have 8 legs
 // cats have 4 legs
 
 
 
 while loops
 while evaluates its condition at the start of each pass through the loop.
 //While loop (does not run at all if condition false)
 var score = 8
 while score>10 {
 print(score)
 score += 1
 }
 
 repeat-while loops (similar to do-while)
 repeat-while evaluates its condition at the end of each pass through the loop.
 //While-repeat Loop (identical to do-while loop)
 //First part of loop runs even if while loop condition is false
 var myScore = 8
 repeat {
 myScore += 1
 print(myScore)
 } while myScore>20
 
 //second example
 var salaries = [30000.0, 40000.0, 50000.0, 60000.0]
 var x = 0
 repeat {
 salaries[x] *= 1.1
 print(salaries[x])
 x+=1
 } while (x<salaries.count)
 
 
 Loops & Switches - Control Transfer Statements
 Transfer Statements
 Continue (loops only)
 The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop. It says “I am done with the current loop iteration” without leaving the loop.
 
 
 Break (loops and switches)
 Ends execution of an entire control flow statement immediately. Used inside a switch statement or loop statement when you want to terminate the execution earlier than would otherwise be the case.
 
 Fallthrough (switches only)
 Continue to code under next case (even if that case is not “true”)
 Switch statements in Swift don’t fall through the bottom of each case and into the next one. Instead, the entire switch statement completes its execution as soon as the first matching case is completed. By contrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough.
 If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword.
 let integerToDescribe = 5
 var description = "The number \(integerToDescribe) is"
 switch integerToDescribe {
 case 2, 3, 5, 7, 11, 13, 17, 19:
 description += " a prime number, and also"
 fallthrough
 default:
 description += " an integer."
 }
 print(description)
 // Prints "The number 5 is a prime number, and also an integer."
 Return - just like in a function
 
 
 Throw - throws an error
 
 
 Labeling loops (and switch statements)
 A labeled statement is indicated by placing a label on the same line as the statement’s introducer keyword, followed by a colon. Here’s an example of this syntax for a while loop, although the principle is the same for all loops and switch statements:
 label name: while condition {
 statements
 }
 With a conditional statement, you can use a statement label with the break statement to end the execution of the labeled statement. With a loop statement, you can use a statement label with the break or continue statement to end or continue the execution of the labeled statement.
 
 
 If the break statement below did not use the gameLoop label, it would break out of the switch statement, not the while statement. Using the gameLoop label makes it clear which control statement should be terminated.
 
 
 gameLoop: while square != finalSquare {
 case finalSquare:
 // diceRoll will move us to the final square, so the game is over
 break gameLoop
 case let newSquare where newSquare > finalSquare:
 // diceRoll will move us beyond the final square, so roll again
 continue gameLoop	**Need “continue”. Execute something
 default:
 // this is a valid move, so find out its effect
 square += diceRoll
 square += board[square]
 }
 }
 
 Switch Statements
 Basics
 Every switch statement must be exhaustive. That is, every possible value of the type being considered must be matched by one of the switch cases. If it’s not appropriate to provide a case for every possible value, you can define a default case to cover any values that are not addressed explicitly. This default case is indicated by the default keyword, and must always appear last.
 
 
 switch statements in Swift do not fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier
 
 
 
 //Switch Case
 let myChar = "z"
 switch myChar {
 case "a":
 print("The character is 'a'")
 case "z":
 print("The character is 'z'")
 default:
 print("Character is neither 'a' nor 'z'")
 }
 
 Single switch case that match multiple conditions
 combine the two values into a compound case, separating the values with commas.
 let anotherCharacter: Character = "a"
 switch anotherCharacter {
 case "a", "A":
 print("The letter A")
 default:
 print("Not the letter A")
 }
 // Prints "The letter A"
 
 
 
 Switch cases & intervals - can check switch in an interval.
 
 //Switch Case with ranges
 let score = 101
 switch score {
 case 1..<10:
 print("Score is less than 10. You need practice")
 case 10...99:
 print("Score is 10-100. Not bad")
 case 100..<1000:
 print("You broke 100.  Awesome!")
 default:
 print("Score is unknown.  Please see FAQs")
 }
 
 Switch cases & tuples
 You can use tuples to test multiple values in the same switch statement. Each element of the tuple can be tested against a different value or interval of values. Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.
 
 //Switch Case with tuples (multiple variables)
 let coord = (3,3)
 switch coord {
 case (0,0):
 print("You are at major axis intersection")
 case (_,2):
 print("Y intersection is 2")
 case (1,_):
 print("X intersection is 1")
 default:
 print("We can't find you")
 }
 
 A switch case can use a where clause to check for additional conditions.
 
 let soccerScore = (1,2)
 switch soccerScore {
 case let (teamA, teamB) where teamA==teamB:
 print("Tie Game")
 default:
 print("It is not a tie")
 }
 
 // --- Second Example ---
 
 
 let somePoint = (1, 1)
 switch somePoint {
 case (0, 0):
 print("(0, 0) is at the origin")
 case (_, 0):
 print("(\(somePoint.0), 0) is on the x-axis")
 case (0, _):
 print("(0, \(somePoint.1)) is on the y-axis")
 case (-2...2, -2...2):
 print("(\(somePoint.0), \(somePoint.1)) is inside the box")
 default:
 print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
 }
 // Prints "(1, 1) is inside the box"
 Value Bindings
 A switch case can bind the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.
 let anotherPoint = (2, 0)
 switch anotherPoint {
 case (let x, 0):
 print("on the x-axis with an x value of \(x)")
 case (0, let y):
 print("on the y-axis with a y value of \(y)")
 case let (x, y):
 print("somewhere else at (\(x), \(y))")
 }
 // Prints "on the x-axis with an x value of 2"
 
 
*/
