//
//  MainTableViewController.swift
//  Reminders
//
//  Created by Anton Wintergerst on 11/05/2016.
//  Copyright © 2016 Anton Wintergerst. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ReminderDelegate {
    
    // MARK: Constants
    let menuTableViewCellId = "MenuTableViewCell"
    let addTableViewCellId = "AddReminderTableViewCell"
    
    // MARK: Variables
    var reminders = [Reminder]()
    var selectedIndexPath: NSIndexPath?
    
    // MARK: UIViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate sample reminder
        let reminder = Reminder()
        reminder.title = "Homework"
        reminder.tasks = [Task(completed: false, description: "Complete Assignment 5")]
        reminders.append(reminder)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update tableView data
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let viewController = segue.destinationViewController as? AddReminderViewController {
            
            // TODO: Set delegate variable for viewController

            
        } else if let viewController = segue.destinationViewController as? EditReminderViewController {
            if let selectedIndexPath = selectedIndexPath {
                if reminders.count > selectedIndexPath.row {
                    
                    // TODO: Pass reminder, selectedIndexPath and set delegate variable for viewController
                    
                    
                    
                    
                }
            }
        }
    }
    
    // MARK: - AddReminderDelegate
    func shouldAddReminder(reminder: Reminder) {
        // TODO: Add new reminder

    }
    
    // MARK: - EditReminderDelegate
    func shouldEditReminder(reminder: Reminder, indexPath: NSIndexPath?) {
        // TODO: Edit existing reminder
        
        
        
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // + 1 for add reminder cell
        return reminders.count + 1
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        
        switch indexPath.row {
        case reminders.count:
            cell = tableView.dequeueReusableCellWithIdentifier(addTableViewCellId)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier(menuTableViewCellId)
            if let cell = cell {
                if reminders.count > indexPath.row {
                    let reminder = reminders[indexPath.row]
                    cell.textLabel?.text = reminder.title
                    if reminder.tasks.count > 0 {
                        cell.detailTextLabel?.text = reminder.tasks[0].description
                    } else {
                        cell.detailTextLabel?.text = ""
                    }
                }
            }
        }
        
        if let cell = cell {
            return cell
        } else {
            print("Warning: TableView contains default cell type")
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        selectedIndexPath = indexPath
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // TODO: Remove reminder using indexPath.row

            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}
