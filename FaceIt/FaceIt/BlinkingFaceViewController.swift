//
//  BlinkingFaceViewController.swift
//  FaceIt
//
//  Created by Doug Wells on 4/10/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class BlinkingFaceViewController: FaceViewController {
    
    var blinking = false {
        didSet {
            blinkIfNeeded()
        }
    }
    
    private struct Blinking {
        static let closedDuration: TimeInterval = 0.5
        static let openDuration: TimeInterval = 2.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        blinking = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        blinking = false
    }
    
    private func blinkIfNeeded(){
        if blinking {
            faceView.eyesOpen = false
            Timer.scheduledTimer(withTimeInterval: Blinking.closedDuration, repeats: false) { [weak self] timer in
                self?.faceView.eyesOpen = true
                Timer.scheduledTimer(withTimeInterval: Blinking.openDuration, repeats: false) { [weak self] timer in
                        self?.blinkIfNeeded()
                }
            }
        }
    
    }


}
