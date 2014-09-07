//
//  ReadFileController.swift
//  ReadTXT
//
//  Created by HungNT on 9/6/14.
//  Copyright (c) 2014 HungNT. All rights reserved.
//

import UIKit

class ReadFileController: UIViewController {

    @IBOutlet weak var txtInput: UITextField!
    
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var lblResult: UILabel!
    
    func getContent() -> String?{
        let path = NSBundle.mainBundle().pathForResource("Sample", ofType: "txt")
        var possibleContent = String.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error: nil)
        return possibleContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblContent.text = "-----Content-----\n"
        var possibleContent = getContent()
        if let content = possibleContent {
            lblContent.text = lblContent.text + "\(content)"
        }
    }
    
    @IBAction func searchClick(sender: AnyObject) {
        var txtInput = self.txtInput
        lblResult.text = "----Result----\n"
        var possibleContent = getContent()
        if let content = possibleContent {
            var array = content.componentsSeparatedByString(" ")
            if let contentSearch = txtInput.text {
                var arraySearch = contentSearch.componentsSeparatedByString(";")
                for textSearch in arraySearch{
                    var numtext = 0
                    for textContent in array{
                        if textContent == textSearch{
                            numtext++
                        }
                    }
                    lblResult.text = lblResult.text + "\(textSearch) : \(numtext) times \n"
                }
                
            }
           
        }
    }
}
