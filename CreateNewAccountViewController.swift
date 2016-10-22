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

    @IBOutlet var userName: UITextField!
    
    @IBOutlet var passWord: UITextField!
    
    var ref: FIRDatabaseReference!

    
    
    
    @IBAction func createAccountButton(_ sender: AnyObject) {
        ref = FIRDatabase.database().reference()

        
        FIRAuth.auth()?.createUser(withEmail: userName.text!, password: passWord.text!) { (user, error) in
            
            
            if error == nil {
                //set user info to data base
                self.ref.child("users").child(user!.uid).setValue(["email": self.userName.text!])
                
                
                
                self.performSegue(withIdentifier: "success", sender: nil)
                
            }
            
            

            
            
        }

        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        FIRApp.configure()
//        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
























