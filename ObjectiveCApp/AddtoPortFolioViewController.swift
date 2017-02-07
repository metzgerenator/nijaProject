//
//  AddtoPortFolioViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class AddtoPortFolioViewController: UIViewController {
    
    
    var currentImages = [UIImage]()
    
    var selectedProject: DeveloperProjects?
    
    @IBOutlet var projectName: UITextField!
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var defaultText = "Please give a brief description of the project"
     var saveDescription: String?
    
    @IBOutlet var descriptionOutlet: UITextView!
    
    
    
    @IBAction func editDescriptionAction(_ sender: Any) {
        
        let hidden = descriptionOutlet.isHidden
        
        switch hidden {
        case true:
            descriptionOutlet.isHidden = false
        case false:
            descriptionOutlet.isHidden = true
   
        }
        
        
        
    }
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func saveProject(_ sender: Any) {
        
        //need to add mainheader from text field
        
        if (projectName.text?.characters.count)! > 0 {
            
            let user = CurrentUser()
            var photos = currentImages
            photos.remove(at: 0)
            let decscription = saveDescription ?? ""
            user.uploadPhotos(images: photos, mainHeader: projectName.text, description: decscription, child: USERPROJECTS)
            
            //user.uploadPhotos(images: photos, mainHeader: projectName.text, child: USERPROJECTS)
            
            self.dismiss(animated: true, completion: nil)
            
        } else {
            
            
            alertControllerView(title: "Fill Field", message: "Please give this project a name")
        }
        
       
        
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedProject = selectedProject{
            
        }
        
        
        //add addition image to imageview 
        let addIcon = UIImage(named: "camera")
        currentImages.insert(addIcon!, at: 0)
        self.collectionView.reloadData()
        
        
        descriptionOutlet.isHidden = true
        
        if let description = saveDescription {
            
            descriptionOutlet.text = description
        } else {
            
            descriptionOutlet.text = defaultText
        }
        

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

extension AddtoPortFolioViewController: UITextViewDelegate {
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        
        if descriptionOutlet.text == defaultText {
            descriptionOutlet.text = ""
        }
        
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        
        if descriptionOutlet.text.characters.count == 0 {
            descriptionOutlet.text = defaultText
            saveDescription = nil
        } else {
            
            saveDescription = descriptionOutlet.text
            
        }
    }
    
    
    
}


//MARK: collection view methods

extension AddtoPortFolioViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentImages.count
    }
   
    
    
    //Mark: launch image picker
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indexCheck = indexPath.row
        
        if indexCheck == 0 {
            
            //launch image picker
            let picker  = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            
            picker.sourceType = .photoLibrary
            picker.modalPresentationStyle = .fullScreen
            
            
            present(picker, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            
            guard let image = image as? UIImage else {return}
            currentImages.insert(image, at: 1)
            self.collectionView.reloadData()
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AddToPortfolioCollectionViewCell
        
        let image = currentImages[indexPath.row]
        
        cell.configureCell(image: image)
        
        return cell
    }
    
    
    
    
    
}

//MARK: convienence methods
extension AddtoPortFolioViewController {
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}









