//
//  FlyingBird.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/24/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class FlyingBird: UIViewController {
    var bird: UIImageView?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        bird = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.height / 2 , width: 110, height: 68))
        bird?.animationImages = [
            UIImage(named: "bird0.png"),
            UIImage(named: "bird1.png"),
            UIImage(named: "bird2.png"),
            UIImage(named: "bird3.png"),
            UIImage(named: "bird4.png"),
            UIImage(named: "bird5.png")
        ]
        bird?.animationRepeatCount = -1 // forever loop
        bird?.animationDuration = 1 // Khoang thoi gian chay animation
        
        self.view.addSubview(bird!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bird?.startAnimating()

        UIView.animateWithDuration(5,
            animations: {
            let i = 1 //Add this line to cheat compiler
            self.bird?.center = CGPoint(x: self.view.bounds.width, y: self.view.frame.height / 2)
            },
            completion: { finished in
                println("Bird reach bottom of screen")
        })
        
    }



}
