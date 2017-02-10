//
//  AddToPortfolioCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class AddToPortfolioCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var cellPhoto: UIImageView!
    
    
    
    func configureCell(image: UIImage) {
        
        
        cellPhoto.image = image
        
        
    }
    
    
    
    func configureLoadCell(url: String) {
        
        
    }
    
    
    
    
    
}
