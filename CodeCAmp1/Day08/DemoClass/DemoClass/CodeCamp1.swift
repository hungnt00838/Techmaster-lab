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
    
    mutating func distinc(isOrderedBefore: (T, T) -> Bool) {
        for var i = 0; i < (self.count); i++ {
            for var j = i + 1; j < (self.count); j++ {
                if isOrderedBefore(self[i] , self[j] ) {
                    self.removeAtIndex(i)
                }
            }
        }
    }
    
    mutating func getRandom(numGet: Int) -> [Soccer]{
        var arrayResul = [Soccer]()
        for i in 1...(numGet+1){
            var resultTM = Int(arc4random_uniform((UInt32)(self.count)))
            arrayResul.append(self[resultTM] as Soccer)
            self.removeAtIndex(resultTM)
        }
        return arrayResul
    }
    
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

class Soccer {
    var name: String
    var role: Int
    
    init(_name: String, _role: Int ) {
        self.name = _name
        self.role = _role
    }
}


class CodeCamp1: ConsoleScreen {
    var intArray: [Int] = [23, 44 , 10, 7, 66, 84, 100, 25, 45, 5, 7]
    var array2 = [1,2,3,4,556,7,8,4,32,2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testBT1()
        self.testBT2()
        self.testBT3()
        self.testBT4()
    }
    
    func testBT1() {
        var resultAverage = self.intArray.average1()
        self.writeln("BT1 average = \(resultAverage)")
    }
    
    func testBT2() {
        array2.distinc({ $0 == $1 })
        self.writeln("BT2")
        for result in array2{
            self.writeln("\(result)")
        }
    }
    
    func testBT3() {
        
        var soccer1 = Soccer(_name: "Thu mon 1" , _role: 1)
        var soccer2 = Soccer(_name: "Thu mon 2" , _role: 1)
        var soccer3 = Soccer(_name: "Thu mon 3" , _role: 1)
        
        var soccer4 = Soccer(_name: "Hau ve 1", _role: 2)
        var soccer5 = Soccer(_name: "Hau ve 2", _role: 2)
        var soccer6 = Soccer(_name: "Hau ve ", _role: 2)
        var soccer7 = Soccer(_name: "Hau ve ", _role: 2)
        var soccer8 = Soccer(_name: "Hau ve 5", _role: 2)
        var soccer9 = Soccer(_name: "Hau ve 6", _role: 2)
        var soccer10 = Soccer(_name: "Hau ve 7", _role: 2)
        var soccer11 = Soccer(_name: "Hau ve ", _role: 2)
        var soccer12 = Soccer(_name: "Hau ve 9", _role: 2)
        
        var soccer13 = Soccer(_name: "Tien ve 1", _role: 3)
        var soccer14 = Soccer(_name: "Tien ve 2", _role: 3)
        var soccer15 = Soccer(_name: "Tien ve 3", _role: 3)
        var soccer16 = Soccer(_name: "Tien ve 4", _role: 3)
        var soccer17 = Soccer(_name: "Tien ve 5", _role: 3)
        var soccer18 = Soccer(_name: "Tien ve 6", _role: 3)
        
        var soccer19 = Soccer(_name: "Tien dao 1", _role: 4)
        var soccer20 = Soccer(_name: "Tien dao 2", _role: 4)
        var soccer22 = Soccer(_name: "Tien dao 3", _role: 4)
        var soccer23 = Soccer(_name: "Tien dao 4", _role: 4)
        var soccer24 = Soccer(_name: "Tien dao 5", _role: 4)
        var soccer25 = Soccer(_name: "Tien dao 6", _role: 4)
        var soccer26 = Soccer(_name: "Tien dao 7", _role: 4)
        var soccer27 = Soccer(_name: "Tien dao 8", _role: 4)
        
        var arraySoocerTM: [Soccer] = [soccer1, soccer2, soccer3]
        var arraySoocerHV: [Soccer] = [soccer4,soccer5,soccer6,soccer7,soccer8,soccer9,soccer10,soccer11,soccer12]
        var arraySoocerTV: [Soccer] = [soccer13,soccer14,soccer15,soccer16,soccer17,soccer18]
        var arraySoocerTD: [Soccer] = [soccer19,soccer20,soccer22,soccer23,soccer24,soccer25,soccer26,soccer27]
        
        var arraySoocerResult =  [Soccer]()
        
        var numTM = 1
        var numHV = Int(arc4random_uniform(3))
        var numTV = Int(arc4random_uniform(4))
        var numTD = 11 - (numHV + numTV + 2 + 1)
        
        var resultTM = Int(arc4random_uniform(3))
        self.writeln("BT4")
        arraySoocerResult.append(arraySoocerTM[resultTM])
        arraySoocerResult += arraySoocerHV.getRandom(numHV)
        arraySoocerResult += arraySoocerTV.getRandom(numTV)
        arraySoocerResult += arraySoocerTD.getRandom(numTD)
        for arr in  arraySoocerResult{
            self.writeln("\(arr.name)")
        }
        
        
    }
    func testBT4() {
        self.writeln("BT4")
        self.intArray.sortArray()
        for result in intArray{
            self.writeln("\(result)")
        }
    }
}

