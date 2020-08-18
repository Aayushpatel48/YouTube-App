//
//  VideoTableViewCell.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/17/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // ensure that we have a video
        guard self.video !=  nil else {
            return
        }
        //set the title and date label
        self.titleLabel.text = video?.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: self.video!.published)
        
        //set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        //check cache before downloading data
        if let cachedData =  CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //set the thumbnail iumageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        //get shared URL Session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data, response,error) in
            
            if error == nil && data != nil {
                
                //save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                //check if thumbnail matches the video url
                if url!.absoluteString != self.video?.thumbnail {
                    //video cell has been recycled for another video and no longer matches
                    return
                }
                //create the image object
                let image = UIImage(data: data!)
                
                //set the iamgeview
                DispatchQueue.main.sync{
                    self.thumbnailImageView.image = image
                }
            }
        }
        // start data task
        dataTask.resume()
    }

}
