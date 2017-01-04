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
        
        self.performSegue(withIdentifier: selectedItem.segue, sender: self)
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

    
    func alertView(title: String, message: String) {
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)

        
        let oneAction = UIAlertAction(title: "One", style: .default) { (_) in }
        let twoAction = UIAlertAction(title: "Two", style: .default) { (_) in }
        let threeAction = UIAlertAction(title: "Three", style: .default) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
}
