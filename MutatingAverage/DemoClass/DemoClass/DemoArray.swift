//
//  DemoArray.swift
//  DemoClass
//
//  Created by techmaster on 9/11/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoArray: ConsoleScreen {
    var instantArray : NSArray? //? để biểu thị optional
    override func viewDidLoad() {
        super.viewDidLoad()
        self.declareArray()
        self.testSwiftArray()
        
       

    }
    
    func testSwiftArray() {
        var intArr = [Int]() // Khai bao 1 mang Swift co kieu phan tu la Int
        // tuong duong voi NSMutableArray
        // NSMutableArray *intArray = [[NSMutableArray alloc] initWithCapacity: 10]
        // [intArray addObject: @10]
        // [intArray addObject: @20]
        // Array va NSMutableArray chi chua cac phan tu la object neu phan tu co kieula primitive thi phai dong goi thanh phan tu : @10 -> dong goi thanh pha tu chua gia tri 10
        
        intArr.append(10)
        intArr.append(20)
        // Mang trong swift co the chua primitive datatype hoac va doi tuong
        
        let doubleArray = [0.5, 200.1, 230.15] // Constant Array
        var hippyArray = [AnyObject]()
        hippyArray.append(10)
        hippyArray.append("aaaa")
    }
    
    
    func declareArray() {
        var intArr = [Int]()
        intArr.append(10)
        intArr.append(100)
        intArr.insert(50, atIndex: 1)
        var objArray : NSArray
        objArray = [Rectangle(width: 10, height: 10), Triangle(a: 10, b: 10, c: 10), Square(width: 4), Circle(radius: 2)]
        
        var swiftArray = [AnyObject]()
        swiftArray.append(Rectangle(width: 10, height: 10))
        swiftArray.append(Triangle(a: 10, b: 10, c: 10))
        swiftArray.append(Square(width: 4))
        swiftArray.append(Circle(radius: 2))
        
        instantArray = objArray
        
        var objMutableArr : NSMutableArray
        objMutableArr = NSMutableArray(capacity: 2)
        objMutableArr.addObject(Rectangle(width: 10, height: 10))
        
        let aTriangle = Triangle(a: 10, b: 10, c: 10)
        objMutableArr.addObject(aTriangle)
        objMutableArr.addObject(Square(width: 4))
        objMutableArr.addObject(Circle(radius: 2))
        
        
        for obj in objMutableArr  {
            if obj is Shape {
                let shape = obj as Shape
                self.writeln("\(shape.description) with perimeter is \(shape.perimeter())")
            }
        }
        
        if objMutableArr.containsObject(aTriangle) {
            self.writeln("YES")
        }
        
        let index: Int = objMutableArr.indexOfObjectIdenticalTo(Triangle(a: 10, b: 10, c: 10))
        if index == Int.max {
            self.writeln("Cannot find identical triangle")
        }
        
        let index2 = objMutableArr.indexOfObjectIdenticalTo(aTriangle)
        self.writeln("found index = \(index2)")
    }
}
