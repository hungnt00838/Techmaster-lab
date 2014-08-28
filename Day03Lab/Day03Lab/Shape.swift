//
//  Shape.swift
//  Day03Lab
//
//  Created by HungNT on 8/25/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides: Int = 0
    var name: String
    
    init (numberOfSides: Int, name: String){
        self.numberOfSides = numberOfSides
        self.name = name
    }
    
    func printDescription(){
        println("\(self.name) has \(self.numberOfSides) sides ")
    }
    
    var description: String{
        return ("\(self.name) has \(self.numberOfSides) sides ")
    }
    
    func perimeter() -> Double {
        return 0.0
    }
    func area() -> Double {
        return 0.0
    }


}