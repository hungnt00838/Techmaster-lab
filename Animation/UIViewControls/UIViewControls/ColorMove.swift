//
//  ColorMove.swift
//  UIViewControls
//
//  Created by HungNT on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ColorMove: UIViewController {

    var numberSquareY:Int!
    var numberSquareX:Int!
    var pointCenter:CGPoint!

    var view1:UIView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        pointCenter = CGPoint(x:-5, y: 5)
        view1 = UIView(frame: self.view.frame)
        view1.backgroundColor = UIColor.whiteColor()
        var timer:NSTimer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "addView:", userInfo: nil, repeats: true)
    }
    func addView(sender:NSTimer){
        var viewSquare =  UILabel(frame: CGRect(x:0, y: 0, width: 10, height: 10))
        viewSquare.backgroundColor = UIColor.purpleColor()
        pointCenter = CGPoint(x: self.pointCenter.x + 10, y: self.pointCenter.y)
        numberSquareY = Int((self.view.frame.size.width) / (viewSquare.frame.size.width))
        numberSquareX = Int((self.view.frame.size.height) / (viewSquare.frame.size.height))
        viewSquare.layer.borderColor = UIColor.redColor().CGColor
        viewSquare.layer.borderWidth = 0.5
        viewSquare.center = pointCenter
        self.view.addSubview(viewSquare)
        if (Int(pointCenter.x) > (((numberSquareY - 1) * 10) + 5 )) {
            pointCenter = CGPoint(x: -5, y: pointCenter.y + 10)
        }
        if (Int(pointCenter.y) > ((numberSquareX - 1) * 10) + 15) {
            sender.invalidate()
        }
    }

}
