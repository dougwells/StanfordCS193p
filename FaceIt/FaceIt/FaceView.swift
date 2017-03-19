//
//  FaceView.swift
//  FaceIt
//
//  Created by Doug Wells on 3/19/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.9

    override func draw(_ rect: CGRect) {
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2 * scale
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0  //5 points (not pixels) wide
        UIColor.blue.set()
        path.stroke()
    }

}
