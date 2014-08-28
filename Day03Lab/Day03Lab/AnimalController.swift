//
//  AnimalController.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class AnimalController: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAnimal()

    }
    
    func showAnimal(){
        let cat = Cat(_number: 2)
        let dog = Dog(_number: 6)
        
        let animalInHome = [cat, dog]
        
        for animal in animalInHome {
            inRa("Name: \(animal.name)")
            inRa("CanSwim: \(animal.canSwim)")
            inRa("Number of Legs: \(animal.numberOfLeg)")
            inRa("Address: \(animal.address())")
            inRa("Descriptio: \(animal.description()) \n")
        }
    }

}
