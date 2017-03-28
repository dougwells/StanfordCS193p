//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Doug Wells on 3/27/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate
{
    
    //set CassiniViewController as SplitView Delegate so see list
    //of planets when app opens vs blank Detail Page
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
        //every viewController has a var/prop called "splitViewController"
        //which is the splitView controller it is in IF its in a SplitViewController
    }
    
    //Delegate will say it collapsed secondary (detail) over master if imageURL is nil
    //The delegate is lying.  We say we did it (return true) even though we did not
    //When delegate returns false, that tells the SVC it needs to do the collapse itself
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self {
            if let ivc = secondaryViewController.contents as? ImageViewController, ivc.imageURL == nil {
                return true     //saying we did collapse (even tho we did not)
            }
        }
        return false
    }

    
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
    
    // Need b/c UNC but want the visible window
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
