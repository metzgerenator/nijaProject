//
//  CustomerQuestionsViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/10/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class CustomerQuestionsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var userSelections = [CustomerCollectionFields]()
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return userSelections.count
    }

 
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomerQuestionsCollectionViewCell
        
        let item = userSelections[indexPath.row]
        
        cell.conFigureCell(inputString: item.message)
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSelections = createCustomerQuestions()
        collectionView.reloadData()
        
        

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
