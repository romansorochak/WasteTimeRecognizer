//
//  NotificationCenter.swift
//  WasteTimeRecognizer
//
//  Created by Roman Sorochak on 6/4/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import UIKit


class NotificationCenter {
    
    class var sharedInstance: NotificationCenter {
        struct Static {
            static var token: dispatch_once_t = 0
            static var sharedInstance: NotificationCenter!
        }
        dispatch_once(&Static.token) {
            Static.sharedInstance = NotificationCenter()
        }
        return Static.sharedInstance
    }
    
    
    func setupLocalPushNotificationsIfNeed() {
        let currentNotificationSettings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if (currentNotificationSettings?.types == UIUserNotificationType.None) {
            // Specify the notification types.
            var notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound]
//
//            // Specify the notification actions.
//            var justInformAction = UIMutableUserNotificationAction()
//            justInformAction.identifier = "justInform"
//            justInformAction.title = "O"
//            justInformAction.activationMode = UIUserNotificationActivationMode.Background
//            justInformAction.destructive = false
//            justInformAction.authenticationRequired = false
            
            var modifyListAction = UIMutableUserNotificationAction()
            modifyListAction.identifier = "editList"
            modifyListAction.behavior = .TextInput
            modifyListAction.title = "E"
            modifyListAction.activationMode = UIUserNotificationActivationMode.Background
            modifyListAction.destructive = false
            modifyListAction.authenticationRequired = true
            
            var trashAction = UIMutableUserNotificationAction()
            trashAction.identifier = "trashAction"
            trashAction.title = "D"
            trashAction.activationMode = UIUserNotificationActivationMode.Background
            trashAction.destructive = true
            trashAction.authenticationRequired = true
            
            let actionsArray = NSArray(objects: modifyListAction, trashAction)
            let actionsArrayMinimal = NSArray(objects: modifyListAction, trashAction)

            // Specify the category related to the above actions.
            var shoppingListReminderCategory = UIMutableUserNotificationCategory()
            shoppingListReminderCategory.identifier = "shoppingListReminderCategory"
            shoppingListReminderCategory.setActions(actionsArray as! [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Default)
            shoppingListReminderCategory.setActions(actionsArrayMinimal as! [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Minimal)
            
            let categoriesForSettings = NSSet(objects: shoppingListReminderCategory)
            
            // Register the notification settings.
            let newNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categoriesForSettings as! Set<UIUserNotificationCategory>)
            UIApplication.sharedApplication().registerUserNotificationSettings(newNotificationSettings)
        }
    }
    
    func scheduleLocalNotification() {
        let localNotification = UILocalNotification()
        localNotification.fireDate = fixNotificationDate(NSDate())
        localNotification.alertBody = "Hey, you must go shopping, remember?"
        localNotification.alertAction = "View List"
        
        localNotification.category = "shoppingListReminderCategory"
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func fixNotificationDate(dateToFix: NSDate) -> NSDate {
//        let dateComponets: NSDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.NSDayCalendarUnit, NSCalendarUnit.NSMonthCalendarUnit, NSCalendarUnit.NSYearCalendarUnit, NSCalendarUnit.NSHourCalendarUnit, NSCalendarUnit.NSMinuteCalendarUnit], fromDate: dateToFix)
//        
//        dateComponets.second = 0
//        
//        let fixedDate: NSDate! = NSCalendar.currentCalendar().dateFromComponents(dateComponets)
        
//        return fixedDate
        return NSDate().dateByAddingTimeInterval(NSTimeInterval(5))
    }
}
