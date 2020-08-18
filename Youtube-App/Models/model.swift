//
//  model.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/15/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
}

class Model {
    
    
    var delegate: ModelDelegate?
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
            
            do {
            // Parsing the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
         let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                    
                //Call the "Videosfetched" Method of the delegate
                    self.delegate?.videosFetched(response.items!)
                }
            }
                //dump(response)
                    
                }
                
            catch {
                
            }
        }
        // Kick off the task
        dataTask.resume()
    }
}


