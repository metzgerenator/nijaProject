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
    
    var userAvailability: String?
    
    
    @IBOutlet var longTermOutlet: UIButton!
    
    
    @IBOutlet var shorTermOutlet: UIButton!
    
    
    @IBOutlet var contractOutlet: UIButton!
    
    

    @IBAction func photoButton(_ sender: UIButton) {
        
        
        
    }
    
    
    
    
    @IBAction func longTermAction(_ sender: UIButton) {
        
        userAvailability = LONGTERM
        setButtonBackgrounds(tagID: sender.tag)
        
        
    }
    
    
   
    
    
    @IBAction func shortTermAction(_ sender: UIButton) {
        userAvailability = SHORTTERM
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    @IBAction func contractAction(_ sender: UIButton) {
        
        userAvailability = CONTRACT
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            if let availability = Developer.userAvailAbility {
                
                
                
                switch availability {
                    
                case LONGTERM:
                    self.setButtonBackgrounds(tagID: 1)
                    self.userAvailability = LONGTERM
                    
                case SHORTTERM:
                    self.setButtonBackgrounds(tagID: 2)
                    self.userAvailability = SHORTTERM
                    
                case CONTRACT:
                    self.setButtonBackgrounds(tagID: 3)
                    self.userAvailability = CONTRACT
                    
                default:
                    break
                    
                }
                
                
                
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
    
    
    func setButtonBackgrounds(tagID: Int) {
        
        
        
        self.longTermOutlet.backgroundColor = UIColor.white
        self.shorTermOutlet.backgroundColor = UIColor.white
        self.contractOutlet.backgroundColor = UIColor.white
        
        switch tagID {
        case 1:
            self.longTermOutlet.backgroundColor = UIColor.gray
            
        case 2:
            self.shorTermOutlet.backgroundColor = UIColor.gray
            
        case 3:
            self.contractOutlet.backgroundColor = UIColor.gray
        default:
            break
        }
        
        
        
        
    }
    
    
    
    
    
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



