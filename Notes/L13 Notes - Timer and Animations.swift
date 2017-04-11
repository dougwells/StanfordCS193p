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
 *UIView Animations - change frame, transparency, etc
 *Dynamic Animations - “Physics” based animations
 
 Dynamic Animation (CS193p, L13, 57:50).  Also, see slides
 Set up physics relating animatable objects & let run to stasis
 Steps
 Create a UIDynamicAnimator
 Add UIDynamicBehavior
 Add UIDynamicItem (usually UIView) to UIDynamicBehaviors
 UIDynamicBehavior is a protocol that UIView implements
 
 
 Avoiding memory cycles
 In past we used “[weak self]” but we know pushBehavior will stay in heap so can’t use weak
 [unknowned pushBehavior] - says we know pB will be in heap BUT do NOT maintain a strong reference pointer to it
 
 
 CoreMotion - accelerometer, gyro, etc

 
 
 UIView Animations
 Done with UIView class methods that take closures
 What can you animate?
 frame/center		→ position (can slide view around screen)
 transform		→ size/scale & rotation. translation = move
 alpha			→ opacity
 backgroundColor	→ color
 
 
 Animations happen IMMEDIATELY in code.  Takes time on screen
 
 
 Animations are methods on UIView → animate(withDuration: … )
 class func animate(withDuration: 	TimeInterval,
 delay:		TimeInterval,
 options:	UIAnimationOptions,
 animations: 	() -> Void,	//what you are animating
 completion:	((finished: Bool) -> Void)?  //at anim done
 )
 
 
 Example
 if myView.alpha == 1.0 {
 UIView.animate(withDuration = 3.0,
 delay: 2.0,
 options: [.curveLinear]
 animations: {myView.alpha = 0},
 completion: {if $0 {myView.removeFromSuperView() } }
 )
 print("myView.alpha = \(myView.alpha)")
 // 0 b/c code executes immediately
 }			//not 0 on screen for 5 more seconds
 
 
	Other Options:
 Change entire View
 UIViewAnimationOptions.transitionFlipFrom{Left, Right, Top, Bottom}
 .transitionCrossDissolve
 .transitionCurl{Up, Down}
 
 UIView.transition(with: UIView,
 duration: 	TimeInterval,
 options:	UIViewAnimationOptions,
 animations:	() -> Void,
 completion: 	((finished) -> Void)?
 )
 
 Example:
 //Flipping a playing card over:
 UIView.transition(with: myPlayingCardView,
 duration: 0.75,
 options: [.transitionFlipFrom(Left)],
 animations: {cardIsFaceUp = !cardIsFaceUp }
 completion: nil
 )
 
 
 Change View hierarch (put elements into or take out of the view)
 UIView.transition(from: 	UIView,		//transitions one to next
 to:		UIView,
 duration:	Timeinterval,
 options:	UIViewAnimationOptions,
 completion: 	((finished) -> Void)?
 //UIViewAnimationOptions.showHideTransitionView or actually removed vs .isHidden
 
 )


 
*/
