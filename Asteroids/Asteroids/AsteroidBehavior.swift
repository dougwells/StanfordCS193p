//
//  AsteroidBehavior.swift
//  Asteroids
//
//  Created by Doug Wells on 4/11/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class AsteroidBehavior: UIDynamicBehavior
{
    
    private lazy var collider: UICollisionBehavior = {
        let behavior = UICollisionBehavior()
        behavior.collisionMode = .everything
        behavior.translatesReferenceBoundsIntoBoundary = true  //sets edges of view to boundary
        return behavior
    }()
    
    private lazy var physics: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.elasticity = 1.0
        behavior.allowsRotation = true
        behavior.friction = 0
        behavior.resistance = 0
        
        return behavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(collider)
        addChildBehavior(physics)
    }
    
    func addAsteroid(_ asteroid: AsteroidView){
        asteroids.append(asteroid)
        collider.addItem(asteroid)
        physics.addItem(asteroid)
    }
    
    func removeAsteroid(_ asteroid: AsteroidView) {
        if let index = asteroids.index(of: asteroid) {
            asteroids.remove(at: index)
        }
        collider.removeItem(asteroid)
        physics.removeItem(asteroid)
    }
    
    
    func pushAllAsteroids(by magnitude: Range<CGFloat> = 0..<0.5){
        for asteroid in asteroids {
            let pusher = UIPushBehavior(items: [asteroid], mode: .instantaneous)
            pusher.magnitude = CGFloat.random(in: magnitude)
            pusher.angle = CGFloat.random(in: 0..<2*CGFloat.pi)
            addChildBehavior(pusher)
        }
    }
    
    private var asteroids = [AsteroidView]()
    
   

}
