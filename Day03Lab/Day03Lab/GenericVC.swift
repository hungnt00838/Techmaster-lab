//
//  GenericVC.swift
//  Day03Lab
//
//  Created by HungNT on 8/26/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class GenericVC: UIViewController {
    
    var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textview = UITextView(frame: self.view.frame)
        self.textview.backgroundColor = UIColor.blackColor()
        self.textview.textColor = UIColor.greenColor()
        self.textview.font = UIFont(name: "Courier", size: 24)
        self.view.addSubview(self.textview)
    }

    func inRa(line: String){
        var text = self.textview.text!
        text += ("\(line) \n")
        self.textview.text = text

    
    }
}
