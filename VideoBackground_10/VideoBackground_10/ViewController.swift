//
//  ViewController.swift
//  VideoBackground_10
//
//  Created by 宋澎 on 2018/6/12.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: VideoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoFrame = view.frame
        
        soud = true
        
        alpha = 0.8
        
        fillModel = .resizeAspectFill
        
        let videoPath = Bundle.main.path(forResource: "moments", ofType: "mp4")
        
        if videoPath != nil {
            contentURL = URL(fileURLWithPath: videoPath!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alwaysRepeat = true
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

