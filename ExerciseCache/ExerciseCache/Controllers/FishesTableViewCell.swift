//
//  FishesTableViewCell.swift
//  ExerciseCache
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class FishesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFish: UIImageView!
    @IBOutlet weak var titleFish: UILabel!
    @IBOutlet weak var escriptionFish: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
