//
//  SortDesc.swift
//  DemoClass
//
//  Created by HungNT on 9/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit




class SortDesc: GenericVC {
    

    var WordCountNSort: [Word] = [Word]()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  if let plainString = self.readFileToString("data.txt") {
        self.countWord(plainString)
        }*/
        
        self.countWord("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
    }
    
    func readFileToString(textFile: String) -> String? {
        let fileNameArr = textFile.componentsSeparatedByString(".")
        if fileNameArr.count != 2 { return nil }
        
        let filePath = NSBundle.mainBundle().pathForResource(fileNameArr[0], ofType: fileNameArr[1])
        println("\(filePath)")
        
        return String.stringWithContentsOfFile(filePath!, encoding: NSUTF8StringEncoding, error: nil)
    }
    func shouldRemoveThisWord(word: String) -> Bool {
        
        let dummyWords = ["", " ","a", "all", "an", "i", "in", "is", "it", "are", "were", "he", "she", "they", "it's", "my", "his", "her", "their", "this", "that", "very", "much"]
        if contains(dummyWords, word) { return true }
        
        return false;
    }
    
    func countWord(inputString: String) {
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSort(word)
            }
        }
        self.inRa("-------Sort Desc")
        for item in WordCountNSort {
            self.inRa("\(item.word) : \(item.count)")
        }
        
        
        // sort count
        
        self.inRa("-------Sort Count")
        self.sortCount()
    
        for item in WordCountNSort {
            self.inRa("\(item.word) : \(item.count)")
        }

        
    }
    
    func insertWordToWordCountNSort(word: String) {
        var index = 0
        if (WordCountNSort.count == 0) {
            WordCountNSort.append(Word(word: word))
            return
        }
        
        for item in WordCountNSort {
            if (word > item.word) {
                WordCountNSort.insert(Word(word: word), atIndex: index)
                return
            } else if (word == item.word) {
                item.increment()
                return
            } else if (word < item.word) {
                index++
                if (index == WordCountNSort.count) {
                    WordCountNSort.append(Word(word: word))
                }
            }
        }
        
    }
    
    func sortCount() {
        var wordCountTemp = 0
        var wordStringTemp = ""
        for var i = 0 ; i < WordCountNSort.count-1 ; i++ {
            
            for var j = i+1 ; j < WordCountNSort.count-1 ; j++ {
                
                if  WordCountNSort[i].count < WordCountNSort[j].count {
                    wordCountTemp = WordCountNSort[i].count
                    wordStringTemp = WordCountNSort[i].word
                    WordCountNSort[i].count = WordCountNSort[j].count
                    WordCountNSort[i].word = WordCountNSort[j].word
                    WordCountNSort[j].count = wordCountTemp
                    WordCountNSort[j].word = wordStringTemp
                }
            }
        }
        
    }
    
    

}
