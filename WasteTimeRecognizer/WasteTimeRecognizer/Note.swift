//
//  Note.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import RealmSwift
import Realm

class Note : Object {
    
    dynamic var date = NSDate()
    dynamic var note = String()
    
    required init(date: NSDate, note: String) {
        super.init()
        
        self.date = date
        self.note = note
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: AnyObject, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init() {
        super.init()
    }
}
