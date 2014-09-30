//
//  StringExtend.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//  http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language

import Foundation
extension String {
    
    // subscript la dang toan tu dac biet cho kieu mang va kieu tap hop tuan tu. 
    // Toan tu truy xuat theo vi tri
    subscript (i: Int) -> String {
        // Array(self) ep kieu String sang Array
        // Array(self)[i] lay ky tu thu i cua Array
        // String String(Array(self)[i]) ep kieu ve string
        return String(Array(self)[i])
    }
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
        var end = advance(startIndex, r.endIndex)
        return substringWithRange(Range(start: start, end: end))
    }
}
