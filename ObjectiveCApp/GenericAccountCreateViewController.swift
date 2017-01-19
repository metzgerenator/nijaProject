//
//  GenericAccountCreateViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/18/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class GenericAccountCreateViewController: UIViewController {
    
    
    var userName: String?
    var userPassword: String?
    
    var companySize: String?
    
    @IBOutlet var companyNameField: UITextField!
    
    
    @IBOutlet var cityField: UITextField!
    
    @IBOutlet var websiteField: UITextField!
    
    @IBOutlet var emailField: UITextField!
    //companysize icons 
    
    
    @IBOutlet var freelanceSize: UILabel!
    
    @IBOutlet var smallTeamSize: UILabel!
    
    @IBOutlet var devShopSize: UILabel!
    
    
    @IBOutlet var saveButtonOutlet: UIButton!
    
    @IBAction func FreeLancerAction(_ sender: UIButton) {
        
        companySize = FREELANCERTYPE
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    @IBAction func SmallTeam(_ sender: UIButton) {
        companySize = SMALLTEAMTYPE
        setButtonBackgrounds(tagID: sender.tag)
    }
    
    @IBAction func DevShop(_ sender: UIButton) {
        
        companySize = DEVSHOPTYPE
        
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
        
        companyNameField.setBottomBorder(borderColor: .gray)
        
        cityField.setBottomBorder(borderColor: .gray)
        websiteField.setBottomBorder(borderColor: .gray)
        emailField.setBottomBorder(borderColor: .gray)
        
        saveButtonOutlet.layer.cornerRadius = 5.0
        
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
    
    
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        saveUIAlert(title: "Credentials", message: "Please fill out the credentials below")
        
        
        
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
//MARK: alert views

extension GenericAccountCreateViewController {
    
    
    func saveUIAlert(title: String, message: String)  {
        
        
        if ((companyNameField.text?.characters.count)! > 0 && (cityField.text?.characters.count)! > 0 ) && (websiteField.text?.characters.count)! > 0 && (emailField.text?.characters.count)! > 0 && companySize != nil {
      
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            
            
            let loginAction = UIAlertAction(title: "Create Account", style: .default) { [weak alertController] _ in
                if let alertController = alertController {
                    let loginTextField = alertController.textFields![0] as UITextField
                    let passwordTextField = alertController.textFields![1] as UITextField
                    
                    self.createNewAccount(username: loginTextField.text!, password: passwordTextField.text!)
                    
                    
                }
            }
            
            alertController.addTextField { (textField) in
                
                if let userName = self.userName {
                    textField.text = userName
                }
                textField.placeholder = "User Name"
                textField.keyboardType = .default
                
            }
            
            alertController.addTextField { textField in
                
                if let password = self.userPassword {
                    
                    textField.placeholder = password
                }
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(loginAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            userAlerts(title: "Check all fields", message: "Please fill in all the required fileds")
            
        }
        
        
        
        
    }
    
    
    //MARK: general alert funciton
    func userAlerts(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
     
        alertController.addAction(okAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}


//MARK: firebase create user methods
extension GenericAccountCreateViewController {

    
    
    
    func createNewAccount(username: String, password: String)  {
        
        
        
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: password, completion: { (user, error) in
                
                if error == nil {
                    
                    let valuesToAdd = [USERNAME : username, COMPANYNAME: self.companyNameField.text!, USERWEBSITE : self.websiteField.text!, USERCITY : self.cityField.text!] as [String : Any]
                    
                    
                    createAccount(accountType: self.companySize!, user: user!, values: valuesToAdd as Dictionary<String, AnyObject>)
                    
                    self.userName = nil
                    self.userPassword = nil
                    
                    //segue to next view
                    
                } else {
                    
                    self.userName = username
                    self.userPassword = password
                    
                    self.saveUIAlert(title: "Error", message: (error?.localizedDescription)!)
                    
                    
                }
                
                
            })
            
        
       

        
        
    }




}























