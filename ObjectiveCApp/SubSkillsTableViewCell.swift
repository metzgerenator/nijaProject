//
//  SubSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewCell: UITableViewCell {
    
    
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
            selectSkillOutlet.backgroundColor = .green
        case false:
            selectSkillOutlet.backgroundColor = .black
        }
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
