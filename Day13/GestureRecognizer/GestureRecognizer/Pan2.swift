//
//  Pan2.swift
//  GestureRecognizer
//
//  Created by HungNT on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class Pan2: UIViewController {

    var tree1 : UIImageView?
    var tree2 : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        var floor = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.size.height - 400, width: 940 / 3, height: 726 / 3))
        floor.image = UIImage(named: "floorplan.png")
        //floor.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        self.view.addSubview(floor)
        
        self.tree1 = UIImageView(frame: CGRect(x: 20, y: 80, width: 112 / 2, height: 118 / 2))
        self.tree1?.image = UIImage(named: "cay1.png")
        self.view.addSubview(self.tree1!)
        self.tree2 = UIImageView(frame: CGRect(x: self.view.bounds.size.width - 150, y: 80, width: 159 / 2, height: 126 / 2))
        self.tree2?.image = UIImage(named: "cay2.png")
        self.view.addSubview(self.tree2!)
        
        tree1?.multipleTouchEnabled = true
        tree2?.multipleTouchEnabled = true
        tree1?.userInteractionEnabled = true
        tree2?.userInteractionEnabled = true
        
        
        let pan1 = UIPanGestureRecognizer(target: self, action: "panTree1:")
        let pan2 = UIPanGestureRecognizer(target: self, action: "panTree2:")
        
        tree1?.addGestureRecognizer(pan1)
        tree2?.addGestureRecognizer(pan2)
        
    }
    
    func panTree1(_panTree1: UIPanGestureRecognizer){
        if(_panTree1.state == UIGestureRecognizerState.Began || _panTree1.state == UIGestureRecognizerState.Changed){
            self.tree1!.center = _panTree1.locationInView(self.view)
        }
    
    }
    
    func panTree2(_panTree2: UIPanGestureRecognizer){
        if(_panTree2.state == UIGestureRecognizerState.Began || _panTree2.state == UIGestureRecognizerState.Changed){
            self.tree2!.center = _panTree2.locationInView(self.view)
        }
        
    }
    
    
    

}
