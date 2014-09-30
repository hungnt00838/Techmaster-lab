//
//  SliderImage.swift
//  UIViewControls
//
//  Created by HungNT on 9/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class SliderImage: UIViewController {

    var girl: UIImageView?
    var slider: UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.girl = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        self.girl?.center = CGPoint(x: self.view.bounds.size.width * 0.5 , y: 200 )
        self.girl?.image = UIImage(named: "beauty.jpg")
        self.view.addSubview(self.girl!)
        
        self.slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.slider?.center = CGPoint(x: self.view.bounds.size.width * 0.5 , y: 400 )
        self.slider?.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.slider?.value = Float(self.girl!.alpha)
        self.slider?.setThumbImage(UIImage(named: "clock.png"), forState: UIControlState.Normal)
        self.view.addSubview(self.slider!)
    }
    
    func onSliderChange(slider: UISlider) {
        self.girl!.alpha =  CGFloat(self.slider!.value)
    
    }

}
