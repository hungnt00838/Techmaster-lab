    //
    //  GiaiPhuongTrinh.swift
    //  Day02Class
    //
    //  Created by HungNT on 8/21/14.
    //  Copyright (c) 2014 HungNT. All rights reserved.
    //
    
    import UIKit
    
    class GiaiPhuongTrinh: UIViewController {
        
        @IBOutlet weak var numA: UITextField!
        
        @IBOutlet weak var numB: UITextField!
        
        @IBOutlet weak var numC: UITextField!
        
        @IBOutlet weak var lblResult: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func giaiPhuongTrinh(sender: AnyObject) {
            let text = "Kết quả :"
            if let numberA = numA.text.toInt(){
                if let numberB = numB.text.toInt(){
                    if let numberC = numC.text.toInt(){
                        var resultX1: Double = 0
                        var resultX2: Double = 0
                        
                        if numberA == 0{
                            if numberB != 0 && numberC != 0{
                                resultX1 = (Double)(0-numberC)/(Double)(numberB)
                                lblResult.text = ("\(text) có 1 nghiệm là : \(resultX1)")
                            }
                            if numberB == 0 && numberC != 0{
                                resultX1 = (Double)(0-numberC)/(Double)(numberB)
                                lblResult.text = ("\(text) vô nghiệm ")
                            }
                            if numberB == 0 && numberC == 0{
                                resultX1 = (Double)(0-numberC)/(Double)(numberB)
                                lblResult.text = ("\(text) vô số nghiệm ")
                            }
                            
                        }
                        else{
                            var delta = tinhDelta(numberA, nnumGetB: numberB, numGetC: numberC)
                            if (delta < 0){
                                lblResult.text = ("\(text) vô nghiệm ")
                            }
                            else if (delta == 0 ){
                                resultX1 = (Double)(0 - (numberB))/(Double)(2 * numberA);
                                lblResult.text = ("\(text) có 1 nghiệm kép là : \(resultX1)")
                            }
                            else{
                                var canDelta = sqrt((Float)(delta))
                                resultX1 = (0 - (Double)(numberB) + (Double)(canDelta) )/(2*(Double)(numberA));
                                resultX2 = (0 - (Double)(numberB) - (Double)(canDelta) )/(2*(Double)(numberA));
                                lblResult.text = ("\(text) có 2 nghiệm là : x1 = \(resultX1) và x2 = \(resultX2)")
                            }
                        }
                        
                        
                    }
                        
                    else{
                        lblResult.text = ("\(text) Error")
                    }
                }
                    
                else{
                    lblResult.text = ("\(text) Error")
                }
            }
            else{
                lblResult.text = ("\(text) Error")
            }
            
        }
        
        
        func tinhDelta(numGetA: Int, nnumGetB: Int, numGetC: Int) -> Int{
            var delta: Int = nnumGetB * nnumGetB - (4 * numGetA * numGetC)
            return delta
        }
        
    }
