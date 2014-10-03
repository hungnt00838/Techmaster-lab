//
//  Mario.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Mario: UIViewController {
    var mario: UIImageView?
    var city1, city2, city3, city4: UIImageView?
    var _timer: NSTimer?
    var timerTap: NSTimer?
    var viewHeight: Double = 0.0
    var box: UIImageView?
    var gameOver: UIImageView?
    var moveX = 20
    let textPoint :String = "Point: "
    var numPoint: Int = 0
    var lblPoint: UILabel?
    let cityWidth: Double = 1498
    let cityHeight: Double = 400
    var checkAddPoint: Bool = true
    var velY: Double = 0.0 // vận tốc
    var accY: Double = 0.3 // gia tốc
    var jumpOn: Bool = false
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let viewSize = self.view.bounds.size
        viewHeight = Double(viewSize.height) - 60
        
        
        city1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city1!.image = UIImage(named: "city1.png")
        self.view.addSubview(city1!)
        
        city4 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city4!.image = UIImage(named: "city1.png")
        self.view.addSubview(city4!)
        
        
        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 102))
        mario?.center = CGPoint(x: viewSize.width * 0.5, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
        // Cau hinh UIImage co the nhan thao tac cham man hinh
        mario!.userInteractionEnabled = true
        mario!.multipleTouchEnabled = false
        mario!.animationImages = [
            UIImage(named: "1.png"),
            UIImage(named: "2.png"),
            UIImage(named: "3.png"),
            UIImage(named: "4.png"),
            UIImage(named: "5.png"),
            UIImage(named: "6.png"),
            UIImage(named: "7.png"),
            UIImage(named: "8.png")
        ]
        mario!.animationDuration = 1.0
        self.lblPoint = UILabel(frame: CGRect(x: 0, y: 70, width: 80, height: 80))
        self.view.addSubview(mario!)
        mario!.startAnimating()
        self.lblPoint?.text = self.textPoint
        self.view.addSubview(self.lblPoint!)
        
        // gan thao tac tap vao mario
        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
        self.view.addGestureRecognizer(tap)
        self.box = UIImageView(frame: CGRect(x: self.view.bounds.size.width + 200, y: CGFloat((viewHeight) - 50), width: 50, height: 50))
        self.box?.image = UIImage(named: "box.jpg")
        self.view.addSubview(self.box!)
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runCity", userInfo: nil, repeats: true)
        self._timer?.fire()
        
    }
    
    
    func runCity() {
        city1!.center = CGPoint(x: city1!.center.x - CGFloat(moveX), y: city1!.center.y)
        city4!.center = CGPoint(x: city4!.center.x - CGFloat(moveX), y: city4!.center.y)
        self.box!.center = CGPoint(x: self.box!.center.x - CGFloat(moveX), y: self.box!.center.y)
        if(self.box!.center.x <= -25){
            self.box!.center = CGPoint(x: self.view.bounds.size.width + 70, y: self.box!.center.y)
            self.checkAddPoint = true
        }
        if(self.box!.center.x <= (self.view.bounds.size.width * 0.5 - self.mario!.bounds.size.width) && self.checkAddPoint == true){
            self.numPoint++
            self.lblPoint!.text = ("\(self.textPoint)\(self.numPoint)")
            self.checkAddPoint = false
        }
        if CGRectIntersectsRect(self.box!.frame,self.mario!.frame){
            self.gameOver = UIImageView(frame: CGRect(x: 0 ,y: 0, width: 400, height: 200))
            self.gameOver?.center = CGPoint(x: self.view.bounds.width * 0.5, y: self.view.bounds.size.height + self.gameOver!.bounds.height * 0.5)
            self.gameOver?.image = UIImage(named: "Game_Over.png")
            self.view.addSubview(self.gameOver!)
            self.mario!.stopAnimating()
            mario!.userInteractionEnabled = false
            self.mario!.image = UIImage(named: "1.png")
            UIView.animateWithDuration(3, animations: {
                self.gameOver!.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                }, completion: { (finished: Bool) in
                    println("Game Over")
            })
            _timer?.invalidate()
            _timer = nil
            timerTap?.invalidate()
            timerTap = nil
            
        }
        if city1!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city1!.frame = CGRect(x: Double(city4!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 1")
        }
        if city4!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city4!.frame = CGRect(x: Double(city1!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 2")
        }
        
        
        
    }
    func tapOnMario() {
        velY = 9
        timerTap?.invalidate()
        timerTap = nil
        self.timerTap = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "tapUpMario:", userInfo: nil, repeats: true)
        self.timerTap?.fire()

    }
    
    func tapUpMario(_timeTap: NSTimer) {
        var marioX = Double (self.mario!.center.x)
        var marioY = Double (self.mario!.center.y)
        if jumpOn == false {
            velY -= accY
            marioY -= velY
            if marioY >= 546 {
                jumpOn = true
                timerTap?.invalidate()
                timerTap = nil
            } else {
                self.mario?.center = CGPoint(x: marioX, y: marioY)
            }
        }else {
            jumpOn = false
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
}
