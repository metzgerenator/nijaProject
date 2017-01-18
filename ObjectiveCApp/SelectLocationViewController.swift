//
//  SelectLocationViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 1/17/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import MapKit

class SelectLocationViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchBar.delegate = self
        self.searchBar.endEditing(true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var prefersStatusBarHidden: Bool {
        
        return true
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

extension SelectLocationViewController: UISearchBarDelegate {
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let localSearhRequest = MKLocalSearchRequest()
        localSearhRequest.naturalLanguageQuery = searchBar.text
        
       let localSearch = MKLocalSearch(request: localSearhRequest)
        
        if localSearch.isSearching {
            localSearch.cancel()
        } else {
            
            localSearch.start(completionHandler: { (response, error) in
                let results = response?.mapItems
                print("here are the results \(results)")
            })
        }
        
        
        
    }
    
    
}



