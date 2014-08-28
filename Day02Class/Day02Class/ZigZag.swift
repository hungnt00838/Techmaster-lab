//
//  ZigZag.swift
//  Day02Class
//
//  Created by HungNT on 8/21/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class ZigZag: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var numZig = 7
        var hightZig = 4
        var text: String = ""
        
        for i in 1...hightZig{

            for j in 1...(hightZig * (numZig - 1)) {
                
                if( ((j - i) % (hightZig * 2 -  2)  == 0) || (j + i - hightZig * 2 ) % (hightZig * 2 - 2 ) == 0 ){
                    text += "*"
                }
                else{
                    text += " "
                }
            }
            text += ("\n")
        }
        lblResult.text = text

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    
    

}
