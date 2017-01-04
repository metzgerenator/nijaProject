//
//  devAdditionalStruct.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/3/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import Foundation


struct CollectionFields {
    var segue: String
    var message: String
    
    
    
}


func createCollections() -> [CollectionFields] {
    
    var collectionFieldsToReturn = [CollectionFields]()
    let userSelections = ["Video" : "Upload Video",
                          "UploadPic" : "Upload pic / logo",
                          "availibility" : "I am looking for",
                          "skill_level" :"My skill level is",
                          "language" : "I am a",
                          "specilty" : "I specialize in",
                          "work_type" : "I am looking for work that is",
                          "start_date" : "I can start",
                          "minimum pay" : "MY minimum $ requirment is",
                          "previous_clients" : "MY minimum $ requirment is",
                          "references" : "would you like to add references?",
                          "samples" :  "Would you like to add samples of your work",
                          "testing" : "Do you provide testing",
                          "submission" : "Will you submit your app for your client" ]
    
    
    for (segue, message) in userSelections {
        
        let collectionType = CollectionFields(segue: segue, message: message)
        collectionFieldsToReturn.append(collectionType)

    }
    
    
    return collectionFieldsToReturn
}
