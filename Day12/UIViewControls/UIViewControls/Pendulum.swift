//
//  Pendulum.swift
//  UIViewControls
//
//  Created by HungNT on 10/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Pendulum: UIViewController {
    
    var _timer: NSTimer?
    var _angle:Double = 0
    var _angleDelta: Double = 0
    var pendulum: UIImageView?
    var liderAngle: UISlider?
    let MAX_ANGLE = M_PI_4 * 0.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        pendulum = UIImageView(frame: CGRect(x: self.view.bounds.size.width * 0.5, y: 20, width: 40 , height: 300))
        self.pendulum?.layer.anchorPoint = CGPointMake(0.5, 0);
        self.pendulum?.image = UIImage(named: "pendulum.png")
        self.view.addSubview(self.pendulum!)
        _angle = 0.0;
        _angleDelta = 0.05;
        _timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animatePendulum", userInfo: nil, repeats: true)
        _timer?.fire()
        
    }
    func animatePendulum(){
        _angle += _angleDelta;
        if ((_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE)) {
            _angleDelta = -_angleDelta;
        }
        self.pendulum?.transform = CGAffineTransformMakeRotation(CGFloat(_angle));
        NSLog("%3.2f - %3.2f", self.pendulum!.center.x  , self.pendulum!.center.y);
        
    }
    
    
}
