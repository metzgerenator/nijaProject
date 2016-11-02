//
//  DeveloperAdditionalDetailsViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 11/1/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class DeveloperAdditionalDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    let arrray = ["who are you", "what am i ", "I'm a robot"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DeveloperAdditionalCollectionViewCell
        
        let item = arrray[indexPath.row]
        
        cell.configureCell(inputString: item)
        
        
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
