//
//  Gratuity .swift
//  GratuityCalculator
//
//  Created by Andrew Roembke on 9/5/18.
//  Copyright © 2018 Andrew Roembke. All rights reserved.
//

import Foundation

//: Playground - noun: a place where people can play

var str = "Hello, playground"
//gratuity is a subclass of NSObject
class Gratuity: NSObject {
    var tipPercent: NSDecimalNumber = 0
    var billAmount: NSDecimalNumber = 0
    
    // tipAmount is never stored in memory. every time it is always calculated on the fly. it is a computed property
    var tipAmount: NSDecimalNumber {
        return tipPercent.multiplying(by: billAmount)
    }
    
    var totalBillAmount: NSDecimalNumber {
        return tipAmount.adding(billAmount)
    }
    
    init(tipPercent: NSDecimalNumber, billAmount: NSDecimalNumber) {
        self.tipPercent = tipPercent
        self.billAmount = billAmount
    }
}

let newGrat = Gratuity(tipPercent: 0.15, billAmount: 100)

print(newGrat.tipAmount)
print(newGrat.totalBillAmount)
