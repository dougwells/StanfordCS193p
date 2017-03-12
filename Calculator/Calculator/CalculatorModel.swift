//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Doug Wells on 3/11/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import Foundation

struct CalcBrain {
    
    private var accumulator: Double?    //in "not set" state @ startup
    
    func performOperation(_ symbol: String) {
        
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
