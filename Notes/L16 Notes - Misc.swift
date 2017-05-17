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
 
 Notifications (professor calls this a "radio station")
 
 let center = NotificationCenter.default
 var observer = center.addObserver(
    forName: NSNotification.Name.UIContentSizeCategoryDidChange
    object: UIApplication.shared
    queue: OperationQue.main
 )
 
 center.removeObserver(observer)  //when done listening
 
*/


