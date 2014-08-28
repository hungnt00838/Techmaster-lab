//
//  ShapeController.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class ShapeController: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoShape()
        self.demoRectangle()
        self.demoSquare()
        self.demoTriangle()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func demoShape() {
        let shape = Shape(numberOfSides: 3, name: "Triangle")
        self.inRa("\(shape.name) has \(shape.numberOfSides) sides" )
        shape.printDescription()
        self.inRa("\(shape.description)")
        
    }
    
    
    func demoRectangle(){
        let rec = Rectangle(width: 10, height: 15)
        self.inRa("\(rec.name) has area = \(rec.area()) and perimeter = \(rec.perimeter())")
    }
    
    func demoSquare(){
        let square = Square(dodai: 10)
        inRa("\(square.name) has area = \(square.area()) and perimeter = \(square.perimeter())")
        
    }
    
    func demoTriangle(){
        let triangle = Triangle(a: 4, b: 5, c: 6)
        inRa("\(triangle.name) has area = \(triangle.area()) and perimeter = \(triangle.perimeter())")
        
    }
    


}
