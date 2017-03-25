//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 3/24/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination
        
        
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
 
        
        if let faceViewController = destinationViewController as? FaceViewController,
            let identifier = segue.identifier,  //multiple if lets.  Just use ,
            let expression = emotionalFaces[identifier] {
            
                faceViewController.expression = expression
        }
        
    } // end prepare(for seque:)

    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .closed, mouth: .frown),
        "happy": FacialExpression(eyes: .open, mouth: .smile),
        "worried": FacialExpression(eyes: .open, mouth: .smirk)
    ]
    
}
