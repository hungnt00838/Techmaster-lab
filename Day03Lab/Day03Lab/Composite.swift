//
//  Composite.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import Foundation
infix operator + {}
infix operator - {}
infix operator ** {}
func + ( c1: Composite , c2: Composite) -> Composite {
    return Composite(real: c1.real + c2.real, imagine: c1.imagine + c2.imagine)
}

func - ( c1: Composite , c2: Composite) -> Composite {
    return Composite(real: c1.real - c2.real, imagine: c1.imagine - c2.imagine)
}

func ** ( c1: Composite , c2: Composite) -> Composite {
    return Composite(real: c1.real * c2.real - c1.imagine * c2.imagine, imagine: c1.imagine * c2.imagine + c1.imagine * c2.imagine)
}



class Composite {
    var real: Double
    var imagine: Double
    
    init (real: Double, imagine: Double){
        self.real = real
        self.imagine = imagine
    }
    
    var descrip: String {
        return "\(self.real) + i * \(self.imagine)"
    }
    
}