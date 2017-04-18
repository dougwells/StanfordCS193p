//
//  ExpressionEditorTableViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 4/18/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ExpressionEditorTableViewController: UITableViewController {

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
