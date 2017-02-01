//
//  AddtoPortFolioViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class AddtoPortFolioViewController: UIViewController {
    
    
    
    @IBOutlet var descriptionOutlet: UITextView!
    
    
    
    @IBAction func editDescriptionAction(_ sender: Any) {
        
        let hidden = descriptionOutlet.isHidden
        
        switch hidden {
        case true:
            descriptionOutlet.isHidden = false
        case false:
            descriptionOutlet.isHidden = true
   
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionOutlet.isHidden = true

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
