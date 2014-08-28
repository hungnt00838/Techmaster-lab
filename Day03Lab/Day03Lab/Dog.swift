//
//  Dog.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation

class Dog: Animal{
    var numberDog: Double
    
    init(_number: Double){
        self.numberDog = _number
        super.init(_name: "Dog", _canSwim: true, _numberOfLeg: 4)
    }
    
    var _description: String {
        return ("intelligent")
    }
    
    override func address() -> String {
        return ("garden")
    }
    
    override func description() -> String {
        return self._description
    }


}