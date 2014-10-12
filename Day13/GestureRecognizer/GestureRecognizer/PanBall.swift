//
//  PanBall.swift
//  GestureRecognizer
//
//  Created by HungNT on 10/8/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class PanBall: UIViewController {
    var ball: UIImageView?
    var hole: UIImageView?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var width: Double = 0.0
    var height: Double = 0.0
    var timer: NSTimer?
    var R: Double = 18
    var x1: Double = 0.0
    var y1: Double = 0.0
    let textPoint :String = "Point: "
    var numPoint: Int = 0
    var lblPoint: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.width = Double(self.view.bounds.size.width)
        self.height = Double(self.view.bounds.size.height) - 20
        
        self.lblPoint = UILabel(frame: CGRect(x: 20, y: 60, width: 100, height: 40))
        self.lblPoint?.textColor = UIColor.grayColor()
        self.lblPoint?.text  = ("\(textPoint) \(numPoint)")
        self.view.addSubview(self.lblPoint!)
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.hole = UIImageView(frame: CGRect(x: 0, y: 0, width: 402 / 6  , height: 439 / 6))
        self.hole?.image = UIImage(named: "Basket.png")
        self.hole?.center = CGPoint(x: self.hole!.bounds.size.width * 0.5, y: 400)
        self.view.addSubview(self.hole!)
        
        self.ball = UIImageView(frame: CGRect(x: 0, y: 0, width: 36 , height: 36))
        self.ball?.image = UIImage(named: "football.png")
        ball?.center = CGPoint(x: self.view.bounds.size.width - 18, y: 100)
        ball?.multipleTouchEnabled = true
        ball?.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: "panIt:")
        
        ball?.addGestureRecognizer(pan)
        self.view.addSubview(self.ball!)
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerLoop", userInfo: nil, repeats: true)
        timer?.fire()
        
    }
    
    func panIt(_pan: UIPanGestureRecognizer) {
        if (_pan.state == UIGestureRecognizerState.Began || _pan.state == UIGestureRecognizerState.Changed) {
            let velocity = _pan.velocityInView(self.view)
            vX += Double(velocity.x) * 5 / width
            vY += Double(velocity.y) * 5 / height
        }
    }
    
    func timerLoop(){
        x1 = Double(ball!.center.x) + vX
        y1 = Double(ball!.center.y) + vY
        if (self.vX != 0 || self.vY != 0 ){
            ball!.center = CGPoint(x: x1, y: y1)
            vX = 0.7 * vX 
            vY += 3
        }
        if CGRectIntersectsRect(self.ball!.frame,self.hole!.frame){
            numPoint++
            ball?.center = CGPoint(x: self.view.bounds.size.width - 18, y: 100)
            vX = 0
            vY = 0
            self.lblPoint?.text  = ("\(textPoint) \(numPoint)")
        }
        
        if (self.ball!.center.x < -18 || self.ball!.center.y > 500) {
            ball?.center = CGPoint(x: self.view.bounds.size.width - 18, y: 100)
            vX = 0
            vY = 0
        }
    }

}
