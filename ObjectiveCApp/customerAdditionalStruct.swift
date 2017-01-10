//
//  customerAdditionalStruct.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/10/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import Foundation


struct CustomerCollectionFields {
    var segue: String
    var message: String
    
    
    
}


func createCustomerQuestions() -> [CustomerCollectionFields] {
    
    var collectionFieldsToReturn = [CustomerCollectionFields]()
    let userSelections = ["duration" : "Is this a onetime or ongoing project",
                          "UploadPic" : "Upload pic / logo",
                          "start_date" : "I can start",
                          "client_list" : "Would you like to see a list of their clients",
                          "beta_Testing" :"Would you like to do beta testing",
                          "app_submission" : "Would you like them to submit your app",
                          "Budget" : "What is your budget",
                          "work_samples" : "would you like to see a sample of their work",
                          "referalls" : "Would you like to see referrals",
                          ]
    
    
    for (segue, message) in userSelections {
        
        let collectionType = CustomerCollectionFields(segue: segue, message: message)
        collectionFieldsToReturn.append(collectionType)
        
    }
    
    
    return collectionFieldsToReturn
}
