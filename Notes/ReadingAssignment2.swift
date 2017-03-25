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
 
 
 ===Multiple MVCs===
 Multiple MVCs (more complex / more powerful apps)
 
 Do this by making other MVCs part of controller’s View (top purple oval above)
 iOS gives us several of these (could also code your own)
 
 
 UITabBarController (TBC)
 lets user choose between multiple views (really MVCs) by choosing icons at bottom of screen (called a tab bar).
 TBC gets these icons by asking the other MVC’s which icon to display
 Example see Apple’s HealthKit app
 
 
 UISplitViewController
 has THREE views. (UISplitView & master/detail inside of it)
 user sees 2 views (MVCs) side-by-side.  Only thing the SplitViewController draws is the line between master & detail
 LHS is the “Master”
 RHS is the “Detail” (larger of the 2)
 
 
 UINavigationController (UNC).  List View - shows a list
 most common of the 3 (TabBar, SplitView, Navigation)
 For example of a UNC, see “Settings” on your iPhone
 top MVC is called “All Settings”
 Only part of UNC we see is the title: “Settings”
 Gets title by asking the “All Settings” MVC “What is your title?” - answer: “Settings”
 
 pushes onto & pops off a stack (think “stack of cards”)
 Worth 3 minutes.  Watch L5 57:10 - 1:00:30
 Click on “General”
 New view/MVC is created and slides “on top of” All Settings view.  Old view still there in stack
 top to bottom:  General - All Settings - UNC
 toolbar at bottom of each view is controlled by its view controller (NOT the UNC)
 Navigation bar at top (“back” button) controlled by UNC.  Automatically placed
 When click “back”, previous view is taken off stack
 rootViewController points to the base card
 In this example: “All Settings”
 Activity of adding new MVC to stack and adding top item in stack to UNC’s view is called “Segueing”
 This segue example is called a “Show (push) segue
 simply means segue in a UNC w/stack of cards
 
 
 
 
 Array of multiple views accessed via the property viewControllers
 var viewControllers: [UIViewController]? { get set }
 Array is different for each type of controller
 UITabBarController:  in order, L to R, in the array (0 = leftmost)
 UISplitScreenController: 0 = Master, 1 = Detail
 UINavigationController: 0 = root, 1=next MVC in stack, etc
 UNC adds & deletes UIViewControllers as stack changes
 
 
 How do you add TBC, SVC or UNC controller to your project?
 UINavigationController
 Highlight desired view in Xcode
 Editor - Embed In - Navigation Controller
 
 UISplitViewController
 Xcode - Object Palette (lower RHS) & drag it out
 Control-drag from SVC to the master MVC & detail MVC
 black box. Choose “master view controller” from list
 
 
 In this example, split view does not display on non-plus iphones.  Can simply embed master view in a UNC
 Editor - Embed In - Navigation Controller
 In view controller array, 0 = master which is now a UNC which has its own array.  0 = root which is that master view
 
 
 UITabViewController
 Object palette.  Drag out a TVC, control-drag to desired views
 Can drag icons in tab bar around
 Can set icons in Interface Inspector
 
 
 Segues
 Types
 Show Segue - in UNC, push.  Else modal (see below)
 Show Detail - SVC, show detail.  UNC, push
 Modal Segue - Takes over entire screen (try to avoid)
 Popover Seque - MVC appears in little popover window)
 
 
 All segues create a new instance of the MVCs
 Think of segues as ephemeral.
 They come alive, do their thing & go away.
 If call detail seque and one is already on screen, old one goes away and new detail instance is created.
 BUT, “go back” button is NOT a seque so no new instance
 
 
 How create seques
 control-drag from button that makes view appear to desired MVC
 black box - select desired type of segue
 Click on created seque & set seque identifier (in Attrib Inspector)
 Make name descriptive.  ie “Show Graph”
 
 Prepare for Segues
 prepare(for segue: UIStoryboardSeque, sender: Any?)  method
 most important method in multiple MVCs
 parameter segue contains important info about the segue:
 segue.identifier
 identifier from the storyboard
 segue.destinationViewController
 controller of MVC you segue to (freshly created)
 sender - what object is instigating this? (button, etc.  Can be nil)
 CRUCIAL - when prepare(for seque: ..) runs, NONE OF THE MVCs outlets are set up yet.
 
 shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool
 Prevent segue from happening.  Return false.

