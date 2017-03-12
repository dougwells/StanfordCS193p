//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Doug Wells on 3/11/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import Foundation

func changeSign(a:Double) -> Double {
    return -a
}

func multiply (a:Double, b:Double) -> Double {
    return a * b
}

struct CalcBrain {
    
    private var accumulator: Double?    //in "not set" state @ startup
    

    
    private enum Operation {            //Need enum so dictionary can return different types
        case constant(Double)           //Type is a Double
        case unary((Double) -> Double)    //Type is a func that takes a Double & returns a Double
        case binary((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),         //Double.pi,
        "e": Operation.constant(M_E),         //M_E,
        "√": Operation.unary(sqrt),      //sqrt()
        "cos": Operation.unary(cos),
        "±": Operation.unary(changeSign),
        "×": Operation.binary(multiply),
        "=": Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unary (let fn):
                if accumulator != nil {
                    accumulator = fn(accumulator!)
                }
            case .binary(let fn):
                break
            case .equals:
                break
            }
            
        }
    } // end performOperation
    
    private struct PendingBinaryOperation {
        
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
