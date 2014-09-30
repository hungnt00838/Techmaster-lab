//
//  BootLogic.swift
//  TechmasterSwiftApp
//
//  Created by Adam on 9/8/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//  Techmaster Vietnam

import UIKit
let SECTION = "section"
let MENU = "menu"
let TITLE = "title"
let CLASS = "class"
class BootLogic: NSObject {
    
    var menu : NSArray!
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
        
        var basic = [SECTION: "Basic",MENU:[
//            [TITLE: "Demo UIView",CLASS: "DemoUIView"],
//            [TITLE: "Demo Control",CLASS: "DemoControl"],
//            [TITLE: "Bon Fire",CLASS: "BonFire"],
//            [TITLE: "Flying Bird",CLASS: "FlyingBird"],
//            [TITLE: "Demo Color",CLASS: "DemoColor"],
//            [TITLE: "NSTimer",CLASS: "DemoNSTimer"],
//            [TITLE: "Label Color",CLASS: "UIColorLabel"],
            [TITLE: "StarField",CLASS: "StarFieldViewController"],
            [TITLE: "TraillingStars",CLASS: "TraillingStars"],
            [TITLE: "Ball Rolling",CLASS: "BallRolling"],
            [TITLE: "Slider Image",CLASS: "SliderImage"],
            [TITLE: "Color Move",CLASS: "ColorMove"],
            [TITLE: "Ball Fall",CLASS: "BallFall"]
            ]
        ]
        
        var animation = [SECTION: "Basic",MENU:[
            [TITLE: "Demo UIView",CLASS: "DemoUIView"],
            ]
        ]
       
        
        mainScreen.menu = [basic]
        mainScreen.title = "UIView - Controls"
        mainScreen.about = "Đây là ứng dụng minh hoạ UIView - Controls"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}
