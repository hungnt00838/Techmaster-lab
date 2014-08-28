//
//  CompositeController.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class CompositeController: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoComposite()
        
    }
    
    func demoComposite() {
        let c1 = Composite(real: 1, imagine: 2)
        let c2 = Composite(real: 3, imagine: 5)
        let c3 = c1 + c2
        let c4 = c1 - c2
        let c5 = c1 ** c2
        self.inRa("\(c3.descrip)")
        self.inRa("\(c4.descrip)")
        self.inRa("\(c5.descrip)")
    }

}
