//
//  CodeCamp4.swift
//  DemoClass
//
//  Created by HungNT on 9/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

extension Array {
    mutating func sortArray() {
        var arrLeft = [T]()
        var arrRight = [T]()
        var leftInt = 0
        for var i = 0; i < self.count ; i++ {
            if (self[i] as Int % 2 != 0) {
                arrLeft.append(self[i])
            }else {
                arrRight.append(self[i])
            }
        }
        self = arrLeft + arrRight
    }

}

class CodeCamp4: ConsoleScreen {
    var intArray: [Int] = [23, 44 , 10, 7, 66, 84, 100, 25, 45, 5, 7]
    var array2 = [1,2,3,4,556,7,8,4,32,2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testBT4()
    }
    
    func testBT4() {
        self.writeln("BT4")
        self.intArray.sortArray()
        for result in intArray{
            self.writeln("\(result)")
        }
    }

}
