//
//  BirdFly.swift
//  UIViewController
//
//  Created by HungNT on 9/20/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class BirdFly: UIViewController {
    
    var bird: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        //self.edgesForExtendedLayout =  UIRectEdge.None
        self.bird = UIImageView(frame: CGRect(x: self.view.bounds.width - 108, y: self.view.bounds.height - 128, width: 108, height: 128))
        self.bird?.image = UIImage(named: "bird01.png")
        self.view.addSubview(self.bird!)
        var btnPlay = UIButton(frame: CGRect(x: self.view.bounds.width - 108, y: self.view.bounds.height - 128, width: 100, height: 50))
        btnPlay.setTitle("Play", forState: UIControlState.Normal)
        btnPlay.addTarget(self, action: "play:", forControlEvents: UIControlEvents.TouchUpInside)
        btnPlay.center = CGPoint(x: (CGFloat)(self.view.frame.width*0.5) , y: (CGFloat)(self.view.bounds.height - 40) )
        btnPlay.backgroundColor = UIColor.grayColor()
        self.view.addSubview(btnPlay)
    }
    
    func play(btn: UIButton) {
        self.bird?.image = UIImage(named: "bird02.png")
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("birdFly:"), userInfo: nil, repeats: true)
    }
    
    func birdFly(timer:NSTimer!) {
        self.bird?.frame.origin.x -= (CGFloat)(2)
        self.bird?.frame.origin.y -= (CGFloat)(2)
    }
}
