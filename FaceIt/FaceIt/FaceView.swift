//
//  FaceView.swift
//  FaceIt
//
//  Created by Doug Wells on 3/19/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {
    
    //didSet is a property observer. Redraw View if any of these vars change
    
    @IBInspectable
    var scale: CGFloat = 0.9 { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var lineWidth: CGFloat = 5.0 { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var color: UIColor = UIColor.blue { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var eyesOpen: Bool = true { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    //1.0 is full smile. -1.0 is full frown
    var mouthCurvature: Double = -0.5  { didSet { setNeedsDisplay() } }
    
    func changeScale(byReactingTo pinchRecognizer: UIPinchGestureRecognizer) {
        
        switch pinchRecognizer.state {
        case .cancelled, .ended:
            scale *= pinchRecognizer.scale
            pinchRecognizer.scale = 1
            
        default:
            break
        }
        
    }
    
    private var skullRadius: CGFloat {
        get {
            return min(bounds.size.width, bounds.size.height) / 2 * scale
        }
    }
    
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path: UIBezierPath
        
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        } else {
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        

        path.lineWidth = lineWidth
        return path
        
    }
    
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth = skullRadius / Ratios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.skullRadiusToMouthOffset
        
        let mouthRectangle = CGRect(
            x: skullCenter.x - mouthWidth/2,
            y: skullCenter.y + mouthOffset,
            width: mouthWidth,
            height: mouthHeight
        )
        
        let smileOffset = CGFloat(max(-1, min(mouthCurvature,1))) * mouthRectangle.height
        
        let start = CGPoint(x: mouthRectangle.minX, y: mouthRectangle.midY)
        let end = CGPoint(x: mouthRectangle.maxX, y: mouthRectangle.midY)
        
        let cp1 = CGPoint(x: start.x + mouthRectangle.width/3, y: start.y + smileOffset)
        let cp2 = CGPoint(x: end.x - mouthRectangle.width/3, y: end.y + smileOffset)
        
        
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
        path.lineWidth = lineWidth  //5 points (not pixels) wide
        return path
    }

    override func draw(_ rect: CGRect) {
        color.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
        pathForMouth().stroke()
    }
    
    private struct Ratios {
        static let skullRadiusToEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
        
    }

}
