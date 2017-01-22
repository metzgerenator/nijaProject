//
//  EditSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/21/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class EditSkillsTableViewCell: UITableViewCell {
    
    var currentSkill: DeveloperSkills?
    
    
    @IBOutlet var skillButton: UILabel!
    
    @IBAction func additionalSkillsButton(_ sender: UIButton) {
        
        if let skill = currentSkill {
            
            print("skill pressed \(skill.subSkills)")
            
        }
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(input: DeveloperSkills) {
        
        currentSkill = input
        
        if let skilltype = input.skillType {
            skillButton.text = skilltype
        
        }
        
       
        
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       

        // Configure the view for the selected state
    }

}
