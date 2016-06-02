//
//  Note.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import Foundation
import RealmSwift

class Note : Object {
    
    dynamic var time = NSDate()
    dynamic var note = String()
}
