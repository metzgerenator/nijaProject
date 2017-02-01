//
//  SkillsAndAvailabilityCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SkillsAndAvailabilityCollectionViewCell: UICollectionViewCell {
    @IBOutlet var projectLabel: UILabel!
    

    @IBOutlet var projectPhoto: UIImageView!
    
    
    
    
    func configureCell(label: String, Photo: UIImage) {
        
        projectLabel.text = label
        projectPhoto.image = Photo
        
        
    }
    
    
    
}
