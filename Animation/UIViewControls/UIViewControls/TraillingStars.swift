//
//  TraillingStars.swift
//  UIViewControls
//
//  Created by HungNT on 9/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class TraillingStars: UIViewController {

    var redStar: UIImageView?
    var violetStar: UIImageView?
    var greenStar: UIImageView?
    var brownStar: UIImageView?
    var timer: NSTimer?
    var x1, x2, x3, x4 : Double?
    var y1, y2, y3, y4 : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        var centerX = self.view.bounds.size.width * 0.5
        var centerY = self.view.bounds.size.height * 0.5
        self.violetStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.violetStar?.image = UIImage(named: "violet.png")
        self.redStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.redStar?.image = UIImage(named: "red.png")
        self.greenStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.greenStar?.image = UIImage(named: "green.png")
        self.brownStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.brownStar?.image = UIImage(named: "brown.png")
        
        self.view.addSubview(self.redStar!)
        self.view.addSubview(self.greenStar!)
        self.view.addSubview(self.brownStar!)
        self.view.addSubview(self.violetStar!)
        
        self.x1 = 0;
        self.y1 = 0;
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animationStar:", userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func animationStar(_timer: NSTimer) {
        x1 = self.scaleSin(Double(y1!));
        self.redStar?.center = CGPoint(x: x1!, y: y1!);
        y1! += 4;
        
        y2 = y1! - 4 * 5;
        x2 = self.scaleSin(Double(y2!));
        self.brownStar?.center = CGPoint(x: x2!, y: y2!);
        
        y3 = y2! - 4 * 5;
        x3 = self.scaleSin(Double(y3!));
        self.greenStar?.center = CGPoint(x: x3!, y: y3!);
        
        y4 = y3! - 4 * 5;
        x4 = self.scaleSin(Double(y4!));
        self.violetStar?.center = CGPoint(x: x4!, y: y4!);
        
    }

    func scaleSin(input: Double) -> Double
    {
        return 150 + 150 * sin(input * M_PI / 160);
    }

    
}
