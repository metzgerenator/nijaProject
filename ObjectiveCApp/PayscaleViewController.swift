//
//  PayscaleViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/4/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class PayscaleViewController: UIViewController {
    
    
    @IBOutlet var dollarAmount: UILabel!
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        dollarAmount.text = "$\(sender.value)K"
        
    }

    @IBAction func saveButton(_ sender: Any) {
        
        appendValues(values: ["minimum_pay" : dollarAmount.text as AnyObject])
        
        
        
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
