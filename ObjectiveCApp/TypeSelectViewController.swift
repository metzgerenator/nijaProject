//
//  TypeSelectViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/18/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class TypeSelectViewController: UIViewController {
    
    
    var notADev = "am not "
    var amADev = "am"
    
    var currentTitle: String?

    
    
    @IBOutlet var devSelectOutlet: UIButton!
    
    
    
    @IBAction func devSelectButton(_ sender: UIButton) {
        
        switch sender.currentTitle! {
        case notADev:
            devSelectOutlet.setTitle(amADev, for: .normal)
            currentTitle = "I am a developer or dev shop"
        default:
            devSelectOutlet.setTitle(notADev, for: .normal)
            currentTitle = "I am not a developer or dev shop"
            
        }
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Add barbutton
        let barButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(TypeSelectViewController.nextStep))
        self.navigationItem.rightBarButtonItem = barButton
        
       // devSelectOutlet.setTitle(notADev, for: .normal)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextStep() {
        
        self.performSegue(withIdentifier: "accountCreate", sender: self)
        
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! GenericAccountCreateViewController
        if segue.identifier == "accountCreate" {
            
            if let titleToSend = currentTitle {
                
                vc.devTypeTitle = titleToSend
            } else {
                
                vc.devTypeTitle = "I am developer or dev shop"
                
            }
 
    }
 

}


}
