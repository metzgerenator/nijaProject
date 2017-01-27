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
    
    
    
    
    @IBOutlet var longTermOutlet: UIButton!
    
    
    @IBOutlet var shorTermOutlet: UIButton!
    
    
    @IBOutlet var contractOutlet: UIButton!
    
    

    @IBAction func photoButton(_ sender: Any) {
        
        
        
    }
    
    @IBAction func longTermAction(_ sender: Any) {
        
        
    }
    
    
   
    
    
    @IBAction func shortTermAction(_ sender: Any) {
    }
    
    
    @IBAction func contractAction(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            if let availability = Developer.USERAVAILABILITY {
                
            }
            
            
        }
        

        
        setAttributes()
       
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

extension SkilsAndAvailabilityViewController {
    
    func setAttributes() {
    
        let border = CGFloat(0.5)
        let radius = CGFloat(5.0)
        
        
        longTermOutlet.layer.cornerRadius = radius
        longTermOutlet.clipsToBounds = true
        longTermOutlet.layer.borderWidth = border
        
        shorTermOutlet.layer.cornerRadius = radius
        shorTermOutlet.clipsToBounds = true
        shorTermOutlet.layer.borderWidth = border
        
        contractOutlet.layer.cornerRadius = radius
        contractOutlet.clipsToBounds = true
        contractOutlet.layer.borderWidth = border
        
        
    }
    
    
    
}



