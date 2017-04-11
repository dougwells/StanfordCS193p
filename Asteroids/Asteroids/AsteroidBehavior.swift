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
    func pushAllAsteroids(by magnitude: Range<CGFloat> = 0..<0.5){
        for asteroid in asteroids {
            let pusher = UIPushBehavior(items: [asteroid], mode: .instantaneous)
            pusher.magnitude = CGFloat.random(in: magnitude)
            pusher.angle = CGFloat.random(in: 0..<2*CGFloat.pi)
            addChildBehavior(pusher)
        }
    }
    
    private var asteroids = [AsteroidView]()
    
    func addAsteroid(_ asteroid: AsteroidView){
        asteroids.append(asteroid)
    }
    
    func removeAsteroid(_ asteroid: AsteroidView) {
        if let index = asteroids.index(of: asteroid) {
            asteroids.remove(at: index)
        }
    }
    

}
