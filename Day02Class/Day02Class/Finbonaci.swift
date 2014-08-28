//
//  Finbonaci.swift
//  Day02Class
//
//  Created by HungNT on 8/19/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class Finbonaci: UIViewController {

    @IBOutlet weak var number: UITextField!
    
    @IBAction func taoFibonacy(sender: AnyObject) {
        
        if let num = number.text.toInt(){
        let arrayFibo = self.generateFibonaci(num)
        var chuoi :String = ""
        for result in arrayFibo{
            chuoi += "\(result) , "
        }
        label.text = chuoi
        }
        else {
            label.text = "ERROR"
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    
    func generateFibonaci (num: Int) -> [Int64] {
        var result:[Int64] = Array(count:num, repeatedValue:0)
        result[1] = 1
        for var i = 2; i < num; i++ {
            result[i] = result[i-1] + result[i-2]
            println("\(i) = \(result[i])")
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
