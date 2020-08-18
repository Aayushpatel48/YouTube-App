//
//  ViewController.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/15/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as the datasource and then delegate
        tableView.dataSource = self
        tableView.delegate = self
         
        //set iteself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    //MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        //Set the retuned videos to our video property
        self.videos = videos
        
        //refresh the tableview
        tableView.reloadData()
    }
    
    //MARK: -TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with the data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

