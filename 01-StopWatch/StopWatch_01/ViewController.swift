//
//  ViewController.swift
//  StopWatch_01
//
//  Created by 宋澎 on 2018/5/29.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var currentTime:Float = 0.0
    
    var timer:Timer? = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeLabel.text = String(currentTime)
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
        timer!.fireDate = NSDate.distantFuture
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickStartButton(_ sender: Any) {
        if timer != nil {
            timer!.fireDate = NSDate.distantPast
        }
    }
    
    @IBAction func clickPauseButton(_ sender: Any) {
        if timer != nil {
            timer!.fireDate = NSDate.distantFuture
        }
    }
    
    @IBAction func clickResetButton(_ sender: Any) {
        if timer != nil {
            timer!.fireDate = NSDate.distantFuture
        }
        timeLabel.text = "0.0"
        currentTime = 0.0
    }
    
    @objc func updateTime() -> Void {
        currentTime = currentTime + 0.1
        
        timeLabel.text = String(format: "%0.2f", currentTime)
    }
}

