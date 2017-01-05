//
//  DevSpecialityViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/5/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class DevSpecialityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
   let specialties = ["UI", "UX", "Desktop software development", "ecommerce development", "game development", "Mobile development", "product management", "QA & testing, scripts & utilities", "web development", "web & mobile design", "other software development", "word press", "wix", "square space", "data base development"]
    
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialties.count
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = specialties[indexPath.row]
        
        return cell!
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
