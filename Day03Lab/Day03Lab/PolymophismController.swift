//
//  PolymophismController.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class PolymophismController: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.polymophism()
    }
    
    func polymophism(){
        let rec = Rectangle (width: 10, height: 20)
        let square = Square(dodai: 5)
        let circle = Circle (radius: 6)
        let tri = Triangle (a: 10, b: 12, c: 13.5)
        
        let shapes = [rec, square, circle,tri]
    
        for shape in shapes {
            inRa("\(shape.description)")
        }
        
    }
    
  
}
