//
//  DemoControl.swift
//  UIViewController
//
//  Created by HungNT on 9/19/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class DemoControl: UIViewController, UITextFieldDelegate {

    var label : UILabel!
    var image: UIImageView?
    var slider: UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        self.label.text = "Hello Word"
        self.label.backgroundColor = UIColor.magentaColor()
        //self.label.transform = CGAffineTransformMakeScale(2, 2)
        self.view.addSubview(self.label)
        
        
        let txtName = UITextField(frame: CGRect(x: 10, y: 70, width: 200, height: 40))
        txtName.placeholder = "Enter your name: "
        txtName.borderStyle = UITextBorderStyle.Bezel
        txtName.keyboardType = UIKeyboardType.NumberPad
        txtName.borderStyle = UITextBorderStyle.Line
        txtName.delegate = self
        self.view.addSubview(txtName)
        
        // switch button 
        let airPlanMode = UISwitch()
        airPlanMode.center = CGPoint(x: 150, y: 150)
        airPlanMode.addTarget(self, action: "airPlanModeChange:", forControlEvents: UIControlEvents.ValueChanged)
        //self.view.addSubview(airPlanMode)
        
        // slider
        self.slider = UISlider(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        self.slider!.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        //slider.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.view.addSubview(self.slider!)
        
        // image
        
        self.image = UIImageView(frame: CGRect(x: 10, y: 250, width: 300, height: 300))
        self.image!.image = UIImage(named: "cartoon-dinosaur-running-vector-illustration-32465532.jpg")
        self.view.addSubview(self.image!)
        slider!.value = Float(image!.alpha)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        if textField.isFirstResponder() {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func airPlanModeChange(switchButton: UISwitch){
        if (switchButton.on){
            self.label!.text = "on"
        } else {
            self.label!.text = "Off"
        }
    }
    
    func onSliderChange(slider: UISlider){
        label.text = String(format: "%1.2f", slider.value)
        image!.alpha = CGFloat(slider.value)
    }
    

}
