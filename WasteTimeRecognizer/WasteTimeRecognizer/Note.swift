//
//  Note.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import RealmSwift

class Note : Object {
    
    dynamic var date = NSDate()
    dynamic var note = String()
}
