//
//  NSDateExtensionTest.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/4/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import XCTest
@testable import WasteTimeRecognizer

class NSDateExtensionTest: XCTestCase {
    
    var date: NSDate = NSDate()
    var sameDate: NSDate {
        return date//.dateByAddingTimeInterval(NSTimeInterval(0))
    }
    var greaterDate: NSDate {
        return date.dateByAddingTimeInterval(NSTimeInterval(60))
    }
    var lessDate: NSDate {
        return date.dateByAddingTimeInterval(NSTimeInterval(-60))
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testNSDateCompareOperators() {
        XCTAssert(date == sameDate, "operator '==' doesn't work correctly")
        XCTAssert(date >= sameDate, "operator '>=' doesn't work correctly")
        XCTAssert(date <= sameDate, "operator '>=' doesn't work correctly")
        
        XCTAssert(date <= greaterDate, "operator '<=' doesn't work correctly")
        XCTAssert(date < greaterDate, "operator '<' doesn't work correctly")
        
        XCTAssert(date >= lessDate, "operator '>=' doesn't work correctly")
        XCTAssert(date > lessDate, "operator '>' doesn't work correctly")
    }
    
    func testNSDateAddRemoveOperators() {
        let add = 75
        let expectedNextDate = date.dateByAddingTimeInterval(NSTimeInterval(add))
        XCTAssert(expectedNextDate.compare(date + add) == .OrderedSame,
                  "operator '+' doesn't work correctly")
        
        let expectedLessDate = date.dateByAddingTimeInterval(NSTimeInterval(-add))
        XCTAssert(expectedLessDate.compare(date - add) == .OrderedSame,
                  "operator '-' doesn't work correctly")
    }
}
