//
//  CreateProfileViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 10/22/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class CreateProfileViewController: UIViewController {

    @IBAction func logOutButton(_ sender: AnyObject) {
        
        try! FIRAuth.auth()!.signOut()
        
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
