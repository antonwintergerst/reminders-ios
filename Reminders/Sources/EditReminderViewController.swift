//
//  EditReminderViewController.swift
//  Reminders
//
//  Created by Anton Wintergerst on 11/05/2016.
//  Copyright © 2016 Anton Wintergerst. All rights reserved.
//

import UIKit

// MARK: - Edit reminder container screen for ReminderViewController
class EditReminderViewController: UIViewController {
    
    // MARK: Variables
    var delegate:ReminderDelegate?
    var reminder:Reminder?
    var reminderIndexPath:NSIndexPath?
    
    // MARK: UIViewController functions
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let viewController = segue.destinationViewController as? ReminderViewController {
            // Pass reminder, reminderIndexPath and delegate to ReminderViewController
            if let reminder = reminder {
                viewController.delegate = delegate
                viewController.reminder = reminder
                viewController.reminderIndexPath = reminderIndexPath
            }
        }
    }
}