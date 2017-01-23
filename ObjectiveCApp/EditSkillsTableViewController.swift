//
//  EditSkillsTableViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/21/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class EditSkillsTableViewController: UITableViewController {

    var skillsArray = [DeveloperSkills]()
    var devSelectSkills = [DeveloperSkills]()
    
    var cellVC = EditSkillsTableViewCell()
    
    
    
    @IBAction func cacelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let developerSkills = DeveloperSkills()
        let developerSelectSkills = DevSelectSkils()
        
        developerSkills.skillsFromDataBase(completion: { skills in
            self.skillsArray.removeAll()
             self.skillsArray = skills
            self.tableView.reloadData()
            
            developerSelectSkills.skillsFromDataBase(completion: { (skills) in
                self.devSelectSkills.removeAll()
                self.devSelectSkills = skills
                
                
                self.tableView.reloadData()
                
            
                
            })
            
        })
        
        
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
        // #warning Incomplete implementation, return the number of rows
        return skillsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditSkillsTableViewCell
        
            let skill = skillsArray[indexPath.row]
        
            cell.delegate = self
        
        let isInSelectedArray = devSelectSkills.contains{$0.skillType == skill.skillType}
        
        cell.configureCell(input: skill, isSelectedSkill: isInSelectedArray)
  
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       // let skill = skillsArray[indexPath.row]
        
        
        
   
       
    }

   

}


extension EditSkillsTableViewController: EditSkillsTableViewCellDelegate {
    
    
    func updateArray(selectedSkill: DeveloperSkills) {
        
        //print("delegate works \(selectedSkill.skillType)")
        
        let skill = selectedSkill
        
        let userSelectCheck = devSelectSkills.contains{$0.skillType == skill.skillType}
        
        switch userSelectCheck {
        case true:
            devSelectSkills = devSelectSkills.filter{$0.skillType != skill.skillType}
            
        case false:
            devSelectSkills.append(skill)
            
            
        }
        
        //loop through and update skills
        var valuesToAppend:Dictionary<String, Any> = [:]
        
        for skill in devSelectSkills {
            
            guard let skillToAppend = skill.skillType else {continue}
            guard let subSkill = skill.subSkills else {continue}
            
            valuesToAppend.updateValue(subSkill, forKey: skillToAppend)
            
        }
        
        let finalValues = [DEVELOPERSKILLS : valuesToAppend]
        
        appendValues(values: finalValues as Dictionary<String, AnyObject>)
        
        
        
    }
}



