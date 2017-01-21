//
//  EditSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/21/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class EditSkillsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var skillButton: UILabel!
    
    @IBAction func additionalSkillsButton(_ sender: UIButton) {
        
        print("button pressed")
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(input: String) {
        
        skillButton.text = input
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
