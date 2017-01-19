//
//  SkilsAndAvailabilityViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/19/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class SkilsAndAvailabilityViewController: UIViewController {
    
    
    var ref: FIRDatabaseReference!
    
    var currentUSer: User?
    

    @IBAction func photoButton(_ sender: Any) {
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ref = FIRDatabase.database().reference()
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            
            
            if user != nil {
                
                 self.ref.child(users).child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let snapshotINput = snapshot.value as! NSDictionary
                    
                    let userCheck = User(snapShot: snapshotINput)
                    
                    
                })
                
                
            }
            
        }
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
