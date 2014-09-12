//
//  SortController.swift
//  BubbleSort_
//
//  Created by HungNT on 9/11/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class SortController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var arrayNum: [Int] = [1,4,5,12,9,3,6,7,99]
        var arrayBubble = bubbleSort(arrayNum)
        var stringResult = ""
        stringResult += ("Bubble sort")
        for item in arrayBubble{
            
             stringResult += "\(item) ; "
        }
        var quickArray = quickSort(arrayNum)
        stringResult += ("\n Quick sort")
        for item in quickArray{
             stringResult += "\(item) ; "
        }
        lblResult.text = stringResult
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bubbleSort(arrayNum: [Int]) -> [Int]{
        var newArray = arrayNum
        var tempNum: Int  = 0
        for var i = 0; i < newArray.count; i++ {
            for var j = i + 1 ; j < newArray.count; j++ {
                if  newArray[i] > newArray[j]{
                
                    tempNum = newArray[i]
                    newArray[i] = newArray[j]
                    newArray[j] = tempNum
                }
            }
        }
        return newArray
    }
    
    func quickSort(newArray: [Int])->Array<Int> {
        
        var less = [Int]()
        var equal = [Int]()
        var greater = [Int]()
        
        if newArray.count > 1{
            var pivot = newArray[0]
            
            for x in newArray {
                if x < pivot{
                    less.append(x)
                }
                if x == pivot {
                    equal.append(x)
                }
                if x > pivot {
                    greater.append(x)
                }
            }
            return (quickSort(less)+equal+quickSort(greater))
            
        }
            
        else {
            return newArray
        }
        
    }
    
}
