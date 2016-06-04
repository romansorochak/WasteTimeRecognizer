//
//  NSDate+WTR.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import Foundation

private let dateFormatter = NSDateFormatter()
private let DateFormat = "yyyy-MM-dd HH:mm:ss zzz"

extension NSDate {
    
    var toString: String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        return dateFormatter.stringFromDate(self)
    }
}

func == (left: NSDate, right: NSDate) -> Bool {
    return left.isEqualToDate(right)
}

func > (left: NSDate, right: NSDate) -> Bool {
    return left.compare(right) == .OrderedDescending
}

func >= (left: NSDate, right: NSDate) -> Bool {
    return left > right || left == right
}

func < (left: NSDate, right: NSDate) -> Bool {
    return left.compare(right) == .OrderedAscending
}

func <= (left: NSDate, right: NSDate) -> Bool {
    return left < right || left == right
}


