//
//  ViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 3/19/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    //"hooks up FaceView View to this ViewController
    @IBOutlet weak var faceView: FaceView! {
        
        //property observer. Runs when iOS hooks up outlet to faceView
        //not .changeScale method is defined in FaceView
        didSet {
            
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            
            //let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            //tapRecognizer.numberOfTapsRequired = 1  //default value but wanted to show
            //faceView.addGestureRecognizer(tapRecognizer)
            
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swipeUpRecognizer.direction = .up
            
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swipeDownRecognizer.direction = .down
            
            //add pinch & tap Recognizers to the UIView (faceView)
            faceView.addGestureRecognizer(pinchRecognizer)
            faceView.addGestureRecognizer(swipeUpRecognizer)
            faceView.addGestureRecognizer(swipeDownRecognizer)
            
            updateUI()
            
        }
    }

    
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        //property observer
        didSet { updateUI() }
    }
    
    func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {

            if expression.eyes == .closed || expression.eyes == .squinting {
                expression = FacialExpression(eyes: .open, mouth: expression.mouth)
            } else {
                expression = FacialExpression(eyes: .closed, mouth: expression.mouth)
            }
        }
    }
    
    private struct Headshake {
        static let angle = CGFloat.pi/6
        static let segmentDuration: TimeInterval = 0.5
    }
    
    private func rotateFace(by angle: CGFloat) {
        faceView.transform = faceView.transform.rotated(by: angle)
    }
    
    private func shakeHead() {
        UIView.animate(
            withDuration: Headshake.segmentDuration,
            animations: { self.rotateFace(by: Headshake.angle) },
            completion: { finished in
                if finished {
                    UIView.animate(
                        withDuration: Headshake.segmentDuration,
                        animations: {self.rotateFace(by: -Headshake.angle*2)},
                        completion: { finished in
                            if finished {
                                UIView.animate(
                                    withDuration: Headshake.segmentDuration,
                                    animations: { self.rotateFace(by: Headshake.angle)}
                                )
                            }
                        }
                    )
                }
            }
        )
    }
    
    @IBAction func shakeHead(_ sender: UITapGestureRecognizer) {
        shakeHead()
    }
    
    
    
    func increaseHappiness(){
        expression = expression.happier
    }
    
    func decreaseHappiness() {
        expression = expression.sadder
    }
    

    
    func updateUI() {
        switch expression.eyes {
        case .open:
            faceView?.eyesOpen = true   //optional in case faceView not set yet (L5 12:50)
        case .closed:
            faceView?.eyesOpen = false
        case .squinting:
            //faceView?.eyesOpen = false
            break
        }
        
        faceView?.mouthCurvature = mouthCurvaturesDict[expression.mouth] ?? 0.0
        
    }
    
    private let mouthCurvaturesDict = [FacialExpression.Mouth.grin:0.5, .smile:1.0, .frown:-1.0, .nuetral: 0.0, .smirk:-0.5]
    
    
    
}

