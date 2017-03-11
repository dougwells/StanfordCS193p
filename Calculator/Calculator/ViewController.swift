//
//  ViewController.swift
//  Calculator
//
//  Created by Doug Wells on 3/11/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π": displayValue = Double.pi
            case "√":
                let root = sqrt(displayValue)
                displayValue = root
            default: break
            }
        }
    }
    
    
    
}

