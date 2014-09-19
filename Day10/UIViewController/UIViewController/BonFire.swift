//
//  BonFire.swift
//  UIViewControls
//
//  Created by techmaster on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BonFire: UIViewController {
    var fire : UIImageView?
    var label : UILabel?
    var turnleft = false
    override func viewDidLoad() {
        super.viewDidLoad()
        fire!.startAnimating()
        
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blackColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        fire = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        fire?.center = CGPoint(x: self.view.bounds.width * 0.5, y: self.view.bounds.width * 0.5)
        var images: [UIImage] = [UIImage]()
        
        for i in 1...17 {
            var fileName: String
            if i < 10 {
                fileName = "campFire0\(i).gif"
            } else {
                fileName = "campFire\(i).gif"
            }
            
            images.append(UIImage(named: fileName))
        }
        fire?.animationImages = images
        fire?.animationDuration = 1.5
        fire?.animationRepeatCount = 100
        self.view.addSubview(fire!)
        self.label = UILabel(frame: CGRect(x: 0, y: self.view.bounds.width * 0.5, width: 200, height: 30))
        self.label?.font = UIFont.boldSystemFontOfSize(17)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update:"), userInfo: nil, repeats: true)
        self.view.addSubview(self.label!)
    }
    
    func update(timer:NSTimer!) {
        self.label!.textColor = UIColor.whiteColor()
        self.label!.text = "HUONG ƠI ANH YEU EM"
        if(self.label!.frame.origin.x <= 0){
            turnleft = false
        }
        if(self.label!.frame.origin.x >= (self.view.bounds.width - self.label!.frame.width)){
            turnleft = true
        }
        if ( turnleft == false && self.label!.frame.origin.x <= (self.view.bounds.width - self.label!.frame.width)){
            self.label!.frame.origin.x += (CGFloat)(10)
        }
        else if ( turnleft == true && self.label!.frame.origin.x >= 0){
            self.label!.frame.origin.x -= (CGFloat)(10)
        }

    }
    
}
