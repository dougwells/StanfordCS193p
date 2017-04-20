//
//  ExpressionEditorTableViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 4/18/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ExpressionEditorTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return tableView.bounds.width
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
