//
//  model.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/15/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession Object
        let session = URLSession.shared
        
        // Get a data task from the URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects
        }
        // Kick off the task
        dataTask.resume()
    }
}
