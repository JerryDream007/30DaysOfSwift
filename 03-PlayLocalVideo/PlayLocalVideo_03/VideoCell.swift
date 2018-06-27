//
//  VideoCell.swift
//  PlayLocalVideo_03
//
//  Created by 宋澎 on 2018/6/1.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import Foundation

import UIKit

struct VideoItem {
    var backGroundImage:String
    var titleString:String
    var videoString:String
}

protocol VideoPlayProtocol{
    func clickVideoPlay(videoString:String) -> Void
}

class VideoCell: UITableViewCell{
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    var playStatus:Bool = false
    
    var indexPath:IndexPath?
    
    var delegate:VideoPlayProtocol?
    
    var _videoItem:VideoItem?
 
    var videoItem:VideoItem? {
        
        get{
            return _videoItem
        }
        
        set(newVideoItem){
            
            titleLabel.text = newVideoItem?.titleString
            
            if newVideoItem?.backGroundImage != nil {
                backgroundImageView.image = UIImage.init(named: (newVideoItem?.backGroundImage)!)
            }
            
            _videoItem = newVideoItem
        }
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func clickPlayOrPauseButton(_ sender: Any) {
        
        playStatus = !playStatus
        
        print("点击了\(String(format: "%d", indexPath!.row))行")
        
        if delegate != nil && videoItem?.videoString != nil {
            delegate!.clickVideoPlay(videoString: (videoItem?.videoString)!)
        }
        
    }
}
