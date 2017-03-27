//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Doug Wells on 3/27/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            
            let destination = navControllerToView(view: segue.destination)
            
                if let imageVC = (destination as? ImageViewController) {
                imageVC.imageURL = url
                }
    }
    }
} //End CassiniViewController

extension CassiniViewController {
    func navControllerToView(view: UIViewController) -> UIViewController {
        if let visibleView = (view as? UINavigationController) {
            return visibleView.visibleViewController!
        }
        return view
    }
}
