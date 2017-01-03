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
        
        //try! FIRAuth.auth()!.signOut()
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
                
                self.ref.child(users).child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    //determine if email is verified
                    let emailVerified = user!.isEmailVerified
                    // Get user value
                    
                    let value = snapshot.value as? NSDictionary
                    print("here is the value \(value)")
                    
                    let userType = value?[userIDType] as! String
                    print("here is the user type \(userType)")
                    
                    
                    if userType == "developer" && emailVerified == true {
                        
                    
        
                        self.performSegue(withIdentifier: developer, sender: nil)
                        
                    } else if userType == customers && emailVerified == true {
                        
                        self.performSegue(withIdentifier: customers, sender: nil)
                        
                    }
                 
                
                    
                    
                   
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
        
        
        if userName.text?.characters.count == 0 || passWord.text?.characters.count == 0 {
            self.alertControllerView(title: "Credential Error", message: "Please fill in all the credentials")
        }
            
            FIRAuth.auth()?.signIn(withEmail: userName.text!, password: passWord.text!, completion: { (user, error) in
                
                
                // tell user if they are not verified
                if user?.isEmailVerified == false {
                    
                    self.alertControllerView(title: "Verify Email", message: "Please verify your email before loging in.")
                    
                }
                
                if (error != nil) {
                    
                    if let userInfo = error?.localizedDescription {
                        
                        self.alertControllerView(title: "Error", message: userInfo)
                        
                    }
                    
                }
                // add error handeling here for loging errors
                
            })
            
        
        
        
        
        
    }
    
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
   
}
