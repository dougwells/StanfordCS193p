//
//  AsteroidsViewController.swift
//  Asteroids
//
//  Created by Doug Wells on 4/11/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class AsteroidsViewController: UIViewController {

    private var asteroidField: AsteroidFieldView!
    private var ship: SpaceshipView!
    
    private var asteroidBehavior = AsteroidBehavior()
    
    
    // Use lazy b/c asteroidField cannot use any of our vars are funcs until
    // We fully initialize ourself.  Also, must tell type since auto infer doesn't work w/lazy
    // Finally, need self. to tell Swift this is our own attribute/property, not a class
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self.asteroidField)
    
    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
        initializeIfNeeded()
        animator.addBehavior(asteroidBehavior)
        asteroidBehavior.pushAllAsteroids()
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)
        animator.removeBehavior(asteroidBehavior)  //stops animation. Must add velocity if start

    }
    
    
    
    private func initializeIfNeeded() {
        if asteroidField == nil {
            asteroidField = AsteroidFieldView(frame: CGRect(center: view.bounds.mid, size: view.bounds.size))
            view.addSubview(asteroidField)
            let shipSize = view.bounds.size.minEdge * Constants.shipSizeToMinBoundsEdgeRatio
            ship = SpaceshipView(frame: CGRect(squareCenteredAt:asteroidField.center, size: shipSize))
            view.addSubview(ship)
            repositionShip()
            asteroidField.addAsteroids(count: Constants.initialAsteroidCount)
            asteroidField.asteroidBehavior = asteroidBehavior
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        asteroidField?.center = view.bounds.mid
        repositionShip()
    }
    
    private func repositionShip() {
        if asteroidField != nil {
            ship.center = asteroidField.center
            asteroidBehavior.setBoundary(ship.shieldBoundary(in: asteroidField), named: Constants.shipBoundaryName) {[weak self] in
                if let ship = self?.ship {
                    if !ship.shieldIsActive {
                    
                        ship.shieldIsActive = true
                        ship.shieldLevel -= Constants.Shield.activationCost
                        Timer.scheduledTimer(withTimeInterval: Constants.Shield.duration, repeats: false){timer in
                            ship.shieldIsActive = false
                            if ship.shieldLevel <= 0 {
                            ship.shieldLevel = 100
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: Constants
    
    private struct Constants {
        static let initialAsteroidCount = 20
        static let shipBoundaryName = "Ship"
        static let shipSizeToMinBoundsEdgeRatio: CGFloat = 1/5
        static let asteroidFieldMagnitude: CGFloat = 10             // as a multiple of view.bounds.size
        static let normalizedDistanceOfShipFromEdge: CGFloat = 0.2
        static let burnAcceleration: CGFloat = 0.07                 // points/s/s
        struct Shield {
            static let duration: TimeInterval = 1.0       // how long shield stays up
            static let updateInterval: TimeInterval = 0.2 // how often we update shield level
            static let regenerationRate: Double = 5       // per second
            static let activationCost: Double = 15        // per activation
            static var regenerationPerUpdate: Double
            { return Constants.Shield.regenerationRate * Constants.Shield.updateInterval }
            static var activationCostPerUpdate: Double
            { return Constants.Shield.activationCost / (Constants.Shield.duration/Constants.Shield.updateInterval) }
        }
        static let defaultShipDirection: [UIInterfaceOrientation:CGFloat] = [
            .portrait : CGFloat.up,
            .portraitUpsideDown : CGFloat.down,
            .landscapeLeft : CGFloat.right,
            .landscapeRight : CGFloat.left
        ]
        static let normalizedAsteroidFieldCenter: [UIInterfaceOrientation:CGPoint] = [
            .portrait : CGPoint(x: 0.5, y: 1.0-Constants.normalizedDistanceOfShipFromEdge),
            .portraitUpsideDown : CGPoint(x: 0.5, y: Constants.normalizedDistanceOfShipFromEdge),
            .landscapeLeft : CGPoint(x: Constants.normalizedDistanceOfShipFromEdge, y: 0.5),
            .landscapeRight : CGPoint(x: 1.0-Constants.normalizedDistanceOfShipFromEdge, y: 0.5),
            .unknown : CGPoint(x: 0.5, y: 0.5)
        ]
    }


}

