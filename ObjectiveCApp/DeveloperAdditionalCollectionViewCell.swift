//
//  DeveloperAdditionalCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 11/1/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class DeveloperAdditionalCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var formLabel: UILabel!
    
   
    
    
    func configureCell(inputString: String) {
        
        formLabel.text = inputString
    
        
    }
    
    
    
}
