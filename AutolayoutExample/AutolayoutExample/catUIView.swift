//
//  catUIView.swift
//  AutolayoutExample
//
//  Created by Guerrero Azpitarte Adrian on 28/09/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class catUIView: UIView {

    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "tacocat")
        iv.contentMode = .scaleAspectFit
        
        // IMPORTANTE---------------------------------------------------------------------<<<<<<<<<<<
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    //por codigo
    override init(frame : CGRect){
        super.init(frame: frame)
    }
    
    //coder es el que agarra el storyboard -> Este es por storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      //  fatalError("init(coder:) has not been implemented")
        setupAutoLayout()
    }
    
    func setupAutoLayout(){
        backgroundColor = UIColor.red
        addSubview(imageView)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)])
    }
    
        
        //se deben de hacer diferentes constraints y activarlos
//      let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    
}
