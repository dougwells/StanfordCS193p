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
                if let imageVC = (segue.destination.contents as? ImageViewController) {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
    }
    }
} //End CassiniViewController

extension UIViewController {
    
    var contents: UIViewController {
        if let navcon = (self as? UINavigationController) {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
    
    /*
    func navControllerToView(view: UIViewController) -> UIViewController {
        if let visibleView = (view as? UINavigationController) {
            return visibleView.visibleViewController!
        }
        return view
    }
    */
}
