//
//  DemoUIView.swift
//  UIViewController
//
//  Created by HungNT on 9/19/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class DemoUIView: UIViewController {
    
    var smallView: UIView? //Khai bao instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame  = self.smallView?.frame
        var w = frame!.width
        let h = frame?.height
        //println("with = %3.2f , height = %2.2f", w h)
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        let view = UIView(frame: CGRect(x: 5, y: 70, width: 60, height: 60))  // frame la dinh nghia vi tri va kich thuoc
        
        view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(view)
        
        self.smallView  = UIView()
        self.smallView?.bounds = CGRect(x: 0, y: 0, width: 30, height: 30) // bound chi dinh nghia dai va rong
        self.smallView?.center = CGPoint(x: 50, y: 50)
        self.smallView?.backgroundColor = UIColor.yellowColor()
        self.smallView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        view.addSubview(smallView!) // view la cha cua smallview
        
        let smallerView = UIView()
        smallerView.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)
        smallerView.center = CGPoint(x: 15, y: 15)
        smallerView.backgroundColor = UIColor.redColor()
        self.smallView?.addSubview(smallerView)
        
        let button  = UIButton(frame: CGRect(x: 150, y: 150, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Remove", forState: UIControlState.Normal)
        button.addTarget(self, action: "removeRec:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func removeRec(button: UIButton){
        self.smallView!.removeFromSuperview()
    }

   
}
