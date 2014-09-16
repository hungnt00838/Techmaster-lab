
//
//  CodeCamp2.swift
//  DemoClass
//
//  Created by HungNT on 9/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

extension Array {
    
    mutating func distinc(isOrderedBefore: (T, T) -> Bool) {
        for var i = 0; i < (self.count); i++ {
            for var j = i + 1; j < (self.count); j++ {
                if isOrderedBefore(self[i] , self[j] ) {
                    self.removeAtIndex(i)
                }
            }
        }
    }
    
}

class CodeCamp2: ConsoleScreen {
    var array2 = [1,2,3,4,556,7,8,4,32,2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testBT2()
    }
    func testBT2() {
        array2.distinc({ $0 == $1 })
        self.writeln("BT2")
        for result in array2{
            self.writeln("\(result)")
        }
    }
}