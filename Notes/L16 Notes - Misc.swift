//  L16 Notes - Misc.swift
//  Created by Doug Wells on 5/12/17

/*
 
 Alert - pop ups. Appear modally.  Usually yes/no OK/Cancel type questions
 
 Action Sheets - slide up from bottom.  Usually 2+ questions.  Branching decisions.  What next?
 
 var alert = UIAlertController(
    title = "Redeploy Cassini",
    message = "Issue commands to redeploy",
    preferredStyle = .actionSheet  //or .alert
 )
 
 alert.addAction(
        UIAlertAction(
            title: "Orbit Saturn",
            style: UIAlertActionStyle.default)
        )
        { (action: UIAlertActionStyle) -> Void in 
            //go into orbit around Saturn
        }
 
 
 )
 
 Notifications (Prof Hegarty calls this a "radio station")
 
 let center = NotificationCenter.default
 var observer = center.addObserver(
    forName: NSNotification.Name.UIContentSizeCategoryDidChange
    object: UIApplication.shared
    queue: OperationQue.main
 )
 
 center.removeObserver(observer)  //when done listening
 
 Key Value Observing:  When you get notified when a variable on an object changes
 
 Application Life Cycle
    - 5 stages. Always goes thru cycles in logical order
        * Not running
        * Foreground - Inactive
        * Foreground - Running
        * Background - Usually only for 30 seconds or seconds
        * Suspended (then back to Not Running)
 
    - You can observe when stage changes occur
        UIApplicationDidFinishLaunching 	(Not running to active)
        UIApplicationWillResignActive	(Active to Inactive)
        UIApplicationDidBecomeActive
        UIApplicationDidEnterBackground	(~ 30 seconds to save data/state)
        UIApplicationWillEnterForeground	(back to active)
 
 
    - Or receive UIApplicationDelegate
        func didFinishLaunchingWithOptions(UIApplication)
        func applicationWillResignActive(UIApplication)
        func applicationDidBecomeActive(UIApplication)
        func applicationDidEnterBackground(UIApplication)
        func applicationWillEnterForeground(UIApplication)

 
*/


