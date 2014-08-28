//
//  CapSoNhanViewController.swift
//  Day02Class
//
//  Created by HungNT on 8/19/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit
infix operator ^^ {} // Toan tu giua 2 toan hang
//prefix : toan tu truoc toan hang
//postfx: toan tu sau toan hang
postfix operator ^^^ {}

postfix func ^^^ (number: Int) -> Int {
    if(number == 0 || number == 1 ){
        return 1
    }
    var result = 1
    for i in 2...number{
        result *= i
    }
    return result
}

func ^^ (radix: Int, power: Int ) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

class CapSoNhanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("2^3 = \(self.capSoNhan(2, power:3 ))")
        
        println("2^4 = \(self.capSoDeQuy(2, power: 4))")
        
        println("2^5 = \( 2 ^^ 5)")
        
        println("5! = \( 5^^^ )")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func capSoNhan(radix: Int , power: Int) -> Int {
        var result: Float = pow(Float(radix), Float(power))
        return Int(result)
    }
    
    func capSoDeQuy(radix: Int , power: Int) -> Int {
        if(power == 0){
            return 1
        }
        else {
            return radix * capSoDeQuy(radix, power:power - 1 )
        }
    }

}
