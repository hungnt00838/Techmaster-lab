//
//  UIColorLabel.swift
//  UIViewControls
//
//  Created by HungNT on 9/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class UIColorLabel: UIViewController {
  
    override func loadView() {
        super.loadView()
        self.addLabel("#556270", _alpha: 1)
    }
    
    
    func addLabel( text: String, _alpha: Int) {
        var label1 =  UILabel(frame: CGRect(x: 10, y: 100, width: 200, height: 30))
        label1.center = CGPoint(x: self.view.bounds.width / 2 , y: self.view.bounds.height / 2)
        self.view.backgroundColor = UIColor.whiteColor()
        label1.text = text
        label1.backgroundColor = UIColor(hex: text, alpha: (Float)(_alpha))
        self.view.addSubview(label1)
    }
    
}
