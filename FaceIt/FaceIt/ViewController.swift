//
//  ViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 3/19/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        //property observer. Runs when iOS hooks up outlet to faceView
        didSet {
            
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            updateUI()
            
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        //property observer
        didSet { updateUI() }
    }
    
    private func updateUI() {
        switch expression.eyes {
        case .open:
            faceView?.eyesOpen = true   //optional in case faceView not set yet (L5 12:50)
        case .closed:
            faceView?.eyesOpen = false
        case .squinting:
            faceView?.eyesOpen = false
        }
        
        faceView.mouthCurvature = mouthCurvaturesDict[expression.mouth] ?? 0.0
        
    }
    
    private let mouthCurvaturesDict = [FacialExpression.Mouth.grin:0.5, .smile:1.0, .frown:-1.0, .nuetral: 0.0, .smirk:-0.5]
    
    
    
}

