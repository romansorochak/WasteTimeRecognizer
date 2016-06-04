//
//  Days.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/5/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import Foundation

enum WeekDay: Int, UIStringConvertible {
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    
    var uiDescription: String {
        switch self {
        case Sunday:
            return "Sunday"
        case Monday:
            return "Monday"
        case Tuesday:
            return "Tuesday"
        case Wednesday:
            return "Wednesday"
        case Thursday:
            return "Thursday"
        case Friday:
            return "Friday"
        case Saturday:
            return "Saturday"
        }
    }
}

func + (left: WeekDay, right: Int) -> WeekDay {
    let weekDayNumber = (left.rawValue - 1 + right) % 7 + 1
    return WeekDay(rawValue: weekDayNumber)!
}

func += (inout left: WeekDay, right: Int) -> WeekDay {
    left = left + right
    return left
}

func - (left: WeekDay, right: Int) -> WeekDay {
    let weekDayNumber = (left.rawValue - right + 6) % 7 + 1
    return WeekDay(rawValue: weekDayNumber)!
}

func -= (inout left: WeekDay, right: Int) -> WeekDay {
    left = left - right
    return left
}
