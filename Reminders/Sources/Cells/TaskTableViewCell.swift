//
//  TaskTableViewCell.swift
//  Reminders
//
//  Created by Anton Wintergerst on 11/05/2016.
//  Copyright © 2016 Anton Wintergerst. All rights reserved.
//

import UIKit

// MARK: - TaskTableViewDelegate protocol definition
protocol TaskTableViewDelegate {
    func didBeginEditingTask(cell: UITableViewCell, textField: UITextField)
    func didUpdateTask(cell: UITableViewCell, completed: Bool, description: String?)
}

// MARK: - Table view cell prototype for task cells
class TaskTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Variables
    var delegate: TaskTableViewDelegate?
    var completed = false
    
    // MARK: IB Connections
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func radioButtonPressed(sender: AnyObject) {
        if let _ = sender as? UIButton {
            completed = !completed
            updateRadioButton()
            
            // Use delegate function to update task
            delegate?.didUpdateTask(self, completed: completed, description: textField.text)
        }
    }
    
    func updateRadioButton() {
        radioButton.setImage(UIImage(named: completed ? "radio-on" : "radio-off"), forState: .Normal)
    }
    
    // MARK: UITableViewCell functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set delegate variable for textField
        textField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        
        // Use delegate function to signal task textField is being edited
        delegate?.didBeginEditingTask(self, textField: textField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // Use delegate function to update task
        delegate?.didUpdateTask(self, completed: completed, description: textField.text)
        
        return true
    }
}