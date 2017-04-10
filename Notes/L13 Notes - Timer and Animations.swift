//
//  L13 Notes - Timer and Animations.swift
//  
//
//  Created by Doug Wells on 4/10/17.
//
//

/*
 
 --- Timer() ---
 CS193p notes
 method
 class func scheduledTimer(
 withTimeInterval: TimeInterval,
 repeats: Bool,
 block: (Timer) -> Void
 ) -> Timer
 Example:
 private weak var timer: Timer?
 timer = scheduledTimer(withTimeInterval: 2.0, repeats: true) {
	//code here
 }
 Every 2 seconds, the closure will be executed
 Weak var since run loop keeps strong pointer to it
 stop timer.  timer.invalidate()
 
 
 Tolerance
 timer runs on mainQueue so not precise (other actions might have higher priority)
 tolerance gives iOS latititude on when timer “fires”
 Why set?  phone in mini nap.  Battery efficiency.
 myOneMinTimer.tolerance = 10   // fire 50-70 sec

 
 --- Animation ---
 iOS animation packages (*CS193p covers)
 OpenGL & Metal - powerful 3D animations
 SpriteKit - “2.5 D”
 Core Animation “CA” - powerful underlying animation framework
 Animating Controller Transitions (like UINavigationController)
 *Animating UIView Properties - change frame, transparency, etc
 *Dynamic Animations - “Physics” based animations

 
*/
