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
    
    var delegate: SubSkillsTableViewCellDelegate?
    
    
    @IBOutlet var subSkillLabel: UILabel!
    
    
    @IBOutlet var selectSkillOutlet: UIButton!
    
    
    @IBAction func selectSkill(_ sender: Any) {
        
        
        
        delegate?.updatesubSkills()
        
        
//        print("selectedMainSkill \(selectedMainSkill.skillType) " )
//        
//        for skill in userSelectSkills {
//            
//            print("head skill \(skill.skillType)")
//            for sub in skill.subSkills! {
//                print("sub skill \(sub)")
//            }
//            
//            
//        }
        
//        
//            var subSkillsToAppend = [String]()
//            subSkillsToAppend.removeAll()
//            for skills in userSelectSkills {
//                
//                
//                    let isSubSkillPresent = skills.subSkills!.contains{$0 == subSkillLabel.text!}
//                    
//                    switch isSubSkillPresent {
//                    case true:
//                        subSkillsToAppend = skills.subSkills!.filter{$0 != subSkillLabel.text!}
//                        selectSkillOutlet.backgroundColor = .black
//                        break
//                    case false:
//                        subSkillsToAppend = skills.subSkills!
//                        subSkillsToAppend.append(subSkillLabel.text!)
//                        selectSkillOutlet.backgroundColor = .green
//                        break
//                    }
//                    
//                    
//                
//                
//            }
//        
//    
//            
//            appendDevSkils(childPath: selectedMainSkill.skillType! , values: subSkillsToAppend)
        
        
        
        
        
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


protocol SubSkillsTableViewCellDelegate {
    func updatesubSkills()
}





