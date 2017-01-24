//
//  Users.swift
//  ObjectiveCApp
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase




struct User {
    
    var companyName: String?
    var city: String?
    var website: String?
    var userName: String?
    var companySize: String?
    
    
    init(snapShot: NSDictionary) {
        
        
        for (key, value) in snapShot {
            
            
            guard let keyCheck = key as? String else {continue}
            guard let valueCheck = value as? String else {continue}
            
            
            switch keyCheck {
            case CITY:
                self.city = valueCheck
                
            case COMPANYNAME:
                self.companyName = valueCheck
                
            case USERSWEBSITE:
                self.website = valueCheck
                
            case USERSNAME:
                self.userName = valueCheck
                
            case COMPANYSIZE:
                self.companySize = valueCheck
            default:
                break
            }
        
        }
       
      
        
        
        
        
        
    }
    
    
}








struct Developer {
    
    var email: String
    var accountType: String
    var userName: String?
    var website: String?
    var github: String?
    var phone: String?
    var address: String?
    
    var developerType: String?
    
    
    init(email: String, accountType: String) {
        
        self.email = email
        self.accountType = accountType
     
    
    }
    
    
    init(userdata: [String : AnyObject])  {
        self.email = ""
        self.accountType = ""
        guard let email = userdata["email"], let accountType = userdata["user_type"] else {return}
        
        self.email = email as! String
        self.accountType = accountType as! String
        
        if let userName = userdata["username"] {
            
            self.userName = userName as? String
            
        }
        
        
        if let website = userdata["website"] {
            
            self.website = website as? String
            
        }
        
        if let phone = userdata["phone"] {
            
            self.phone = phone as? String
            
        }
        
        if let github = userdata["github"] {
            
            self.github = github as? String
            
        }
        
        
        if let address = userdata["address"] {
            
            self.address = address as? String
            
        }
        
        
        if let devType = userdata[DEVELOPERTYPE] {
            
            self.developerType = devType as? String
            
        }
        
        
       
    }
    

    
    

    
}


func createAccount(accountType: String,user: FIRUser ,values: Dictionary<String, AnyObject>) {
    
    let ref = FIRDatabase.database().reference()
    
    ref.child("users").child(user.uid).setValue(values)

    
}



func appendValues(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid)
        ref.updateChildValues(values)

        
        
    }
    
  

    
}

func appendDevSkils(childPath: String, values: Array<String>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid).child(DEVELOPERSKILLS).child(childPath)
        
        var dictionaryToAdd: Dictionary<String, Any> = [:]
        for (int,skill) in values.enumerated() {
            
            dictionaryToAdd.updateValue(skill, forKey: "\(int)")
            
        }
        print("here is reference \(ref), here are key value pairs \(dictionaryToAdd)")
        
        ref.updateChildValues(dictionaryToAdd)
        
        
        
    }
    
}


func appendGenericValues(values: Dictionary<String, AnyObject>) {
    
    
    let ref = FIRDatabase.database().reference().child("developer_skills")
    ref.updateChildValues(values)
    
    
    
}
