//
//  DataManager.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import Foundation

class DataManager {

    private(set) var notes = [Note]()
    
    private init() {}
    
    class var sharedInstance: DataManager {
        struct Static {
            static var token: dispatch_once_t = 0
            static var sharedInstance: DataManager!
        }
        dispatch_once(&Static.token) {
            Static.sharedInstance = DataManager()
        }
        return Static.sharedInstance
    }
    
    func addNote(note: Note) {
        notes.append(note)
    }
}
