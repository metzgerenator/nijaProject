//
//  CreateDeveloperTableViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 10/25/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase


class CreateDeveloperTableViewController: UITableViewController {
    
    
    
    
    
    // properties 
    
    var ref: FIRDatabaseReference!
    
    
    @IBOutlet var userNameField: UITextField!
    
    @IBOutlet weak var companyNameField: UITextField!
    
    @IBOutlet var phoneField: UITextField!
    
    @IBOutlet var website: UITextField!
    
    @IBOutlet var github: UITextField!
    
    @IBOutlet var address: UITextField!
    

    @IBAction func logOutButton(_ sender: AnyObject) {
        
        try! FIRAuth.auth()!.signOut()
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func saveButton(_ sender: AnyObject) {
        
        if (userNameField.text?.characters.count)! > 0 &&  (phoneField.text?.characters.count)! > 0 && (website.text?.characters.count)! > 0 && (github.text?.characters.count)! > 0
        && (address.text?.characters.count)! > 0 {
            
            let values = ["username" : userNameField.text!,
                          "phone" : phoneField.text!,
                          "website" : website.text!,
                          "github" : github.text!,
                          "address" : address.text!,
                          "companyName" : companyNameField.text!
                          ]
            
            appendValues(values: values as Dictionary<String, AnyObject>)
            
            alertControllerView(title: "up to date", message: "we've updated your profile")
            
            
        } else {
            
             alertControllerView(title: "fill out all fields", message: "please fill out all the fields")
        }
        
        
        
    }
    
    //MARK: alertview
    
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let user = FIRAuth.auth()?.currentUser {
            
            ref = FIRDatabase.database().reference().child("users").child(user.uid)
            
            ref.observe(FIRDataEventType.value, with: { (snapshot) in
                guard let userData = snapshot.value as? [String : AnyObject] else {return}
                
              let developer =  Developer(userdata: userData)
                
                if let userName = developer.userName{
                    self.userNameField.text = userName
                }
                
                if let phone = developer.phone{
                    self.phoneField.text = phone
                }
                
                if let gitHub = developer.github{
                    self.github.text = gitHub
                }
                if let website = developer.website{
                    self.website.text = website
                }
//                if let address = developer.address{
//                    self.address.text = address
//                }
//                
                if let devType = developer.developerType{
                    
                    currentUserDevType = devType
                    self.setNavTitle(devTpe: devType)
                    
                    
                } else {
                    
                    self.performSegue(withIdentifier: "devType", sender: self)
                }
                
                
                
                
            })
            
            
        }
        

    
    }
    
    
    func setNavTitle(devTpe: String) {
        
        self.navigationItem.title = devTpe
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
