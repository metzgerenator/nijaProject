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
    
    init(email: String, accountType: String) {
        
        self.email = email
        self.accountType = accountType
     
    
    }
    

    
    

    
}


func createAccount(accountType: String,user: FIRUser ,values: Dictionary<String, AnyObject>) {
    
    let ref = FIRDatabase.database().reference()
    
    ref.child("users").child(user.uid).setValue(values)

    
}



func appendValues(user: String ,values: Dictionary<String, AnyObject>) {
    let ref = FIRDatabase.database().reference().child("users").child(user)
    print(ref)

    ref.updateChildValues(values)
    

    
}
