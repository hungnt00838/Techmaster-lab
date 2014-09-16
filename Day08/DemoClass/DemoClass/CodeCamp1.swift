//
//  CodeCamp1.swift
//  DemoClass
//
//  Created by HungNT on 9/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

extension Array {
    mutating func average1() -> Double {
        var total: Int = 0
        var average:Double = 0
        for i in 0...(self.count-1) {
            total += self[i] as Int
        }
        average = (Double)(total) / (Double)(self.count)
        return average
    }
    

    
}




class CodeCamp1: ConsoleScreen {
    var intArray: [Int] = [23, 44 , 10, 7, 66, 84, 100, 25, 45, 5, 7]
    var array2 = [1,2,3,4,556,7,8,4,32,2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testBT1()
    }
    
    func testBT1() {
        var resultAverage = self.intArray.average1()
        self.writeln("BT1 average = \(resultAverage)")
    }
}

