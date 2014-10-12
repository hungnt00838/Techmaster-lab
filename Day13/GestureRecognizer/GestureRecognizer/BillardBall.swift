//
//  BillardBall.swift
//  GestureRecognizer
//
//  Created by HungNT on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class BillardBall: UIViewController {
    
    var ball: UIImageView?
    var cue: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        var table = UIImageView(frame: CGRect(x: 0, y: 60, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 60))
        table.image = UIImage(named: "unnamed.jpg")
        self.view.addSubview(table)
        self.ball = UIImageView(frame: CGRect(x: 0, y: 0, width: 29, height: 29))
        self.ball?.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        self.ball?.image = UIImage(named: "Ball8.png")
        self.cue = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 360))
        self.cue?.center = CGPoint(x: self.ball!.center.x , y: self.ball!.center.y)
        self.cue?.image = UIImage(named: "cue.gif")
        self.cue?.layer.anchorPoint = CGPointMake( 0.5, 0)
        
        self.view.addSubview(self.ball!)
        self.view.addSubview(self.cue!)
        
        self.view.multipleTouchEnabled = true
        self.view.userInteractionEnabled = true
        
   
        
        let rotate = UIRotationGestureRecognizer(target: self, action: "onRotate:")
        view.addGestureRecognizer(rotate)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: "onPinch:")
        view.addGestureRecognizer(pinch)
    }
    
  
    
    func onRotate(rotate: UIRotationGestureRecognizer) {
        if (rotate.state == UIGestureRecognizerState.Began || rotate.state == UIGestureRecognizerState.Changed) {
            cue!.transform = CGAffineTransformRotate(cue!.transform, rotate.rotation)
            rotate.rotation = 0
        }
    }
    
    func onPinch(pinch: UIPinchGestureRecognizer) {
        let point = pinch.locationInView(self.view)
        cue?.center = CGPoint(x: point.x, y: point.y)
        self.view.addSubview(self.cue!)
    }
    
    
}
