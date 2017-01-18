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
    
    
    @IBOutlet var freelanceSize: UILabel!
    
    @IBOutlet var smallTeamSize: UILabel!
    
    @IBOutlet var devShopSize: UILabel!
    
    
    
    @IBAction func FreeLancerAction(_ sender: UIButton) {
        
        
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    @IBAction func SmallTeam(_ sender: UIButton) {
        
        setButtonBackgrounds(tagID: sender.tag)
    }
    
    @IBAction func DevShop(_ sender: UIButton) {
        
        setButtonBackgrounds(tagID: sender.tag)
    }
    
    
    
    func setButtonBackgrounds(tagID: Int) {
        
        
        
        self.freelanceSize.backgroundColor = UIColor.white
        self.smallTeamSize.backgroundColor = UIColor.white
        self.devShopSize.backgroundColor = UIColor.white
        
        switch tagID {
        case 1:
            self.freelanceSize.backgroundColor = UIColor.gray
            
        case 2:
            self.smallTeamSize.backgroundColor = UIColor.gray
            
        case 3:
            self.devShopSize.backgroundColor = UIColor.gray
        default:
            break
        }
       
        
        
        
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
        
        setAttributes()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setAttributes() {
        let border = CGFloat(0.5)
        let radius = CGFloat(5.0)
        
        
        freelanceSize.layer.cornerRadius = radius
        freelanceSize.clipsToBounds = true
        freelanceSize.layer.borderWidth = border
        
        smallTeamSize.layer.cornerRadius = radius
        smallTeamSize.clipsToBounds = true
        smallTeamSize.layer.borderWidth = border
        
        devShopSize.layer.cornerRadius = radius
        devShopSize.clipsToBounds = true
        devShopSize.layer.borderWidth = border
        
        
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
