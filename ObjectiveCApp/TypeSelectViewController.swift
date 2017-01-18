//
//  TypeSelectViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/18/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class TypeSelectViewController: UIViewController {
    
    
    var notADev = "Am not "
    var amADev = "Am"

    
    
    @IBOutlet var devSelectOutlet: UIButton!
    
    
    
    @IBAction func devSelectButton(_ sender: UIButton) {
        
        switch sender.currentTitle! {
        case notADev:
            devSelectOutlet.setTitle(amADev, for: .normal)
        default:
            devSelectOutlet.setTitle(notADev, for: .normal)
        }
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // devSelectOutlet.setTitle(notADev, for: .normal)

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
