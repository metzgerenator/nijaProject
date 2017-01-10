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
    
    var userSelections = [CollectionFields]()
    
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
       return userSelections.count
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
