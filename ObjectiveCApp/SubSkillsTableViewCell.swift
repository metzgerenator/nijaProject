//
//  SubSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewCell: UITableViewCell {
    
    
    var selectedMainSkill: DeveloperSkills!
    var userSelectSkills = [DeveloperSkills]()
    
    @IBOutlet var subSkillLabel: UILabel!
    
    
    @IBOutlet var selectSkillOutlet: UIButton!
    
    
    @IBAction func selectSkill(_ sender: Any) {
        var subSkillsToAppend = [String]()
        
        // if there remove if not add 
        if userSelectSkills.count > 0 {
            
            for skills in userSelectSkills {
                
                if skills.skillType! == selectedMainSkill.skillType {
                    
                    let isSubSkillPresent = skills.subSkills!.contains{$0 == subSkillLabel.text!}
                    
                    switch isSubSkillPresent {
                    case true:
                        subSkillsToAppend = skills.subSkills!.filter{$0 != subSkillLabel.text!}
                        selectSkillOutlet.backgroundColor = .black
                        
                    case false:
                        subSkillsToAppend = skills.subSkills!
                        subSkillsToAppend.append(subSkillLabel.text!)
                        selectSkillOutlet.backgroundColor = .green
                    }
                    
                    
                }
                
                
            }
            
            
        }
        
           

            
            appendDevSkils(childPath: selectedMainSkill.skillType! , values: subSkillsToAppend)
            
        
        
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configueCell(subSkill: String, subskills: [DeveloperSkills], currentMainSkill: DeveloperSkills) {
        
        
        subSkillLabel.text = subSkill
        self.userSelectSkills = subskills
        self.selectedMainSkill = currentMainSkill
    
       
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

