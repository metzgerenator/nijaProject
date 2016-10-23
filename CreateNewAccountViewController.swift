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
        ref = FIRDatabase.database().reference()
        
        if customerSwitchLael.isOn != true && developerSwitchLabel.isOn != true {
            
            alertControllerView(title: "choose profile", message: "Please choose if you are creating a developer or customer account")
            
            
        } else {
            
            FIRAuth.auth()?.createUser(withEmail: userName.text!, password: passWord.text!) { (user, error) in
                
                
                if error == nil {
                    //set user info to data base
                    self.ref.child("users").child(user!.uid).setValue(["email": self.userName.text!])
                    
                    self.performSegue(withIdentifier: "success", sender: nil)
                    
                } else {
                    
                    
                }
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: alertview
    
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}


























