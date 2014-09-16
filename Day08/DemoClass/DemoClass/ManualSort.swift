//
//  ManualSort.swift
//  DemoClass
//
//  Created by techmaster on 9/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
extension Array {
//See this link http://www.programmingsimplified.com/c/source-code/c-program-bubble-sort
    
    mutating func bubbleSort(isOrderedBefore: (T, T) -> Bool) {
        let n = self.count
        for var i = 0; i < n - 1; i++ {
            for var j = 0; j < n - i - 1; j++ {
                if !isOrderedBefore(self[j], self[j+1]) {
                    let temp = self[j]
                    self[j] = self[j+1]
                    self[j+1] = temp
                }
            }
        }
    }
//http://www.vogella.com/tutorials/JavaAlgorithmsQuicksort/article.html
//QuickSort and Optimized QuickSort http://alienryderflex.com/quicksort/
//http://www.cquestions.com/2008/01/c-program-for-quick-sort.html
  
    mutating func quickSort(isOrderedBefore: (T, T) -> Bool) {
        qSort(0, end: (self.count - 1), compare: isOrderedBefore)
    }
    private mutating func swap(i: Int, j: Int) {
        let temp = self[i]
        self[i] = self[j]
        self[j] = temp
    }
    
    private mutating func qSort(beg: Int, end: Int,compare: (T, T) -> Bool) {
        var left = beg + 1
        var right = end
        let pivot = self[beg]
        while left < right {
            if compare(self[left], pivot) {
                left++
            } else {
                swap(left, j:right)
            }
        }
        swap(--left, j: beg)
        qSort(beg, end: left, compare: compare)
        qSort(right, end: end, compare: compare)
        
    }

    mutating func average() -> Double?{
        var checkNum: Bool = false
        var average: Double? = nil
        for i in 0...(self.count-1){
            if var numCheck = self[i] as? Int{
                checkNum = true
            }
            else{
                checkNum = false
                break
            }
        }

       if checkNum != false {
            var total = 0
            for i in 0...self.count-1{
                total += (self[i] as Int)
            }
            average = (Double)(total) / (Double)(self.count)
        }
        return average
    }


    mutating func getSoccer() ->[Int] {
        var result: [Int] = []
        var dice1 = 0
        var numberTemp: UInt32 = 29
        for i in 1...11 {
            dice1 = Int(arc4random_uniform(numberTemp))
            result.append(self[dice1] as Int)
            self.removeAtIndex(dice1)
            numberTemp--
        }
        return result
    }

}
class ManualSort: ConsoleScreen {
    var intArr = [23, 44 , 10, 7, 66, 84, 100, 25, 45, 5, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let start = NSDate(); // <<<<<<<<<< Start time
        self.testBubbleSort()
        let end = NSDate();   // <<<<<<<<<<   end time
        let timeInterval: Double = end.timeIntervalSinceDate(start); // <<<<< Difference in seconds (double)
        
        self.writeln("\(timeInterval) seconds")

        self.testAverage()
        self.testGetSoccer()
    }

    func testBubbleSort() {
        intArr.bubbleSort { $0 < $1 }
        for i in intArr {
            self.writeln("\(i)")
        }
    }
    
    func testQuickSort() {
        intArr.quickSort { $0 < $1 }
        for i in intArr {
            self.writeln("\(i)")
        }
    }
    
    func testAverage() {
        var result = self.intArr.average()
        self.writeln("Average = \(result!)")
    }
    

    func testGetSoccer(){
        var soccerArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
        print("num = \(soccerArray.count)")
        var result = soccerArray.getSoccer()
        for re in result{
            self.writeln("Soccer: \(re)")
        }
    }
    

   
}
