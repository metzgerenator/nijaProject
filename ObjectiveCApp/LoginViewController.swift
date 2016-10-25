//
//  LoginViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 10/13/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
       // try! FIRAuth.auth()!.signOut()
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
                
                self.ref.child(users).child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    
                    let value = snapshot.value as? NSDictionary
                    print("here is the value \(value)")
                    
                    let userType = value?[userIDType] as! String
                    print("here is the user type \(userType)")
                    
                    
                    if userType == "developer" {
                        
                        self.performSegue(withIdentifier: developer, sender: nil)
                        
                    } else if userType == customers {
                        
                        self.performSegue(withIdentifier: developer, sender: nil)
                        
                    }
                 
                
                    
                    
                    // ...
                }) { (error) in
                    print(error.localizedDescription)
                }
                
                
                
                
                
            } else {
                
                
                
            }
            
    
        }
        
       
    }
    
    
    func userQuery() {
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButton(_ sender: AnyObject) {
        
        
        
            
            FIRAuth.auth()?.signIn(withEmail: userName.text!, password: passWord.text!, completion: { (user, error) in
                
                print("user \(user) error \(error)")
                
                // add error handeling here for loging errors
                
            })
            
        
        
        
        
        
    }
    
    
   
}
