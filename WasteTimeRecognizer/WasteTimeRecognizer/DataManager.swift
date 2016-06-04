//
//  DataManager.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import Foundation
import RealmSwift

class DataManager {
    
    let realm: Realm
    
    var notes: Results<Note> {
        return realm.objects(Note).sorted("date", ascending: true)
    }
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    convenience init() {
        let realm = try! Realm()
        self.init(realm: realm)
    }
    
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
        do {
            try realm.write {
                realm.add(note)
            }
        } catch {
            print("addNote - \(error)")
        }
    }
    
    func notesWithInterval(startDate: NSDate, endDate: NSDate) -> [Note] {
        return notes.filter { (note) -> Bool in
            
            note.date >= startDate && note.date <= endDate
        }
    }
}
