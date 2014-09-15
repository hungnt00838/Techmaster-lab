//
//  ExtendArray.swift
//  DemoClass
//
//  Created by HungNT on 9/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
extension Array {
    //reverse() -> [T]
    func daoMang() -> [T] {
        var newArray = self
        var maxElement = newArray.count-1
        var temp: T
        for var i = 0; i < maxElement; i++ {
            if(i <= (maxElement-i) ) {
                temp = self[i]
                newArray[i] = self[(maxElement - i)]
                newArray[maxElement - i] = temp
            }
        }
    return newArray
    }

    mutating func daoMang2() {
        var maxElement = self.count-1
        var temp: T
        for var i = 0; i < maxElement; i++ {
            if(i <= (maxElement-i) ) {
                temp = self[i]
                self[i] = self[(maxElement - i)]
                self[maxElement - i] = temp
            }
        }
    }

    mutating func bubbleSort() {
        var tempArray: [Double] = self as [Double]
        var tempNum: Double  = 0
        for var i = 0; i < self.count; i++ {
            for var j = i + 1 ; j < self.count; j++ {
                if  tempArray[i] > tempArray[j]{
                    tempNum = tempArray[i]
                    tempArray[i] = tempArray[j]
                    tempArray[j] = tempNum
                }
            }
        }
    
    }

    mutating func average() -> Double?{
        var checkNum: Bool = false
        var average: Double? = nil
        for i in 0...(self.count-1){
            if var numCheck = self[i] as? Double{
                checkNum = true
            }
            else{
                checkNum = false
                break
            }
        }

       if checkNum != false {
            var total: Double = 0
            for i in 0...self.count-1{
                total += (self[i] as Double)
            }
            average = (Double)(total) / (Double)(self.count)
        }
        return average

    }

}
