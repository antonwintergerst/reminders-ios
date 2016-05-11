//
//  AddReminderViewController.swift
//  Reminders
//
//  Created by Anton Wintergerst on 11/05/2016.
//  Copyright © 2016 Anton Wintergerst. All rights reserved.
//

import UIKit

// MARK: - Add reminder modal container screen for ReminderViewController
class AddReminderViewController: UIViewController {

    // MARK: Variables
    var delegate: ReminderDelegate?
    
    // MARK: IB Connections
    @IBAction func addButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UIViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let viewController = segue.destinationViewController as? ReminderViewController {
            // TODO: Pass delegate to ReminderViewController

        }
    }
}