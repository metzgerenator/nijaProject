//
//  CustomerQuestionsCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/10/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class CustomerQuestionsCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet var cellLabel: UILabel!
    
    
    
    func conFigureCell(inputString: String) {
        
        cellLabel.text = inputString
        
    }
    
    
    
    
    
}
