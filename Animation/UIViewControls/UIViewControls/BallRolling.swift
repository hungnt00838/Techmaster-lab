//
//  BallRolling.swift
//  UIViewControls
//
//  Created by HungNT on 9/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BallRolling: UIViewController {

    var timer: NSTimer?
    var ball: UIImageView?
    var angle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.ball = UIImageView(frame: CGRect(x: 0, y: 0, width: 63, height: 63))
        self.ball?.center = CGPoint(x: 100, y: 10)
        self.ball?.image = UIImage(named: "football.png")
        self.view.addSubview(self.ball!)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timingFunction:", userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    func timingFunction(timer: NSTimer) {
        self.angle += 0.1
        self.ball?.transform = CGAffineTransformMakeRotation(self.angle)
        self.ball?.center = CGPoint(x: Double(self.ball!.center.x), y: Double(self.ball!.center.y + 4))
        
    }
}
