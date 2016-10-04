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
    
    
    
    @IBAction func createAccountButton(_ sender: AnyObject) {
        
        
        FIRAuth.auth()?.createUser(withEmail: userName.text!, password: passWord.text!) { (user, error) in
            
           print("error \(error)")
            

            
            
        }
//
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
