//
//  ExpressionEditorTableViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 4/18/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ExpressionEditorTableViewController: UITableViewController, UITextFieldDelegate {
    
    var name: String {
        return nameTextField?.text ?? ""
    }
    
    private let eyeChoices = [FacialExpression.Eyes.open, .closed, .squinting]
    
    private let mouthChoices = [FacialExpression.Mouth.frown, .smirk, .nuetral, .grin, .smile]
    
    
    var expression: FacialExpression {
        return FacialExpression(
            eyes: eyeChoices[eyeControl?.selectedSegmentIndex ?? 0],
            mouth: mouthChoices[mouthControl?.selectedSegmentIndex ?? 0])
    }
    
    @IBAction func updateFace() {
        print("name = \(expression)")
    }

    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var eyeControl: UISegmentedControl!
    @IBOutlet weak var mouthControl: UISegmentedControl!
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return tableView.bounds.width
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
