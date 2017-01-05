//
//  Users.swift
//  ObjectiveCApp
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase


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
