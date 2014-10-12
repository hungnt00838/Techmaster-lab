//
//  football.swift
//  GestureRecognizer
//
//  Created by HungNT on 10/9/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class football: UIViewController {
    
    var goal: UIImageView?
    var ball : UIImageView?
    var keeper : UIImageView?
    var timerKeeper: NSTimer?
    var timerBall: NSTimer?
    var frameGoal : UILabel?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var width: Double = 0.0
    var height: Double = 0.0
    let textPoint :String = "Point: "
    var numPoint: Int = 0
    var lblPoint: UILabel?
    var turnLeft: Bool = true
    var sizeX : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        width = Double(size.width)
        height = Double(size.height) - 60
        sizeX = size.width
        self.lblPoint = UILabel(frame: CGRect(x: 20, y: 300, width: 100, height: 40))
        self.lblPoint?.textColor = UIColor.grayColor()
        self.lblPoint?.text  = ("\(textPoint) \(numPoint)")
        self.view.addSubview(self.lblPoint!)
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.goal = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 150 ))
        self.goal?.image = UIImage(named: "Goal.jpg")
        self.goal?.center = CGPoint(x: (self.view.bounds.size.width * 0.5), y: 150)
        self.view.addSubview(self.goal!)
        
        self.frameGoal = UILabel(frame: CGRect(x: 0, y: 0, width: (250 - 30), height: 150 ))
        self.frameGoal?.center = self.goal!.center
        self.view.addSubview(self.frameGoal!)
        
        self.keeper = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 100 ))
        self.keeper?.image = UIImage(named: "keeper.jpg")
        self.keeper?.center = CGPoint(x: (self.view.bounds.size.width * 0.5), y: 180)
        self.view.addSubview(self.keeper!)
        
        self.ball = UIImageView(frame: CGRect(x: 0, y: 0, width: 36 , height: 36))
        self.ball?.image = UIImage(named: "football.png")
        ball?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: 500)
        ball?.multipleTouchEnabled = true
        ball?.userInteractionEnabled = true
        
        let pan =  UIPanGestureRecognizer(target: self, action: "panBall:")
        self.ball?.addGestureRecognizer(pan)
        
        self.view.addSubview(self.ball!)
        timerBall = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveBall:", userInfo: nil, repeats: true)
        timerBall?.fire()
        timerKeeper = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveKeeper", userInfo: nil, repeats: true)
        timerKeeper?.fire()

    }
    
    func panBall(pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            let velocity = pan.velocityInView(self.view)
            vX += Double(velocity.x) * 4 / width
            vY += Double(velocity.y) * 4 / height
        }
    }
    
    func moveBall(timer: NSTimer) {
        var x1 = Double(ball!.center.x) + vX
        var y1 = Double(ball!.center.y) + vY
        self.ball?.center = CGPoint(x: x1, y: y1)
        if (self.ball!.center.x < -40 || self.ball!.center.y < -40 || self.ball!.center.y > self.view.bounds.size.height + 40 || self.ball!.center.x > self.view.bounds.size.width + 40) {
            ball?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: 500)
            vX = 0
            vY = 0
        }
        if !CGRectIntersectsRect(self.ball!.frame,self.keeper!.frame){
            if CGRectIntersectsRect(self.ball!.frame,self.frameGoal!.frame){
                numPoint++
                ball?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: 500)
                vX = 0
                vY = 0
                self.lblPoint?.text  = ("\(textPoint) \(numPoint)")
            }
        }else{
            vY = -vY
        }
        
    }
    
    func moveKeeper() {
        if self.turnLeft == true {
            self.keeper?.center.x -= 2
        }else{
            self.keeper?.center.x += 2
        }
        if self.keeper!.center.x <= CGFloat(sizeX * 0.5 - 100) {
            turnLeft = false
        }
        if self.keeper!.center.x >= CGFloat(sizeX * 0.5 + 100) {
            turnLeft = true
        }
    }

}
