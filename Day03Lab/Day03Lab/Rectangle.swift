//
//  Rectangle.swift
//  Day03Lab
//
//  Created by HungNT on 8/25/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation
class Rectangle: Shape{
    var width, height: Double
    init (width: Double, height: Double){
        self.width = width
        self.height = height
        super.init(numberOfSides: 4, name: "Rectangle")
    }
    
    override func perimeter() -> Double {
        return (self.width + self.height) * 2
    }
    
    override func area() -> Double {
        return self.width * self.height
    }
    
    
}
