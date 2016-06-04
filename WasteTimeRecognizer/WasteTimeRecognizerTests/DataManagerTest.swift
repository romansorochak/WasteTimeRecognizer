//
//  DataManagerTest.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/4/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import XCTest
import RealmSwift
@testable import WasteTimeRecognizer

class DataManagerTest: XCTestCase {
    
    class MockDataManager : DataManager {
        
        convenience init() {
            let configuration = RealmSwift.Realm.Configuration(inMemoryIdentifier: "realm.test")
            let realm = try! Realm(configuration: configuration)
            
            self.init(realm: realm)
        }
    }
    
    var mockDataManager: MockDataManager!
    

    override func setUp() {
        super.setUp()
        
        mockDataManager = MockDataManager()
        
        mockDataManager.realm.beginWrite()
        mockDataManager.realm.deleteAll()
        try! mockDataManager.realm.commitWrite()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNotesWithInterval() {
        let now = NSDate()
        let start = now - 10
        let end = now + 60
        
        //these should included - count = 5
        var expectedNotes = [Note]()
        
        var note = Note(date: now - 10, note: "note-10")
        expectedNotes.append(note)
        mockDataManager.addNote(note)
        
        note = Note(date: now, note: "note00")
        expectedNotes.append(note)
        mockDataManager.addNote(note)
        
        note = Note(date: now + 20, note: "note20")
        expectedNotes.append(note)
        mockDataManager.addNote(note)
        
        note = Note(date: now + 60, note: "note60")
        expectedNotes.append(note)
        mockDataManager.addNote(note)
        
        //these should not be included
        mockDataManager.addNote(Note(date: now + 70, note: "note70"))
        mockDataManager.addNote(Note(date: now + 80, note: "note80"))
        mockDataManager.addNote(Note(date: now + 90, note: "note90"))
        mockDataManager.addNote(Note(date: now - 20, note: "note-20"))
        
        let notes = mockDataManager.notesWithInterval(start, endDate: end)
        
        XCTAssert(notes == expectedNotes, "notesWithInterval doesn't work correclty")
    }
}
