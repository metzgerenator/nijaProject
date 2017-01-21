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
    
    
    
    func skillsFromDataBase()  {
        
        let ref = FIRDatabase.database().reference().child("developer_skills")
        
        ref.observe(.value, with: { (snapshot) in
            
            let skillDic  = snapshot.value as! NSDictionary
            
            for (key, value) in skillDic {
                
                print("here is key \(key) here is value\(value)")
                
                //guard let skill = key as? String else {continue}
                
                
                
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
}




