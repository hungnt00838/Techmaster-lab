//
//  ImpossibleRush.swift
//  GestureRecognizer
//
//  Created by HungNT on 10/11/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class Ball{
    var color: Int
    var image: String
    
    init(_color: Int, _image: String) {
        self.color = _color
        self.image = _image
    }
    
}

class ImpossibleRush: UIViewController {

    var box: UIImageView?
    var timer: NSTimer?
    var size: CGSize?
    var ballExist: Bool = false
    var ballImage: UIImageView?
    var angle :Double = 0
    var timerRotation: NSTimer?
    var angleCheck : Double = 0
    var boxColor: Int = 0
    var vY: Double = 0.0
    var iPoint: Int = 0
    var lblPoint: UILabel?
    var stringPont: String = "Point: "
    var ballToAdd: Ball?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        self.lblPoint = UILabel(frame: CGRect(x: 20, y: 200, width: 100, height: 150))
        self.lblPoint?.textColor = UIColor.grayColor()
        lblPoint?.text = "\(stringPont)\(iPoint)"
        self.view.addSubview(self.lblPoint!)
        
        self.box = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        self.box?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: 630)
        self.box?.image = UIImage(named: "box.png")
        self.view.addSubview(self.box!)
        
        self.ballImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        self.addBall()
        self.view.addSubview(self.ballImage!)
        
        self.size? = self.view.bounds.size
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveBall:", userInfo: nil, repeats: true)
        timer?.fire()
        
        let tapView = UITapGestureRecognizer(target: self, action: "tapView:")
        self.view.addGestureRecognizer(tapView)
    }
    
    func moveBall(_timer: NSTimer) {
        var y1 = Double(self.ballImage!.center.y) + vY
        vY += 2
        self.ballImage?.center = CGPoint(x: self.ballImage!.center.x , y: CGFloat(y1) )
        if CGRectIntersectsRect(self.box!.frame, self.ballImage!.frame){
            if self.ballToAdd!.color == boxColor{
                iPoint++
                lblPoint?.text = "\(stringPont)\(iPoint)"
            }
            self.addBall()
            vY = 0
        }
    }
    
    func randomColor() -> Ball {
        var outBall = Ball(_color: 0, _image: "Red.png")
        outBall.color = Int(arc4random_uniform(4))
        if outBall.color == 0 {
            outBall.image = "Red.png"
        }
        if outBall.color == 1 {
            outBall.image = "Blue.png"
        }
        if outBall.color == 2 {
            outBall.image = "Green.png"
        }
        if outBall.color == 3 {
            outBall.image = "Yellow.png"
        }
        return outBall
    }
    
    func addBall(){
        ballToAdd = randomColor()
        self.ballImage?.image = UIImage(named: self.ballToAdd!.image)
        self.ballImage?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: -20)
    }
    
    func tapView(_tap: UIPanGestureRecognizer) {
        angleCheck = angle + M_PI_2
        timerRotation = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "rotationTimer", userInfo: nil, repeats: true)
        timerRotation?.fire()
        if boxColor != 3 {
            boxColor++
        }else{
            boxColor = 0
        }
    }
    
    func rotationTimer() {
        if(angle < angleCheck && (angle + 0.1) >= angleCheck){
            angle = angleCheck
            self.box?.transform = CGAffineTransformMakeRotation(CGFloat(angle))
            timerRotation?.invalidate()
            timerRotation = nil
        }else{
            angle += 0.1
            self.box?.transform = CGAffineTransformMakeRotation(CGFloat(angle))
        }
    }

}
