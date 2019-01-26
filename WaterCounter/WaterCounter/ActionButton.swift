//
//  ActionButton.swift
//  WaterCounter
//
//  Created by Guerrero Azpitarte Adrian on 13/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit



@IBDesignable //Notacion para renderizar en storyboard, o ZIp el pintado de draw rect

class ActionButton: UIButton {
    
    @IBInspectable var isAddButton: Bool = true //para agregar la opcion de que sea valor ON/Off
    
    @IBInspectable var fillColor : UIColor = UIColor.purple
    
    private var halfWitdth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHight: CGFloat {
        return bounds.width / 2
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely
     affects performance during animation.*/
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
      //  UIColor.orange.setFill()
        fillColor.setFill()
        path.fill()
    }
    

}
