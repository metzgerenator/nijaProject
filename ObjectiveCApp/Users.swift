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
    
    var email: String?
    var accountType: String?
    var userName: String?
    var website: String?
    var github: String?
    var phone: String?
    var location: String?
    
    var companyName: String?
    
    
    
    var developerType: String?
    
    init() {
        
    }
    
    
    //MARK: finish cross checking with constants
    
    init(userdata: [String : AnyObject])  {
     
        
        if let email = userdata[USERSEMAIL] {
            
            self.email = email as? String
            
        }
        
        
        if let accountType = userdata[USERTYPE] {
            
            self.accountType = accountType as? String
            
        }
        
        
        if let userName = userdata[USERSNAME] {
            
            self.userName = userName as? String
            
        }
        
        
        if let website = userdata[USERSWEBSITE] {
            
            self.website = website as? String
            
        }
        
//        if let github = userdata["github"] {
//            
//            self.github = github as? String
//            
//        }
        
        
        if let location = userdata[USERLOCATION] {
            
            self.location = location as? String
            
        }
        
        
        if let devType = userdata[DEVELOPERTYPE] {
            
            self.developerType = devType as? String
            
        }
        
        if let companyName = userdata[COMPANYNAME] {
            
            self.companyName = companyName as? String
            
        }
        
        
       
    }
    

    
    

    
}


func createAccount(user: FIRUser) {
    
    let ref = FIRDatabase.database().reference()
    
    guard let email = user.email else {return}
    
    let emailAttribute = ["email" : email]
    
    ref.child("users").child(user.uid).setValue(emailAttribute)

    
}



func appendValues(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid)
        ref.updateChildValues(values)

        
        
    }
    
  

    
}


func appendDevSkils(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid).child(DEVELOPERSKILLS)
        
        
        for (key, value) in values {
            
            print("key \(key) value \(value)")
            
        }
        
        ref.updateChildValues(values)
        
        
        
    }
    
}


func appendGenericValues(values: Dictionary<String, AnyObject>) {
    
    
    let ref = FIRDatabase.database().reference().child("developer_skills")
    ref.updateChildValues(values)
    
    
    
}


//MARK: Authentication State listener and user attributes


struct CurrentUser  {
    
    
     func userAttributes(completion: @escaping (Developer) -> Void) {
        
        guard let userId = FIRAuth.auth()?.currentUser?.uid else {return}
        
        let ref = FIRDatabase.database().reference().child("users").child(userId)
        
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let skillDic = snapshot.value as? NSDictionary else { return }
            
            
            let developer = Developer(userdata: skillDic as! [String : AnyObject])
            
            completion(developer)
            
            
        })
        
    }
   
    func checkUSerStatus(completion: @escaping (_ userLogged: Bool)->Void)  {
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
                completion(true)
                
            } else {
                
                completion(false)
                
            }
            
            
            
        }
        
    }
    

    
}













