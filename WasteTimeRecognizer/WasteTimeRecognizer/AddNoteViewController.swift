//
//  AddNoteViewController.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import UIKit

class AddNoteViewController : UIViewController {
    
    @IBOutlet weak var noteTextField: UITextField!
    
    
    //MARK: vc life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTextField.becomeFirstResponder()
    }
    
    
    //MARK: actions
    
    @IBAction func doneAction(sender: UIBarButtonItem) {
        
        let note = Note()
        note.time = NSDate()
        note.note = noteTextField.text ?? ""
        
        do {
            try DataManager.sharedInstance.addNote(note)
        } catch {
            print(error)
        }
        
        noteTextField.resignFirstResponder()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
