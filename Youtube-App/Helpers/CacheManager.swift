//
//  CacheManager.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/17/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    static func setVideoCache(_ url: String, _ data:Data?) {
        
        //store image and use url as key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //try to get data for specified url
        return cache[url]
    }
}
