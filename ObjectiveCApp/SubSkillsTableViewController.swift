//
//  SubSkillsTableViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewController: UITableViewController {
    
    
    var skillSet: DeveloperSkills?
    
    var userSelectSkills: [DeveloperSkills]?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return skillSet?.subSkills?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubSkillsTableViewCell
        
         let subSkill = skillSet?.subSkills?[indexPath.row]
        
        if let skillCheck = subSkill {
            
            cell.configueCell(subSkill: skillCheck, isSelected: true)
            
        }
        
        
        return cell
    }
 

 

}



extension SubSkillsTableViewController: EditSkillsTableViewControllerDelegate {
    
    
    func updateUserSelectSkills(userSelectSkills: [DeveloperSkills]) {
        
        self.userSelectSkills = userSelectSkills
        
    }
    
}




