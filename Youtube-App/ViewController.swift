//
//  ViewController.swift
//  Youtube-App
//
//  Created by Gabriella  Reyes on 8/15/20.
//  Copyright © 2020 Aayush Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        model.getVideos()
    }


}

