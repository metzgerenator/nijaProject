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
    var companySize: String?
    
    var userAvailAbility: String?
    
    
    var developerType: String?
    
    
    var developerDescription: String?
    
    
    var previousClients: [String]?
    
    var userPhoto: String?
    
    init() {
        
    }
    
    
    //MARK: finish cross checking with constants
    
    init(userdata: [String : AnyObject])  {
        
        
        if let previousClients = userdata[PREVIOUSCLIENTS] {
            
            var newArray = [String]()
            
            for user in previousClients as! NSArray {
                
                if user is String {
                    
                    newArray.append(user as! String)
                    
                }
                
                self.previousClients = newArray
            }
        }
        
        
        if let userImageURL = userdata[USERIMAGE] {
            
            self.userPhoto = userImageURL as! String
        
            
        }
        
        
        if let availability = userdata[USERAVAILABILITY] {
            
            self.userAvailAbility = availability as? String
            
        }
        
        
        if let description = userdata[COMPANYDESCRIPTION] {
            
            self.developerDescription = description as? String
            
        }
        
        if let email = userdata[USERSEMAIL] {
            
            self.email = email as? String
            
        }
        
        
        if let companySize = userdata[COMPANYSIZE] {
            
            self.companySize = companySize as? String
            
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
    
    // need function for retriving photos
    
    
    //single photo function 
    
    func uploadSinglePhoto(image: UIImage, mainHeader: String?) {
        
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://objective-c-7392d.appspot.com").child("userimages")
        
        
        
        
        guard let imageToLoad = UIImageJPEGRepresentation(image, 0.2) else { return }
        let randomNumber = Int(arc4random_uniform(20000) + 1)
        let userImageRef = storageRef.child("\(randomNumber).jpg")
        
        
        userImageRef.put(imageToLoad, metadata: nil) { (metadata, error) in
            
            if error == nil {
                
                if let header = mainHeader {
                    let randomNumber = "\(Int(arc4random_uniform(20000) + 1))"
                    let imageReference = "\(userImageRef)"
                    let imageDicToAdd: Dictionary<String, AnyObject> = [randomNumber : imageReference as AnyObject]
                    let values: Dictionary<String, Dictionary<String, Any>> = [USERPROJECTS : [header : imageDicToAdd] ]
                    //
                    appendValues(values: values as Dictionary<String, AnyObject>)
                    
                }
                
                
            } else {
                
                print("error occured \(error)")
                
            }
            
        }
        
        
        
        
        
    }
    
    
    
    func uploadPhotos(images: [UIImage], mainHeader: String?) {
        
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://objective-c-7392d.appspot.com").child("userimages")
        
        var imageURLS = [String]()
        for image in images {

            guard let imageToLoad = UIImageJPEGRepresentation(image, 0.2) else { return }
            let randomNumber = Int(arc4random_uniform(20000) + 1)
            let userImageRef = storageRef.child("\(randomNumber).jpg")
            
            
                if let header = mainHeader {
                    //let randomNumber = "\(Int(arc4random_uniform(20000) + 1))"
                    let imageReference = "\(userImageRef)"
                    
                    imageURLS.append(imageReference)
                    
                    //imageURLS.updateValue(imageReference as AnyObject, forKey: randomNumber)
                    
                    //let imageDicToAdd: Dictionary<String, AnyObject> = [randomNumber : imageReference as AnyObject]
                    //let values: Dictionary<String, Dictionary<String, Any>> = [USERPROJECTS : [header : imageDicToAdd] ]
                    //
                   // appendValues(values: values as Dictionary<String, AnyObject>)
                    
                
            
            
//            userImageRef.put(imageToLoad, metadata: nil) { (metadata, error) in
//                
//                if error == nil {
//                    
//                    if let header = mainHeader {
//                        let randomNumber = "\(Int(arc4random_uniform(20000) + 1))"
//                        let imageReference = "\(userImageRef)"
//                        let imageDicToAdd: Dictionary<String, AnyObject> = [randomNumber : imageReference as AnyObject]
//                        let values: Dictionary<String, Dictionary<String, Any>> = [USERPROJECTS : [header : imageDicToAdd] ]
//                        //
//                        appendValues(values: values as Dictionary<String, AnyObject>)
//                        
//                    }
// 
//                    
//                } else {
//                    
//                    print("error occured \(error)")
//                    
//                }
//                
//            }
            
        }
        
        }
        //update values here 
        appendValues(values: [mainHeader! : imageURLS as AnyObject])
    }
    
    
    func getCurrentPhoto(imageURL: String, completion: @escaping (UIImage?, _ error: Bool, _ errorMessage: String) -> Void) {
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: imageURL)
        
        storageRef.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                
                completion(nil, true, error.localizedDescription)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                
                completion(image, false, "")
                
                
            }
        }
        
        
    }
    
    
    
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













