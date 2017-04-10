//
//  L12 Notes - AutoLayout.swift
//  
//
//  Created by Doug Wells on 4/9/17.
//
//

/*
 
Autolayout (CS193, L12)
 Sometimes want to do something different than just resize views
 ie, calculator = 20 buttons 5x4 portrait but 4x5 landscape
 use Size Classes to do this
 ViewController always exists in one of 2 size classes
 Compact
 Regular (ie, not Compact)
 Examples:
 iPhone
 portrait: height is regular, width is compact
 iPhone landscape: h compact, w compact
 
 
 iPhone + (6+, 7=)
 portrait: height regular, width compact
 landscape: height compact, width NORMAL
 
 
 iPad - always regular. Both directions
 caution. Split view controller
 Master: h reg but width compact
 By using “Any Height” & “Any Width”, reduce number of instances from 4 to 2.
 By using Any Height / Any Width, can use same code for majority of UI
 
 
*/
