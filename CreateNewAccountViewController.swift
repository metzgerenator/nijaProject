//
//  CreateNewAccountViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 10/4/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase


class CreateNewAccountViewController: UIViewController {
    
    //MARK: properties
    @IBOutlet var customerSwitchLael: UISwitch!
    
    @IBOutlet var developerSwitchLabel: UISwitch!
    

    @IBOutlet var userName: UITextField!
    
    @IBOutlet var passWord: UITextField!

    
    var ref: FIRDatabaseReference!
    
    
    
    
    @IBAction func customerSwitchAction(_ sender: UISwitch) {
        
        if (sender.isOn) {
            
            developerSwitchLabel.isOn = false
        }
        
    }
    
    

    @IBAction func developerSwitchAction(_ sender: UISwitch) {
        
        if (sender.isOn) {
            
            customerSwitchLael.isOn = false
        }
        
        
    }
    
    @IBAction func createAccountButton(_ sender: AnyObject) {
        
        
        if userName.text?.characters.count == 0 || passWord.text?.characters.count == 0 {
            self.alertControllerView(title: "Credential Error", message: "Please fill in all the credentials")
        }
        
        ref = FIRDatabase.database().reference()
        
        if customerSwitchLael.isOn != true && developerSwitchLabel.isOn != true {
            
            alertControllerView(title: "choose profile", message: "Please choose if you are creating a developer or customer account")
            
            
        } else {
   
            FIRAuth.auth()?.createUser(withEmail: userName.text!, password: passWord.text!) { (user, error) in
                
                
                if error == nil {
                    
                    //if user is customer
                    if (self.customerSwitchLael.isOn) {
                        
                        let values  = ["user_type" : "customer",
                                       "email" : self.userName.text!]
                        
                        //createAccount(accountType: customers, user: user!, values: values as Dictionary<String, AnyObject>)
             
                        
                    } else if (self.developerSwitchLabel.isOn) {
                        
                        let values  = ["user_type" : "developer",
                                       "email" : self.userName.text!]
                        
                         //createAccount(accountType: developer, user: user!, values: values as Dictionary<String, AnyObject>)
                        
                        
                     }
                    
                    //send email verification
                    FIRAuth.auth()?.currentUser?.sendEmailVerification(completion: { (error) in
                        
                        if error == nil {
                            
                            try! FIRAuth.auth()!.signOut()
                            
                            self.alertControllerViewPostEmailVerification(title: "Check your email", message: "please check your email for verification and then log in")
                            
                 
                        } else {
                            
                            self.alertControllerView(title: "Invalid Email", message: "Please check your email and log in again")
                        }
                        
                        
                    })
                    
                   
                    
                } else {
                
                   
                    
                    if let userInfo = error?.localizedDescription {
                        
                        self.alertControllerView(title: "Error", message: userInfo)
                    }
                    
                    
                    
                }
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: alertview
    
    
    func alertControllerViewPostEmailVerification(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            
           _ = self.navigationController?.popViewController(animated: true)
            
        })

        alertController.addAction(okAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    



}





















