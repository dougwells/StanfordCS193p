//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 3/24/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class EmotionsViewController: UITableViewController {
    
    //MARK:  Model
    private var emotionalFaces: [(name: String, expression: FacialExpression)] =
        [
            ("sad", FacialExpression(eyes: .closed, mouth: .frown)),
            ("happy", FacialExpression(eyes: .open, mouth: .smile)),
            ("worried", FacialExpression(eyes: .open, mouth: .smirk))
    ]

    //MARK - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotionalFaces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Emotion Cell", for: indexPath)
        cell.textLabel?.text = emotionalFaces[indexPath.row].name
        return cell
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination
        
        
        if let navigationController = destinationViewController as? UINavigationController {
            
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        
        if let faceViewController = destinationViewController as? FaceViewController,
            let cell = sender as? UITableViewCell,  //multiple if lets.  Just use ,
            let indexPath = tableView.indexPath(for: cell){
            
                faceViewController.expression = emotionalFaces[indexPath.row].expression
            
                faceViewController.navigationItem.title = emotionalFaces[indexPath.row].name
        }
        
    } // end prepare(for seque:)
    
    

    
}
