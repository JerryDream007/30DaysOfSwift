//
//  ViewController.swift
//  PlayLocalVideo_03
//
//  Created by 宋澎 on 2018/5/31.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

import AVKit

class ViewController: UIViewController,VideoPlayProtocol{

    @IBOutlet weak var listTableView: UITableView!
    
    var testString:String?
    
    var dataSource : [VideoItem] = [
                                    VideoItem(backGroundImage: "videoScreenshot01", titleString: "诸界末日在线", videoString:"emoji zone"),
                                    VideoItem(backGroundImage: "videoScreenshot02", titleString: "凡人修仙传之仙界篇",videoString:"emoji zone"),
                                    VideoItem(backGroundImage: "videoScreenshot03", titleString: "我是至尊",videoString:"emoji zone"),
                                    VideoItem(backGroundImage: "videoScreenshot04", titleString: "龙王传说",videoString:"emoji zone"),
                                    VideoItem(backGroundImage: "videoScreenshot05", titleString: "飞剑问道",videoString:"emoji zone"),
                                    VideoItem(backGroundImage: "videoScreenshot06", titleString: "通天仙路",videoString:"emoji zone")//
                                   ]
    
    let playerViewController : AVPlayerViewController = AVPlayerViewController.init()
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testString = "songpeng"
        
        if testString != nil {
            dataSource .append(VideoItem(backGroundImage: "videoScreenshot07", titleString: self.testString!, videoString: "emoji zone"))
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func clickVideoPlay(videoString:String) -> Void {
        let videoPath = Bundle.main.path(forResource: videoString, ofType: "mp4")
        
        if videoPath != nil{
            
            player = AVPlayer(url: NSURL.fileURL(withPath: videoPath!))
            
            playerViewController.player = player
            
            self.present(playerViewController, animated: true) {
                self.player!.play()
            }
        }
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        cell.videoItem = dataSource[indexPath.row]
        
        cell.indexPath = indexPath
        
        cell.delegate = self as! VideoPlayProtocol
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
