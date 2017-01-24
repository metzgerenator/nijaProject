//
//  SubSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewCell: UITableViewCell {
    
    
    var delegate: SubSkillsTableViewCellDelegate?
    
    @IBOutlet var subSkillLabel: UILabel!
    
    
    @IBOutlet var selectSkillOutlet: UIButton!
    
    
    @IBAction func selectSkill(_ sender: Any) {
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configueCell(subSkill: String, isSelected: Bool) {
        
        
        subSkillLabel.text = subSkill
        
        switch isSelected {
        case true:
            selectSkillOutlet.backgroundColor = .black
            delegate?.updateSubSkills(subSkill: subSkill, remove: false)
            
        case false:
            selectSkillOutlet.backgroundColor = .green
            delegate?.updateSubSkills(subSkill: subSkill, remove: false)
        }
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol SubSkillsTableViewCellDelegate {
    func updateSubSkills(subSkill: String, remove: Bool)
}
