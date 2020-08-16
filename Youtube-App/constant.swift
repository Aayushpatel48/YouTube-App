//
//  constant.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/15/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAhxDY0LoXPcewJXVZwB6h6x-lJ_AePoSE"
    static var PLAYLIST_ID = "PLPdoRGhsS-tvJ6i7-WRgjPbvmZrJcuq2f"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
