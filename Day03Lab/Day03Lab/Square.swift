//
//  Square.swift
//  Day03Lab
//
//  Created by HungNT on 8/25/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation

class Square: Shape {
    var dodai: Double
    
    init(dodai:Double){
        self.dodai = dodai
        super.init(numberOfSides: 4, name: "Square")
    }

    override func area() -> Double {
        return (dodai * dodai)
    }
    
    override func perimeter() -> Double {
        return (dodai * 4)
    }

}