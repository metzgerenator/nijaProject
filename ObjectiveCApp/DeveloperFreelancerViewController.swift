//
//  DeveloperFreelancerViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 12/13/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class DeveloperFreelancerViewController: UIViewController {
    
    
    

    @IBOutlet var freelancerSwitch: UISwitch!
    
    @IBAction func freelancerSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn {
            companySwitch.isOn = false
        }
        
        
    }
    
    
    
    @IBOutlet var companySwitch: UISwitch!
    
    
    @IBAction func companySwitchAction(_ sender: UISwitch) {
        
        if sender.isOn {
            freelancerSwitch.isOn = false
        }
        
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        var developerType: String = ""
        
        if (freelancerSwitch.isOn) {
            
            developerType = FREELANCER
        } else if (companySwitch.isOn) {
            
            developerType = COMPANY
            
        }else {
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
        let dictionaryToAppend = [DEVELOPERTYPE : developerType]
        
        appendValues(values: dictionaryToAppend as Dictionary<String, AnyObject>)
        
        self.dismiss(animated: true, completion: nil)
       
        
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
