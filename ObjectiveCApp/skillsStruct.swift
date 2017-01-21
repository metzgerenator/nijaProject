//
//  skillsStruct.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/21/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase


struct DeveloperSkills {
    
    var skillType: String?
    var subSkills: [String]?
    
    
    init() {
        
        
    }
    
    
    init(skillType: String, subSkills: [String]) {
        
        self.skillType = skillType
        self.subSkills = subSkills
        
        
    }
    
    
    
    func skillsFromDataBase(completion: @escaping (_ skills: [DeveloperSkills])->Void) {
        
        var devSkillsArray = [DeveloperSkills]()
        let ref = FIRDatabase.database().reference().child("developer_skills")
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let skillDic  = snapshot.value as? NSDictionary else { return }
            
            for (skill, subSkill) in skillDic {
   
                let devSkill = DeveloperSkills(skillType: skill as! String, subSkills: subSkill as! Array<String>)
                devSkillsArray.append(devSkill)
            }
            completion(devSkillsArray)
        }) { (error) in
            print(error.localizedDescription)
        }
        
    
        
    }
    
    
    
    
    
}




