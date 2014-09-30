//
//  BallFall.swift
//  UIViewControls
//
//  Created by HungNT on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BallFall: UIViewController {
    
    var timer: NSTimer?
    var ball: UIImageView?
    var turnUp: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.ball = UIImageView(frame: CGRect(x: 0, y: 0, width: 63, height: 63))
        self.ball?.center = CGPoint(x: self.view.bounds.width * 0.5, y: 100)
        self.ball?.image = UIImage(named: "football.png")
        self.view.addSubview(self.ball!)
        var turnUp = false
        var centerX = self.view.bounds.width * 0.5
        var centerY:Double = 100
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "falling:", userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    func falling(_timer: NSTimer) {
        
        
    }
    
}
