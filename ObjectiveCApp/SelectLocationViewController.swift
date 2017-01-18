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
    
    @IBOutlet var tableView: UITableView!
    
   var locatons = [MKMapItem]()
    
    
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dev" {
            
        }
        
      
    }
 

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
                guard let results = response else {return}
                
                self.locatons = results.mapItems
                self.tableView.reloadData()
 
            })
        }
        
        
        
    }
    
    
}



extension SelectLocationViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locatons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = locatons[indexPath.row].name
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "dev", sender: self)
        
    }
    
    
}



















