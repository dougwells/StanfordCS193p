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


struct CalcBrain {
    
    private var accumulator: Double?    //in "not set" state @ startup
    

    
    private enum Operation {            //Need enum so dictionary can return different types
        case constant(Double)           //Type is a Double
        case unary((Double) -> Double)    //Type is a func that takes a Double & returns a Double
        case binary((Double, Double) -> Double)  //Type is a fn that takes two Doubles & ret Double
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),         //Double.pi,
        "e": Operation.constant(M_E),         //M_E,
        "√": Operation.unary(sqrt),      //sqrt()
        "cos": Operation.unary(cos),
        "sin": Operation.unary(sin),
        "x⁻¹": Operation.unary({1 / $0}),
        "x²": Operation.unary({$0 * $0}),
        "10ˣ": Operation.unary({pow((10), ($0))}),
        "C": Operation.unary({$0 * 0}),
        "±": Operation.unary({-$0}),
        "×": Operation.binary({$0 * $1}),
        "÷": Operation.binary({$0 / $1}),
        "+": Operation.binary({$0 + $1}),
        "-": Operation.binary({$0 - $1}),
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
            case .binary(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(fn: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
            
        }
    } // end performOperation
    
    private mutating func performPendingBinaryOperation(){
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.performOperation(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }

    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?

    private struct PendingBinaryOperation {
        let fn: (Double, Double) -> Double
        let firstOperand: Double
        
        func performOperation (with secondOperand: Double) -> Double {
            return fn(firstOperand, secondOperand)
        }
    }

}
