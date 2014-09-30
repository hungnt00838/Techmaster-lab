//
//  DemoNSTimer.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
class Data {
    var message: String
    init(message: String) {
        self.message = message
    }
}
class DemoNSTimer: UIViewController {
    var timer: NSTimer?
    var x0, y0: CGFloat?
    var angle: Double?
    var earth: UIImageView?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let sun = UIImageView(image: UIImage(named: "sun.png"))
        let boundSize = self.view.bounds.size
        x0 = boundSize.width * 0.5
        y0 = boundSize.height * 0.5
        sun.center = CGPoint(x: x0!, y: y0!)
        sun.bounds = CGRect(x: 0, y: 0, width: 48, height: 48)
        self.earth = UIImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        self.earth?.center = CGPoint(x: sun.center.x + 100, y: sun.center.y + 100)
        self.earth?.image = UIImage(named: "earth.png")
        self.view.addSubview(sun)
        angle = 0
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timingFunction:", userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func timingFunction(timer: NSTimer) {
        angle = angle! + 0.1
        var x2 =  Double(self.view.bounds.size.width * 0.5) + Double(100) * cos(angle!)
        var y2 =  Double(self.view.bounds.size.height * 0.5) + Double(100) * sin(angle!)
        self.earth?.center = CGPoint(x: x2, y: y2)
        self.view.addSubview(self.earth!)
        if (angle > 180){
            angle = 0
        }
    }
    
    func computePos() {
        
    }
    
    deinit {
        timer?.invalidate()
    }
   
}
