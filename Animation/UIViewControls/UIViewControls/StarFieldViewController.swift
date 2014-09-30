//
//  StarFieldViewController.swift
//  UIViewControls
//
//  Created by HungNT on 9/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class StarFieldViewController: UIViewController {
    
    var redStar: UIImageView?
    var violetStar: UIImageView?
    var greenStar: UIImageView?
    var brownStar: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadView()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        var centerX = self.view.bounds.size.width * 0.5
        var centerY = self.view.bounds.size.height * 0.5
        self.violetStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.violetStar?.image = UIImage(named: "violet.png")
        self.violetStar?.center = CGPoint(x: centerX, y: centerY)
        self.redStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.redStar?.image = UIImage(named: "red.png")
        self.redStar?.center = CGPoint(x: centerX, y: centerY)
        self.greenStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.greenStar?.image = UIImage(named: "green.png")
        self.greenStar?.center = CGPoint(x: centerX, y: centerY)
        self.brownStar = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.brownStar?.image = UIImage(named: "brown.png")
        self.brownStar?.center = CGPoint(x: centerX, y: centerY)
        
        self.view.addSubview(self.redStar!)
        self.view.addSubview(self.greenStar!)
        self.view.addSubview(self.brownStar!)
        self.view.addSubview(self.violetStar!)
        
        let button = UIButton(frame: CGRect(x: 0 , y: 0, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Start", forState: UIControlState.Normal)
        button.center = CGPoint(x: centerX, y: centerY + 200)
        button.addTarget(self, action: "Animation:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func Animation(button: UIButton){
        
        var centerX = self.view.bounds.size.width * 0.5
        var centerY = self.view.bounds.size.height * 0.5

        
        UIView.animateWithDuration(2,
            animations: {
                let i = 1 //Add this line to cheat compiler
                self.violetStar?.center = CGPoint(x: self.view.bounds.width / 2 + 100 , y: self.view.frame.height / 2 + 100)
                self.greenStar?.center = CGPoint(x: self.view.bounds.width / 2 - 100 , y: self.view.frame.height / 2 + 100)
                self.redStar?.center = CGPoint(x: self.view.bounds.width / 2 + 100 , y: self.view.frame.height / 2 - 100)
                self.brownStar?.center = CGPoint(x: self.view.bounds.width / 2 - 100 , y: self.view.frame.height / 2 - 100)
            },
            completion: { finished in
                UIView.animateWithDuration(2,
                    animations: {
                        let i = 1 //Add this line to cheat compiler
                        self.violetStar?.center = CGPoint(x: self.view.bounds.width / 2 + 100 , y: self.view.frame.height / 2 - 100)
                        self.greenStar?.center = CGPoint(x: self.view.bounds.width / 2 + 100 , y: self.view.frame.height / 2 + 100)
                        self.redStar?.center = CGPoint(x: self.view.bounds.width / 2 - 100 , y: self.view.frame.height / 2 - 100)
                        self.brownStar?.center = CGPoint(x: self.view.bounds.width / 2 - 100 , y: self.view.frame.height / 2 + 100)
                    },
                    completion: { finished in
                        UIView.animateWithDuration(2,
                            animations: {
                                let i = 1 //Add this line to cheat compiler
                                self.violetStar?.center = CGPoint(x: centerX , y: centerY)
                                self.greenStar?.center = CGPoint(x: centerX , y: centerY)
                                self.redStar?.center = CGPoint(x: centerX , y: centerY)
                                self.brownStar?.center = CGPoint(x: centerX , y: centerY)
                            },
                            completion: { finished in
                                println("")
                        })
                })
        })
        
        
        
    }
    
}
