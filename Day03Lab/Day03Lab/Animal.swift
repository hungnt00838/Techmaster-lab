//
//  Animal.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation

class Animal {
    var name: String
    var canSwim: Bool
    var numberOfLeg: Int
    
    init(_name: String, _canSwim: Bool, _numberOfLeg: Int) {
        self.name = _name
        self.canSwim = _canSwim
        self.numberOfLeg = _numberOfLeg
    }
    
    func address() -> String {
        return ""
    }
    
    func description() -> String {
        return ""
    }

}