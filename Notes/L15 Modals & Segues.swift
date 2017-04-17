//
//  L15 Modals & Segues.swift
//  FaceIt
//
//  Created by Doug Wells on 4/16/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

/*
 
 --- Segueing from Modal to another MVC
 Unwind Segues from modals
 cntrl-drag to “exit” icon on top of current MVC. 2 requirements:
 “Presenter of the modal, must have an @IBAction method
 that @IBAction method can only have one argument which is UIStoryboardSegue

 popover modal
 trigger using same approach as any modal
 UIPopoverPresentationController
 Notes what triggered the popover
 “little” triangle points to rectangle (bar item, text, etc) that triggered it.
 
 
 Embed Segues
 Putting a VC’s self.view inside another VC’s view hierarchy
 Drag out a Container View from object palette in scene you want it in.

 
*/