=== L6: ViewController LifeCycle & Memory Management (ARC) ===

 Lifecycle View Controller
 summary
 instantiated (created) from storyboard
 awakeFromNib
 segue preparation happens
 outlets get set
 viewDidLoad - good place to put initialization since lots done by then
 Called EACH time view comes on screen (note: NOT viewDidLoad)
 viewWillAppear
 viewDidAppear
 
 
 Called EACH time view comes off screen
 viewWillDisappear
 viewDidDisappear
 
 
 Geometry - called anytime after viewDidLoad
 viewWillLayoutSubviews
 … autolayout happens ...
 viewDidLayoutSubviews
 
 
 ALWAYS CALL super.viewDidLoad(), super.viewDidDisappear, etc
 viewDidLoad
 great place to put setup code (ie, updateUI)
 all outlets are set up (can see this w/ didSet)
 segues have been prepared for
 next, viewDidLoad is called (only runs once per lifecycle)
 BUT DO NOT DO GEOMETRY based things (constraints)
 B/C device geometry is not yet set
 
 
 viewWillAppear
 you know the view will soon be on screen
 start something “expensive” ie, DB call
 
 
 viewDidAppear - now view is on screen.
 Good time to start animations (no need to b4 on screen)
 
 
 viewWillDisappear - match with w/viewDidAppear (stop stuff started by vDA)
 viewDidDisappear - match with viewWillAppear (stop processes started by vWA)
 
 
 When do geometry based stuff?
 generally, autolayout takes care of it for you
 if want to do yourself:
 viewWillLayoutSubviews()
 viewDidLayoutSubviews()
 these get called more often than people think they will
 BTW, autolayout happens between the two calls above
 
 
 awakeFromNib()
 Not really part of View Controller lifecycle
 Everything that gets sent from storyboard (views, view controllers, etc) gets sent awakeFromNib().  Sent very early.
 Better to put stuff in lifecycle items (viewWillLoad, viewDidLoad) than put in awakeFromNib().  Gets overused.
 
 http://bit.ly/1QC7IcX
 
 Memory Management
 Automatic Reference Counting (ARC)
 Swift does NOT use “garbage collection”
 Reference types (classes) are stored in the heap
 ARC keeps a “tally” of all the vars/lets that make reference to a class.  When no more references (tally count is 0), it removes class from heap
 
 
 Influence ARC
 strong pointer
 Strong is “normal” reference counting
 As long as anyone anywhere has a strong pointer to an instance, it stays in the heap
 This is the default.  No need to type it.  Every var is strong unless stated otherwise
 weak pointer
 If no one else is interested in this instance, than neither am I & set me to ‘nil’
 Only applies to Optional pointers to reference types
 Weak pointer NEVER keeps item in the heap
 Helps avoid a “Memory Cycle” where two objects both point to each other strongly so they are kept in heap forever
 unowned pointer
 Dangerous.  Almost never used.  Tells Swift, do not worry about reference counting.  I’ll take care of memory management on it.
 Will crash program if try to use it but it has already left the heap
 Only used to break Memory Cycles
 
 
 Closures & Memory Cycles
 Capturing
 Closures capture & hold onto values from within its scope
 A closure is a reference type that lives in the heap
 if Closure points to an item, it does so strongly.  If that item points back strongly to the closure, you have a memory cycle and both will stay in the heap forever.
 
 
 Solution - weak pointer
 Make self (UIView) a weak variable.  Otherwise UIView points strongly to closure addUnary and vice-versa.  Then viewControllers will keep accumulating in memory.  Very bad.
 Swift throws compile error w/no self.  Warns that you are about to “capture” self (& that will create a memory cycle)
 "Reference to property "display" in closure requires explicit 'self' to make capture semantics explicit"
 
 addUnary("√"){ [ weak weakSelf = self ] in
 weakSelf?.display.textColor = UIColor.green
 return sqrt($0)
 }

 
*/
