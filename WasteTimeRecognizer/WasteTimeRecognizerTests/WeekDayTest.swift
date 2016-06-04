//
//  WeekDayTest.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/5/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import XCTest
@testable import WasteTimeRecognizer

class WeekDayTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWeekDayOperators() {
        XCTAssert(WeekDay.Tuesday == WeekDay.Monday + 1, "WeekDay '+' doens't work correctly")
        XCTAssert(WeekDay.Sunday == WeekDay.Saturday + 1, "WeekDay '-' doens't work correctly")
        XCTAssert(WeekDay.Monday == WeekDay.Sunday + 1, "WeekDay '-' doens't work correctly")
        
        XCTAssert(WeekDay.Monday == WeekDay.Tuesday - 1, "WeekDay '-' doens't work correctly")
        XCTAssert(WeekDay.Sunday == WeekDay.Monday - 1, "WeekDay '-' doens't work correctly")
        XCTAssert(WeekDay.Saturday == WeekDay.Sunday - 1, "WeekDay '-' doens't work correctly")
        
        var dayToTest = WeekDay.Monday
        dayToTest += 2
        XCTAssert(dayToTest == WeekDay.Wednesday, "WeekDay '+=' doens't work correctly")
        
        dayToTest = WeekDay.Monday
        dayToTest -= 2
        XCTAssert(dayToTest == WeekDay.Saturday, "WeekDay '-=' doens't work correctly")
    }
}
