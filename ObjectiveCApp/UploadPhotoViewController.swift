//
//  UploadPhotoViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/3/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class UploadPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var userImage: UIImageView!

    
    @IBAction func uploadPhoto(_ sender: Any) {
        
        let picker  = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        
        picker.sourceType = .camera
        picker.modalPresentationStyle = .fullScreen
        
        
        present(picker, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            
            self.userImage.image = image as? UIImage
            dismiss(animated: true, completion: nil)
            
        }
    }
    

}


