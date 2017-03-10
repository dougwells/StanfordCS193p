//: Playground - noun: a place where people can play

import UIKit


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let plus10 = makeIncrementer(forIncrement: 10)
plus10()
plus10()

let plus20 = makeIncrementer(forIncrement: 20)
plus20()
plus20()

plus10()
plus20()


