//
//  ViewController.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/3/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import UIKit

private let CellIdentifier = "NoteCell"

private let AddNoteSegueIdntifier = "AddNoteSegueIdentifier"

class NotesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: vc life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.sharedInstance.setupLocalPushNotificationsIfNeed()
        
        NotificationCenter.sharedInstance.scheduleLocalNotification()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let notification = UILocalNotification()
        notification.alertTitle = "Hey Roman!"
        notification.alertBody = "Alrt body presented immediately"
        
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    //MARK: actions
    
    @IBAction func addNoteAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier(AddNoteSegueIdntifier, sender: self)
    }
}

extension NotesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.sharedInstance.notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! NoteCell
        
        let note = DataManager.sharedInstance.notes[indexPath.row]
        
        cell.timeLabel.text = note.time.toString
        cell.noteLabel.text = note.note
        
        return cell
    }
}

