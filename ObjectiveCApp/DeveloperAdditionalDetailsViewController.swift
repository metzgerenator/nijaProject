//
//  DeveloperAdditionalDetailsViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 11/1/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class DeveloperAdditionalDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    
    var userSelections = [CollectionFields]()
    
    

    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let devType = currentUserDevType {
            
            self.navigationItem.title = devType
            
        }
        
        userSelections = createCollections()
        self.collectionView.reloadData()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userSelections.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem = userSelections[indexPath.row]
        
        switch selectedItem.segue {
            
        case "availibility":
           AvailiBilityAlert()
            
        case "skill_level":
            skillLevel()

        default:
            self.performSegue(withIdentifier: selectedItem.segue, sender: self)
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DeveloperAdditionalCollectionViewCell
        
        let item = userSelections[indexPath.row]
        
        cell.configureCell(inputString: item.message)
        
        
        return cell
        
        
        
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


extension DeveloperAdditionalDetailsViewController {
    
    
    //MARK: alertviews
    
    func AvailiBilityAlert() {
        
        let alertController = UIAlertController(title: "Availibility", message: "Select One", preferredStyle: .actionSheet)
        let attributeTitle = "availibility"
        
        let oneAction = UIAlertAction(title: "Fulltime Work", style: .default) { (action) in
            let input = action.title!
            appendValues(values: [attributeTitle : input as AnyObject])
        }
        let twoAction = UIAlertAction(title: "Parttime", style: .default) { (action) in
            
            let input = action.title!
            appendValues(values: [attributeTitle : input as AnyObject])
        }
        let threeAction = UIAlertAction(title: "Contractwork", style: .default) { (action) in
            
            let input = action.title!
            appendValues(values: [attributeTitle : input as AnyObject])
            
        }
        let fourAction = UIAlertAction(title: "Internship", style: .default) { (action) in
            
            let input = action.title!
            appendValues(values: [attributeTitle : input as AnyObject])
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        alertController.addAction(fourAction)
        alertController.addAction(cancelAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    func skillLevel() {
    
    let alertController = UIAlertController(title: "Skill Level", message: "Select One", preferredStyle: .actionSheet)
    let attributeTitle = "skill_level"
    
    let oneAction = UIAlertAction(title: "Senior", style: .default) { (action) in
    let input = action.title!
    appendValues(values: [attributeTitle : input as AnyObject])
    }
    let twoAction = UIAlertAction(title: "Junior", style: .default) { (action) in
    
    let input = action.title!
    appendValues(values: [attributeTitle : input as AnyObject])
    }
    let threeAction = UIAlertAction(title: "Intern", style: .default) { (action) in
    
    let input = action.title!
    appendValues(values: [attributeTitle : input as AnyObject])
    
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
    
    alertController.addAction(oneAction)
    alertController.addAction(twoAction)
    alertController.addAction(threeAction)
    alertController.addAction(cancelAction)
    
    
    self.present(alertController, animated: true, completion: nil)
    
    
    }

    
    
}




