//
//  SkillsAndAvailabilityCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorageUI

class SkillsAndAvailabilityCollectionViewCell: UICollectionViewCell {
    @IBOutlet var projectLabel: UILabel!
    

    @IBOutlet var projectPhoto: UIImageView!
    
    let storage = FIRStorage.storage()
    
    
    
    func configureCell(project: DeveloperProjects) {
        let storageRef = storage.reference(forURL: "gs://objective-c-7392d.appspot.com").child("userimages")
        
        let projectURL = project.pictures[0]
        
        let reference = storageRef.child(projectURL)
        
        let placeholderImage = UIImage(named: "camera.jpg")
    
        let imageView: UIImageView = projectPhoto
    
        
        imageView.sd_setImage(with: reference, placeholderImage: placeholderImage)
        
        projectLabel.text = project.projectName
        
    }
    
    
//    
//    override func awakeFromNib() {
//        
//        
//    }
    
}
