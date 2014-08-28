//
//  Cat.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation

class Cat: Animal {

    var numberCat: Double
    
    init(_number: Double){
        self.numberCat = _number
        super.init(_name: "Cat", _canSwim: false, _numberOfLeg: 4)
    }
    
    var _description: String {
        return ("Catch mouse")
    }
    
    override func address() -> String {
        return ("Home")
    }

    override func description() -> String {
        return self._description
    }

}