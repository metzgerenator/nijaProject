//
//  GenericAccountCreateViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/18/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit


class GenericAccountCreateViewController: UIViewController {
    
    
    
    @IBOutlet var companyNameField: UITextField!
    
    
    
    
    //companysize icons 
    
    
    
    @IBOutlet var freeLancerOutlet: UIButton!
    
    @IBOutlet var smallTeamOutlet: UIButton!

    @IBOutlet var devShopOutlet: UIButton!
    
    
    
    
    @IBAction func FreeLancerAction(_ sender: Any) {
    }
    
    
    @IBAction func SmallTeam(_ sender: Any) {
    }
    
    @IBAction func DevShop(_ sender: Any) {
    }
    
    
    var devTypeTitle: String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navTitle = devTypeTitle {
            
            self.navigationItem.title = navTitle
            
        }
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
