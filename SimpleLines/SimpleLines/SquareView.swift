//
//  SquareView.swift
//  SimpleLines
//
//  Created by Guerrero Azpitarte Adrian on 13/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class SquareView: UIView {

    override func draw(_ rect: CGRect) { //Solamente si se va a dibujar a mano sobre la vista
        // Drawing code
        let aPath = UIBezierPath()
        aPath.lineWidth = 4
        aPath.move(to: CGPoint(x: 10, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        aPath.addQuadCurve(to: CGPoint(x: frame.width, y: 10), controlPoint: CGPoint(x: frame.width, y: 0))
       // aPath.addLine(to: <#T##CGPoint#>)
        UIColor.purple.set()
        aPath.stroke()

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        let context = UIGraphicsGetCurrentContext()
//
//        context?.move(to: CGPoint(x: 10, y: 0))
//        context?.addLine(to: CGPoint(x: frame.width - 10, y: 0))
//        // context?.addLine(to: CGPoint(x: 200, y: frame.height))
//
//        context?.addQuadCurve(to: CGPoint(x: frame.width, y: 10), control: CGPoint(x: frame.width, y: 0))
//        context?.addLine(to: CGPoint(x: 160, y: 160))
//
//        context?.addQuadCurve(to: CGPoint(x: 150, y: 170), control: CGPoint(x: 160, y: 170))
//        context?.addLine(to: CGPoint(x: 50, y: 170))
//
//        context?.addQuadCurve(to: CGPoint(x: 40, y: 160), control: CGPoint(x: 40, y: 170))
//
//        context?.addLine(to: CGPoint(x: 40, y: 60))
//        context?.addQuadCurve(to: CGPoint(x: 50, y: 50), control: CGPoint(x: 40, y: 50))
//
//        //context?.addQuadCurve(to: CGPoint(x: 160, y: 60), control: CGPoint(x: 160, y: 50))
//
//        context?.setLineWidth(2)
//        context?.setStrokeColor(UIColor.black.cgColor)
//
//
//       // context?.currentPointOfPath??
//        //
        
    }
    

}
